#include "fileio.h"

#include <QDebug>
#include <QFile>

FileIO::FileIO(QObject *parent) :
    QObject(parent)
{
}

QString FileIO::read(){
    if(mSource.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(mSource);
    QString fileContent;

    emit error(mSource);

    if(file.open(QIODevice::ReadOnly)){
        QString line;
        /*QString line_for_Right = "";
        int posNum = 0;
        bool islooped = false;*/

        //QString additionalLine;
        QTextStream t(&file);

        line = t.readLine();

        while(!line.isNull()){

            if(line.indexOf("  ")){
                line.replace(line.indexOf("  "), 1, "");
            }

            line = line.trimmed();

            line.insert(line.length(), "*");

            mTotalStatement++;
            fileContent += line;

            line = t.readLine();

        }

        file.close();
    }else{
        emit error("Unable to open the file");
        return QString();
    }

    fileContent += "$";

    return fileContent;
}
