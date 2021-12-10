import sqlite3
from utils import display
from PyQt5.QtWidgets import QDialog
from PyQt5.QtCore import pyqtSlot
from PyQt5 import uic

# Classe permettant d'afficher la fenêtre de visualisation des données

class AppTriggerDev3Partie3(QDialog):

    # Constructeur
    def __init__(self, data: sqlite3.Connection):
        super(QDialog, self).__init__()
        self.ui = uic.loadUi("gui/v1_trigger_dev_3_3.ui", self)
        self.data = data

        # On met à jour l'affichage avec les données actuellement présentes dans la base
        self.refreshDev1Partie3()

    ####################################################################################################################
    # Méthodes permettant de rafraichir les différentes tables
    ####################################################################################################################

    # Fonction de mise à jour de l'affichage d'une seule table
    def refreshTable(self, label, table, query):
        display.refreshLabel(label, "")
        try:
            cursor = self.data.cursor()
            result = cursor.execute(query)
        except Exception as e:
            table.setRowCount(0)
            display.refreshLabel(label, "Impossible d'afficher les données de la table : " + repr(e))
        else:
            display.refreshGenericData(table, result)

    # Fonction permettant de mettre à jour toutes les tables
    @pyqtSlot()
    def refreshResultDev3(self):
        display.refreshLabel(self.ui.label_dev_3_3, "")
        if not self.ui.lineEditDev3.currentText():
            self.ui.tableDev_3_3.setRowCount(0)
            display.refreshLabel(self.ui.label_dev_3_3, "Veuillez indiquer un nom de catégorie")
        else:
            try:
                cursor = self.data.cursor()
                result = cursor.execute(
                    "SELECT ",
                    [self.ui.lineEditDev2.currentText()])
            except Exception as e:
                self.ui.tableDev_3_3.setRowCount(0)
                display.refreshLabel(self.ui.label_dev_3_3, "Impossible d'afficher les résultats : " + repr(e))
            else:
                i = display.refreshGenericData(self.ui.tableDev_3_3, result)
                if i == 0:
                    display.refreshLabel(self.ui.label_dev_3_3, "Aucun résultat")

    def refreshDev3Partie3(self):

        self.refreshTable(self.ui.label_dev_3_3, self.ui.tableDev_3_3,
                          "INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) "
                          "VALUES('23/11/2008 14:16:18', 'senior', '29/11/2008 21:00', 1, 1, 3); ")
        # Active le trigger
