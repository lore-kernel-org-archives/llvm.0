Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED544463
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:52:22 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68fdcc37827so2855878b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405142; x=1696009942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUfG5CM9LeO6dcNwDkeYkSibXZr9XVodXzzx/nCur9U=;
        b=TyJ+Z8JBIUvtAUgcsE097UUog7Muyr85mRuU/EpI/5+X7vRMoDCkMaF2Guyov5X6CO
         Tb/C6E7PjCR0It1gAK3neymGj2mfiQSZs3uTrjH0Syf73jHzZWeIJq+S1txe6Ir1sOoT
         tiGgmr3yeI/WjwLRKxVc2wzHsqsQgLUgjGhP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405142; x=1696009942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUfG5CM9LeO6dcNwDkeYkSibXZr9XVodXzzx/nCur9U=;
        b=owfyZqlp5wjKRXUgRo4UO8Wpuuw9XKL8F+6GGLSkooefpnPisIiYv0B7QYPxs1wYQn
         lKHdPylyMWZNEWpBYAHMh36kHtYXGRsJo2sOFgz72A+IMSYkwql02xY/bRDQd/uBJNsq
         L2YV3v2+Ymp+EnTYUPAERyeSOQTtoyF9SZMj3RvUTZRERlgAHJDlDKGoFy8NufcsOGj/
         zQTS/bbrgA/Udb6UKudPLZslfQdQPAgSAl+6gcf1UkYPLuYn4TVTVzX+9MSoAM51mt82
         DHSNYPR0gRlo8bXdPhIeoGDGeo/zkHQR341KNJFFrb+u6WcqZb9/vxQociH6iEcKvfzA
         X3VA==
X-Gm-Message-State: AOJu0YyRlm/NOM24eu7glN4n6e5ai7NPbXWYCwqd6xMMOCUwM16WpeTw
	4vTZVDEGk1eTyWWAZRjKp4uswA==
X-Google-Smtp-Source: AGHT+IGKglSu4V94OTI3A3BfgAmZCaaFTkJEerKkiQY4tQfjHtM7Ae884UZbgp+Yzv55o7c6aErRvg==
X-Received: by 2002:a05:6a00:10c6:b0:68f:cb69:8e66 with SMTP id d6-20020a056a0010c600b0068fcb698e66mr459676pfu.15.1695405142449;
        Fri, 22 Sep 2023 10:52:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c26-20020aa78c1a000000b0067b643b814csm3492756pfd.6.2023.09.22.10.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:52:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] gcov: Annotate struct gcov_iterator with __counted_by
Date: Fri, 22 Sep 2023 10:52:20 -0700
Message-Id: <20230922175220.work.327-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=keescook@chromium.org;
 h=from:subject:message-id; bh=PERykbPQFb07CtyESuEWnJKmw1X+EsX8MBvMPSKrxC0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdRUUa78Ww0nV8tm9uBXdH6YFNvrlgq4vOUD0
 VtGGM7H0YKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UVAAKCRCJcvTf3G3A
 JjQHD/0UYfkg7/bkKyRZFzhxwcMCFxcRlEeqzLk645U0ZI9EVsp4jndBVkZ+iw5IwU7aRrq18L4
 8aTvCwK2LSM+TXSQ8bTsckVKhNNC2LEGdGcAyzEL/6uZySyr82kR0W32JBSwA20fgzjCLrWuAFt
 TQ3l7yy/5NyAQ3IZEpHGDbmkIJ/iP2jTes6eXQdljIfv1L5kiIl8A0N6X3abxTan8idIaE5qxSX
 g8VVf8vZabxyp39MNdCrALA6b1RO1NBanmP7mDPpMGrLaf71Y8+MQ32jntnDIyDMvCnHUjx2B7N
 M1IV8C7rGNxLJjH3Y/ZUFmea19f7lvgs3sIDi3WzY4YTfTN0LvJRVkzLfiCTJGdOgYfmYRqvYkX
 9pi6sgaIlCb3ZejdLb3fibwDBT/+5/Zj04mn3bFSH+YQk84KYrPmaQ9CqUtPT2Q3OsBpdABJkWi
 g6q5MiqogBKcHYYiBm4dBjJ9f8SDDGHRSen2a5mm9TPRZrj+S2rE4JDMefGMdPfr4JD6uGVoEfq
 z0+KSraR9tUXAi54bzPB5OBQfpZnjSHNkNMcqwTjIgJFuQ/7UqQwn8jEQbaLLQSePHLGeK5qiVO
 6vLvyE4Pfwo8UClJmc6qkpfjX5dwtbbWcYFCJLcNshPGyxh2NikJOgh3xcwQJTNrZNWV0dX6Q+E
 Now+tQ6E ++kkCSA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct gcov_iterator.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 kernel/gcov/fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/gcov/fs.c b/kernel/gcov/fs.c
index 5c3086cad8f9..01520689b57c 100644
--- a/kernel/gcov/fs.c
+++ b/kernel/gcov/fs.c
@@ -99,7 +99,7 @@ struct gcov_iterator {
 	struct gcov_info *info;
 	size_t size;
 	loff_t pos;
-	char buffer[];
+	char buffer[] __counted_by(size);
 };
 
 /**
-- 
2.34.1

