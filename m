Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743CA2309A3
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802884; cv=none; b=miA3FI0IjVq8KJuV5xkIinDVDPVfhtipTKoDm/4x0JOtg3OPYiCT8kg6daRCSihULHUomI5yl1AzRCTw+PIYoXT7nQk94MMqufpK+tR46TJ1UBl8UKh+gaFXa2gD0xH+NFL7Fthlk1qJldNwwGoMStSbyDmOVeGXJ/nzPF2HaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802884; c=relaxed/simple;
	bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbY2VSV84T7TK7FE5TGawcEHiaNfpgAF2wqlM2pb5rnpAFyBreT3y0rYXQewjzwLtB4y6N8xrhCyL2CcnxMuXPMShv5nF7KnPILbU6Yw1MdAHIbW2NVEB3b46JC6cQQTo/H0bUC0iIVaYHrUO+jU0dQFuW3KBh2vp3MoZt+UcLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KRHhDEHU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRHhDEHU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441c0d42233so1148225e9.0
        for <llvm@lists.linux.dev>; Fri, 09 May 2025 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746802880; x=1747407680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=KRHhDEHUCCMPbGVzuOrZHM/HGY9v07WUwNEMf3Ik3bNr/ZbosOR9pxzqwGDS5MRnOy
         Xwgg7zdP1sH/y62On0LG76kF4O5dSqxNAGZ87XsZ/+X/TfSDNdPvgO4xcQGwwffaPU9H
         gh+Fq3IKXLYUh0OwtakftRq5IU5zggM8O0LzNEvi4YF9LPxHIb3KdfSyBIUCCQmTdUcy
         vy8N+Zwn9B3g7sHBejKWi1699PxdMAXQcxEaFEttOBuIDAhWxJZVU1iXTh0VlQeVEO3K
         gQHfXEizIyBEl63moD1AK8frEpE7yyG2StNtewHkeT/wp8KG/MFOCySyvjFkfHth6AGd
         eZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802880; x=1747407680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=X2GLm+1dGg8Qsos35fpNZ24T8Lut1NGPCBTijmnsqNpgoYCTFE5I3jZisYI+1LHs1c
         zBQgNFkTrmgxayjfrfy3QPhFyUrpB+vqIlFy0Na0fLgZATzEv/DrgcEh6xc8jriNYOpK
         xdx5g5c26N+bW3wXII+/nhjre/UtvIjpFqlMT7WIMo5HaNukirmY8tMZkxnGj3zoF1hF
         dvHtyUo4g8HHA3QRN/rmm9k232vetqnCYNRFxEJibvnxo4ozZKpLN7QLd7ZS91qtwUPN
         H8Ok0+GOgwgJ8N26aqJV14OhddKHAFb5pNTd6gOXxzttAJXMWyqSOBDlrOQrpC8W6SHv
         Ltow==
X-Forwarded-Encrypted: i=1; AJvYcCW1RbyiOxUqG1VkhT8vP7Cf7afGUU1LSadi2tu2H6F1ZIzNZOIWWSY4TkQqxJp9J/DT96HN@lists.linux.dev
X-Gm-Message-State: AOJu0YzxReqFjFS1/TBKhbBeyS9rphku+0EkkSfIKsCkeQM+gIaJhd/U
	YujHUjJ85AwBVYvKKbjlDwxMihJY+mskwlU8OS7YV9AEbEQdIfG10Vvm/6qzHQM=
X-Gm-Gg: ASbGncvsBef2+KzqHrEjXZtkKPK1PVDlXbTpFGZV3ref3aN2r0h2ByNq8ngMGjIppRQ
	u/Mv2NBn+WfLs0dhGI/DS1XvTNk/Lk5b2UyS+7h/UGXP8790xAts4yqnR1UYcTzMlYBpbEPtClT
	DPdSzJkCRoaco44KUk3lSrYEc7eU1ZdVooyQe/BZk1wf75zUXBapiDEPr76X/uOvY5R2SVlzh65
	LOpS7WhpuOyNlbBpLtyM3BH5KQWwIT8zowE/tgRo9Y2AstHYBpQyR75TsCCQYVQ77A4y6MR9dEX
	DpRXRQHjnAbfT5xzoFRJbGVXQrQY8XZu4zvgYGe7VUIHT9PBEA==
X-Google-Smtp-Source: AGHT+IHkBCNBnWPS/LtBg9S6XT9b0O28ZZRzf7nzBT0Cq35AQorOtZe7qvsosSmWPjFrnfFCw+NYnA==
X-Received: by 2002:a05:600c:8207:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-442d6ddcedcmr10827805e9.6.1746802879590;
        Fri, 09 May 2025 08:01:19 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm32063275e9.10.2025.05.09.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
Date: Fri,  9 May 2025 17:01:15 +0200
Message-ID: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhi6pu+duuCQJsD1u7676gujslrvVm4Iw27Cv
 36hI4QfwzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4YugAKCRDBN2bmhouD
 186yEACA393kMv+ucbdEL6lZb/ug65wE7C5fY0na+UddUEAqfbdRTMW/MQNb98gck2H4JelcSfd
 OqvvlLQeKFMdWfdUO18CHwvvC6jx66XVCegvI4JxuvyksOrbdym5bdkndEtsvJU65+czjW31aQC
 bHRORJ2LIBPhhHFt3ciNC419Qf2mqrIbuTdCqXzPCYIAG8lyODGPRBf0LOzsou2eHbNKoe/9Y+R
 23eU21dwJrXTGQTdhZ4qfRdprxXwba89LAlR8QDQCVmK16b1qGaazYtoO91pGXtUR8rzkk2i48H
 Wq9kS0QV3rawviyRjAMKi85wG92NalX7ZfaI2Q5QuOdw7JC0O+0Q0AgxcwAxwRboQ39ip4LqGDk
 tvjnS4C68OSHUa3PX6JTLE+UXdCZe30u4UYdsIcmTTT3FgpzrXkJbKTXqGkK6uF0+3HYoijtD9g
 s+SAVZIrOX7WT9EelETCp43Y3cuWalfUBl6VVgIGPY1QmUU0ATKC65qnVOvh4fXdUuH16PWtHXV
 7Al9PQ3UL07lYL8o45wc9N4eZf11k0Jrxz/Y47WdnpUfH7JQ7PjUOs2+s+zD0+/QCmae9q45mJP
 YO9URaV6sm2hA0MKrtqU5s740gHW4t8rdh2BT/QLHRUNFxURM2zBsHQbIpt/eXKgkE5r6+FATnw Lzhd+0AQCGwUKJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

aml_pctl_find_group_by_name() is not used anywhere, as reported by W=1
clang build:

  pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group_by_name' [-Werror,-Wunused-function]

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a76f266b4b94..385cc619df13 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -596,20 +596,6 @@ static int aml_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static inline const struct aml_pctl_group *
-	aml_pctl_find_group_by_name(const struct aml_pinctrl *info,
-				    const char *name)
-{
-	int i;
-
-	for (i = 0; i < info->ngroups; i++) {
-		if (!strcmp(info->groups[i].name, name))
-			return &info->groups[i];
-	}
-
-	return NULL;
-}
-
 static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
 			     unsigned int offset)
 {
-- 
2.45.2

