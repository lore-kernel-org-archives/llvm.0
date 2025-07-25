Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E217A2F0
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 01:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753408564; cv=none; b=kMGU+Uajs/N5cy0r+Yo0Vugk3AQIjyL9LnA9D4dxaQkgyxZSbCixIscqeq3s/b1SqGU0qDUTlAGd8u8DStuM6tBYwrpHmoziWZ/uYZ+uIk69tnBgqSuyNXwpXRjWuNn9iOvzdBnVWBbrCrjOyoN0GYs1IEKArviAPCrSXk79vpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753408564; c=relaxed/simple;
	bh=tcWSEMLkdnyh9aSLiaRBtq7lBNnDoTyyz9lHUiNPlc0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=s6zn6m2vvyznhNAVSyMlj3IJ2HEInRKRVRodwzmzUoJGe0tn1uiSNlONvpVE6cV45+L1k2+z51IblB5L6grb/3SolIX7FIm1MXqfOf/87jW0VggaBF5XcVwL1rQRXhO+Vh5nTHg0Ep+vEGFvDVXFfAVC8KUPQ//KLcI1P5KdYrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.corp-partner.google.com; spf=pass smtp.mailfrom=inventec.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EnRi663+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EnRi663+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so289287966b.2
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753408558; x=1754013358; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jBluRc4AqYa9mwEBFMC/KLTpnRIQOHur+1Rtne5kToE=;
        b=EnRi663+4EcLYxGiLY07YHE2BwNgcW6jbfYlYBlw+Lor70OnnDQfYgIxKExkMcfYtk
         7ZKKV8aNs1dvTDmu7WVKkhjmBaskR3r2We+3OpdDBeBfAgY+THuLHXQ40mZPTY0quGya
         6DoMNDSrdnEZ7GzA/QPbgRD9ABNPaTl1LqjMpDOahByT06g/ncX75Nj8nzSs3jdecAKY
         x2avnTr6vUJ6w97NFe5WkF8Xrj16dEE3/IT+DcHdd6en+StRU64b5dNQa5jlS0CvZJgv
         m3g9kgV/PI8AtX217YDAp0YSeah8LoDItx5rDX3k+5V/kNuzlr8n81LMPK/pWfar7T3h
         GaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753408558; x=1754013358;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBluRc4AqYa9mwEBFMC/KLTpnRIQOHur+1Rtne5kToE=;
        b=Pze2OzmzU7Fm3FS4N9LRVjbai8umzRRBXi4d8reJe4eiMxcJUwZr7J4SsoKiiqri4L
         6Vcl1+IHx1V2Fp3LBBl68eyQcqGzhSQEV5L3jh4BV7KbJpaBvQFxOpzAv0SazuOmXg7b
         xAbE5QMd5vqW8Ts3L6OXD26XZ9bzCXB4f+sOXox25c6yqqVHCCa5bbvpI18vdSeLw+o2
         NdnjP5JEdiVzCxOa9mJNTer9ffPET5pjx6QQGQC83mlXo6Lj1NL7ne+B5MrREK1FIN9y
         Ux0hPLBXbN3wF/IMztUZiNyQIwmBLLc8wSdEAYqxuoXG6JXO2rEvmuuTNpI8rq78wRG7
         BuPw==
X-Gm-Message-State: AOJu0YwyQZlVoeFoz83qLBj5L9frkeqAAj6KNT0YtQMPKdUx7SQi0BBq
	1o7WlxELAidB3VBoRiwK92wpKP4d41qAHBmUdY4Caoox8R5LTlBcBloV5m1l+VlEtWuLIn2HGVc
	YZI/D2x1J0WCsQFOc2QAzqji5q/Na30Ad0BtVBB0Chtqd/bkAK/6CmXo=
X-Gm-Gg: ASbGncsUvS4MqheIYLMuNlLc8TzgPxOZ83e0Z4Vysk0o/NLT0eO5Tj2fEvYNVOPo3Vi
	L27vH6LhfUqzYDI1kU1XCPfAZfc1X6Bn8Z/ZxKukEgfz6++62YDin7tqZvQlzZH/4PtP4KzLk3O
	XJjVrC4dWVbNtwFhSF3N18CgJyQWKJL40OU1zflLr64mgk7C6UKP5rqPF+Lq+BdWdXOdEHscxTW
	amWwTMt
X-Google-Smtp-Source: AGHT+IHJrq4VBdfI6Nqmu4pqZEfaWm4CrQW+bqbn01Yhkhymbt8Rfxp8TOPk0fUV2NdWzI06k8NeP6tQWLP55DzcysI=
X-Received: by 2002:a17:907:3d02:b0:ae0:66e8:9ddb with SMTP id
 a640c23a62f3a-af617705483mr27696066b.19.1753408558508; Thu, 24 Jul 2025
 18:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Kerry Kang <kang.kerry@inventec.corp-partner.google.com>
Date: Fri, 25 Jul 2025 09:55:46 +0800
X-Gm-Features: Ac12FXxDU5D-UiU7IOkHfr3KZQP0idtJyLB1qSw9Lcx_i6IPlXyGrNTUQJpBxUs
Message-ID: <CALNGHDA5Lb_8d+Hywv2S+Ks0J+n7kZb3Hme5gnkPf=MKYKhfOw@mail.gmail.com>
Subject: [PATCH RESEND] mtd: spi-nor: Add Winbond w25q512jvdtr
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
