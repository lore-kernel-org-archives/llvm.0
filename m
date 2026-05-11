Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C2A3CAE76
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494529; cv=none; b=pcxMPEgzwAvbAqPbiSs1yM16WXztkfzgAvs/jK0kKO9K27xMsfhokNxbfCZWyO27LvuOIyemZIlvfYv5Pqc+q4Y9ZXSDRHrPX+Rp49g2smCqzzW3Ff9SV8vc2kG52RVp1l43GJFxyJIHn0oOFYB+0eQIHGdj7qZekHtpSan7khw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494529; c=relaxed/simple;
	bh=ZNCM1f5NkkZEbM1tIxw5+5lLcuLbapbNIuJ4nyqL/5c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEk/bAGZW1FVeYGxsvlOLrMCGzskbsEKttHtJNdeidEuUshosPVq7jeYR/VeRZlz3h/uLHDgJFVTKPFa6jNozSU20be07tTIBtUnnf5VUKMZSB8k8REiG1fbhfwPS+Fkl3GfxPCAJlnpjvZwQ29fneeYJ865KO19rseBB902TPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqITnCNa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqITnCNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A8EC2BCFF
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778494529;
	bh=ZNCM1f5NkkZEbM1tIxw5+5lLcuLbapbNIuJ4nyqL/5c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jqITnCNantnthP+JhD+fN3WOvTuoKHbmwcrD/PHQQQPIwsdhtkBWGOCLOnJDu5KoH
	 X8Pz73rbMcZIOfFdx4dbgCUbwRMCHfIIDV5Uyn1/KeNdgVCLP/F3c04lGi4cEjiQUS
	 2ZLxKQAaob3tTZKBOpHqJRJzP+QB4RwYN+M3RiqsuGBsSWO+fcgFj9S3WVU3k96PBk
	 d+4K9Rj9YIJao+q+yYdMD/9uz1eGBGUrqMzMlW7pY/wup3f8VjxIpD85Nn/DzFFvfk
	 NbO+/WOIbP1IBkYuUXmNi8KGxToEVWkYMnpPRlVcmFEYyTPQzHKGtqy2yRNZEQ5/MP
	 vTUIFYi3g14sg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so972357e87.0
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 03:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8b5GL51qe07+xnGo3ljkase3FubdaD4i856Ts8mF2gqVxnxT2cxdrOdgRYQj3fNJqQF4rm@lists.linux.dev
X-Gm-Message-State: AOJu0YzD9hcwG9Vg2J487p7Xs5OHbjNZZyFYr01R37W/tkJJr+DeBdsW
	au5NDBqolRgR5Gsu7EJNARyLjRRqVpM06R9qyLJNO0lBOcYXUQBaVPEj1t63mNM+Ff0vuvIfHz8
	qmMBzhquj+kU/Gwvitx3DQtb2AjGlGoBVl4fYE6h2oQ==
X-Received: by 2002:a05:6512:3b8f:b0:5a8:7eda:7d8f with SMTP id
 2adb3069b0e04-5a899bb5e7cmr5081739e87.12.1778494527644; Mon, 11 May 2026
 03:15:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 03:15:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 03:15:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260509003327.955942-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509003327.955942-1-rosenp@gmail.com>
Date: Mon, 11 May 2026 03:15:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfwDx8RTwaJb48ta=gppJGNwfXMOMNiNvQoRa9ibUh60w@mail.gmail.com>
X-Gm-Features: AVHnY4LaXfT7S_VIc6SNu-VlebOGp4eIttRN573M2qU2mlE-T4_TvvBFzpM9ygY
Message-ID: <CAMRc=MfwDx8RTwaJb48ta=gppJGNwfXMOMNiNvQoRa9ibUh60w@mail.gmail.com>
Subject: Re: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 May 2026 02:33:27 +0200, Rosen Penev <rosenp@gmail.com> said:
> The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers, and
> builds outside X86.  Move its Kconfig entry out of the X86-only port-I/O
> menu and allow it to be selected with COMPILE_TEST.
>
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/gpio/gpio-sodaville.o
>
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f8e34b16fd99..9e1ed0f451b9 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1908,16 +1908,16 @@ config GPIO_RDC321X
>  	  Support for the RDC R321x SoC GPIOs over southbridge
>  	  PCI configuration space.
>
> +endmenu
> +
>  config GPIO_SODAVILLE
>  	bool "Intel Sodaville GPIO support"
> -	depends on X86 && OF
> +	depends on (X86 || COMPILE_TEST) && OF
>  	select GPIO_GENERIC
>  	select GENERIC_IRQ_CHIP
>  	help
>  	  Say Y here to support Intel Sodaville GPIO.
>
> -endmenu
> -
>  menu "SPI GPIO expanders"
>  	depends on SPI_MASTER
>
> --
> 2.54.0
>
>

I don't mind it but I'll wait for an Ack from Intel GPIO maintainers.

Bart
