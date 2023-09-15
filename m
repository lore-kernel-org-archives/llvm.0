Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4D1B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:12:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68fb7fb537dso2410679b3a.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808776; x=1695413576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BZJf9s84lU3CfTi9HxKXU6WVEhOLwpzo38ws2QVZ2w=;
        b=YQbuN85bkNgiZXCPlLN+MkRQvWpXegK8UGerI1CUfHbbELPb25wFBRAxaa9Op5QWTl
         r7ogQSh9x/k5b34Y2LCJKWoGkl5cg+Fq2UNo9aoOiDb6k43bAqW4pV4IBgyo6hT7trSX
         ZM4XL2HXKwky7WE1PQaQW15HTHvxq0A4fSFIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808776; x=1695413576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BZJf9s84lU3CfTi9HxKXU6WVEhOLwpzo38ws2QVZ2w=;
        b=PzHmnDlus4TnkQnahMviXdBepYKN521eTo+3W8OI9kXjpnOra8Ze84OTWW1NTBXJu7
         FA2o803sm8uNFOb1nTMeze0FdihE7uQ8VBdG0MPOtFXEU6S0hPpLf2LJoR8r40wug027
         SsDYmXqnI+uQhoe5QgwA+upBNwEAubXMeJZprYfRDTfDBVkiSJ+85Tb/rhzpYyh/Bt2f
         aAt4vVoG1qNA1LOtdo9MkwxGPdiWpGm3io+vJYTly0hF4HWHAmpMmGuEcLFxl+t0Ui+J
         B8p/hbqH9/vtglnKCz9gGbgTcCtuspaMsyPuLLGGgrkmhA7r5trP7Wz6Z2PBg3lxFv0L
         ipqg==
X-Gm-Message-State: AOJu0YwoxLhDVWJ3Kwl/pxYVwtpao+hI2hWKES8NkC+iSQei+zSYwZ48
	vnyXbdSzpgG7v1JUnrQ5kxHAnw==
X-Google-Smtp-Source: AGHT+IHmQbOxLY0L8bXhn+zKOM/BnwaC8qXFTLFQ0kYWZVSH2PXuzlce8g/QsH9C+n/HCzeTj7zpsw==
X-Received: by 2002:a05:6a20:320d:b0:14b:8023:33c8 with SMTP id hl13-20020a056a20320d00b0014b802333c8mr2750657pzc.2.1694808776017;
        Fri, 15 Sep 2023 13:12:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z16-20020a656650000000b00565dd935938sm2758499pgv.85.2023.09.15.13.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: renesas: Annotate struct rnand_chip with __counted_by
Date: Fri, 15 Sep 2023 13:12:54 -0700
Message-Id: <20230915201254.never.511-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=keescook@chromium.org;
 h=from:subject:message-id; bh=0FPGmCgvWt7RjvkdTmKw5gfdGmdouZ3tE6ulzomUB2U=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLrGeRmtf7v7PuHT27LUye5Sm4GLfRpWtonSx
 p2dIfmBTvuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6xgAKCRCJcvTf3G3A
 Jm5IEAC1QGXYJ9yOV0x64S8RCZrHbM5hI5qcR13CwhzHoqjMh2ZYHbyfI3r1NJdJai/+Lz6k2Qy
 mEzqHCjkI/Mub7jmWbQpzrff0loovqVfED8gwE3LDnt21UZALC2CHMhkeynTeqfx3blquFl/4/S
 2xcPtvU8OQdr4PA1CDlZv4sIuMDjCztn2Z379LJlimR60iSZgkxcdJGE81pVkF5tD8CRvh5ckn/
 JnHJ6MpjFjETsFnCbayrzEsvZTQXAA065p7EpTafPz7trWTN7hjj9nKUDG6aT8lnlALZDWgWf4v
 BWN3h57Y4cSYBG8z29PniByDsPlVzYfW3J9Lxd1C8430W9VDbH3xu/q957gWp4Bl5U7aQK8QsIJ
 dAf3OzpoL/ONx8PDuObWUgww//y8mHbjqvRqowuTA+VlchilOGBE0+qz4C6cxLvbBjTSm/XOW4W
 Q1R+0c+bJtRPYdANjaXw2lFzNTlXg+iHDbwsQsN/6BeNu06htsCNR+N9BpRebycxfmHrIqO86hb
 oluyC6avf43e1QhfZDl7ViR+6olmcuXajW1hbv4PdUXKzeEqvPZwfbcZzp4kFfYDCyMAV9oifxd
 yG29Z874XY7Xo5PDqIiflaj4hU2414puFaXtfq8yfQFSglCTM0E+X5RDD2qWfvNo2QdF212WR4F
 x/g2isV w/p8A3kA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct rnand_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 589021ea9eb2..c9a01feff8df 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -210,7 +210,7 @@ struct rnand_chip {
 	u32 tim_gen_seq1;
 	u32 tim_gen_seq2;
 	u32 tim_gen_seq3;
-	struct rnand_chip_sel sels[];
+	struct rnand_chip_sel sels[] __counted_by(nsels);
 };
 
 struct rnandc {
-- 
2.34.1

