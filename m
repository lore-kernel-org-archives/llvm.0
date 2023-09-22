Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8394447F
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:57 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c364fb8a4cso23247965ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405237; x=1696010037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLImW1IzePGbN+/EKPq+ioMvgiAmC6mEu6v1g8YfVEg=;
        b=WNQiaIRVqQ6ARzVFHbS0jtz1xmiLHMaahVp1ojjumrcNZP1pV3sNIowSMIzGGTZ8u6
         IfM9tBwo1sR977piLFW/PbedVpWctEumpoMvaP31mVxt05U2f/XxJfmHFVbMUh+Dzb8q
         z8ELrhv9YrsbXMSJ/kI4nmr3ljtxpEzb4GATw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405237; x=1696010037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLImW1IzePGbN+/EKPq+ioMvgiAmC6mEu6v1g8YfVEg=;
        b=a0Hl8V/hlkN6imaLcMD3tc40hqQVAxzl32kzS4uA8iA7eNqQixgMQCdptuONJNcPpZ
         ic/GMLkBCffrdSeGftCOuoKxXZ8p9xWyqE8eHiXpxsyvhrXdTK/NL41xIdUT8NeLwhbh
         I/XkuTNjVnpU92aKjzXT7sDZ897/eUwb8DpUcTiuQqAS6D861OgqgX8900HYh6RM6pMf
         QyZubUygQ2634hNaxNV9MiKVwX00i1si6gPUI/u0zMA3mTf6QlmxP/8u0P5HeB69yDZx
         YPkeaOqAVe68DTasdFLNkq3i0pA5sBhztjGlTBtMMjoMVG4cHTjMCSgBj5nlKknYm8ii
         IN8g==
X-Gm-Message-State: AOJu0YyT8fYavtZxxCG1oYzlUN2pgi7O8HjVzXm+wFQsi2/rXuZAUc80
	WHZ2wRlCJx9in3+MKtjRiN1WxQ==
X-Google-Smtp-Source: AGHT+IGF3fNGmUjC4okiXR6Ev3mOPUrKRgaxVlLdi8Plb8MDgj/4DVzkWP898nuYl3TJbEm6TJyfFw==
X-Received: by 2002:a17:902:f687:b0:1c5:f4c7:b4de with SMTP id l7-20020a170902f68700b001c5f4c7b4demr167642plg.2.1695405236901;
        Fri, 22 Sep 2023 10:53:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001ba066c589dsm3759352plc.137.2023.09.22.10.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-pm@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] power: supply: axp20x_ac_power: Annotate struct axp20x_ac_power with __counted_by
Date: Fri, 22 Sep 2023 10:53:55 -0700
Message-Id: <20230922175355.work.006-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=keescook@chromium.org;
 h=from:subject:message-id; bh=xHCdB+Bm90QD3l3umM0GSzvzHSQIr+R2KIoMY7RnKys=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdSze1eY/sp2o8MEriIqwEc63bQLWGuZ7Mxjn
 XsSXzjxXROJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UswAKCRCJcvTf3G3A
 JkmYD/0S5o/H/m1efZ3VLfgKqfWqJMlk1UnalQCznqLB523UsBWOyBFnCxJpx5xAQd2EAH91j5a
 gBDwJWO155sAMdKYBg421/d0lTM+zYXSDZpyICyA1G2Opkka9dhfzlrpNYhCFam98UFxOO9O49t
 djX5PdSHYcJ1C95HbfPuiC1JdN8pDwl7McJKCDJgDQCAqxcVdrRWht/CoTG5zNPGwko91JVvOxE
 K49WJK+FSKVOEG9SKA4ODQDXPrnsr/KXWm19/7Kwtt3/Jt8NOE1k9nY20k90czIRxVH6yn40dw9
 XwA32R13GtGujQRdKcKtYiXvrS3LX9CBP/QL7jK8WW4SSWLrf9AOKgrdpCMOiQybtrE5TFZKxUD
 c01ygdxfBJM+Z9T2vzaWMkVQhSmDloymBckp6Aw4+QxTX2XIpx7Mx6gByTBv/z29kKQTkhctofD
 RjuvWxEJXSBIVdGYVxHEVnejxUNCCPKXMAwYqN41lz81sUypVwcjk0xUl0lL8YdKf7IEP1XHsAq
 cDbRHp3BuasSrnfhdQc4jdnagoA0jZG7RV/C4cA3Lzkcgl4ewRvm5SZvBR5ZrphbGBWdROQqsBu
 cddUfhNcPlDhPH5xrMR4f0qDMI6HV3aebr04+HBX8WrelhuleyrQfVXsc8068m2IVu6OqB5CbUp
 xb8XFZi TX0C2BjQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct axp20x_ac_power.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Sebastian Reichel <sre@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/power/supply/axp20x_ac_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/axp20x_ac_power.c b/drivers/power/supply/axp20x_ac_power.c
index 19a118633115..e5733cb9e19e 100644
--- a/drivers/power/supply/axp20x_ac_power.c
+++ b/drivers/power/supply/axp20x_ac_power.c
@@ -45,7 +45,7 @@ struct axp20x_ac_power {
 	struct iio_channel *acin_i;
 	bool has_acin_path_sel;
 	unsigned int num_irqs;
-	unsigned int irqs[];
+	unsigned int irqs[] __counted_by(num_irqs);
 };
 
 static irqreturn_t axp20x_ac_power_irq(int irq, void *devid)
-- 
2.34.1

