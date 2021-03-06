.class public Lcom/android/internal/atfwd/AtCmdResponse;
.super Ljava/lang/Object;
.source "AtCmdResponse.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/internal/atfwd/AtCmdResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final RESULT_ERROR:I = 0x0

.field public static final RESULT_OK:I = 0x1

.field public static final RESULT_OTHER:I = 0x2


# instance fields
.field private mResponse:Ljava/lang/String;

.field private mResult:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Lcom/android/internal/atfwd/AtCmdResponse$1;

    invoke-direct {v0}, Lcom/android/internal/atfwd/AtCmdResponse$1;-><init>()V

    sput-object v0, Lcom/android/internal/atfwd/AtCmdResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;)V
    .locals 0
    .parameter "result"
    .parameter "response"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, p1, p2}, Lcom/android/internal/atfwd/AtCmdResponse;->init(ILjava/lang/String;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "p"
    .parameter "flags"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .local v1, result:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .local v0, response:Ljava/lang/String;
    invoke-direct {p0, v1, v0}, Lcom/android/internal/atfwd/AtCmdResponse;->init(ILjava/lang/String;)V

    return-void
.end method

.method private init(ILjava/lang/String;)V
    .locals 0
    .parameter "result"
    .parameter "response"

    .prologue
    iput p1, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResult:I

    iput-object p2, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResponse:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResponse:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()I
    .locals 1

    .prologue
    iget v0, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResult:I

    return v0
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 0
    .parameter "mResponse"

    .prologue
    iput-object p1, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResponse:Ljava/lang/String;

    return-void
.end method

.method public setResult(I)V
    .locals 0
    .parameter "mResult"

    .prologue
    iput p1, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResult:I

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "dest"
    .parameter "flags"

    .prologue
    iget v0, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResult:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/android/internal/atfwd/AtCmdResponse;->mResponse:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
