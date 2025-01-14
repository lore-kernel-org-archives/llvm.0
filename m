Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5611F2361DD
	for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858026; cv=none; b=j/k1nU0nYMRqq4myWGg0PHF8O5oXzBa7ewHV1YBbEMMphsV9oK+XZi8qCpgyRGf8R+V309o1SpRAUK0Y1wq0HXZPf0hGQuOxbNNpn6JM8aLi2BRHVPM7sYWz+3wofy+sGH/J0yd0qMpuZp82uIs2ASeTX8zDYaO4+rtgBQoLnAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858026; c=relaxed/simple;
	bh=/YJr8UpKRDc+0utfD6HmlO4vHLwuJEf1t/xcHKocVQ4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAwm0gfS6y8pbsMyS3ms/KWDHZUO0s/5lISVYXtiBcIeyz2ueKyUnS9NHdzS7IIXexMGy/u39OXzm1zBZwOHjz22OBDbj9YO3eYmT0MCCrOfUugCDV6Uf/B3x8+GRmDnNi+3h2WuZBbSzOBpeMpvI4wrxo1JoiJ2bcdqIxRYwT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdojrWOn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdojrWOn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436281c8a38so38645675e9.3
        for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 04:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858022; x=1737462822; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e0G14l1knOdaruc+I1unnIDR29LSZs4T072x9bMUSOk=;
        b=KdojrWOnhTlFXGroSfabsGFDSLe/k6xPqoYvjaa44qSAfdbvzrVYsimJkYGcoEHGtu
         WGn9knt1mBNqRxn2Uey9jKoeTxZHFhI1Ft99Kpb2oWzGrpgYbBC0nE5sp8VMb0dSGAz2
         2l6x6Z75iSEdeI9TbSvmYBQRtN9tTRL7Pwv5I+35qQQ86Jtre6lPHrGlZ9f2cUU4NuBd
         bIqc6ej5pS+T5+g2BonCrUT6/xPpmZ4oQ5rh1iorWGAiTXMF0IzLcG7xWNmeh9p1SJb8
         Kp9k8lsh3IqB8gOPyFLirxnMezEmaKo0Lm0bx/aY2QRcXmkW0e9nT/UFgbAjegLtZeH8
         ulaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858022; x=1737462822;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0G14l1knOdaruc+I1unnIDR29LSZs4T072x9bMUSOk=;
        b=c7j9s4zUZH5PtPOG27mZ9yrc5v7ooXKL4mkoWdCySVFgdjBXxhh0udrMyMkOAmPseZ
         pO0eHzTTK9CHaiXFVQHGLL3PbS0zit+BI/W9Be2O7JYNJRfWmztQxcAr/f+eO0+T2EXi
         pDL6hb0ZG7+8AGndDPeiJzid3Er/h0V6L3vKQVhK3rmOLo3Bx062YSODh0ECryTsGpxK
         JEtS6v0cx6+0dkh+VKzjMzkveRJ7E4mU3Gs+WTOeBguswLCSshNRghxHANDgF7WrKfNp
         sfvPMFfxPz13IGH9jSXDUGf08IEjqQFKfQ84bBlcEbGpxnBAdqHs5FgDIr6CzWmyTQ7X
         DBGw==
X-Forwarded-Encrypted: i=1; AJvYcCWKLf2SB9PtlTeu/OatbKM1TY+ZgnrVidJTTGC9PClzkGAxVB0EWvc8l4IYNZfEtp78lPr8@lists.linux.dev
X-Gm-Message-State: AOJu0YwUflhi8blJr21GrD1lt8meDlf3TI98EApkZkpY90VWAgnDLc1M
	KnyW6ZV8cHBn23ByufK0VuPdYD0tqtZhQ1jKguQBRpvPyonAshMQ
X-Gm-Gg: ASbGncvyre/rQIWfkKrmP2URZV4WfYIHF2Ymv/qCE9zyTMd8cm5WLEeOHYvQbohDxTW
	17/xyocu1ughbjefuKZm3LV4ivCKSIhi5b8vnUijqTEJC3tPIr3/70LEHCslWFHtQRUbxOKi23W
	vWDTMKOCPRiRoEs+KGs/hUwLhx+0dNfzR5QZaGg7EFmjv2evWFY+STWesfjhKSxhxJ9J6Xe030E
	Hzv28fba17N0gXy+0NC2tkxZIV0Jfw4jVNP2GPZXXZBw+Ewpyng3CxLC9aCiSN1KcqgkIOBAf9+
	MFcMbIJ76QSb
X-Google-Smtp-Source: AGHT+IHCsdPFaJF6vWjg+pdCa0iGNxZHxd+p3cTgxOveEGdFXhRJJcBQjoZk8a5ZgIUGLsHlqteHJQ==
X-Received: by 2002:a05:600c:1552:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-436e26be5a3mr241842435e9.17.1736858022273;
        Tue, 14 Jan 2025 04:33:42 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d7fsm172267105e9.32.2025.01.14.04.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:33:41 -0800 (PST)
Message-ID: <678659a5.050a0220.17d5d0.749c@mx.google.com>
X-Google-Original-Message-ID: <Z4ZZof-GeNjDEUOB@Ansuel-XPS.>
Date: Tue, 14 Jan 2025 13:33:37 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, upstream@airoha.com,
	Richard van Schagen <vschagen@icloud.com>
Subject: Re: [PATCH v10 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
References: <20250105143106.20989-1-ansuelsmth@gmail.com>
 <20250105143106.20989-4-ansuelsmth@gmail.com>
 <Z4XbwyrBXXcQvqiO@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4XbwyrBXXcQvqiO@gondor.apana.org.au>

On Tue, Jan 14, 2025 at 11:36:35AM +0800, Herbert Xu wrote:
> On Sun, Jan 05, 2025 at 03:30:48PM +0100, Christian Marangi wrote:
> > Add support for the Inside Secure SafeXcel EIP-93 Crypto Engine used on
> > Mediatek MT7621 SoC and new Airoha SoC.
> > 
> > EIP-93 IP supports AES/DES/3DES ciphers in ECB/CBC and CTR modes as well as
> > authenc(HMAC(x), cipher(y)) using HMAC MD5, SHA1, SHA224 and SHA256.
> > 
> > EIP-93 provide regs to signal support for specific chipers and the
> > driver dynamically register only the supported one by the chip.
> > 
> > Signed-off-by: Richard van Schagen <vschagen@icloud.com>
> > Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> I get a compile-time warning with this patch (C=1 W=1):
> 
>   CHECK   ../drivers/crypto/inside-secure/eip93/eip93-common.c
>   ../drivers/crypto/inside-secure/eip93/eip93-common.c:101:5: warning: context imbalance in 'eip93_put_descriptor' - wrong count at exit
>   ../drivers/crypto/inside-secure/eip93/eip93-common.c:126:6: warning: context imbalance in 'eip93_get_descriptor' - wrong count at exit
> 
> Could you please take a look?
>

Hi, this is just a false-positive with the usage of the cleanup API.
Sending new revision muting this by using scoped_guard instead.

Will also make cleanup guy aware of this bug.

-- 
	Ansuel
