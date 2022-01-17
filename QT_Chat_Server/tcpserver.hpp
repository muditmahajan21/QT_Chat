#ifndef TCPSERVER_HPP
#define TCPSERVER_HPP

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QHash>

class TcpServer : public QObject
{
    Q_OBJECT
public:
    explicit TcpServer(QObject *parent = nullptr);

    signals:
        void newMessage(const QByteArray &message);

    public slots:
        void sendMessage(const QString &message);

    private slots:
        void onNewConnection();
        void onReadyRead();
        void onDisconnected();
        void onNewMessage(const QByteArray &ba);

    private:
        QString getClientKey(const QTcpSocket *client) const;
    private:
        QTcpServer _server;
        QHash<QString, QTcpSocket*> _clients;
};

#endif // TCPSERVER_HPP
