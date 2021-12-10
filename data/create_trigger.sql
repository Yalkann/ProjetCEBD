-- Trigger pour ne pas vendre un ticket si le nombre de places max est atteint
CREATE TRIGGER IF NOT EXISTS update_Tickets BEFORE INSERT ON LesTickets
    BEGIN
        SELECT
            CASE
                WHEN (SELECT noPlace FROM LesRepresentationsView
                WHERE NEW.dateRep = LesRepresentationsView.dateRep) IS NULL
                THEN
                    RAISE ( ABORT, 'nombre de places insuffisante' )
    END;
END/