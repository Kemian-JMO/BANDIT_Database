module com.example.bandit_database {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.bandit_database to javafx.fxml;
    exports com.example.bandit_database;
}