#ifndef SNDEFFECT_H
#define SNDEFFECT_H

#include <QObject>
#include <QSoundEffect>

class SndEffect : public QSoundEffect
{
    Q_OBJECT
public:

    Q_PROPERTY(QString sourcePath
               READ sourcePath
               WRITE setSourcePath)

    explicit SndEffect(QObject *parent = 0);

    Q_INVOKABLE void playSnd(){ this->play(); }
    //Q_INVOKABLE void play(){};

    QString sourcePath(){return mSource;}


signals:
    
public slots:

    void setSourcePath(QString source){
        //mSource = source;
        //mSnd->setSource(QUrl::fromLocalFile(mSource));
        //mSnd->setLoopCount(1);
        this->setSource(QUrl::fromLocalFile(source));
    }

private:

    //QSoundEffect *mSnd;
    QString mSource;
    
};

#endif // SNDEFFECT_H
