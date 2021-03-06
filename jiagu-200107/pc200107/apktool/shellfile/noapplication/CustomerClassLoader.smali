.class public Lcom/example/forshell/CustomerClassLoader;
.super Ldalvik/system/PathClassLoader;
.source "CustomerClassLoader.java"


# static fields
.field private static final VERBOSE_DEBUG:Z


# instance fields
.field private initialized:Z

.field private is_write_back:Z

.field private final libPath:Ljava/lang/String;

.field private final mDexOutputPath:Ljava/lang/String;

.field private mDexs:[Ldalvik/system/DexFile;

.field private mFiles:[Ljava/io/File;

.field private mLibPaths:[Ljava/lang/String;

.field private mPaths:[Ljava/lang/String;

.field private mZips:[Ljava/util/zip/ZipFile;

.field private final path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "optimizedDirectory"    # Ljava/lang/String;
    .param p3, "libPath"    # Ljava/lang/String;
    .param p4, "parent"    # Ljava/lang/ClassLoader;

    .prologue
    .line 89
    const-string v0, ""

    invoke-direct {p0, v0, p3, p4}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 90
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 91
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 93
    :cond_1
    iput-object p1, p0, Lcom/example/forshell/CustomerClassLoader;->path:Ljava/lang/String;

    .line 96
    iput-object p3, p0, Lcom/example/forshell/CustomerClassLoader;->libPath:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lcom/example/forshell/CustomerClassLoader;->mDexOutputPath:Ljava/lang/String;

    .line 99
    :try_start_0
    invoke-direct {p0}, Lcom/example/forshell/CustomerClassLoader;->ensureInit()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    :goto_0
    return-void

    .line 100
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private declared-synchronized ensureInit()V
    .locals 10

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    iget-boolean v7, p0, Lcom/example/forshell/CustomerClassLoader;->initialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_1

    .line 211
    :cond_0
    monitor-exit p0

    return-void

    .line 142
    :cond_1
    const/4 v7, 0x1

    :try_start_1
    iput-boolean v7, p0, Lcom/example/forshell/CustomerClassLoader;->initialized:Z

    .line 144
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->path:Ljava/lang/String;

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    .line 145
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    array-length v2, v7

    .line 147
    .local v2, "length":I
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "PathClassLoader: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 148
    new-array v7, v2, [Ljava/io/File;

    iput-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mFiles:[Ljava/io/File;

    .line 149
    new-array v7, v2, [Ljava/util/zip/ZipFile;

    iput-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mZips:[Ljava/util/zip/ZipFile;

    .line 150
    new-array v7, v2, [Ldalvik/system/DexFile;

    iput-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mDexs:[Ldalvik/system/DexFile;

    .line 153
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_3

    .line 154
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "My path is: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    aget-object v9, v9, v1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 155
    new-instance v4, Ljava/io/File;

    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    aget-object v7, v7, v1

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 156
    .local v4, "pathFile":Ljava/io/File;
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mFiles:[Ljava/io/File;

    aput-object v4, v7, v1

    .line 158
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-eqz v7, :cond_2

    .line 160
    :try_start_2
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mZips:[Ljava/util/zip/ZipFile;

    new-instance v8, Ljava/util/zip/ZipFile;

    invoke-direct {v8, v4}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    aput-object v8, v7, v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 169
    :goto_1
    :try_start_3
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mDexOutputPath:Ljava/lang/String;

    if-eqz v7, :cond_2

    .line 170
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    aget-object v7, v7, v1

    iget-object v8, p0, Lcom/example/forshell/CustomerClassLoader;->mDexOutputPath:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/example/forshell/CustomerClassLoader;->generateOutputName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 172
    .local v3, "outputName":Ljava/lang/String;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "-------------------->loadDex"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 173
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Para1:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    aget-object v9, v9, v1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 174
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Para2:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 175
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mDexs:[Ldalvik/system/DexFile;

    iget-object v8, p0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    aget-object v8, v8, v1

    const/4 v9, 0x0

    invoke-static {v8, v3, v9}, Ldalvik/system/DexFile;->loadDex(Ljava/lang/String;Ljava/lang/String;I)Ldalvik/system/DexFile;

    move-result-object v8

    aput-object v8, v7, v1

    .line 176
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "init ok"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 153
    .end local v3    # "outputName":Ljava/lang/String;
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 188
    .end local v4    # "pathFile":Ljava/io/File;
    :cond_3
    :try_start_4
    const-string v7, "java.library.path"

    const-string v8, "."

    invoke-static {v7, v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 189
    .local v5, "pathList":Ljava/lang/String;
    const-string v7, "path.separator"

    const-string v8, ":"

    invoke-static {v7, v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 190
    .local v6, "pathSep":Ljava/lang/String;
    const-string v7, "file.separator"

    const-string v8, "/"

    invoke-static {v7, v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "fileSep":Ljava/lang/String;
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->libPath:Ljava/lang/String;

    if-eqz v7, :cond_4

    .line 193
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_6

    .line 194
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/example/forshell/CustomerClassLoader;->libPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 200
    :cond_4
    :goto_3
    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mLibPaths:[Ljava/lang/String;

    .line 201
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mLibPaths:[Ljava/lang/String;

    array-length v2, v7

    .line 205
    const/4 v1, 0x0

    :goto_4
    if-ge v1, v2, :cond_0

    .line 206
    iget-object v7, p0, Lcom/example/forshell/CustomerClassLoader;->mLibPaths:[Ljava/lang/String;

    aget-object v7, v7, v1

    invoke-virtual {v7, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 207
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/example/forshell/CustomerClassLoader;->mLibPaths:[Ljava/lang/String;

    aget-object v9, v8, v1

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v8, v1

    .line 205
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 196
    :cond_6
    iget-object v5, p0, Lcom/example/forshell/CustomerClassLoader;->libPath:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    .line 138
    .end local v0    # "fileSep":Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "length":I
    .end local v5    # "pathList":Ljava/lang/String;
    .end local v6    # "pathSep":Ljava/lang/String;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 178
    .restart local v1    # "i":I
    .restart local v2    # "length":I
    .restart local v4    # "pathFile":Ljava/io/File;
    :catch_0
    move-exception v7

    goto :goto_2

    .line 161
    :catch_1
    move-exception v7

    goto/16 :goto_1
.end method

.method private static generateOutputName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "sourcePathName"    # Ljava/lang/String;
    .param p1, "outputDir"    # Ljava/lang/String;

    .prologue
    .line 220
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v4, 0x50

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 223
    .local v2, "newStr":Ljava/lang/StringBuilder;
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    const-string v4, "/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 225
    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    :cond_0
    const-string v4, "/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 230
    .local v1, "lastSlash":I
    if-gez v1, :cond_1

    .line 231
    move-object v3, p0

    .line 244
    .local v3, "sourceFileName":Ljava/lang/String;
    :goto_0
    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 245
    .local v0, "lastDot":I
    if-gez v0, :cond_2

    .line 247
    const-string v4, "classes"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    :goto_1
    const-string v4, ".dex"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 233
    .end local v0    # "lastDot":I
    .end local v3    # "sourceFileName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "sourceFileName":Ljava/lang/String;
    goto :goto_0

    .line 250
    .restart local v0    # "lastDot":I
    :cond_2
    const-string v4, "classes"

    const/4 v5, 0x0

    const/4 v6, 0x7

    invoke-virtual {v2, v4, v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private loadFromArchive(Ljava/util/zip/ZipFile;Ljava/lang/String;)[B
    .locals 10
    .param p1, "zip"    # Ljava/util/zip/ZipFile;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 512
    invoke-virtual {p1, p2}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v3

    .line 513
    .local v3, "entry":Ljava/util/zip/ZipEntry;
    if-nez v3, :cond_0

    .line 540
    :goto_0
    return-object v6

    .line 526
    :cond_0
    :try_start_0
    invoke-virtual {p1, v3}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v5

    .line 527
    .local v5, "stream":Ljava/io/InputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v8

    long-to-int v7, v8

    invoke-direct {v1, v7}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 528
    .local v1, "byteStream":Ljava/io/ByteArrayOutputStream;
    const/16 v7, 0x1000

    new-array v0, v7, [B

    .line 529
    .local v0, "buf":[B
    :goto_1
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "count":I
    if-lez v2, :cond_1

    .line 530
    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 533
    .end local v0    # "buf":[B
    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "count":I
    .end local v5    # "stream":Ljava/io/InputStream;
    :catch_0
    move-exception v4

    .line 536
    .local v4, "ioex":Ljava/io/IOException;
    goto :goto_0

    .line 532
    .end local v4    # "ioex":Ljava/io/IOException;
    .restart local v0    # "buf":[B
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "count":I
    .restart local v5    # "stream":Ljava/io/InputStream;
    :cond_1
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    goto :goto_0
.end method

.method private loadFromDirectory(Ljava/lang/String;)[B
    .locals 7
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 484
    :try_start_0
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v4, "r"

    invoke-direct {v3, p1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 491
    .local v3, "raf":Ljava/io/RandomAccessFile;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    long-to-int v4, v4

    new-array v0, v4, [B

    .line 492
    .local v0, "fileData":[B
    invoke-virtual {v3, v0}, Ljava/io/RandomAccessFile;->read([B)I

    .line 493
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 500
    .end local v0    # "fileData":[B
    .end local v3    # "raf":Ljava/io/RandomAccessFile;
    :goto_0
    return-object v0

    .line 485
    :catch_0
    move-exception v1

    .line 487
    .local v1, "fnfe":Ljava/io/FileNotFoundException;
    const/4 v0, 0x0

    goto :goto_0

    .line 494
    .end local v1    # "fnfe":Ljava/io/FileNotFoundException;
    .restart local v3    # "raf":Ljava/io/RandomAccessFile;
    :catch_1
    move-exception v2

    .line 495
    .local v2, "ioe":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error reading from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 497
    const/4 v0, 0x0

    .restart local v0    # "fileData":[B
    goto :goto_0
.end method

.method public static native writeback(Ljava/lang/String;)V
.end method


# virtual methods
.method protected findClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 16
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 272
    invoke-direct/range {p0 .. p0}, Lcom/example/forshell/CustomerClassLoader;->ensureInit()V

    .line 274
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "PathClassLoader "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ": findClass \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 277
    const/4 v3, 0x0

    .line 278
    .local v3, "data":[B
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    array-length v7, v13

    .line 280
    .local v7, "length":I
    const/4 v9, 0x0

    .line 281
    .local v9, "res":Z
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v6

    .line 283
    .local v6, "len":I
    const/16 v13, 0x10

    new-array v11, v13, [Ljava/lang/String;

    const/4 v13, 0x0

    const-string v14, "android.support"

    aput-object v14, v11, v13

    const/4 v13, 0x1

    const-string v14, "com.baidu."

    aput-object v14, v11, v13

    const/4 v13, 0x2

    const-string v14, "com.amap"

    aput-object v14, v11, v13

    const/4 v13, 0x3

    const-string v14, "com.sina"

    aput-object v14, v11, v13

    const/4 v13, 0x4

    const-string v14, "com.google"

    aput-object v14, v11, v13

    const/4 v13, 0x5

    const-string v14, "com.tencent."

    aput-object v14, v11, v13

    const/4 v13, 0x6

    const-string v14, "com.alipay"

    aput-object v14, v11, v13

    const/4 v13, 0x7

    const-string v14, "com.facebook"

    aput-object v14, v11, v13

    const/16 v13, 0x8

    const-string v14, "com.alibaba."

    aput-object v14, v11, v13

    const/16 v13, 0x9

    const-string v14, "com.xiaomi"

    aput-object v14, v11, v13

    const/16 v13, 0xa

    const-string v14, "com.taobao"

    aput-object v14, v11, v13

    const/16 v13, 0xb

    const-string v14, "org.jivesoftware"

    aput-object v14, v11, v13

    const/16 v13, 0xc

    const-string v14, "com.easemob"

    aput-object v14, v11, v13

    const/16 v13, 0xd

    const-string v14, "com.umeng"

    aput-object v14, v11, v13

    const/16 v13, 0xe

    const-string v14, "com.bumptech"

    aput-object v14, v11, v13

    const/16 v13, 0xf

    const-string v14, "okhttp3"

    aput-object v14, v11, v13

    .line 285
    .local v11, "str":[Ljava/lang/String;
    const/4 v13, 0x7

    if-lt v6, v13, :cond_1

    .line 286
    const-string v12, ""

    .line 287
    .local v12, "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/4 v14, 0x7

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 288
    if-nez v9, :cond_0

    const/16 v13, 0xf

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_19

    :cond_0
    const/4 v9, 0x1

    .line 290
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_1
    :goto_0
    const/16 v13, 0x8

    if-lt v6, v13, :cond_4

    .line 291
    const-string v12, ""

    .line 292
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0x8

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 293
    if-nez v9, :cond_2

    const/4 v13, 0x2

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a

    :cond_2
    const/4 v9, 0x1

    .line 294
    :goto_1
    const-string v12, ""

    .line 295
    const/4 v13, 0x0

    const/16 v14, 0x8

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 296
    if-nez v9, :cond_3

    const/4 v13, 0x3

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1b

    :cond_3
    const/4 v9, 0x1

    .line 298
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_4
    :goto_2
    const/16 v13, 0x9

    if-lt v6, v13, :cond_6

    .line 299
    const-string v12, ""

    .line 300
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0x9

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 301
    if-nez v9, :cond_5

    const/16 v13, 0xd

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1c

    :cond_5
    const/4 v9, 0x1

    .line 303
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_6
    :goto_3
    const/16 v13, 0xa

    if-lt v6, v13, :cond_c

    .line 304
    const-string v12, ""

    .line 305
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0xa

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 306
    if-nez v9, :cond_7

    const/4 v13, 0x1

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1d

    :cond_7
    const/4 v9, 0x1

    .line 307
    :goto_4
    const-string v12, ""

    .line 308
    const/4 v13, 0x0

    const/16 v14, 0xa

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 309
    if-nez v9, :cond_8

    const/4 v13, 0x4

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1e

    :cond_8
    const/4 v9, 0x1

    .line 310
    :goto_5
    const-string v12, ""

    .line 311
    const/4 v13, 0x0

    const/16 v14, 0xa

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 312
    if-nez v9, :cond_9

    const/4 v13, 0x6

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1f

    :cond_9
    const/4 v9, 0x1

    .line 313
    :goto_6
    const-string v12, ""

    .line 314
    const/4 v13, 0x0

    const/16 v14, 0xa

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 315
    if-nez v9, :cond_a

    const/16 v13, 0x9

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_20

    :cond_a
    const/4 v9, 0x1

    .line 316
    :goto_7
    const-string v12, ""

    .line 317
    const/4 v13, 0x0

    const/16 v14, 0xa

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 318
    if-nez v9, :cond_b

    const/16 v13, 0xa

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_21

    :cond_b
    const/4 v9, 0x1

    .line 320
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_c
    :goto_8
    const/16 v13, 0xb

    if-lt v6, v13, :cond_e

    .line 321
    const-string v12, ""

    .line 322
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0xb

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 323
    if-nez v9, :cond_d

    const/16 v13, 0xc

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_22

    :cond_d
    const/4 v9, 0x1

    .line 325
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_e
    :goto_9
    const/16 v13, 0xc

    if-lt v6, v13, :cond_13

    .line 326
    const-string v12, ""

    .line 327
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 328
    if-nez v9, :cond_f

    const/4 v13, 0x5

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_23

    :cond_f
    const/4 v9, 0x1

    .line 330
    :goto_a
    const-string v12, ""

    .line 331
    const/4 v13, 0x0

    const/16 v14, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 332
    if-nez v9, :cond_10

    const/4 v13, 0x7

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_24

    :cond_10
    const/4 v9, 0x1

    .line 334
    :goto_b
    const-string v12, ""

    .line 335
    const/4 v13, 0x0

    const/16 v14, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 336
    if-nez v9, :cond_11

    const/16 v13, 0x8

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_25

    :cond_11
    const/4 v9, 0x1

    .line 338
    :goto_c
    const-string v12, ""

    .line 339
    const/4 v13, 0x0

    const/16 v14, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 340
    if-nez v9, :cond_12

    const/16 v13, 0xe

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_26

    :cond_12
    const/4 v9, 0x1

    .line 342
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_13
    :goto_d
    const/16 v13, 0xf

    if-lt v6, v13, :cond_15

    .line 343
    const-string v12, ""

    .line 344
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0xf

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 345
    if-nez v9, :cond_14

    const/4 v13, 0x0

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_27

    :cond_14
    const/4 v9, 0x1

    .line 347
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_15
    :goto_e
    const/16 v13, 0x10

    if-lt v6, v13, :cond_17

    .line 348
    const-string v12, ""

    .line 349
    .restart local v12    # "strtemp":Ljava/lang/String;
    const/4 v13, 0x0

    const/16 v14, 0x10

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 350
    if-nez v9, :cond_16

    const/16 v13, 0xb

    aget-object v13, v11, v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_28

    :cond_16
    const/4 v9, 0x1

    .line 353
    .end local v12    # "strtemp":Ljava/lang/String;
    :cond_17
    :goto_f
    const/4 v13, 0x1

    if-eq v9, v13, :cond_18

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/example/forshell/CustomerClassLoader;->is_write_back:Z

    if-eqz v13, :cond_18

    .line 355
    invoke-static/range {p1 .. p1}, Lcom/example/forshell/CustomerClassLoader;->writeback(Ljava/lang/String;)V

    .line 360
    :cond_18
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_10
    if-ge v5, v7, :cond_2d

    .line 362
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/example/forshell/CustomerClassLoader;->mDexs:[Ldalvik/system/DexFile;

    aget-object v13, v13, v5

    if-eqz v13, :cond_2a

    .line 363
    const/16 v13, 0x2e

    const/16 v14, 0x2f

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    .line 364
    .local v10, "slashName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/example/forshell/CustomerClassLoader;->mDexs:[Ldalvik/system/DexFile;

    aget-object v13, v13, v5

    move-object/from16 v0, p0

    invoke-virtual {v13, v10, v0}, Ldalvik/system/DexFile;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 365
    .local v2, "clazz":Ljava/lang/Class;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v14, "find class ok"

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 366
    if-eqz v2, :cond_29

    .line 379
    .end local v2    # "clazz":Ljava/lang/Class;
    :goto_11
    return-object v2

    .line 288
    .end local v5    # "i":I
    .end local v10    # "slashName":Ljava/lang/String;
    .restart local v12    # "strtemp":Ljava/lang/String;
    :cond_19
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 293
    :cond_1a
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 296
    :cond_1b
    const/4 v9, 0x0

    goto/16 :goto_2

    .line 301
    :cond_1c
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 306
    :cond_1d
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 309
    :cond_1e
    const/4 v9, 0x0

    goto/16 :goto_5

    .line 312
    :cond_1f
    const/4 v9, 0x0

    goto/16 :goto_6

    .line 315
    :cond_20
    const/4 v9, 0x0

    goto/16 :goto_7

    .line 318
    :cond_21
    const/4 v9, 0x0

    goto/16 :goto_8

    .line 323
    :cond_22
    const/4 v9, 0x0

    goto/16 :goto_9

    .line 328
    :cond_23
    const/4 v9, 0x0

    goto/16 :goto_a

    .line 332
    :cond_24
    const/4 v9, 0x0

    goto/16 :goto_b

    .line 336
    :cond_25
    const/4 v9, 0x0

    goto/16 :goto_c

    .line 340
    :cond_26
    const/4 v9, 0x0

    goto/16 :goto_d

    .line 345
    :cond_27
    const/4 v9, 0x0

    goto :goto_e

    .line 350
    :cond_28
    const/4 v9, 0x0

    goto :goto_f

    .line 369
    .end local v12    # "strtemp":Ljava/lang/String;
    .restart local v2    # "clazz":Ljava/lang/Class;
    .restart local v5    # "i":I
    .restart local v10    # "slashName":Ljava/lang/String;
    :cond_29
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v14, "find class failed"

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 374
    :try_start_0
    invoke-super/range {p0 .. p1}, Ldalvik/system/PathClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 375
    .local v1, "cla":Ljava/lang/Class;
    if-eqz v1, :cond_2b

    move-object v2, v1

    .line 379
    goto :goto_11

    .line 386
    .end local v1    # "cla":Ljava/lang/Class;
    .end local v2    # "clazz":Ljava/lang/Class;
    .end local v10    # "slashName":Ljava/lang/String;
    :cond_2a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/example/forshell/CustomerClassLoader;->mZips:[Ljava/util/zip/ZipFile;

    aget-object v13, v13, v5

    if-eqz v13, :cond_2c

    .line 387
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v14, 0x2e

    const/16 v15, 0x2f

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".class"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 388
    .local v4, "fileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/example/forshell/CustomerClassLoader;->mZips:[Ljava/util/zip/ZipFile;

    aget-object v13, v13, v5

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v4}, Lcom/example/forshell/CustomerClassLoader;->loadFromArchive(Ljava/util/zip/ZipFile;Ljava/lang/String;)[B

    move-result-object v3

    .line 360
    .end local v4    # "fileName":Ljava/lang/String;
    :cond_2b
    :goto_12
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_10

    .line 390
    :cond_2c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/example/forshell/CustomerClassLoader;->mFiles:[Ljava/io/File;

    aget-object v8, v13, v5

    .line 391
    .local v8, "pathFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v13

    if-eqz v13, :cond_2b

    .line 392
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/example/forshell/CustomerClassLoader;->mPaths:[Ljava/lang/String;

    aget-object v14, v14, v5

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x2e

    const/16 v15, 0x2f

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".class"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 394
    .restart local v4    # "fileName":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/example/forshell/CustomerClassLoader;->loadFromDirectory(Ljava/lang/String;)[B

    move-result-object v3

    goto :goto_12

    .line 416
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v8    # "pathFile":Ljava/io/File;
    :cond_2d
    new-instance v13, Ljava/lang/ClassNotFoundException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " in loader "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 381
    .restart local v2    # "clazz":Ljava/lang/Class;
    .restart local v10    # "slashName":Ljava/lang/String;
    :catch_0
    move-exception v13

    goto :goto_12
.end method

.method public setIs_write_back(I)V
    .locals 3
    .param p1, "is_write_back"    # I

    .prologue
    const/4 v0, 0x1

    .line 80
    if-ne p1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/example/forshell/CustomerClassLoader;->is_write_back:Z

    .line 81
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "CustomerClassLoader setIs_write_back ok"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 82
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "is_write_back:    "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/example/forshell/CustomerClassLoader;->is_write_back:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 83
    return-void

    .line 80
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
