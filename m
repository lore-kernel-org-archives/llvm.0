Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E763CE;
	Sun, 22 Oct 2023 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7EIG+bg"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-1c9b95943beso21413225ad.1;
        Sun, 22 Oct 2023 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697999967; x=1698604767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9XnGTqS6VWrLiI+nuP6yzxfhhc0PJY1/9rd1gvde04=;
        b=Z7EIG+bgE3VR2bJV5Ye3UJ39rOC85AaYl5iYlcuP6PUFmcspeBqV+Y3ZPK5iG5iOON
         l7sTjQ5fozaKRCdtc3zUl2hH03BDGyFsbPhJHycFv2mcfFy5c4hPJYQTE37bo9tok8G3
         KxQfzz8mxw+e7REiqCEql3Nb3yfupLX6vrTBSnKjx+sW7aGfM72OZAernRFwNquMO77d
         NzS48YTmBcYNS5q353L5JpyFPyFxefawyenWkapSkjCCOWQRC86kFUzH7mV7G+0/ze8Y
         kcPnQSoOt791xj6p76AOjZq9OlKNYIn39ULa5/csEap+JvQ6XjAn6/GY4WVazGuF1Aul
         Dbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697999967; x=1698604767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9XnGTqS6VWrLiI+nuP6yzxfhhc0PJY1/9rd1gvde04=;
        b=kZt6PA2qBrlxclSEMFrDpXdLRh+RybGY6W+ntJIo30fzE7H7s1YVbdqWM5U4Vz9zPY
         mappKKA4yXQzaFiITX4ZC/oDS5PGStrkWCols0ZCyj3Wr2iQcYwpTjI2FnJOuVs0r7Rg
         gHXBnNC7csWON+RgswnQcn2ZYxn/kSkroybGhYkPCDCxb/QYvSsdUCqLebiMPpcwBIWn
         ZhC/Unav89bRD/ksfg1qTT9pKCOL5lqjz8LzFmB07iytS4jFynXnyyIwyCWJaZpbcLQK
         omd06HF4Bk8beXcC37ej2nLpSaqpgIAzeTFwBVzd6nlYXMtRdZ0EDQlKbhz4PIlrCzN7
         cNUg==
X-Gm-Message-State: AOJu0YxKZmAVMD8LUNIrqRlG7OijDhwDADy03/FaP23GlwQUvzckcI1P
	VkHsW7L2rENV+zUC1DRR9yQ=
X-Google-Smtp-Source: AGHT+IGtJn40MHIY1wL/r/2JYdCJPBQM+Et+9XlN6Ua5mnUsXU68QMG0DWmO7g0krYdP9MYWZgbJqg==
X-Received: by 2002:a17:902:e844:b0:1c6:25c3:13d3 with SMTP id t4-20020a170902e84400b001c625c313d3mr8145238plg.6.1697999967482;
        Sun, 22 Oct 2023 11:39:27 -0700 (PDT)
Received: from localhost ([2409:8a3c:3640:7481:178a:30e9:674c:c2f3])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm4649961plh.186.2023.10.22.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 11:39:27 -0700 (PDT)
From: John Sanpe <sanpeqf@gmail.com>
To: stfrench@microsoft.com,
	linkinjeon@kernel.org,
	pc@manguebit.com,
	sprasad@microsoft.com,
	linux-cifs@vger.kernel.org
Cc: llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	John Sanpe <sanpeqf@gmail.com>
Subject: [PATCH] fs/smb: using crypto lib instead cifs_arc4
Date: Mon, 23 Oct 2023 02:39:17 +0800
Message-ID: <20231022183917.1013135-1-sanpeqf@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace internal logic with an independent arc4 library.

Signed-off-by: John Sanpe <sanpeqf@gmail.com>
---
 fs/smb/Kconfig              |  1 +
 fs/smb/client/cifsencrypt.c |  7 ++--
 fs/smb/common/Makefile      |  1 -
 fs/smb/common/arc4.h        | 23 ------------
 fs/smb/common/cifs_arc4.c   | 74 -------------------------------------
 fs/smb/server/auth.c        |  6 +--
 6 files changed, 7 insertions(+), 105 deletions(-)
 delete mode 100644 fs/smb/common/arc4.h
 delete mode 100644 fs/smb/common/cifs_arc4.c

diff --git a/fs/smb/Kconfig b/fs/smb/Kconfig
index ef425789fa6a..65e5a437898b 100644
--- a/fs/smb/Kconfig
+++ b/fs/smb/Kconfig
@@ -7,5 +7,6 @@ source "fs/smb/server/Kconfig"
 
 config SMBFS
 	tristate
+	select CRYPTO_LIB_ARC4
 	default y if CIFS=y || SMB_SERVER=y
 	default m if CIFS=m || SMB_SERVER=m
diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.c
index ef4c2e3c9fa6..d8754c406b5f 100644
--- a/fs/smb/client/cifsencrypt.c
+++ b/fs/smb/client/cifsencrypt.c
@@ -21,7 +21,7 @@
 #include <linux/random.h>
 #include <linux/highmem.h>
 #include <linux/fips.h>
-#include "../common/arc4.h"
+#include <crypto/arc4.h>
 #include <crypto/aead.h>
 
 /*
@@ -826,9 +826,8 @@ calc_seckey(struct cifs_ses *ses)
 		return -ENOMEM;
 	}
 
-	cifs_arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_KEY_SIZE);
-	cifs_arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key,
-			CIFS_CPHTXT_SIZE);
+	arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_KEY_SIZE);
+	arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key, CIFS_CPHTXT_SIZE);
 
 	/* make secondary_key/nonce as session key */
 	memcpy(ses->auth_key.response, sec_key, CIFS_SESS_KEY_SIZE);
diff --git a/fs/smb/common/Makefile b/fs/smb/common/Makefile
index c66dbbc1469c..9e0730a385fb 100644
--- a/fs/smb/common/Makefile
+++ b/fs/smb/common/Makefile
@@ -3,5 +3,4 @@
 # Makefile for Linux filesystem routines that are shared by client and server.
 #
 
-obj-$(CONFIG_SMBFS) += cifs_arc4.o
 obj-$(CONFIG_SMBFS) += cifs_md4.o
diff --git a/fs/smb/common/arc4.h b/fs/smb/common/arc4.h
deleted file mode 100644
index 12e71ec033a1..000000000000
--- a/fs/smb/common/arc4.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Common values for ARC4 Cipher Algorithm
- */
-
-#ifndef _CRYPTO_ARC4_H
-#define _CRYPTO_ARC4_H
-
-#include <linux/types.h>
-
-#define ARC4_MIN_KEY_SIZE	1
-#define ARC4_MAX_KEY_SIZE	256
-#define ARC4_BLOCK_SIZE		1
-
-struct arc4_ctx {
-	u32 S[256];
-	u32 x, y;
-};
-
-int cifs_arc4_setkey(struct arc4_ctx *ctx, const u8 *in_key, unsigned int key_len);
-void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, unsigned int len);
-
-#endif /* _CRYPTO_ARC4_H */
diff --git a/fs/smb/common/cifs_arc4.c b/fs/smb/common/cifs_arc4.c
deleted file mode 100644
index 043e4cb839fa..000000000000
--- a/fs/smb/common/cifs_arc4.c
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API
- *
- * ARC4 Cipher Algorithm
- *
- * Jon Oberheide <jon@oberheide.org>
- */
-
-#include <linux/module.h>
-#include "arc4.h"
-
-MODULE_LICENSE("GPL");
-
-int cifs_arc4_setkey(struct arc4_ctx *ctx, const u8 *in_key, unsigned int key_len)
-{
-	int i, j = 0, k = 0;
-
-	ctx->x = 1;
-	ctx->y = 0;
-
-	for (i = 0; i < 256; i++)
-		ctx->S[i] = i;
-
-	for (i = 0; i < 256; i++) {
-		u32 a = ctx->S[i];
-
-		j = (j + in_key[k] + a) & 0xff;
-		ctx->S[i] = ctx->S[j];
-		ctx->S[j] = a;
-		if (++k >= key_len)
-			k = 0;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(cifs_arc4_setkey);
-
-void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, unsigned int len)
-{
-	u32 *const S = ctx->S;
-	u32 x, y, a, b;
-	u32 ty, ta, tb;
-
-	if (len == 0)
-		return;
-
-	x = ctx->x;
-	y = ctx->y;
-
-	a = S[x];
-	y = (y + a) & 0xff;
-	b = S[y];
-
-	do {
-		S[y] = a;
-		a = (a + b) & 0xff;
-		S[x] = b;
-		x = (x + 1) & 0xff;
-		ta = S[x];
-		ty = (y + ta) & 0xff;
-		tb = S[ty];
-		*out++ = *in++ ^ S[a];
-		if (--len == 0)
-			break;
-		y = ty;
-		a = ta;
-		b = tb;
-	} while (true);
-
-	ctx->x = x;
-	ctx->y = y;
-}
-EXPORT_SYMBOL_GPL(cifs_arc4_crypt);
diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 229a6527870d..5640196b313f 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -29,7 +29,7 @@
 #include "mgmt/user_config.h"
 #include "crypto_ctx.h"
 #include "transport_ipc.h"
-#include "../common/arc4.h"
+#include <crypto/arc4.h>
 
 /*
  * Fixed format data defining GSS header and fixed string
@@ -362,9 +362,9 @@ int ksmbd_decode_ntlmssp_auth_blob(struct authenticate_message *authblob,
 		if (!ctx_arc4)
 			return -ENOMEM;
 
-		cifs_arc4_setkey(ctx_arc4, sess->sess_key,
+		arc4_setkey(ctx_arc4, sess->sess_key,
 				 SMB2_NTLMV2_SESSKEY_SIZE);
-		cifs_arc4_crypt(ctx_arc4, sess->sess_key,
+		arc4_crypt(ctx_arc4, sess->sess_key,
 				(char *)authblob + sess_key_off, sess_key_len);
 		kfree_sensitive(ctx_arc4);
 	}
-- 
2.41.0

