Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68398AD21
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 23:46:25 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id jn22so34251260plb.13
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 15:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=euRwx6QF/OV6RpXiKr7BIdAc00ukRSAUiOkpbL7iCKU=;
        b=XjKNtQpNLJ8aqo7xjHoll4+DdwZrxKRZXlYp6JqqXGXYzu6avm3dJLbOsMQuy89EdG
         OIWBFWbEMo8JNz8qp4S5dPsIzqCFDBkzKAK65Fd3iUKktYjLfZgxonKbHUMSqauJ6Kyx
         kSt3wX07D1moGHhO+wh5Wh7DHypEKw3VjuYS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euRwx6QF/OV6RpXiKr7BIdAc00ukRSAUiOkpbL7iCKU=;
        b=rQk8kFS2qOgrP5dxiiGCXrS3oLz7N71YaaDzlIlf7MAAzQYp0hjlrlvrcKRS3BYaPi
         HUWw5IU6b+YprYmtCu8pacXxe1VWJbvuoycQspb50Y7VBVkjHlx0Lfv5yhLRPOR6dSgo
         AgJqOO7Ee2I3Co9wps+V8KO27KUPjKgqTCsxjQqnw2vtpjeKoWQpaetDtK1jW/JAKwFr
         3iM6UPVamiESJxHaDKDYM1s/ikEefqdYrEd8BJVEHRFpwOTA2ANGBw7rZRAOB2gSclPg
         FcZaoBCgRjL8klU2Va+Ir/C1WBrnWKTX03vbh4HX6K8hkyQBlxmuCDox0shnPby97SGA
         fnSA==
X-Gm-Message-State: AFqh2kp5F/0prTIiNEcQ4bteG4LAo0+WGjOBs9/xGZXmsYpO7bccurBt
	l6po38P7BOh0lh5koA3EiSIYqw==
X-Google-Smtp-Source: AMrXdXv/JNePduRY0txUDdRCt5JhRSIR6DrhMpv75pkJ3d4K/8KqbSdJC4O5iyMFwg38vN8/tHD1Kg==
X-Received: by 2002:a05:6a20:bf19:b0:af:dc62:8abd with SMTP id gc25-20020a056a20bf1900b000afdc628abdmr50713685pzb.0.1672789584914;
        Tue, 03 Jan 2023 15:46:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23-20020aa794b7000000b00582729b7032sm4793752pfl.97.2023.01.03.15.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 15:46:24 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: tytso@mit.edu
Cc: Kees Cook <keescook@chromium.org>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ext4: Fix function prototype mismatch for ext4_feat_ktype
Date: Tue,  3 Jan 2023 15:46:20 -0800
Message-Id: <20230103234616.never.915-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630; h=from:subject:message-id; bh=EPPA4fAFZuWB5pdzvby7FTtYsOyM2XQPaphR85N5tMQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjtL5MF54NCvmDQY0Dd7rNnLX1L0GvWxEKudKalV75 pS6Nr92JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY7S+TAAKCRCJcvTf3G3AJjndD/ 47MN61Dsc0UtJKECZp7gwKoY73Pw3qTWJzGhEO8zpglulKrzEkZeTmPqhCIiQ7U8fC9E6hyPMOvGkR JL3zryAjWLo9eGZSahA3Hd7tbnnwYZ/ZF2iKqEhnkRF/dnXpC5Pa1QozMpdidQ6rZO5/v9dnLQDW0w Xi98Dw0EjbPMvKQnM7L+uJoYyyiI7kBjsYAePwWSerOGNflmjK7jj+RLCAZgdRUMgPdvSSm/BCLYqg kDeTUx8FPOHowELmcRgHBexBBzvFKb65KXlUBj4hndW/bMUjLR2s9VTm09L3DeILJrL9iH6sNLRyjL ADKZtflw7g7rUxaQX3RIK5ML2pcj/272P3g/5uNtCyBkOkNgKWsAqedOsIP4goqWAI0QCMsKY3RIm2 7du4nSWz7sQdkpIIVqNJfHoKbtKKrkjwN552ikIhXKWsDOsjDzFzi0VbHikZiWupfdcX3Yl8JIeKvW BpVAP83s1pbJS54o4CwGMT+1M/K0iX1xNpYhaieiJfX6qePvsAdYLNmi2KmdDrPVNmDv7Lp8tCudP8 NKdrr8dUolvQoy3K9oBsuxGUcStGfPSaiMfyIhuAuGaPJbXjLMpTjkygqQBdEmRgYh3HSnPqeLNyQi EeXk5XyMYgH2WqJLhtBB1KTJuOLGoSuBDmmUvEPBF5znyJD3023rRY+4SY8w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed.

ext4_feat_ktype was setting the "release" handler to "kfree", which
doesn't have a matching function prototype. Add a simple wrapper
with the correct prototype.

This was found as a result of Clang's new -Wcast-function-type-strict
flag, which is more sensitive than the simpler -Wcast-function-type,
which only checks for type width mismatches.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/ext4/sysfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index d233c24ea342..83cf8b5afb54 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -491,6 +491,11 @@ static void ext4_sb_release(struct kobject *kobj)
 	complete(&sbi->s_kobj_unregister);
 }
 
+static void ext4_kobject_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct sysfs_ops ext4_attr_ops = {
 	.show	= ext4_attr_show,
 	.store	= ext4_attr_store,
@@ -505,7 +510,7 @@ static struct kobj_type ext4_sb_ktype = {
 static struct kobj_type ext4_feat_ktype = {
 	.default_groups = ext4_feat_groups,
 	.sysfs_ops	= &ext4_attr_ops,
-	.release	= (void (*)(struct kobject *))kfree,
+	.release	= ext4_kobject_release,
 };
 
 void ext4_notify_error_sysfs(struct ext4_sb_info *sbi)
-- 
2.34.1

