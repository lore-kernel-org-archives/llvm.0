Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE61B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:12:22 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68fb2e9ebbfso2122304b3a.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808742; x=1695413542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbgir45P8c3Pig3O82d5C6ZtsdrQshUxHqzUl7LRBJ8=;
        b=WSxD4cBfok0lMWuHTzaAu/1IqoUh850U5OuKz0T2KhWtSMY1zmSpqy1q0gtjv560HG
         m5Vj0aoDYeBjxvL9BZ6LE6umYev2Q01HzhVWKGfHk1aKOuJoBjxqsv1KUru9Tkk9aZwU
         mjIuvMWl7Uo4xDVUN2DYf+tj4d2w8C6rLXLKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808742; x=1695413542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbgir45P8c3Pig3O82d5C6ZtsdrQshUxHqzUl7LRBJ8=;
        b=EiBx5cgEZh/Pat/GpLxW00A/bgkgW2TLw6y4gAVk152/hrILbwNBacJrEwQtrLcPo3
         xN9pBiMfTcuIW4RoLgKQKp+TCStZj5+Tni3GEVnwAkD6b2kCmcoEH5hNkAxN4zaiZpwg
         y7Cg3OsWp02v57IfN+GmFi6UnV1FyeZ5RIQOBqLqDPc2N+IOs+VuzUYha8SI0cUV/5lB
         gpBZ9jvaCCU2pF8Np7nl/Ry46MDkWiG2FK+NAoG2da0cAksDpK4fMN5GAk58+wodNB/L
         GZ7a0jl/CTqIjX8WE/8c1J4o5IfDSAjJcAycxhULlrs1czq6qR0Kh40kn1aULO76wcOo
         23tQ==
X-Gm-Message-State: AOJu0YxtdswzZtZhwrVpleoTniITGwz6cnML6BgxJEqZdmYFJ5ee/6nH
	4UDhrh0IrA15shZ5tCgXzGWpHA==
X-Google-Smtp-Source: AGHT+IFhBgyUlPiD5xyzulG3JBRm1U+iu40tZkfPFsrc4zrlynDTyADHna0tENdTjWY4mEIPQKAfVA==
X-Received: by 2002:a05:6a20:160e:b0:14b:887a:6d70 with SMTP id l14-20020a056a20160e00b0014b887a6d70mr3499753pzj.15.1694808742247;
        Fri, 15 Sep 2023 13:12:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a21-20020a62e215000000b0068c6e666066sm3327765pfi.111.2023.09.15.13.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: atmel: Annotate struct atmel_nand with __counted_by
Date: Fri, 15 Sep 2023 13:12:20 -0700
Message-Id: <20230915201219.never.352-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=keescook@chromium.org;
 h=from:subject:message-id; bh=Tdr7pAr2Wb4/8w/gmPSQOqizdA4eTmvQlqS8OoRKddg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqkv2XZPgk3DLyZFw3FAR71jSeYJBJnbdcTE
 k2PsyMAmBKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6pAAKCRCJcvTf3G3A
 JoNrD/9bXYCBxADrZNHe5KYuXZa2MpAe6bX4jbfGcBcOh/Ugaq5DHdiRZ1029txqS953Eg+J7pJ
 4a2Ae0PAfgHBWg+DTNZgpFuZdZVjmmA+C2Jek1oRG9j1sOPzK5g3dEKzqM0T3SCSG9ltaBGAaXB
 4mJ4oJVZsywrSPmpnBsHloni/CITMF65he+pl9MzG+gt8XiGtiVO9x82Ja5P+VDx3HnlQtkfvwJ
 uiZaJb0o3mZArnjWMPTMzx5Vr8FDd1RgiqgfdCuANBN9rBs4ZPZKbqK6dHz3KMLFxw34Vs9g5DW
 QL1OeYO/nsO9COQqGEG+Eju7ASKKedTGsFLqzdxxeORZre7+qJJkxSs/UcA8DHWkYS/HpZtvLtF
 BSBdlZHteJ/HlYfTPTWd/jIBjFsSdRUkKzIgDb4BPhSyHbrZ0jKOCs79l2Fk9mhZ+7DpLh83VpG
 lnaDwD5gbMFG6RFosKr+j2LMBNcqtLSNBJC57ZcgvECQNgGy3oFq+m0Mne3Sg68G3TnakTjFtI0
 lFmUUvubrfVj6jPZfm113wYcvENBIVGjC59zqFpg4AUbAOpULsLLbf4ihMaxOXG2yCI6Nb8bnRT
 tUygiBi5+DcAgoQCg4tO393PtyIKRx54A5CsFCeC8iCVwKqdd+FnSBzCCQOZkxU93X7wLijiaWp
 EOhkDTw GDHW+fKw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct atmel_nand.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3f494f7c7ecb..4cb478bbee4a 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -165,7 +165,7 @@ struct atmel_nand {
 	struct atmel_pmecc_user *pmecc;
 	struct gpio_desc *cdgpio;
 	int numcs;
-	struct atmel_nand_cs cs[];
+	struct atmel_nand_cs cs[] __counted_by(numcs);
 };
 
 static inline struct atmel_nand *to_atmel_nand(struct nand_chip *chip)
-- 
2.34.1

