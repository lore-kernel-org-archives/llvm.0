Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D91B949
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892220; cv=none; b=dWdSJIxMY0n5irW1967BtqaE6lWT2r5+U6BGwZRfezRQRhdlZVnRVh4UPUYncWTskXyy702XSEGqcuASqaCyxF5IcVo23ewbAVQf6yBVWuX28gV2xIJSed6zpq1Ve1D5W4lGnb+7vWMDYPKDRobqbOWPwmTVZ27P2+9jH7yChzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892220; c=relaxed/simple;
	bh=VxLZ7RsZpLYYQuSI66FP3nhHczQ7j/5oRGLYsnKLyxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HCDxdeZBuwuBuUpGDsvYpFZtzkuDNiltLvdtNVF+OfIGmZxUjqjvZCDsXhtNB2PsD7UXVPPu6bQk6UvEzeIOmzR7Y3efGY8FEw3DCb7w5aOLsU2IJDNSaKc0eSt3W8NnGfVoyzENXkLPbS3FEtbR91LExpx4NdLhHBp92DVzElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRVt4/km; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRVt4/km"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3f4464c48dso269268266b.3
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708892217; x=1709497017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g0BL3CAb54Q9PTk8ioTJQE7FsRhBBa8lLja7tu/HP78=;
        b=aRVt4/km0LjkujV06S23K7Yu8gCVMOiGvLlFEKuO57GenLcAgc48UEAX45RqXkSysi
         4pjqjSp+DS2Z/B8ATX12NqrqzVNtFbLyu6urfjwvPYLfmZHuwlXghDv797W1NEpSqx0+
         d2rDXXn78u8o/CCSgCf3KmKHMIuCRNDU4wQH3zpIfAlAHwyn6z1jF8/IBNMeVBnRyELS
         DmfYdscT3nSD2mwn8OMcjlDLYIGb3y4uTrvUzobaDi2EIxPvgMrowG8qpwm6IdXnVqmT
         jiuPbA46Fyf1dC5AVCQ+S2JRCzSdgC1uqRNj2ybiysgvuggKtbtR0ZkNmA/Pcfh+9jkJ
         dAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892217; x=1709497017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0BL3CAb54Q9PTk8ioTJQE7FsRhBBa8lLja7tu/HP78=;
        b=JJMqjs2ccFw2wjVXJpOrRveEjDzZUbeuxkJqFn5VlJdyzNgKjMPHsTp1cgUIV6hLch
         iPf5SV7ycEOUnOmFiVNS9vPT/OD+FuxsX/dCqMNO8ucbseADzMsHJZugNHzWd3CqEeyv
         4MSfYtdI0j6UVk8UrLLXILE3UlBkpGyMq3E1woahMBrpSe2d/7cnySUV6yA8ZsObcjCv
         r9KuyuaV9STGBt8n3xGijWiHL5g1H0cjin3dNoihLdMeDtbSztjpq106txs4mnWvREXZ
         dqvzhBDwEkczH/1tLLUePG8xoC7tvvfMze1eNLL5grO8vIZc1SFk6SbMgUUOSD98CCVQ
         JFpw==
X-Forwarded-Encrypted: i=1; AJvYcCX5QZiNMJwSTSZCnhbraMbZ+VEK0dcenCty1LUfTJRcoxyTnBFnsCTBUU4x7gpz49VZk/pkMDe3VuOQhqBnARzmi2/SDg==
X-Gm-Message-State: AOJu0Yya5s9fPNSo6XIqyJmwrZ+HOnP+SZtLhABY7eZF5+tN565OhZJa
	705UNYTjmRVXPm3kATj09Xt63V7suZT+RJQh0LwzJMigYVpA7O3qKu93C4u0Y1k=
X-Google-Smtp-Source: AGHT+IHwvup2ahGbonMPPRSZ4YpMn5V9B0o/2DNB+FUiQxsAjMoxZAEys1BsJfv7CQ90Ezd9DISwOg==
X-Received: by 2002:a17:906:f804:b0:a3f:c0bd:b7bd with SMTP id kh4-20020a170906f80400b00a3fc0bdb7bdmr3933047ejb.43.1708892217056;
        Sun, 25 Feb 2024 12:16:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id ck13-20020a170906c44d00b00a3d7bcfb9a1sm1741045ejb.128.2024.02.25.12.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:16:56 -0800 (PST)
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
Subject: [PATCH v2 1/2] iio: dac: ad5755: make use of of_device_id table
Date: Sun, 25 Feb 2024 21:16:53 +0100
Message-Id: <20240225201654.49450-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Populate the of_device_id table with match data, reference it in the
spi_driver struct and use spi_get_device_match_data() to perform the
type matching to fix warning:

  ad5755.c:866:34: error: unused variable 'ad5755_of_match' [-Werror,-Wunused-const-variable]

This is also preferred way of matching device variants, then relying on
fallback via spi_device_id.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rework according to comments.

An old v1:
https://lore.kernel.org/all/20230810111933.205619-1-krzysztof.kozlowski@linaro.org/
---
 drivers/iio/dac/ad5755.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
index 404865e35460..877c1125d892 100644
--- a/drivers/iio/dac/ad5755.c
+++ b/drivers/iio/dac/ad5755.c
@@ -809,7 +809,7 @@ static struct ad5755_platform_data *ad5755_parse_fw(struct device *dev)
 
 static int ad5755_probe(struct spi_device *spi)
 {
-	enum ad5755_type type = spi_get_device_id(spi)->driver_data;
+	enum ad5755_type type = (kernel_ulong_t)spi_get_device_match_data(spi);
 	const struct ad5755_platform_data *pdata;
 	struct iio_dev *indio_dev;
 	struct ad5755_state *st;
@@ -864,11 +864,11 @@ static const struct spi_device_id ad5755_id[] = {
 MODULE_DEVICE_TABLE(spi, ad5755_id);
 
 static const struct of_device_id ad5755_of_match[] = {
-	{ .compatible = "adi,ad5755" },
-	{ .compatible = "adi,ad5755-1" },
-	{ .compatible = "adi,ad5757" },
-	{ .compatible = "adi,ad5735" },
-	{ .compatible = "adi,ad5737" },
+	{ .compatible = "adi,ad5755", (void *)ID_AD5755 },
+	{ .compatible = "adi,ad5755-1", (void *)ID_AD5755 },
+	{ .compatible = "adi,ad5757", (void *)ID_AD5757 },
+	{ .compatible = "adi,ad5735", (void *)ID_AD5735 },
+	{ .compatible = "adi,ad5737", (void *)ID_AD5737 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ad5755_of_match);
@@ -876,6 +876,7 @@ MODULE_DEVICE_TABLE(of, ad5755_of_match);
 static struct spi_driver ad5755_driver = {
 	.driver = {
 		.name = "ad5755",
+		.of_match_table = ad5755_of_match,
 	},
 	.probe = ad5755_probe,
 	.id_table = ad5755_id,
-- 
2.34.1

