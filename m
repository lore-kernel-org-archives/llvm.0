Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343912CA5
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 15:27:06 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id b2so8854854vso.9
        for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=QX+g1hCOW91cXXnSggcw6gj04u3NWBZ31aKJT4qy8z4=;
        b=HD/4qz2z/NdjjLU1lR4H3U15s5msIFLg7DBqWhui4lujSGMlzrXXW637fmJHyj7rJg
         9ZSLBqe0C+Gv5VtDiUFNtMoyYHNHXkH1NpFo+NqijUSbm0XwOJGMaZ5h+0pmGbWRKG28
         QnPjy7wB8St3ENbSz7Gx/BOgxWyQ04LuBZggu9IcCAiI3HQNAYvlPeZ8tTB9kxKwOZxb
         E4HRukFXNvmbOGDV1Vgfj7yxjC6SEy1wIsQ8jtKL4zdIx4x9GJP+TTiN2ONPMM9M0tYf
         zIqUquFg4g0eiezyCtsEWtknBXBlTPEUfphOElqsiWhlniImPrlSNO89ou/k6U1S+FFZ
         ShwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=QX+g1hCOW91cXXnSggcw6gj04u3NWBZ31aKJT4qy8z4=;
        b=V+tLdNPcUwoqqcZlPBfN9gURrTy/ypKzKQOSKV7UgngpUSdeHUhU9q1fkjhUSgqgI+
         18u8KLoFDYSG/8loBH4u+cGkV5LPTxaA1J5+l+0FJ2KQb7W0P1jQynrF8aMdUqLiY9yK
         id+MhIRZfzVH7piOwrCSitCbygY/nUemA/DjtB2HR8MgciBLjEMEWDp2vKTaq9F8yifM
         hfcuUpDs8NdWSMKY0l9doGKFR7sjUUpFsZHkiP4FijOBAF4fBpmexFlLm2evB+rVz9WZ
         IBMj0ZNQEQVmfZxtLrepM2MnVBHCZDUUrFRM5lRv/UDBUKMFgh9KDfMtivXtY0E/+d9l
         f2Zw==
X-Gm-Message-State: AOAM531ddhx91F4DiUsgNng/pNjlSblu1u726xuwZpb+Mey9qhxXtxXb
	0R2+dttwMWdMBQCDPj+vloh3RA==
X-Google-Smtp-Source: ABdhPJxkGrsc+o2xJu08YhAkeRNFOz6+5hhYb5WDUPUWhPpwgPKwhiHccgAA6hO+d1qRqqhfQPS+dQ==
X-Received: by 2002:a05:6102:5490:: with SMTP id bk16mr6607320vsb.33.1643556425648;
        Sun, 30 Jan 2022 07:27:05 -0800 (PST)
Received: from fedora ([187.36.236.204])
        by smtp.gmail.com with ESMTPSA id w5sm3139815vkf.12.2022.01.30.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 07:27:05 -0800 (PST)
Date: Sun, 30 Jan 2022 12:27:00 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: gregkh@linuxfoundation.org, tj@kernel.org, viro@zeniv.linux.org.uk,
	nathan@kernel.org, ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] seq_file: fix NULL pointer arithmetic warning
Message-ID: <YfauRJpYiAT3yEnK@fedora>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Implement conditional logic in order to replace NULL pointer arithmetic.

The use of NULL pointer arithmetic was pointed out by clang with the
following warning:

fs/kernfs/file.c:128:15: warning: performing pointer arithmetic on a
null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                return NULL + !*ppos;
                       ~~~~ ^
fs/seq_file.c:559:14: warning: performing pointer arithmetic on a
null pointer has undefined behavior [-Wnull-pointer-arithmetic]
        return NULL + (*pos == 0);

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 fs/kernfs/file.c | 6 ++++--
 fs/seq_file.c    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 9414a7a60a9f..3a6990c7fe8e 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -120,12 +120,14 @@ static void *kernfs_seq_start(struct seq_file *sf, loff_t *ppos)
 		if (next == ERR_PTR(-ENODEV))
 			kernfs_seq_stop_active(sf, next);
 		return next;
-	} else {
+	} else if (*ppos) {
 		/*
 		 * The same behavior and code as single_open().  Returns
 		 * !NULL if pos is at the beginning; otherwise, NULL.
 		 */
-		return NULL + !*ppos;
+		return NULL;
+	} else {
+		return (void *) 1;
 	}
 }
 
diff --git a/fs/seq_file.c b/fs/seq_file.c
index f8e1f4ee87ff..7b6165d5d829 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -556,7 +556,7 @@ EXPORT_SYMBOL(seq_dentry);
 
 static void *single_start(struct seq_file *p, loff_t *pos)
 {
-	return NULL + (*pos == 0);
+	return *pos ? NULL : (void *) 1;
 }
 
 static void *single_next(struct seq_file *p, void *v, loff_t *pos)
-- 
2.34.1

