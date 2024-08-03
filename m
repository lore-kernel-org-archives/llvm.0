Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96145F9CC
	for <llvm@lists.linux.dev>; Sat,  3 Aug 2024 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722664758; cv=none; b=A3OWrxpwUDffuKPrQfQiuXGpv8K/5lSVqeD5ewZ/vyC0JYwH4R+Olcl/rq7tNlIQvOtfqFPPMDbCubWw8/FGBovr2qOUvRQ4fWpYaAIkNvQy19e/K+i1tSFQ1iY4VVw6kjdaIoWl8IRFMtm8JvabY56vO4FDaWVPlF+lt9tL87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722664758; c=relaxed/simple;
	bh=CRTjdpok2ylJOBVRB5NG+v3YKMZN4sDLzRfETUx+ZQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxVT+Yu+GwWhekPlqSVyzurnMqL7ZJwinyI1QjaNodnKyUQCoFEfHS2m785wIaFxFj7WUgeIUer44TA7Ha6CQL6YmYR/NvrDsUv5pZPSQpTDcMYLtsgAqJJ8ePUkAfWNA67rKdLNqBtm3LKpiL1X/B0oc6powaatAobVw6j+r+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCGLtZRM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCGLtZRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331E5C4AF11
	for <llvm@lists.linux.dev>; Sat,  3 Aug 2024 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722664758;
	bh=CRTjdpok2ylJOBVRB5NG+v3YKMZN4sDLzRfETUx+ZQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XCGLtZRMUCMbu6BQGQk49WxH5ioOsEqgD/dlbMGahAWxu/FIHRvD4heSeli5ntERw
	 wwuMI7EOh3r4LHLtUPIhwyeaouzexismarEux3mtMgNa5kzrvWM4E70ICdsPxnnWAS
	 RndLH+2XsXWPFQzAoyiSgZSXPoKuIQ8WSjkKK6rkLquL9QWt6IlAbQEMTWqLNgPxts
	 4O59B8dg76/sxj5C/Nmxo3jMpxDojqmR+lafqyLd/nDUm4bGNKtueWr+Np/7hMQcgg
	 xUQSIFR+grHcWFMVE1J+kYiuhVw1Wbw4LDe1L/y9j252Cx4vgX+fbwosdk4kodFSUU
	 53rKEz9rwt1LA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f01993090so12644102e87.2
        for <llvm@lists.linux.dev>; Fri, 02 Aug 2024 22:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNG2mTBXpATG+eraf+gS0RG11lo6HhuvAQV02q0HukAaDLqgaJWymxhLib27E4YIFDPpNvBZCQV8su08bdYYMDbybUqw==
X-Gm-Message-State: AOJu0YyzrshHjArveb6XIYpQziuOLlSi0uu/Y1pmRJkzjOxkp4LO6GAY
	Zb+12Euc1JSgwdb8u/jfJFW6Lk29I9H2sRY/5+6CyreyFTxFRD4DpbCnM6IxgsWnY7LoaXdFBI2
	h3QXh5wu3AJyfD+6aKfoRaiKHxcs=
X-Google-Smtp-Source: AGHT+IGH3RhSkPSqDeBQj38zD+0ibup0k8GYvLycZ0CcyN+aNPlxgoEpaXhYyETxTBdvMTXtFmvfO0h4X1uuLe82UVE=
X-Received: by 2002:a05:6512:ba3:b0:52e:bdfc:1d09 with SMTP id
 2adb3069b0e04-530bb36f0b1mr3632046e87.18.1722664756789; Fri, 02 Aug 2024
 22:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>
In-Reply-To: <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 14:58:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmrzNHbAHC91OSS3TXwex7W4bjsoKaYVBULx+-e6Omfw@mail.gmail.com>
Message-ID: <CAK7LNAQmrzNHbAHC91OSS3TXwex7W4bjsoKaYVBULx+-e6Omfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
To: koachan@protonmail.com
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 1:12=E2=80=AFAM Koakuma via B4 Relay
<devnull+koachan.protonmail.com@kernel.org> wrote:
>
> From: Koakuma <koachan@protonmail.com>
>
> clang only supports building 64-bit kernel, so we use the
> sparc64-linux-gnu target.
>
> See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFw=
dB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=
=3D@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b
>
> Signed-off-by: Koakuma <koachan@protonmail.com>



Acked-by: Masahiro Yamada <masahiroy@kernel.org>


(I assume this will go through the sparc subsystem)




--=20
Best Regards
Masahiro Yamada
