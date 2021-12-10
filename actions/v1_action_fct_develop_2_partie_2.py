import sqlite3
from utils import display
from PyQt5.QtWidgets import QDialog
from PyQt5.QtCore import pyqtSlot
from PyQt5 import uic

# Classe permettant d'afficher la fenêtre de visualisation des données

class AppFctDev2Partie2(QDialog):

    # Constructeur
    def __init__(self, data: sqlite3.Connection):
        super(QDialog, self).__init__()
        self.ui = uic.loadUi("gui/v1_fct_dev_2_2.ui", self)
        self.data = data

        # On met à jour l'affichage avec les données actuellement présentes dans la base
        self.refreshDev2Partie2()

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
    def refreshResultDev2(self):
        display.refreshLabel(self.ui.label_dev_2_2, "")
        if not self.ui.lineEditDev2.currentText():
            self.ui.tableDev_2_2.setRowCount(0)
            display.refreshLabel(self.ui.label_dev_2_2, "Veuillez indiquer un nom de Spectacle")
        else:
            try:
                cursor = self.data.cursor()
                result = cursor.execute(
                        [self.ui.lineEditDev2.currentText()])
            except Exception as e:
                self.ui.tableDev_2_2.setRowCount(0)
                display.refreshLabel(self.ui.label_dev_2_2, "Impossible d'afficher les résultats : " + repr(e))
            else:
                i = display.refreshGenericData(self.ui.tableDev_2_2, result)
                if i == 0:
                    display.refreshLabel(self.ui.label_dev_2_2, "Aucun résultat")

    def refreshDev2Partie2(self):

        self.refreshTable(self.ui.label_dev_2_2, self.ui.tableDev_2_2,
                        "SELECT dateRep, noPlace, noRang "
                        "FROM LesInformations "
                        "JOIN LesRepresentations USING (noSpec) "
                        "CROSS JOIN LesPlaces ")

