Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51168
	for <llvm@lists.linux.dev>; Wed,  3 Nov 2021 19:39:26 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id p16so7374483lfa.2
        for <llvm@lists.linux.dev>; Wed, 03 Nov 2021 12:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xiozs0LD/qCiuH2g73QvKrjdH/BKsUzCKCin0QnJksg=;
        b=yQoEgMpSMf/aD308JQxNV2TSpcdZ2eyGfazGExV5JJD22owh3+wplOV9roslUnr/U/
         qAtH/xqGvWj9rZdmpOfh9qxolr/gvDgvipZTU1tKfMNMy3n8PgqeGGOC3xlHO6YpQfe+
         ceHE6XgzMAV3Oj5bcXisPW4ufSE31kStQ7pk7R3Pop+7564SikViYZlWWfa+zJL4JFse
         hqvdbWiu5I/yM6EYhwyUxQ1zd2gKXMOIRzFMU7YbKsn+A6VbMrPQyqtANTBTDnSRuFuQ
         3P3Z7mJxPdcActQxk6KBokHsGIJDvbICkwyfMdg3gIREpruxytTuEjDUnNe915x7S9ti
         Hhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xiozs0LD/qCiuH2g73QvKrjdH/BKsUzCKCin0QnJksg=;
        b=L7gzwo5gLoGS8H06N1ynp3iSZUWbUnD6rfvaahRs7Y99/YzUhRVQ80IF/4vEqM/HQW
         t/RbEaGjwY+lKeF4ocd7pBN9DXnn6XrRArUdPEOswtgG8+yx2eCoHwnxsV3caQ55AAeD
         fJYVRp2e0glySRCJggM6J6tMVoWH4t7Fj3l9co+HqOFLjS2NX02ndbbjkwr4+/NU2oJ1
         tHSdYMRCbyW8F3W7D+LD6RgH4upKSSFKrYaZqLGqIDTerlE6xo0L64+ZSMRBf7b08YWl
         jzAJ5enRpyeh8lLA5gFCeJmKTGdhFQxYhsaIAFTqnUvh+l+28rRjT2GHLXZQgstfcJf2
         SX7w==
X-Gm-Message-State: AOAM533kZ4b8eFUjPcF3Ht6QIESwv7GVfvvZh5LKj4FzC9SrEiDQx9eO
	/Hzoy+zzJp93iWN65yseoYZLAA==
X-Google-Smtp-Source: ABdhPJxNUwP/1QQ0wCtd7iQ2XVGvcervJ2nt/JeNr/HOI1oo1drI2yLew/dUwVURjwfyuDyDTYzgow==
X-Received: by 2002:a05:6512:39c1:: with SMTP id k1mr43551899lfu.673.1635968364891;
        Wed, 03 Nov 2021 12:39:24 -0700 (PDT)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id l26sm254559lfh.247.2021.11.03.12.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 12:39:24 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: shuah@kernel.org
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] selftests: exec: unused command-line-argument '-pie'
Date: Wed,  3 Nov 2021 20:39:09 +0100
Message-Id: <20211103193909.3756095-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building selftests/exec with clang, makes clang warn about the
following:

clang -Wall -Wno-nonnull -D_GNU_SOURCE  -Wl,-z,max-page-size=0x200000 -pie -static load_address.c -o kselftest/exec/load_address_2097152
clang: warning: argument unused during compilation: '-pie' [-Wunused-command-line-argument]

Commit 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error")
tried to solve the issue, but when fixing the link error by adding '-static', the effect was that no pie binary was created, which makes the test case comletely pointless.
The gcc documentation states:

'-pie'
     Produce a dynamically linked position independent executable on
     targets that support it.  For predictable results, you must also
     specify the same set of options used for compilation ('-fpie',
     '-fPIE', or model suboptions) when you specify this linker option.

Add '-fPIE' to CFLAGS.

Cc: stable@vger.kernel.org # v5.10+
Fixes: 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/exec/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index dd61118df66e..ed2c171ac083 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS = -Wall
+CFLAGS = -fPIE
+CFLAGS += -Wall
 CFLAGS += -Wno-nonnull
 CFLAGS += -D_GNU_SOURCE
 
@@ -28,8 +29,8 @@ $(OUTPUT)/execveat.denatured: $(OUTPUT)/execveat
 	cp $< $@
 	chmod -x $@
 $(OUTPUT)/load_address_4096: load_address.c
-	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-z,max-page-size=0x1000 -pie -static $< -o $@
+	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-z,max-page-size=0x1000 -pie $< -o $@
 $(OUTPUT)/load_address_2097152: load_address.c
-	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-z,max-page-size=0x200000 -pie -static $< -o $@
+	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-z,max-page-size=0x200000 -pie $< -o $@
 $(OUTPUT)/load_address_16777216: load_address.c
-	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-z,max-page-size=0x1000000 -pie -static $< -o $@
+	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-z,max-page-size=0x1000000 -pie $< -o $@
-- 
2.33.0

