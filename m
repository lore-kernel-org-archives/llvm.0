Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B93ACA4D
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085917; cv=pass; b=TDuSNWNUQCDUO+EEnlo4NQKGg62/Tfiti1bbkCa5XpJKmco8JjbLmNW+YPQxtv7vrM+IE/Dxw4BmTO6d383htRWr/YDat6U/rGVYvbSFMoTGwY1nHFaqbQeaW6dgxj4tilNHo6qMX6Ml2UF6vhpA1y0YcZeaahz4SVrurWfY5j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085917; c=relaxed/simple;
	bh=4shjJrvziMCOaEg+cmflj8Sk8Is4R3jYebiTCFnLGKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWjL0OtHbDBl7Hjp689CNrbeSbiHIgRZLWP9aez+M7DE9Fvfch9kVaWRabb8C+VH8dg+Drrx3fMJlJKkj3GpwF8DLzLaThNcbHB+OAiQTiyUcQd7IQHknUIh9sm9ouAr03umu0sk81G71KYvxbpjmHtsnVFVwB4hZCGEHQUnx+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxq16zXd; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxq16zXd"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-575171b1ce7so4773056e0c.1
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 13:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780085914; cv=none;
        d=google.com; s=arc-20240605;
        b=AlLYloSfuDqTH6rd/izPYeFSI71iNv65c+QCk0yyD2lNE4HPN/B1RIo7j/yyZRwI0g
         lKSMz+djV9Gnts0KWQQNr1MQitTuCdQ0cAUadlG5sCa1Us6K6wquXgcEd5bfzMe/9RxH
         +OMGkyj99I8r7l76J6MOCXzkJlrpHAPRCl/yeJ75xlmq4z4D2mYtKW38/gyE65N4rgaD
         NmJ3J3b2FpWsJWmo+45/jcwLqjeMy5eRLMOUI+aI/9vEnEkP+Bmhj22ivmgIlr9IaM0o
         inI+5tTDV9fRmCGppiFyINkeEcieLmAxtAnVFs8I8VqBzrebsxPwisVpt0re6cfjcyg1
         QSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        fh=Yzl5ygP556R8mBqI85pGbJU6jN3ZFcutHydA+CC4zz8=;
        b=afVM66Qe5uaZv9bwJKqg2zR5lthT+Mi/o2glKFRBk0TAlgHL3vHB9WvyVkMIB5JVki
         Mm9XUNYUhutL9V/zVPtww5uo2vBdXKBKwgahBANwLT8dh8Hm5AIauUQcS6J+WPGRNiF/
         ghFtG7gVulVuKi31MA5WY57VvaFucGug5MPXSO7MnzFiRzEvWrXDrDhD6KNiOuuQqwmw
         jI+f7quUNjASq9j8FK7rmO9wJ2/MZXB+Kph5lIR8DoVp+nj7eGLDxNec7f/vUwSjjcoV
         UGTedhoQ2NZ38WQkyeB/ZK0gSWOvBeyOZKi5+c686SvApj/KdgfFllRYhVGdB1FtMyTe
         63qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780085914; x=1780690714; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        b=dxq16zXd03k7ellYoDM1DktA2a8apzMF5+e1o5mLmYBhUAR3hP33VWf6LshePqNLHF
         iXaRBomGSlykev/e6rEI2ZXyN/7Fig74EngKpZQtXIpckSV/OcixY+TyR8ozcwpK2Osz
         RUNf+QfkwaFEa6I0DkxkdidZwROq5aDNlf7npdIxPlEiB62+vRtBWTW/3a5COxo1X/MY
         T9Txv5PLnn2KiDfBF1t6PjypQqym+36cmiPdqGlTm7mv13FGBxIxWxQDA2pp4Al83Q85
         GURDGR78k+7hhBXtUvTnLhpIqI11CwWwbn+1jo/tbv9ciMOusSKSVE8wjywtuwqJ9M8n
         ooqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780085914; x=1780690714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        b=TmIGSKVNXZxZaeGmtTCXY9FsJlQXFUoupVB7Ig6N4BRsw1WrRRbIvaiY2qmw9YhQ2Z
         KhQcdoheWLXsmb5IHrVUZqyp5WnhPeeqIVgz0LohSoRlYp1XqrLd++W+YqvjTKN1bZJq
         PW+bio6H9vZUtSEFB/Vsu7iFvp3nDiEK6wK3ZKab6CAA7kikqSwcxE73l9kmaKYHX8lT
         nUYeVifnROtchoB8gekxhTvC6s1091ZTb62LdrIce45cNm7X/fg0ku5RjZSIwbclIyBB
         IwoBUEb7+DRjOUbvoD4Kh6eyG5LG98J/x3RxhTjlk49Psj7bB7hqAHMvaO2SY9Yr2A+/
         MssA==
X-Forwarded-Encrypted: i=1; AFNElJ922WhmsXgz54gBOkhpjACz36j6Gj4XLTEF2qKPKMPUQeDcqyM/Togqx2VWS7EmjjnPAnPE@lists.linux.dev
X-Gm-Message-State: AOJu0YwkDay2r78hep8P4FmkJMPf1zNQFIu4PKuKsXyV+UVJW2e2VILb
	KCawPqdLw7L+tqb+c6L+fOPyFYL7lvw7FUzTYY3ePHjW0kYPsm7O9eKj1ruT3044nX4NokWofcP
	8fI/EwAaq/7yzb1xriJnbm75xszD5qTkbMtm9toE=
X-Gm-Gg: Acq92OFdHjrGDMBmgNekY+d9oXRr25I+9PUqPQaCMym8bZS+6GJK67S2xuQr6NFOWOj
	ACmPO62UKtvze0lmIfuHAOAfcdnRNqLVwjrI6ktVD6ovO76poNBIO+5VAMSVyr5mP8oU5SRA7pb
	Os2gEWv3WAge6FfrplPA7Go22Q1VfeFY5aAooY2bi11NygIKJJttdhjGN48UCgBGXMNjRwoRnVC
	XIaVd9QeJ6BM5yomtVzU8l6cocP3+q3w5UwUo+OvCADZCU8UoPBKy1Ht+lkoFqCnkw2KfqKbtSA
	fPLmy4NAWF4d/frQw8rcY1WGwyVIsqTLdWoIowYF4I5XOXTAT6l8nQLnCLE=
X-Received: by 2002:a05:6122:4d8b:b0:59b:1012:3f26 with SMTP id
 71dfb90a1353d-59be9d567a3mr540327e0c.0.1780085913427; Fri, 29 May 2026
 13:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 29 May 2026 13:18:16 -0700
X-Gm-Features: AVHnY4Jk3Oh6mj1Uh1YuwCnLVI-rIUfHv3S_D4s-m3C-uGvZSHpg8R8WgON19Qs
Message-ID: <CAGG=3QUcorKStoM+cYZ3tWGtCxrTxVz7b9HycKBMk=zmgm+V5Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:38=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.
>

I have the fire, I have the force
I have the power to make my evil take its course

-bw

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
