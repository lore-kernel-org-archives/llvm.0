Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C91B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:10:54 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c364fb8a4cso23521585ad.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808654; x=1695413454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rGCQZXOZFob52Gnc+msXzDi2Oa5SKWBAnf/TmWNgRE=;
        b=Qe2bnN6ud97m9Q8WAv6V4qRyS64RZ/UL5EZOXShWogI1lptoNDl4Blob2j2xPASYUQ
         5B3oh9s+ncfgX9PaBauBsFbUzDcWywnz3s9i4c0sV/GOU+AOe500SGvXNDZoeobhd/jR
         JoaLMaiGK0XQB1MDkMUuQsKLz4OSfayAB+aRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808654; x=1695413454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rGCQZXOZFob52Gnc+msXzDi2Oa5SKWBAnf/TmWNgRE=;
        b=thDrBEFpVdd3jCRT2QkB3j+csxnY+BqfQlLl5pycyR/9ti9kKocY1tyZq3ZtovitUh
         jwrQiEGOHlIRR0Eb7A525gO/4PvrWZv0ncwxQTxtVZ5ysFKttUzQcW0Kj96dn2/T4zv6
         kUEvN86G1Y2iAaw2PV3j3cGfMc5bJYt7iPqOYBwZzXf2lUNF4fQs5m84qKlF6cvb2Drt
         e+gBdXLG6gkJ8+8UbHchqtYuBF6DGP8Y5dm9duoncoz49+q4y92L38UWimhZe3IlmDuh
         YLB/993z3uSefYF7hqsLKXzQ86m5wo1gUNmlIUjD1ZT3VbS8A2idFfhh1emzgjLBZbq9
         ZEJg==
X-Gm-Message-State: AOJu0Ywl3NLPSf44IDWdq/uBJZVyqjDdLSZh3NpW0N2vB6liNEQj2r+z
	/R4HmR2cL1f6rPoQrHwbYnbjyA==
X-Google-Smtp-Source: AGHT+IEs5lOaR2Ta2Mws1l9cp/mRyT2P58L6rAu8X1p1avpmZi1GYS+ZtJEyDjHT8joJnRpmAmtC5A==
X-Received: by 2002:a17:903:22cc:b0:1c4:13f:9dd3 with SMTP id y12-20020a17090322cc00b001c4013f9dd3mr3457711plg.62.1694808654451;
        Fri, 15 Sep 2023 13:10:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b3-20020a170903228300b001bdca6456b9sm3904606plh.17.2023.09.15.13.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:10:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Kees Cook <keescook@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alice Chen <alice_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	kernel test robot <lkp@intel.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] leds: mt6370: Annotate struct mt6370_priv with __counted_by
Date: Fri, 15 Sep 2023 13:10:52 -0700
Message-Id: <20230915201051.never.429-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=keescook@chromium.org;
 h=from:subject:message-id; bh=coE/iSzW/9UhtjCTK3P8Gz63+gP8L3K/+tYQMkvh0is=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLpMEabFyu4iy+cSm/IiRf1sxT9B50iyRXrIa
 1U8Y2+HfRSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6TAAKCRCJcvTf3G3A
 JqR9D/kB+HRM4Ne/WaOq10KenW2vk7P75UuXI5Jub8jHjnyyum8tphcbeG+hgOsmtv/58Whcs70
 n0FswYXFTWoWh7E7chImCAqAjk7e1w+p6hX+cDqRx/p2Ye36TpSe4GRFESmTs8qvf5jJeqpkgI7
 a13SXZalZVypMYSHWpxC8SnLbdfRnZjwc+aii8s7cwTxD6SRB6is0+q91VfuFeZzBX24z77AGtT
 VkXo6fdWWZV4GIWD12a0kzcul+7Uxpa0aB4DQ1NOFLjA9WrHyRhwrGmDGbHuswn5kFM4IayZzui
 Pkis6fT1iFeKKO6RdYKDGUtYbEP4mvXOVQ2/XMUodrY2c9x/oA+KosAoPSrir673KWOOHofAHD3
 5AL8W5EzhbS3BnTwYJX669gI82yKLDX+IEX7CodlJVrK33ZNmVF31puCUqzL462U7tMxWPmnlBb
 OftVJhzzw7hfxwndI7LoXe8OevLuAy2DYbWh389xPIoLPh7X0BZR4xHqgMTHEypF08hh0q5lNlx
 +EZ03lTN7zwMfA/0RUG9XOexK+kmOhS8Y9Qj4aw45BxhvPHhRJw8XETmXO26Rc/+RRfL1+KH/o7
 Mqw0xayOuPh650DTC2CZv0a+PoHnaYkOm1kaE4tFx0OX9R1VTMeJD8TmvF8+r4Il478NvyQxABt
 BcXYqKz l4fOiO5g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mt6370_priv.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alice Chen <alice_chen@richtek.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>
Cc: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: kernel test robot <lkp@intel.com>
Cc: linux-leds@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/flash/leds-mt6370-flash.c | 2 +-
 drivers/leds/rgb/leds-mt6370-rgb.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6370-flash.c b/drivers/leds/flash/leds-mt6370-flash.c
index 931067c8a75f..912d9d622320 100644
--- a/drivers/leds/flash/leds-mt6370-flash.c
+++ b/drivers/leds/flash/leds-mt6370-flash.c
@@ -81,7 +81,7 @@ struct mt6370_priv {
 	unsigned int fled_torch_used;
 	unsigned int leds_active;
 	unsigned int leds_count;
-	struct mt6370_led leds[];
+	struct mt6370_led leds[] __counted_by(leds_count);
 };
 
 static int mt6370_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index bb62431efe83..448d0da11848 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -153,7 +153,7 @@ struct mt6370_priv {
 	const struct mt6370_pdata *pdata;
 	unsigned int leds_count;
 	unsigned int leds_active;
-	struct mt6370_led leds[];
+	struct mt6370_led leds[] __counted_by(leds_count);
 };
 
 static const struct reg_field common_reg_fields[F_MAX_FIELDS] = {
-- 
2.34.1

