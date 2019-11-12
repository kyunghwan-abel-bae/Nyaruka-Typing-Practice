#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QDebug>

class FileIO : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString source
               READ source
               WRITE setSource)

    Q_PROPERTY(int totalStatement
               READ totalStatement)

    explicit FileIO(QObject *parent = 0);

    Q_INVOKABLE QString read();

    QString source(){return mSource;}
    int totalStatement(){return mTotalStatement;}

signals:
    void error(const QString& msg);

public slots:
    void setSource(const QString& source){ mSource = source; }

private:
    QString mSource;
    int mTotalStatement;
};

#endif // FILEIO_H
