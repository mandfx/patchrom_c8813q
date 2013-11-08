.class public Landroid/net/FmcProvider;
.super Ljava/lang/Object;
.source "FmcProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/net/FmcProvider$1;,
        Landroid/net/FmcProvider$NotificationsThread;,
        Landroid/net/FmcProvider$FmcEventListener;
    }
.end annotation


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "FmcProvider"

.field private static final ON_FMC_STATUS:I = 0x1


# instance fields
.field private mFmcNotifier:Landroid/net/FmcNotifier;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerAvail:Ljava/util/concurrent/locks/Condition;

.field private mListener:Landroid/net/FmcProvider$FmcEventListener;

.field private mLock:Ljava/util/concurrent/locks/Lock;

.field private mService:Landroid/net/IConnectivityManager;

.field private mThread:Landroid/net/FmcProvider$NotificationsThread;


# direct methods
.method public constructor <init>(Landroid/net/FmcNotifier;)V
    .locals 4
    .parameter "notifier"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/net/FmcProvider;->mFmcNotifier:Landroid/net/FmcNotifier;

    const-string v1, "FmcProvider"

    const-string v2, "FmcProvider"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "connectivity"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/net/IConnectivityManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/net/IConnectivityManager;

    move-result-object v1

    iput-object v1, p0, Landroid/net/FmcProvider;->mService:Landroid/net/IConnectivityManager;

    iget-object v1, p0, Landroid/net/FmcProvider;->mService:Landroid/net/IConnectivityManager;

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "mService can not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    new-instance v1, Landroid/net/FmcProvider$FmcEventListener;

    invoke-direct {v1, p0, v3}, Landroid/net/FmcProvider$FmcEventListener;-><init>(Landroid/net/FmcProvider;Landroid/net/FmcProvider$1;)V

    invoke-static {v1}, Landroid/net/IFmcEventListener$Stub;->asInterface(Landroid/os/IBinder;)Landroid/net/IFmcEventListener;

    move-result-object v1

    check-cast v1, Landroid/net/FmcProvider$FmcEventListener;

    iput-object v1, p0, Landroid/net/FmcProvider;->mListener:Landroid/net/FmcProvider$FmcEventListener;

    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, p0, Landroid/net/FmcProvider;->mLock:Ljava/util/concurrent/locks/Lock;

    iget-object v1, p0, Landroid/net/FmcProvider;->mLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v1

    iput-object v1, p0, Landroid/net/FmcProvider;->mHandlerAvail:Ljava/util/concurrent/locks/Condition;

    new-instance v1, Landroid/net/FmcProvider$NotificationsThread;

    invoke-direct {v1, p0, v3}, Landroid/net/FmcProvider$NotificationsThread;-><init>(Landroid/net/FmcProvider;Landroid/net/FmcProvider$1;)V

    iput-object v1, p0, Landroid/net/FmcProvider;->mThread:Landroid/net/FmcProvider$NotificationsThread;

    iget-object v1, p0, Landroid/net/FmcProvider;->mThread:Landroid/net/FmcProvider$NotificationsThread;

    invoke-virtual {v1}, Landroid/net/FmcProvider$NotificationsThread;->start()V

    :try_start_0
    iget-object v1, p0, Landroid/net/FmcProvider;->mLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object v1, p0, Landroid/net/FmcProvider;->mHandler:Landroid/os/Handler;

    if-nez v1, :cond_1

    iget-object v1, p0, Landroid/net/FmcProvider;->mHandlerAvail:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v1, p0, Landroid/net/FmcProvider;->mLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v1

    iget-object v2, p0, Landroid/net/FmcProvider;->mLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method static synthetic access$200(Landroid/net/FmcProvider;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/net/FmcProvider;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$202(Landroid/net/FmcProvider;Landroid/os/Handler;)Landroid/os/Handler;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Landroid/net/FmcProvider;->mHandler:Landroid/os/Handler;

    return-object p1
.end method

.method static synthetic access$300(Landroid/net/FmcProvider;)Landroid/net/FmcNotifier;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/net/FmcProvider;->mFmcNotifier:Landroid/net/FmcNotifier;

    return-object v0
.end method

.method static synthetic access$400(Landroid/net/FmcProvider;)Ljava/util/concurrent/locks/Lock;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/net/FmcProvider;->mLock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic access$500(Landroid/net/FmcProvider;)Ljava/util/concurrent/locks/Condition;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/net/FmcProvider;->mHandlerAvail:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method


# virtual methods
.method public getFmcStatus()I
    .locals 3

    .prologue
    const-string v1, "FmcProvider"

    const-string v2, "FmcProvider@getFmcStatus"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v1, p0, Landroid/net/FmcProvider;->mService:Landroid/net/IConnectivityManager;

    iget-object v2, p0, Landroid/net/FmcProvider;->mListener:Landroid/net/FmcProvider$FmcEventListener;

    invoke-interface {v1, v2}, Landroid/net/IConnectivityManager;->getFmcStatus(Landroid/os/IBinder;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "FmcProvider"

    const-string v2, "FmcProvider@getFmcStatus: RemoteException"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    const/4 v1, -0x1

    goto :goto_0
.end method

.method public startFmc()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    const-string v2, "FmcProvider"

    const-string v3, "FmcProvider@startFmc"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget v2, Landroid/net/FeatureConfig;->FMC:I

    invoke-static {v2}, Landroid/net/FeatureConfig;->isEnabled(I)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "FmcProvider"

    const-string v3, "startFmc: FMC is disabled. This API is invalid."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1

    :cond_0
    :try_start_0
    iget-object v2, p0, Landroid/net/FmcProvider;->mService:Landroid/net/IConnectivityManager;

    iget-object v3, p0, Landroid/net/FmcProvider;->mListener:Landroid/net/FmcProvider$FmcEventListener;

    invoke-interface {v2, v3}, Landroid/net/IConnectivityManager;->startFmc(Landroid/os/IBinder;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "FmcProvider"

    const-string v3, "FmcProvider@startFmc: RemoteException"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public stopFmc()Z
    .locals 3

    .prologue
    const-string v1, "FmcProvider"

    const-string v2, "FmcProvider@stopFmc"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v1, p0, Landroid/net/FmcProvider;->mService:Landroid/net/IConnectivityManager;

    iget-object v2, p0, Landroid/net/FmcProvider;->mListener:Landroid/net/FmcProvider$FmcEventListener;

    invoke-interface {v1, v2}, Landroid/net/IConnectivityManager;->stopFmc(Landroid/os/IBinder;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "FmcProvider"

    const-string v2, "FmcProvider@stopFmc: RemoteException"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    const/4 v1, 0x0

    goto :goto_0
.end method
