Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9501B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:12:30 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6903a452dfaso1640328b3a.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808750; x=1695413550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1ORwL4JwevQxgf11GzdpKoTIBTsgU2jnKyI5O4kARU=;
        b=FuS1j7fc54b/8GNnuaqTG8QclB3FmnDxyWHJ5FCOA0+D2OWLBmJKqgnbtbhhskjUfO
         5ghLSPvCGtAcT3qlHT2rkEJCxLkXI9yToR1BEvko6QKWBaHsjoK+8FYVcEzvB7EXRfWx
         uccL2h6doiIoHUkLs04VQNcRgfovgZCwYj/NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808750; x=1695413550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1ORwL4JwevQxgf11GzdpKoTIBTsgU2jnKyI5O4kARU=;
        b=O18dwGqbm5RGq9mDZjKJc2NlJRrVFTLt3aic7j0JKx5k7nFj94xr+zaCaRlbLZPfLA
         HDCxi77N2JBsy6UFahYpyyYNFfAADTTJn8JjXDMnF8TpGUcBUnQB7546uTzr1t3qohRn
         S5VjlqhkM4DvCYGhCzz0PdJojnXtwRsVVEwKxR4HcJv4zzltcCgpEuNcJF4QBHtj35v1
         vroBMvY1Uph5rjdhdYhBj1ZJS+p8m1LWzqxnhwSUj8Rh5FXgTWtbrex26stkbhlorHcN
         JCzLNAuVqcnTBArP/UC/Ja+ioPUEl8qEify/GmksvqZf5kHUxGjoTw82W79s/rjvWARl
         HbtQ==
X-Gm-Message-State: AOJu0YzO1VToQR7/FNGzRbsrkFdIMTEw1QtD+bjsv4uvykDGIuv2ZsNF
	1HkKQhAEcR8f9ZLs1Gjah6hRTQ==
X-Google-Smtp-Source: AGHT+IGM69XeyMqXrJENXIIbK0AJFt00kniNdSM5fG+ubnbAoFnmRMBQxlen4CPemfd4BQw4M58I3A==
X-Received: by 2002:a05:6a00:22ce:b0:68e:2cf2:1613 with SMTP id f14-20020a056a0022ce00b0068e2cf21613mr3157316pfj.3.1694808749928;
        Fri, 15 Sep 2023 13:12:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v14-20020aa7850e000000b00682c864f35bsm3433733pfn.140.2023.09.15.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:29 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: denali: Annotate struct denali_chip with __counted_by
Date: Fri, 15 Sep 2023 13:12:28 -0700
Message-Id: <20230915201227.never.483-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=keescook@chromium.org;
 h=from:subject:message-id; bh=HPftxSeIdfi4GNcmfYxSI30gQxrnfduSUhsbK/q4I2U=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqrBhnZOaQvbWWLFylIXxeEofmGqQfAApeF0
 9Efh0UjrZ+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6qwAKCRCJcvTf3G3A
 Juq0EAC1p8IKMh8ULf/+9eqSBMFztVKVRNhwH84rJGBubRqa9GmRqG9lJA7HsGhBtR+V+fxtD32
 aZqVfOA9y1Z9LppySZJxzizv01l84QfPm4/2t+Z6lFiJsmAsrSfnLhKi+4RtQgh/ftLa7YFffLk
 DHuuIKIAr+KyklVs9AVhAsQa4PCcANGLyCFK8hImwQQcjhzFhdPLkAwiF4lF5nX9W6Ph/MgtwdG
 zuc4D9tgk1+sUx9keYPl/Q5y7CJOh98r7YuhmgOI5jFo5tGDPtsT5q1JIuXKyIFZktCSc1ZTEIY
 rcFm8dhnnPjfekYmEhvgLkk5F0V9B5sZRpWoRfVctss6CF4CsZTwyEg2FyE3uwdD9Wf1ltQvV82
 wjMq4iftY52seKEp3LGSC5l0D9FbQim2DxswJ4uvsGRT2wPtMXtt0wDgtXR5g9s89pJ9ivLoJMR
 PbNoWJx0vydQXRqqtjv5uI0YdmQ/vBrFSMHF3UwdwPoEdIx2WTk4DephZgfErE3HEzwEEBfa5+z
 apHYb19IwNM3IQ/5LAZm0UrxW8gMt0rwV5Tna98A/fk7W7OntvQEEsHZWKl+Ve3+4Z+drf2kUSA
 a0SDFp8ERUWM1k583PrxiuMXYrA5doWz1lHk5TI+q/wpsU0abnhFZBJk5QtqN/L+ZGsIrQNhKiu
 cL+/10l bmZkd82g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct denali_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/denali.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index ac46eb7956ce..5f2fab022fc5 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -328,7 +328,7 @@ struct denali_chip {
 	struct nand_chip chip;
 	struct list_head node;
 	unsigned int nsels;
-	struct denali_chip_sel sels[];
+	struct denali_chip_sel sels[] __counted_by(nsels);
 };
 
 /**
-- 
2.34.1

