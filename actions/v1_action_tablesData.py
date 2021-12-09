
import sqlite3
from utils import display
from PyQt5.QtWidgets import QDialog
from PyQt5.QtCore import pyqtSlot
from PyQt5 import uic

# Classe permettant d'afficher la fenêtre de visualisation des données
class AppTablesDataV1(QDialog):

    # Constructeur
    def __init__(self, data:sqlite3.Connection):
        super(QDialog, self).__init__()
        self.ui = uic.loadUi("gui/v1_tablesData.ui", self)
        self.data = data

        # On met à jour l'affichage avec les données actuellement présentes dans la base
        self.refreshAllTablesV1()

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
    def refreshAllTablesV1(self):

        self.refreshTable(self.ui.label_Taux, self.ui.tableTaux,
                          "SELECT typeZone, tauxZone "
                          "FROM LesTaux")
        self.refreshTable(self.ui.label_Zones, self.ui.tableZones,
                          "SELECT noZone, typeZone "
                          "FROM LesZones")
        self.refreshTable(self.ui.label_Places, self.ui.tablePlaces,
                          "SELECT noPlace, noRang, noZone "
                          "FROM LesPlaces")
        self.refreshTable(self.ui.label_Informations, self.ui.tableInformations,
                          "SELECT noSpec, nomSpec, prixBaseSpec "
                          "FROM LesInformations")
        self.refreshTable(self.ui.label_Representations, self.ui.tableRepresentations,
                          "SELECT dateRep, promoRep, noSpec "
                          "FROM LesRepresentations")
        self.refreshTable(self.ui.label_RepresentationsView, self.ui.tableRepresentationsView,
                          "SELECT dateRep, noPlace, noRang "
                          "FROM LesRepresentationsView")
        self.refreshTable(self.ui.label_Dossiers, self.ui.tableDossiers,
                          "SELECT noDos, dateCrea, prixGlob "
                          "FROM LesDossiers "
                          "JOIN LesDossiersView "
                          "USING (noDos)")
        self.refreshTable(self.ui.label_Situations, self.ui.tableSituations,
                          "SELECT situation, promoSit "
                          "FROM LesSituations")
        self.refreshTable(self.ui.label_Tickets, self.ui.tableTickets,
                          "SELECT noTic, dateAchat, prixTic, situation, dateRep, noPlace, noRang, noDos "
                          "FROM LesTickets "
                          "JOIN  LesTicketsView "
                          "USING (noTic)")
