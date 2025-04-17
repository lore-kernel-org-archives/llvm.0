Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AA218821
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875615; cv=none; b=lh2YJMLWblfVaOVEGgjzBBEnO9LAOs/6UZcfxGxBn/hWGjPvaVDT8yBVR5GHolA6znYN0si1rL0gNWyyyQFxfrpGE1hUNkTHzdxfNE5IMJv6cUrA1DUf7onk6vatNqymW6ebOyZ7cUDQNa6zVBwZmBLD0tx+uVJAqMxsPGG6ZLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875615; c=relaxed/simple;
	bh=uTWUZ7GG75MGdOuYepKN19ZkysIgaqJ3eIvg+KIv+4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V15BHXNu5KeTJ0DcQ3GZSl4qZhV8rERI5jEarMun2hfbnLCXL02US1vQyEmRPGsqosGlnKoIxd8Udm5Dr3Y2amxRpBzCrZu8ScUFI2zcNaoEFjBGaXqdk9Py8FV7ryu/sdMtY4N/h+8noCj1VPUUcx6sj3MenT57Pf/J8cqFQxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZWrOBQG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZWrOBQG"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bee278c2aso16542781fa.0
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 00:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875611; x=1745480411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTWUZ7GG75MGdOuYepKN19ZkysIgaqJ3eIvg+KIv+4k=;
        b=pZWrOBQG3zSqZ82V3uKzNbvso0h3q6w1jmBRvvSQp0UXcj8dPRjAuGVtUqPGa5O0Vi
         sxs7rWg4WEmWXv3mrIVeDveh3V1psvCHPfFOWtJDuL6eDUz9q1eTl/G2/MzQo/7Il/O2
         4ENN3FtOuTUeTpzsUCkBZ6fj+qf9EvZqEW0RbcU5VZ5rB/X8WVq4CjjpzQwZ2jRVrxtc
         8FXoC7oz0+Yfr5UiP0yCrQnXGDN3YHIaPlzSrTVxAi/pnAVgMxBVJ1daJJXrnyOGOYcc
         lJng0G9t0k9eaM4IHvCnF24txql+BV2JShCQ0s8sgItI87HCErAM7bRsI9LY5wYbEZZY
         Y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875611; x=1745480411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTWUZ7GG75MGdOuYepKN19ZkysIgaqJ3eIvg+KIv+4k=;
        b=Qtj2BE/k2CBCFLVc/9LabNyW8Ik6hgFsIzPaf7F7anoI3+gcHQRBZ+TrZ4cr/JTA6C
         jD4mtdM1wkkRayEjLWacHidUTybkBkq764xHJ/iNczxG9G0cZr7BhgG/0vSyhxy1vV1/
         CgYVLfgkgiTek9fEJWfeo01JxV00sneIdpF4gMTokIIlFCp6+oRV+6UCJ5QTJpBk3FMn
         sIic0BcoPl+VaeW9RpiKmyY9N5mcrlJVGqH/aG5jXaM3QasedSRRMRGH3iSN4tzfA0BX
         ko31vglZxvcTnX81ryPGotRRrStrvK/urxAYrqwpLVMk5F5Ndd5gAF+6UUHwL8N4UmCH
         GBOw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1Ydp88Zp3x+sB0wQXdxJK+VTprLeT4saOlByu6TFN9EsdaNDWCH25GWW6tXKTc3MGY2O@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh/hT9rPATlVEw6xk5Vl220P8CMEuDQZDB8dXqLyvJQpfBmBnp
	L5eoKzYP+D/AXIF+WKsef8mfgL6SejRXpt0jIPQgc2R3MRavy/muOjCxdUn63e3aBZM5bStEmSV
	xV5F5H4tT8VKM/tOIh2JTwozEu02BEdUq1GaU1Q==
X-Gm-Gg: ASbGncujFrpSMf8grX4c/5P10ZF9KDlR/axdRC//ScNM84/ufSNL6akTVCuEWT2F7yD
	zbDFvcSJrTxYjksHSC54ldDVcIt0b70kyQ3gVKziLQPdvpABRocMXVUvF3aXngOlBTD7zQqyFDc
	nw0k2B+zjV3sBVKTT9epdrBQ==
X-Google-Smtp-Source: AGHT+IEiIqX4aUPaydJ1PP141MrnnbHon/RuJNnAkVqairRqk2NvTUxvddZyFvb/1Nqn9kMA1RIB96pFHZiG8rhrSbY=
X-Received: by 2002:a05:651c:221c:b0:30c:1aa6:5565 with SMTP id
 38308e7fff4ca-31086da3d9emr5323571fa.20.1744875611003; Thu, 17 Apr 2025
 00:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504170707.IBFj7H28-lkp@intel.com>
In-Reply-To: <202504170707.IBFj7H28-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:40:00 +0200
X-Gm-Features: ATxdqUGx8WO-eDXtMko006_t0ICMvYXMIboRMkFn_7RA_E8SVE1D6ETmNgEk9DA
Message-ID: <CACRpkdZ-2eOrDRDFk2UqKULyog1GJzsSS4epidbQiNH-xPcV7w@mail.gmail.com>
Subject: Re: [linux-next:master 4325/4528] s390x-linux-ld: pinctrl-sx150x.c:undefined
 reference to `i2c_smbus_write_byte_data'
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 1:25=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> commit: c4d1b2ee4407b0b12e0dade40361eb86c1c710ed [4325/4528] pinctrl: sx1=
50x: enable building modules with COMPILE_TEST=3Dy

I just dropped this commit from my tree, it's buggy.

Yours,
Linus Walleij
