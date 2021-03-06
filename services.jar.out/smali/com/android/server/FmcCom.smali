.class public abstract Lcom/android/server/FmcCom;
.super Ljava/lang/Object;
.source "FmcCom.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/FmcCom$sockaddr_in;,
        Lcom/android/server/FmcCom$fmc_trigger_resp;
    }
.end annotation


# static fields
.field protected static final DBG:Z = true

.field protected static final FMC_TRIGGER_RESP_LEN:I = 0x84

.field private static final SOCKET_PATH:Ljava/lang/String; = "/dev/socket/ds_fmc_app_call_mgr_sock"

.field private static final TAG:Ljava/lang/String; = "FmcCom"

.field protected static ds_sock:Landroid/net/LocalSocket;


# instance fields
.field protected fsm:Lcom/android/server/FmcStateMachine;

.field protected instance:Lcom/android/server/FmcCom;

.field protected receiveQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/FmcCom;->instance:Lcom/android/server/FmcCom;

    iput-object v0, p0, Lcom/android/server/FmcCom;->fsm:Lcom/android/server/FmcStateMachine;

    iput-object v0, p0, Lcom/android/server/FmcCom;->receiveQueue:Ljava/util/concurrent/BlockingQueue;

    const-string v0, "FmcCom"

    const-string v1, "constructor"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private openSocket()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    const-string v2, "FmcCom"

    const-string v3, "openSocket"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v2, Landroid/net/LocalSocket;

    invoke-direct {v2}, Landroid/net/LocalSocket;-><init>()V

    sput-object v2, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    sget-object v2, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    if-nez v2, :cond_0

    const-string v2, "FmcCom"

    const-string v3, "openSocket could not create LocalSocket"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_0
    sget-object v2, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    new-instance v3, Landroid/net/LocalSocketAddress;

    const-string v4, "/dev/socket/ds_fmc_app_call_mgr_sock"

    sget-object v5, Landroid/net/LocalSocketAddress$Namespace;->FILESYSTEM:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v3, v4, v5}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    invoke-virtual {v2, v3}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    sget-object v2, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    invoke-virtual {v2}, Landroid/net/LocalSocket;->isConnected()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    const-string v2, "FmcCom"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "openSocket IOException="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method establishSocket()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    const-string v1, "FmcCom"

    const-string v2, "establishSocket"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    if-nez v1, :cond_0

    const-string v1, "FmcCom"

    const-string v2, "readFromDS ds_sock is null"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/server/FmcCom;->openSocket()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "FmcCom"

    const-string v2, "readFromDS failed to open socket"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v0

    :cond_0
    sget-object v1, Lcom/android/server/FmcCom;->ds_sock:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "FmcCom"

    const-string v2, "readFromDS ds_sock is not connected"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/server/FmcCom;->openSocket()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "FmcCom"

    const-string v2, "establishSocket failed to open socket"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string v0, "FmcCom"

    const-string v1, "establishSocket ok"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public run()V
    .locals 2

    .prologue
    const-string v0, "FmcCom"

    const-string v1, "run"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
