Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A351C7007
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162596; cv=none; b=JyV+NeNaT+lyHNwDXYl0IvoZ9PDPBcZy11u56nX8h1r/L3r1o87dlzStl2iG2gps8hkfHslCI3aBrty+IbuBt1bXwUc3L32dsZRE2vbu7C5P1QgYTTcNqRGGHFYvROaIPeEi1JS0MlfTbz+KrJBpf0nzIsG7wpKfgO9VFsiU3d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162596; c=relaxed/simple;
	bh=tcWSEMLkdnyh9aSLiaRBtq7lBNnDoTyyz9lHUiNPlc0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nCmmyv/cdrgJ7zCw3oilCpxAWglw4vaObXRyvZ2KpOUttNwczrCQgQSmi6wbyq7bvtpN7zXd7ePEAiUJhLSjFOzJ3W2ozeQF3UvMTsf5uzKSLh2hn1j8XNHUcVpUtbEKT2tZ32LNFAFRyr7qKS++XnFFBpxi3bclRy5XsZYOIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.corp-partner.google.com; spf=pass smtp.mailfrom=inventec.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Q88xReL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Q88xReL"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1184008166b.3
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 00:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741162592; x=1741767392; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jBluRc4AqYa9mwEBFMC/KLTpnRIQOHur+1Rtne5kToE=;
        b=0Q88xReLMuydBTC7BdfbRE+xrULX+scFZYrDhSXTVLg24KVTqR1QJrk9tuzW9ljwfD
         +IaqA/srLSIjNgu6L27NR8rMdfnJbpiLg4XiyXdT6GmZi72xDtxLvHbtYdcV1kErRi3L
         VLmJoNWMdOXgmeOKOj5uGYYWvChVvyLU/JRp5c0hJhNpcelFFHKMAIhQSx7l0QPt4xya
         mdFqXKM/uebcoF3lVuYATtkVeN9yE4+wIOv2Dk7u/BF7YjQTO7WbVTbS3Ejz0kRgczgU
         3qI5e7KHD03eAqHcYGp1Oeqp292qbgcTpdbU+MWm/mFOalUSTUKu1U/HGwoYwf8DSxNQ
         WQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162592; x=1741767392;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBluRc4AqYa9mwEBFMC/KLTpnRIQOHur+1Rtne5kToE=;
        b=eU/NsAlGF49v33bB4K8GgyBNexIGJ88qgK7N1a343NubNBVmzqeMeNVjAuaoiQ2qLX
         tfwN+jWE98bi0f1bVxT30SlrTFgQwT0Qnh/55sHlr0cJH8cBX3ablhRX2Ju/wHEz4G5M
         n9rBjCE+KTms2WYw/vUaMzXUVZ2GLXdMkJ2tWoo/RabMiXF6nFYbruIiXAp3tg4/gtdm
         A+t/Sh8hwqY9Tdc8+Q8ys3VT8xQVfWf6BCOolg1SO6VN4pEqvK1fbTjAXV6okHIiBo+u
         avnPrvRK5ifqfOleb0YpOW6M19nbNsBte0teOADgaEdGSO2RBcHTwB7vkvDJKhSD5dB0
         IAzg==
X-Gm-Message-State: AOJu0YwUHP6R9nVe4q5AlZD5Kkn7BlW/GCGyjY6g0XKynA+RTeMippqx
	KUy4TbvDgv2BZXfixumMjwesn3HkTFtB7jvnY622PtmgtpSMZDPS+VZVEp+VrimRY5J7bGG1eGG
	GiIwDx1pZ2CXEnucG+vmNlF4Z/xVaWD9z2StIWYo176o8d1WOB5M=
X-Gm-Gg: ASbGncu3ChTkd3DzLLYhzeNGXL90ZBarR5Aw/vMZdr1TEByWVFoAiltTHJWHncADORa
	LGD/a9WUOXT7YEWOZNx/D+4REXipu8GO+JAVhwSn4jxOExjapyCpvRUbOHR0ochnKbuQCl2bhvS
	fG2zUSahv0WJ1GJy3xmjtKplcdAQ==
X-Google-Smtp-Source: AGHT+IEIhI0imlmnmvEneoZB1CIsEriCFPuIQWHazM6Mp0DX2g8PZfAOrDM3QO+MompArNS2jl892RCCVscXRLKiSk0=
X-Received: by 2002:a17:907:94c8:b0:abf:44bd:8326 with SMTP id
 a640c23a62f3a-ac20d8bce29mr206694166b.17.1741162592052; Wed, 05 Mar 2025
 00:16:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Kerry Kang <kang.kerry@inventec.corp-partner.google.com>
Date: Wed, 5 Mar 2025 16:16:20 +0800
X-Gm-Features: AQ5f1JrOJG-PHSW4n-sQZJypeRPbHykGGGirbiBu2VW4UdVYsGJR-MgJZ-byFWE
Message-ID: <CALNGHDC=cCjTpfm6WDN_rdo2A9KBvHPX=0u52s6gTVgPt2xj7w@mail.gmail.com>
Subject: [PATCH] mtd: spi-nor: Add Winbond w25q512jvdtr
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Similar to the other ones, different size. The "JV-DTR" suffix is in
the datasheet, I haven't seen mentions of a different one.

The datasheet indicates DUAL and QUAD are supported.

https://www.winbond.com/resource-files/W25Q512JV%20DTR%20RevD%2006292020%20133.pdf

Signed-off-by: Kang.Kerry <kang.kerry@inventec.corp-partner.google.com>
---

This modification is add BIOS W25Q512JV-DTR chip to winbond list

---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e12..6ce5f70bc11a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -146,6 +146,11 @@ static const struct flash_info winbond_nor_parts[] = {
  .name = "w25q512jvq",
  .size = SZ_64M,
  .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+ }, {
+ .id = SNOR_ID(0xef, 0x70, 0x20),
+ .name = "w25q512jvdtr",
+ .szie = SZ_64M,
+ .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
  }, {
  .id = SNOR_ID(0xef, 0x50, 0x12),
  .name = "w25q20bw",
--
2.43.0
