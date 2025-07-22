<?php
class Inquiry {
    private $conn;
    private $table = "inquiries";

    public $keywords;
    public $answer;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getAnswer($userInput) {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $keywordArray = explode(",", $row['question_keywords']);
            foreach ($keywordArray as $keyword) {
                if (stripos($userInput, trim($keyword)) !== false) {
                    return $row['answer'];
                }
            }
        }
        return "Sorry, I couldn't understand your inquiry. Please contact the school registrar.";
    }

    public function addInquiry() {
        $query = "INSERT INTO " . $this->table . " (question_keywords, answer) VALUES (?, ?)";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute([$this->keywords, $this->answer]);
    }
}
