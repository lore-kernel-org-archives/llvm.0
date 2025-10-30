Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3CA304BC9
	for <llvm@lists.linux.dev>; Thu, 30 Oct 2025 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761812349; cv=none; b=TUtyHUSKjNI6DfxQ4tmm+LWIFYu7+3AUzXHWBHc8EBT2RUuRHP3Rlxoz3E3KzuaaPJg0Chlinnb6XeudSfYKkwO3a4aIy+X99HNOnrL18Chmc1bQktTWkfOMa+8V0/44Z74VsaJxROSEwK996uKevUeKGqomvF6Xz8UmG/2nIn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761812349; c=relaxed/simple;
	bh=n8kXk/u9Pag8wMhc1UkF9e4Fd9yQ8hjWefqsOJiE1/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoYGDf3z8II0bwLLKIp2m9B1iSvWjC97mI/gW1GsjdMlFi4ex89mQDwvjwSmljGrgHL3ZJwFQs0igey6LpwXm6MkB7dd9kh7CaaszJmbrGUwObQfW4j5sqlJ4ypz1hiGphRgfT24X2P+tcgUT4PbmSk2MT0UvS1YuBeoDkZ+JMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhO2acTJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhO2acTJ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592f29e273bso677496e87.0
        for <llvm@lists.linux.dev>; Thu, 30 Oct 2025 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761812346; x=1762417146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZSc3Yfohy0GneZpcaYTXUsRgt/OPg+2FZgItitcnEM=;
        b=qhO2acTJcNaMPehwQOP2h2849CxVQ3cs85JF1hwgFfTKdcfifUSnfBPjmegH0NunS5
         aWqOcagGrJJ5I/TntQFkbGAi6cIvfAugSqnBuh7vzvJlDEjeNfimhQZoPnVk5TJgL5yP
         Z0tk7rYqo+K4ASvsUaVQsJGt1W2EfAtszal0WHw2ObzpaAjLQT/nxu6DVoIm7rJxjTPW
         V9kGsIXpPODIXX6dXp6KXPl7MvbDpVKkL3tD413dM7m7uepgRhSZFI/1C9tezfDVUGAe
         3XNOzZY/r7YUSozgvuMkxLvYyQN+8PetAw4XMWBySNT94GXd40OGUShf5+gH1mEntEfQ
         Zqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812346; x=1762417146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZSc3Yfohy0GneZpcaYTXUsRgt/OPg+2FZgItitcnEM=;
        b=YFsdWVsKOoTOyK9bFZuI1iwqiwmjkOnfLr3hJVPSVes46IWDibckpbSgbmIt90V5Eg
         U2EGIWs4rMPT3UdNFgNyOy6jd3wps8Nj1NymcnepVW1gKLk/Nwsn3SXJgyNtEoqPC8VM
         YFsFXbzsQ5e9Ut7UrAruip6wfmUICvIlPxP4V3ZRjuVARcRWU7Js6NUq1mdw1tO5zUsa
         yIRH96GFux/ugCygSrUCVPbcnbURCOY79K8y2UOHpqq38czAv+tNivuU3en6z8oK+gSl
         sFmKmkPuQSzeSOca+8oU/kgKJLMQzkr2lLbkzmLSBgLv4YiNkrRbbXsJrCtE2tsmHFhm
         j0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWNMsrDVYCQJsWLVeKgxosfb4iI7vnVrxm9MJaYdVAfS5W8JewisZxydcggwmwfl2Kbs3CQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxuex3W9kufDDle/XioG+sUvgaF86QTfi1HbGTSCkQGAj5XgTjM
	Xp1TCpdolT3oBjd9jSsbjeUOKyZxGubV5xbb+y17QLLYl44JK/HhZXWyaQOqBde/t+WWC1kK0rN
	GPFS5Crv7z+tbf4IttmKeyMwpX5/Dw5tSG2Wj1cIDnA==
X-Gm-Gg: ASbGncvwPWIhvX88pGRpYFLCs9KCxH0Fz5Bw5UKwTqyAudguxkakvEXYI/YV+2Vbpd1
	k0ndPsP6t7faVcPtJDZ75OccDcsJQrrIZif8bHoAtOcTiwpn4vfQJj7NbDxEnle9NH4NnuagAMZ
	23uIicKuZF3rZwuXHQsSRIxxcs7coZO/jmPCfL0dZ0msrarBajvzzOpa8js4edebLg+CBvpYOB+
	EXNz55Gaf5uDNFqniNUZkvIpsPbh/3CU3Xo44zH5PrcrUubZ4EvIJRHvegV
X-Google-Smtp-Source: AGHT+IFpU5SfD5f6aYsrY94jW2ThyTJxMXRujbccn17De50s7ThAJI6lRpfdtUVW5umqLgWUYZ7hiZL74+1ScUCScAU=
X-Received: by 2002:a05:6512:3989:b0:590:9a11:9c2f with SMTP id
 2adb3069b0e04-59412c4d006mr1997751e87.50.1761812346100; Thu, 30 Oct 2025
 01:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029-isolation-shield-b66aea79a9a4@spud>
In-Reply-To: <20251029-isolation-shield-b66aea79a9a4@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Oct 2025 09:18:55 +0100
X-Gm-Features: AWmQ_bl-lBgjTxJAyqBuCSaVQyLLToyI0K2Q3rw5bzF0J-trmHFQhxiymB76HMM
Message-ID: <CACRpkdaEwa_HMTQ9gOyKh+i+gU1oAqGrPwV7VKF3+W58BMbNZA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant
 warning for LLVM prior to 17
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Nathan Chancellor <nathan@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 4:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> With LLVM prior to 17.0.0:
>
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is=
 not a compile-time constant
>         MPFS_IOMUX0_GROUP(spi0),
>         ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'M=
PFS_IOMUX0_GROUP'
>         .mask =3D BIT(mpfs_iomux0_##_name##_pins[0]),     \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
> \#define BIT(nr)                 (UL(1) << (nr))
>                                 ^~~~~~~~~~~~~~~
>
> This is a constant, but LLVM prior to a change from Nick to match the
> gcc behaviour did not allow this. The macro isn't really all that much
> of an idiot-proofing, just change it to the same sort that's in the
> gpio2 driver, where a second argument provides the mask/setting.
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/2140
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Patch applied!

Yours,
Linus Walleij
