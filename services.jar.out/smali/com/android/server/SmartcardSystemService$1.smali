.class Lcom/android/server/SmartcardSystemService$1;
.super Lorg/simalliance/openmobileapi/service/ISmartcardServiceCallback$Stub;
.source "SmartcardSystemService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/SmartcardSystemService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/SmartcardSystemService;


# direct methods
.method constructor <init>(Lcom/android/server/SmartcardSystemService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/SmartcardSystemService$1;->this$0:Lcom/android/server/SmartcardSystemService;

    invoke-direct {p0}, Lorg/simalliance/openmobileapi/service/ISmartcardServiceCallback$Stub;-><init>()V

    return-void
.end method
