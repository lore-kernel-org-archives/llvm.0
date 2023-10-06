Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC341E38
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S8eczWFc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-69101d33315so2243749b3a.3
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623456; x=1697228256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVW48+aAw5RrT5lkfRy3SJYTnhGkwarT0QT62F6zY44=;
        b=S8eczWFc234rxGwHQTSKUS8pSscEsA8LrlXKUruPqx2nwA6Ytqll9wknFwaJ0kNFbw
         7swH4enoL2bNk46wZLa2bu9tBaHMOaIuYAPOi3ro+ptdniplOcqJTUJbycagHLizMAF7
         5UNtHT67Hkmu5pnmsiLBD/y5kFohnCjqTpahE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623456; x=1697228256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVW48+aAw5RrT5lkfRy3SJYTnhGkwarT0QT62F6zY44=;
        b=hoUrC5Bbm6QfNy99iP63HMNO+jEgcFKFexfMQyrpP9TRc6U1IdiH83b2BdtNOvSMLC
         /sB94ssuzwACwIM3G4dGAHEFKQTOpbkdvvn6qMk6pesiSZcWH1YLbdNFfoRbEC2ln45j
         HI1REqvDrM9K9M0O9JKf+pUmzbeXwvRabE2Dm6v8b7Jr7/NLOGvWW3jwQCUkuHsp0/zV
         PiY2mw74xXDD1dbqvEo6YL9DAzPZP2AaoxKtfkyYUzO78YhnziJaPqkjCzgvg2jod5qa
         o10oPsFjF0/66JDfwdM5y98BIlUZztEEO3X97N1Tk+CMZYsbVmXFnrppOz1z+pMKdFaK
         OgsA==
X-Gm-Message-State: AOJu0YxVsb4eYiJqSQLUS01MTqwJTWV8RTnBcq996TeLPmWH25wZ2dC/
	rJzK9IzYobI1tFzP1JpGEQHygA==
X-Google-Smtp-Source: AGHT+IGgULuRMAk+2xAiqAngtQMYH/45dfkfgIQakgeEwSnSB9Ck2fpTw3sOiYnEFueq2+Zw0HIj5g==
X-Received: by 2002:a05:6a00:1d89:b0:68f:c6f8:144a with SMTP id z9-20020a056a001d8900b0068fc6f8144amr8344041pfw.22.1696623456614;
        Fri, 06 Oct 2023 13:17:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g29-20020a63375d000000b0056c2de1f32esm3761746pgn.78.2023.10.06.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Roger Quadros <rogerq@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Valentin Korenblit <vkorenblit@sequans.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: rawnand: cadence: Annotate struct cdns_nand_chip with __counted_by
Date: Fri,  6 Oct 2023 13:17:34 -0700
Message-Id: <20231006201734.work.060-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=keescook@chromium.org;
 h=from:subject:message-id; bh=v/mBW37FRWiHDbQSeKGRt7jHSIbBK2m2caz2GN2pAMs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlIGtehhtNs4fsQLlK/idmpyBfIyy3VLPUCxgiM
 uN0LPqd+ImJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZSBrXgAKCRCJcvTf3G3A
 JkStEACSGTbTsp8zz1atoDGJhIXcLq7dkczKkpuqx43dYR8vq3nM6javyZ6DU7cAg2OhRoAplw0
 mA8jHnMFQixkl5LkbmCfoRytUqgJCK+dMCySAAPwBp9IItFtaqczmNI/I6/d/gDJvtqQQep0jSk
 PW0HSCeEDsFzX/CdW0t6C1dRPVu7gddhQI2dT1KUMTLPghKqCKjqgUrKfruh+yarpwMIKUmhV3X
 rklM4b718lqThCqUPASeb/zZeCoN3g+MQAmL5MM3Vf9Vtx780jFE4SHxFwk+do0CrYsWhTxO9a4
 8FNOJNfUrv8dasPXCafK9pQxYkzRE4lKjDlKWPbrzSfelocXGryBNFQPiOTkAkRMf3RqiNh2GCR
 z8QM/L+lmF4dv//gnu3oXL3ds1MRzA8FY5nKjYoduHvOOsVDQTEx+B+4XPa6vTmDxWk68HDhoOV
 CKOyMtZUCdXdo7dGXx+OhYtsFT/beclrvneNK+WXJJ8DAXpxRJYlmCGfmAV1/okr5oEOrE8U8ru
 cshkana+HpzpbJuzw28HhcouY+hWSF2Clzt6FUws6hL+evFTv6yEopyovGmCakC3k2VR5UMumZ7
 MvA//yU5JMxP7SDbF30UVevcNuhKSu2LoEBaAp4CJ4xAJzaBrUaKqgdOogIP6IIGac0nANokUqs
 9OfVz+T lNbq/PRA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct cdns_nand_chip.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Valentin Korenblit <vkorenblit@sequans.com>
Cc: ye xingchen <ye.xingchen@zte.com.cn>
Cc: linux-mtd@lists.infradead.org
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 034ec564c2ed..7d5ef7ffe0fe 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -526,7 +526,7 @@ struct cdns_nand_chip {
 	/* ECC strength index. */
 	u8 corr_str_idx;
 
-	u8 cs[];
+	u8 cs[] __counted_by(nsels);
 };
 
 struct ecc_info {
-- 
2.34.1

