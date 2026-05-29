Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B84F3DA7F5
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072145; cv=pass; b=nnusKgC79POtL0SXFQCk8Vh8pwqWzaMk4lQse3vyhNUPX7M62uU/9ODTFHDxK75jEwjYzVa3rg1t9R3e4VUICp+jEg0/iIWiYOGGYpVcWiWsMGmKaxAv273U6GxVnKgEMRMWG0L4gODBLvvdVD9OdZy6iyajxyWzqEMd8iWF9UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072145; c=relaxed/simple;
	bh=PH/Z12wHsMq8SpuU56tCXSsJXXE208ciSwkYTY3S1Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0utSvPRld4AjE15UBpfH1piyIacmCGauOR0IFgHxp/HT1YikB3T/d0tpWOQxk7u/Rl/87DJkeZGSIm0D069ydKfLdTCSd2BUh8liY2DFSR2TBdTouGQhWYbNchf+EHnOUpq1Kb/GmPHbiUkbRB2hag7GzeGPjVwbgBuqjAEAf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eqnfSqdt; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eqnfSqdt"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6c36543e834so166006137.1
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 09:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780072143; cv=none;
        d=google.com; s=arc-20240605;
        b=aEyH7A3OBtWH29YHpt3QRy83cNNeSe+SNkcMWpXjJvQ32xOlWE1yMqJy3Vag/xA2Ew
         IO+i5A/VHSQM7UxsI2EjhWtwrqrJSVIH2kMOorFyB8jOivL7xhxH3ZWHa70SmnezyNEo
         TNnhr1rLnKILh9R1cxn4ju+jvLu1RGeRWgBYA8qq7wl8Vf8eH6xzF1wsj4qXYOvjUoty
         mvk8iGHk0V7RFYUOshbv3nmmiyBOU0PqkGEHouSkDBB4KhW6YDpRBtIwoPCcdF3yrwCL
         OkVFoOgPAeFs7H8kUkhsWWxoVtuJNTWmf0JWVguFMJW70TkzSRJmkQN6MlsqG68mXYQG
         evGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        fh=dTgH+GgDYPPrmR7trjLVD/FeEIOqbGk95zP8uVDUcrQ=;
        b=PcesGRfAgtDxUaLcgg5u7gvGItLte+J+dIJvZf4f+vcyKyWKi1nwk7dZSxySayMLeC
         axfCyrcrXF99n9ehMwXPRltki/zTuyjcdmRoDQGjqc2DamE9598KZ0MJVCZpVcpz9BBI
         JwdZcS8zAAS8Y3/LcMZiD21WVddkojQxZJKO/DgwZVJNw76yHWWzD3jXs6fIjFUGFMKr
         dQKSA2at+pR1IEPvxC/7KCfjwSsguFiKTnCtrsT5WkPnxdbbBd+dfY7ZisvaoM22ctaM
         TK4CVWZqL8Kc6KHdnSZl9bMF//TBPg/wNuL1p7ISX6Zlz8RWb4Jwe/0FJFQBq48y5FLU
         g7Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780072143; x=1780676943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        b=eqnfSqdtpR+m/ZHe7dqrgmwE0NCDux+bRO8hCAQDpqZqDUEvyGaQbw/X33woHfUlta
         dAeo59XgA8bquyMcV5z0EPmtF4AhcRUNGXIXg3FejYrgZruFVYVZ3YOkxtXV5NbZmdZN
         Xv5kllKnUoaoJnV2UjTktSeI8iRoBF1VwNBVeMyiMpKw9ouR2CbfQzIzFqP56SbAltlW
         Zq3H+9Qoh9T8kQ7aQ67pnbJuPnxlk8tIStcblH1zs1rntI+/l3M6z2oeibU6+w62emd/
         kRFljvRRb6IzTz63E6wzZvgp80dG2+Skcy+AcDtrpRHtkWWnxIciCQkVEHTHUyhACeP5
         1JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780072143; x=1780676943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        b=mvSTn32HkSJ61lCKKzffFXGvWzPw1YFm8s4LZ2p0XIKgTTzAwtBc3YLrDFFC2IT7IU
         6cOD/srLBmZz9lgiPuKsrhQ0fiIcwCKTGsdiWvaSN5R9k0nzT+DyfBzWLfwTC+zu07sF
         fPVJiB/DycAlmpizQ+fY2pnfBpvPuquXv+rG0J01lAbguYjIvWNDlI1uYejrTyMNa0jG
         2MIXu5jFsJHji9Tcb+n3gbAAl+Lv60xN8OSoDVC3+4VLE+cfWUXyduck/u99VHFsaL+2
         tt1V5rEBtBtJo9py0WgIsZ3/9zz+s6PGk+rtY4gqWPG0IV0u72RVCQfpZsEsrLJg62IK
         zFhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UTZ4Cyx0jlZjZi2OIb7p0lNkw37tAUbghIB+uMiQgYMwZ09ZB01rY3HTqVHAbSLazvqGj@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy7hV8sSmopfoPuEGRCLE6kCAOCahsoJXF4CRhBjzhsqAoNQnW
	AVcTNmWmQaX6hczgLsMtl4TCDzpQIM3kBC0F0OHFIMy7Rjya31oMoQhtXgeQppZ1aZgvoHxKwfJ
	Gy0zKQMnZPw6ANCQJKQfR9uLzdjUUBVesIWz1Socz
X-Gm-Gg: Acq92OHwatFHbc5KyOgLxP+raFQNLTN4/OKy3Xd7DuY9Jil/Xx3extFGAvcbhxFcLAa
	5jSVIVAomeB9DGuBWQIPB7Fput/gBaEqRviO3r/+kSwD+0QFkOpawHU4cFSMnbpLY3Qj2Xo1Dh+
	0ceDuJzr221NnS/dg1xXb8EKIjg5pXi34ZNB4qr7ROwqPbhn7DJjBRcJuUkq+AHwXmEyHiD6Ila
	dCXBzET66/MaWQlQIcIrGQ5T2TPYTYtW2ubBlNO9mrqouYnT26yHIcKOTF3Ftre6YknuRQVSmYo
	logP0OFbLaXVLuqyWQ==
X-Received: by 2002:a05:6102:3ece:b0:631:8665:3511 with SMTP id
 ada2fe7eead31-6bf422b40eemr1931039137.30.1780072142599; Fri, 29 May 2026
 09:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 29 May 2026 09:28:51 -0700
X-Gm-Features: AVHnY4Jr6H03OfHaWFJtqrsbD1DMvlU60lxKSdJGu2BseUWECJcMyHSM0OqmjvQ
Message-ID: <CAFhGd8pOWHnZHH7R5KBspj+o1Bfrbk9sXeNj2X48VB+nYPBAnw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 28, 2026 at 2:38=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.

:0

>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  .mailmap                                                               |=
 1 -
>  Documentation/process/embargoed-hardware-issues.rst                    |=
 2 +-
>  Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst |=
 2 +-
>  MAINTAINERS                                                            |=
 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index a009f73d7ea5..f863781b0102 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -634,7 +634,6 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@kernel.d=
k>
>  Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
>  Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
>  Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
> -Nick Desaulniers <nick.desaulniers+lkml@gmail.com> <ndesaulniers@google.=
com>
>  Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
>  Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
>  Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Docume=
ntation/process/embargoed-hardware-issues.rst
> index 34e00848e0da..d07f16c3c7b8 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -308,7 +308,7 @@ an involved disclosed party. The current ambassadors =
list:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  If you want your organization to be added to the ambassadors list, pleas=
e
> diff --git a/Documentation/translations/sp_SP/process/embargoed-hardware-=
issues.rst b/Documentation/translations/sp_SP/process/embargoed-hardware-is=
sues.rst
> index 9d444b9c46d3..7d4d694967c7 100644
> --- a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> +++ b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> @@ -287,7 +287,7 @@ revelada involucrada. La lista de embajadores actuale=
s:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Si quiere que su organizaci=C3=B3n se a=C3=B1ada a la lista de embajador=
es, por
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..2f06cc2e463c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6259,7 +6259,7 @@ F:        .clang-format
>
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Bill Wendling <morbo@google.com>
>  R:     Justin Stitt <justinstitt@google.com>
>  L:     llvm@lists.linux.dev
>
> ---
> base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
> change-id: 20260528-im_back_baby-1ade32dc049e
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>

Justin
