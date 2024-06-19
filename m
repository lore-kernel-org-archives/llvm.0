Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082D158DDF
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826185; cv=none; b=dEfSLGJDn9isj3U9Kg3Oc19Papjj3Qb+tU0TEpGuJNL50v6xcUhE8kSF/3h4guv+cdrlBrNwvTs1eJEfFCEZ48LF2deAMNJykDEA7Lvc/oqXxWLd39XhcmxEFGOCtoJ7WcjqgfjMSarWL/lFCJQaWJbWoxJwvF2iTi0oE07Cyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826185; c=relaxed/simple;
	bh=qCJk9bWEc+/fuCHJqn77Np+/NCaJz6B237shZlGk7wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlPppG5jvnLPLLa/pDk5OT71eBRFa49H+roN1KDGQFgYXAJLkfJoHSCDb7fKAjEw3PjDKrdTTIke6XGAm7NezQJV2escJRWkth3rv4tIWfxnwJ7GfWkU4j7wGEb9NQoZDDCvyTu29FwYhYQ0trpwQ28lvDIaoTI1Sqr31c0C0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRIeq+t5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRIeq+t5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6fb696d2e5so11121866b.3
        for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718826182; x=1719430982; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9z63p6lskMirNgu/7X6osNx5PNpqMrbPB+Wm9ztJrU=;
        b=WRIeq+t5A6pSU+xv9lHB5zFm9GYUl5HbO4w1M3qwU95w18HvigeYjmiYrba/KrYzT8
         r7P4ZyE9YZwrO/TT4JUJWw5J7MMwtFBAoVZphM+WT17gtNGg+ecbcC+Sr53KxsINnxtN
         obejNAZmfD/FjD/7HeU9x+y/KhaoCrs13nHB0L6CnPcOZlGnirGnD4J2RM2DZAmMooC4
         aYpBQORcOrGb0LXkrLXRjuAvsyimgqc5G2F4PesdpxpyvpV+29MRBpcRCqoxvLGuDFpv
         NyGS5iDnBKyOFVYz7lkU+O2Nx/RpfqDP3XVsWSaq30IQYfrXisJRZNrUIsAWTnQfIqcm
         r1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718826182; x=1719430982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9z63p6lskMirNgu/7X6osNx5PNpqMrbPB+Wm9ztJrU=;
        b=fiTm2oxQzI0mt/eDFUJugy/Ta/PJ/YvE4Ktc2ouVZ2uPnhmOFuo1pb8LlhCuDM0zqc
         22BMoadSoZl+65DCx4wj1SEVvh7AwaYZSYt8MZAxafYOY2D49Pm0gdKZ+R64vwiZshBx
         envWItUOQfN/XRq6K33wj6y5uq0zeVLMeLNqDGFEtLNcnZW+03DTO2yIGvuzTEsh3lcD
         to6O67r9joq7Le3Qaup4MUe0x0fpasnSVkgNBGIZByEZcVWjHoXEOk+6vGfR0EfFW6T+
         b2QrzYdmXoXQ3W16H19dA7jCC6rw4ZvgaxdUxDq8qO+3TNTiGYJdSzRgmYg0KZ8Z0CfO
         P8uA==
X-Forwarded-Encrypted: i=1; AJvYcCXBA1sj3V6pXxdYSQU3xLHVq0KVoOMLkd03NyT+uapDMpfSCVFcnuD8qci73j/WJvcZNQf5MbHPxTMl6pVcEhoWSofHqg==
X-Gm-Message-State: AOJu0YwPO0y4ebp99u0a8BSlsfxH5aLyHSRGxbMPQymqTJ9/psYlzBxe
	p/8WX2VHFg1qV2OTFNRSDLRnismFFoU4h2cnh1o0xcGTBOf7qhLN
X-Google-Smtp-Source: AGHT+IGhnnBv0QoNxw0IXvKXUeKA7OoxHA1cnv3LEAsfVt/4l2CCSjKit1x7O4p8BBi5/H5VF3Bmzg==
X-Received: by 2002:a17:907:a095:b0:a6f:b34c:76eb with SMTP id a640c23a62f3a-a6fb34c7838mr180373066b.54.1718826181747;
        Wed, 19 Jun 2024 12:43:01 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3385sm688365766b.24.2024.06.19.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 12:43:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 19 Jun 2024 21:42:45 +0200
Subject: [PATCH v2 2/2] USB: serial: garmin_gps: use struct_size to
 allocate pkt
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-garmin_gps_counted_by-v2-2-f82f10ebbf28@gmail.com>
References: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
In-Reply-To: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718826176; l=869;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qCJk9bWEc+/fuCHJqn77Np+/NCaJz6B237shZlGk7wA=;
 b=cexK0HonegmOr1iAcrxTSFtX32J5Razx8ZpgrRL6ih52oWsn3hR9bgc/J3g0tkdX6cLrnZG8q
 eEZ8mKg7vbcBWjSIG2VzRHf37QEneJDUhAV9LGoM2IcgC4OZhrLYD1o
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the struct_size macro to calculate the size of the pkt, which
includes a trailing flexible array.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/usb/serial/garmin_gps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 57df6ad183ff..6d6ec7eed87c 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -267,8 +267,7 @@ static int pkt_add(struct garmin_data *garmin_data_p,
 
 	/* process only packets containing data ... */
 	if (data_length) {
-		pkt = kmalloc(sizeof(struct garmin_packet)+data_length,
-								GFP_ATOMIC);
+		pkt = kmalloc(struct_size(pkt, data, data_length), GFP_ATOMIC);
 		if (!pkt)
 			return 0;
 

-- 
2.40.1

