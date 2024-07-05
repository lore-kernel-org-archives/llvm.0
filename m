Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89D149019
	for <llvm@lists.linux.dev>; Fri,  5 Jul 2024 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720179083; cv=none; b=HApHefe+DRLKs9Sa5IQKEpTMejxei8lk26jnDDIkjfRjzCqdUdxYPFjY1aa/9gkyIB4Xe6h0TXnAQfbVO/opTbs7R1NZDOdECtwI+NdYc6IySQb1E4STWDTf8zmrS1+QXKeYSbbOxv2VpUgGQCsGlCq6pvKOAvkZZS1MRig8BhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720179083; c=relaxed/simple;
	bh=hPHreMrDt1doXkKIFfOnokfWoTTGR/eEdk8FJb3tsIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEhgu5EYWldFKvKIbioSrfl3vHQre5gAEEi7vHOj98ioV0dOUiiaozyfkSttcdzluFLnD4Fbd+WqZfzs85qEwCmAYx21p4jpljNNplhYXtzKfD3h36HjN90qL0QmvWneaz9+rSdar0QTROE9qptimF2V3TSEgFrIolCac88XN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d81aqrzm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d81aqrzm"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso1760881e87.1
        for <llvm@lists.linux.dev>; Fri, 05 Jul 2024 04:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720179078; x=1720783878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peeNZCDuyoda2DYpfs5bkgO4H7nlJlel4Yeo4yaX2aw=;
        b=d81aqrzmAa4qHW1aMNFEKC8itktexEob+hNWPo+FjWX9olFRCnz6OeFKeLPBZEMWOK
         safumZhltp8rR+okXyWzKnzkJZF6z+LJPpvie3AmZIZRzYmM9WqF93GpmdcsarHj26OY
         dJx7VApPI7eIiWN23PGAesgtCgG3KSwZN0s/gHHiAK17K2N7gmd+H1KzO+SiuiXz22QY
         r7Fm62DyxS+WxEDh+OamTCOIuRc+JdMBK6TRpb2eSQaEF6ZCm84CoIaUpHmXeB6mnOMZ
         /RipT6J8hOyAxae8ZEGwneibFcXPzj+6kInhWdMliCCrdzl7XwP16XmtZY+1UNBZRTL5
         ZDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720179078; x=1720783878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peeNZCDuyoda2DYpfs5bkgO4H7nlJlel4Yeo4yaX2aw=;
        b=esufgFpkc5U4gBTl+7XbBZQCicXdujrrSXW3qJWZIa6NgWYiWQa2d3Bs7ztPTyE1m5
         Lwwh8cR7EbPZ9a1qDu9T/1cKDw4mlErT4stpgbO+fPpaf5z12Or9HMbxhi1tglmiQxMi
         VhQeqmW8VdJTlSrL5YgKjNO4VdBl64VHW4OXPBcu9bP+PlxqLCjUR1P7yVBCpcQflzi6
         0sSk4VCWJCAf1F3SPDb3imJMKu3Y28nFOT1f6KDkIV2WFSka+ldZ6vSUByfgl45Pednf
         C/ODkkAOxK8/f2nBSWlUt+Fnqy6ElNf0BJmxPZsAtSg8Q3gXdHkhs4PF9MAieWkUANH0
         KlAg==
X-Forwarded-Encrypted: i=1; AJvYcCXBZu/j+mfjg3EATc3YWVJyuJw7eHc88FNT4SLofvVaosGPJUSYi8QsU3aonQ25PKOUmufh1vinQa7ZlQi3Gtd68UDmJw==
X-Gm-Message-State: AOJu0YyY6CMKYRNGSZMm9bzYr4sDTXVJ2ZhQSajxu+E504yv/gznq9D9
	8tETlwumzICL2u+myGuq9KypTfhQmaw1xKYV+e+PTw3RttewViIfA/yzDxTyRinvbhvrK6TIWO9
	8
X-Google-Smtp-Source: AGHT+IG87fGjXF+TaN2rAGmYDwXmCBV4e70dP7HYgoU/5vS+jGGZ87IXfHT7BTxzfN8kyxOo+KkYcg==
X-Received: by 2002:a05:6512:3ca8:b0:52c:8abe:51fb with SMTP id 2adb3069b0e04-52ea061f4e1mr4207586e87.10.1720179078543;
        Fri, 05 Jul 2024 04:31:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fc942sm58090725e9.42.2024.07.05.04.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 04:31:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] power: supply: twl4030_charger: correct comparision with old current
Date: Fri,  5 Jul 2024 13:31:13 +0200
Message-ID: <20240705113113.42851-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240705113113.42851-1-krzysztof.kozlowski@linaro.org>
References: <20240705113113.42851-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver reads existing current value from two 8-bit registers, but then
compares only one of them with the new 16-bit value.  clang W=1 is also
not happy:

  twl4030_charger.c:243:16: error: variable 'cur_reg' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/power/supply/twl4030_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/twl4030_charger.c b/drivers/power/supply/twl4030_charger.c
index 7b9b0b3e164e..f3f1a0862e93 100644
--- a/drivers/power/supply/twl4030_charger.c
+++ b/drivers/power/supply/twl4030_charger.c
@@ -363,7 +363,7 @@ static int twl4030_charger_update_current(struct twl4030_bci *bci)
 	if (status < 0)
 		return status;
 	cur_reg |= oldreg << 8;
-	if (reg != oldreg) {
+	if (reg != cur_reg) {
 		/* disable write protection for one write access for
 		 * BCIIREF */
 		status = twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE, 0xE7,
-- 
2.43.0

