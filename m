Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2FA1B947
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892222; cv=none; b=aUoXlKVvCkevuiWRg/Qp//VE4XjPSYZCVVyYDlF7zdltXJTFA5K5U8KtDLAaGmM0GTZTuDMdmNX1NyOGbWoHgFR9Gz3E20DZaDMgNApiWWrljR8aqW8x+kyryWga54uj7lJ+xrYGdJFj0CCzP73DtevaR8L8idWiHitSB/BlDNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892222; c=relaxed/simple;
	bh=hYVGG3zCAp5q9wfPxfygwzoMeHDq1lD0TOw/nA3SQqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fekN7+agpPInKd+uRYQjrcqVLBOUc/HPskX//g0cPj+QC9kAXM4O/dbq5/MezgCI417NSE2ZQinZbZv/J9fFT/lDyM+Rq/bos9HFJhLJx4a23RhcplobHUf1RUhci8dxc+Bjveet5tqsylykG1MWAvYYPdWrnyltgXnXVGshma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6eLK0di; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6eLK0di"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so343896866b.0
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708892218; x=1709497018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RDTCOuw+4/YmutiadjBWbj6E1uINYYJEFoH23miprM=;
        b=T6eLK0diALAtHt829iD6VQp+61hiyvg3IiBRYD+tZxtkYQd8ZCRXImDoYbYBI5yyb/
         NZlremgq+4QezzYAAa/M6wLxBVJIRSvO1e6reCAuzCMvA76RhlF47n0GGD+hW6wWHA0Z
         WPADSiWQBDGBqeE41yzYxnxOPPVefnbxeqFRUDavcMIS68ygsKju9UarNTlaUKURlYHf
         G+9731bfYp0/dPpmNyJmDq3QRqagz6o6Fl8omSeIGkW1d3moHwoSmVhF1+n/sKRRStYp
         7u9JD6QDJh/j47/ypi1NoGNw0AFNn9ZuUhZqIJClofF/abCOkwJErrQfB2P0Y7EwCJqD
         XOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892218; x=1709497018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RDTCOuw+4/YmutiadjBWbj6E1uINYYJEFoH23miprM=;
        b=LWynfBdn9TS8tR8k+Z3LvZU1eopjnzqlItEDT6Q7wshAbzzYSRZCR72BEGPvg7IoWa
         BaZYmh3irZnkeMmW0iyQ65+uYR+gg+C6exCNTlK5NzHDvU0Aq5bibSS+COWqXimfx66I
         2A6j1WtX/AkiKHojvfYKW+qixP0bva4GkNpaPZBK1bS36TxTESkBalMxTyNA2wm7VSfM
         8Sk82To4wwGL7Zl66KDEkv6ejo2OSyMThQ/S/AsUMc80b4Hp4INBcH1Fb1izkD9IeS9f
         Ozij0wpNy6Jx/Sazhc7SE9JtpH6UFhn/cSM8FR+Nwt9mtO0GmqEtDKneDM2Im2R/oAcM
         dyaA==
X-Forwarded-Encrypted: i=1; AJvYcCVIHlze5COIQavW1WCM9QNzFgGlXtbH4Xn+nUCal30g4rxbq6n19qLD8SKaob3fBByqb22g7qyaevNFlua2pvo03i8+7Q==
X-Gm-Message-State: AOJu0Ywtm+dFU4Lhnl7lzoYd1K0SyfGxQYAbElSJDxf6LnWMaoHY1bfu
	nL35RWBEiURZEpOorl7DwM+oB/Jq+djaQoELtymMkjymKYxcmrScRKVvbaviCig=
X-Google-Smtp-Source: AGHT+IFmzrcv6/CgvFP65oBr1ISELI6gDrREcQehqqpSKx151vTi5mDUavH7OKS2JjWHlw2haKthsg==
X-Received: by 2002:a17:906:b798:b0:a41:3d8b:80d with SMTP id dt24-20020a170906b79800b00a413d8b080dmr3872738ejb.37.1708892218531;
        Sun, 25 Feb 2024 12:16:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id ck13-20020a170906c44d00b00a3d7bcfb9a1sm1741045ejb.128.2024.02.25.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:16:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] iio: proximity: isl29501: make use of of_device_id table
Date: Sun, 25 Feb 2024 21:16:54 +0100
Message-Id: <20240225201654.49450-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240225201654.49450-1-krzysztof.kozlowski@linaro.org>
References: <20240225201654.49450-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reference the of_device_id table in the driver structure, so it will be
used for module autoloading and device matching.  This fixes clang W=1
warning:

  isl29501.c:999:34: error: unused variable 'isl29501_i2c_matches' [-Werror,-Wunused-const-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rework according to comments.

An old v1:
https://lore.kernel.org/all/20230810111933.205619-1-krzysztof.kozlowski@linaro.org/
---
 drivers/iio/proximity/isl29501.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/isl29501.c b/drivers/iio/proximity/isl29501.c
index bcebacaf3dab..4982686fb4c3 100644
--- a/drivers/iio/proximity/isl29501.c
+++ b/drivers/iio/proximity/isl29501.c
@@ -995,17 +995,16 @@ static const struct i2c_device_id isl29501_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, isl29501_id);
 
-#if defined(CONFIG_OF)
 static const struct of_device_id isl29501_i2c_matches[] = {
 	{ .compatible = "renesas,isl29501" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, isl29501_i2c_matches);
-#endif
 
 static struct i2c_driver isl29501_driver = {
 	.driver = {
 		.name	= "isl29501",
+		.of_match_table = isl29501_i2c_matches,
 	},
 	.id_table	= isl29501_id,
 	.probe		= isl29501_probe,
-- 
2.34.1

