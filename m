Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF91B26E
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:13:03 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c0ecb9a075so21478775ad.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808783; x=1695413583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2M49lx0SrOSxw3SwYD5z4lDni11acdMA1KrbMre3cHA=;
        b=SL6ylMHw7EmXHBjZDNnToIVCFHBt0B4NBfkgU0F2t/OEUI47NahHFjAK3DjiKLmfiV
         8KrdLz9qHMNmfVQuMSYL2AMAfUAZ/QjUvS1uWW+Ul/viSwaTmchUPix2G9cPm6WxDMdw
         hCGNhQlyt8JEQKBoPjyLhds22ZLCOOJ3iNJK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808783; x=1695413583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2M49lx0SrOSxw3SwYD5z4lDni11acdMA1KrbMre3cHA=;
        b=EKeeXmFqBg4CWijERtWVMa+kVCYfaabgZDmVZacUHU/TRpAbN9m1r0TmgOCUPUqqW3
         LwHlauAMcH5thWOwpEnOtFI3M3yShTgAOqxycAti6U3TtrqdHJSmO9yXCO1YBdW8ncDc
         u/99mbq6i05Y9O19ff2g608sxRFFh8hbNQCdAfVW7oujvKqUCDXTIlrMk/hWiK8GXEvt
         gBpDzyxaPEGGYnIZnPb+Y52hfSdiIzYmpb5NCZWWnqKf6IBUcn1jJLt5QbR6hRGBu0JH
         cWSG0A15DNuSL/Eomt0uzjb0E2fbiVvy0ZQdHZAAxqYyvfV057VPjGn/czcjWkmE7Rb3
         77jA==
X-Gm-Message-State: AOJu0YxeYn914tMObSIwzIwRuAQoO3zpMd0jTuca0UygJKlpXM1TgdBb
	pvcJSn2jMBqfK2xoEOB2h3J1Kg==
X-Google-Smtp-Source: AGHT+IHmJsBEHRSFwHd9H6oVJRsl62rZFBTkjbPN1AjmLjm/eZ5VnEB4AJ5MbrK8A+rBSdegqn0n2A==
X-Received: by 2002:a17:902:db08:b0:1be:1fc:8ce0 with SMTP id m8-20020a170902db0800b001be01fc8ce0mr3734260plx.12.1694808782967;
        Fri, 15 Sep 2023 13:13:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001bdd512df9csm218663plb.74.2023.09.15.13.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:13:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Manuel Dipolt <mdipolt@robart.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: Annotate struct sunxi_nand_chip with __counted_by
Date: Fri, 15 Sep 2023 13:13:01 -0700
Message-Id: <20230915201300.never.057-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; i=keescook@chromium.org;
 h=from:subject:message-id; bh=9LgHW2ESmAWnpC8VkPKIjSNhD9+xewvO1BU6xLYCYys=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLrN7bH2fSvx7Pk5xVsFyM9ZP63U7SCER0Gx/
 1a7bYV9DdCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6zQAKCRCJcvTf3G3A
 JjKID/9gXg8w66qZfCGmvAX8Ub+SGXwCmA3YOfUDES+znbHz9/CripNvDDfLLhe5EVL5h3kJO6m
 35FkrSXVpHWljoV3QAOyH34CLD+X7WoBY2hQCne3oLauVtJFKYHDi+1xiM60MUD1cJm+7bbrPJR
 Ywyhs6nkYn/yLxhuQB0Fg1lA7qfOoQSt/ZGI/pRPV9ehSOb6n0owmVEYm1v+VZjAxzACRWjjEzJ
 +MmwR6qVCBlwlOD/h9f+V0KeODYE1O4HuqtBZSp8eTEEP1kjtc92Zh+EPRzpvDwywIzQFygFFgU
 R5CTNEBEP+5eUFeKYDnan3QUhZzTJnNk5c9NXJ3lpIe9/q204g/M2+fpbPFY1UGEagTqKyI43tG
 eh/NDIHf3zTaM5cZpHL++wvYoz1PzEpxmgQMhi/gkJKk8p9LixpYEHQx1WGSlvkbLs22CqHGZB0
 +qB8wd1Rlxqkds0B9k3Nm73iul/qPyRkx82+hWrle4r77c4F0aMZyQJx1sSZXAL74oUSuZ2n14m
 /04J/LRUq8a/BALl+3ZyJVurqFg5w7rtQEcqho0TVyRT8YEn9PvICX4HaJwQuPcfk7mY79YwlIv
 qzUUZprHpLJZTbfjJvdTAgUje2fPni05Ab33Ntka+sBFJpOgRhy66zEWzU5ChzUyC4SK2vfYD4t
 b0+mhO7 VDdYbzZw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct sunxi_nand_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Manuel Dipolt <mdipolt@robart.cc>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9abf38049d35..4ec17c8bce5a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -197,7 +197,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	int nsels;
-	struct sunxi_nand_chip_sel sels[];
+	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
 
 static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
-- 
2.34.1

