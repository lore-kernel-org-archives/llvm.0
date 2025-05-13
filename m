Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87D28DB63
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142974; cv=none; b=J9jyi9up7NjA3CziJ0cf1MrH1alz5HKF2ZqlOV3a+6DakpRZEpjQHau7PcV0ay1YO/u14hwCD9j5MVhOkhjEF4agDA6IH2W7J+wFbwFX7hrC5cP9+tkSQsrKq6SgBJfnx3CVtRfDXJE21QIROEvFsAxlyim4xYlHbVnYhv26fDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142974; c=relaxed/simple;
	bh=pIZnqAbvKi6g6bM9xBkbfMYNKRFSU6d2NCIENbAWFOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dwi4AdomN6DYW/Xprggmgfnef3tyXJAzAiXqYcZ4vE8U6mN3S+xpvoQN64fT84MLnOPHp8ItDTUVzWju+LB6j6+Wx8gKNF1Nk9bV3I69KKLkxXi+tbeOygBVqpZzuGZHH4R1njJMGALUQ2iULxpjX1UEbewuQ3xy2J9cI7G7IWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nifmLZU5; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nifmLZU5"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4ddb7ddfb76so3769799137.1
        for <llvm@lists.linux.dev>; Tue, 13 May 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142971; x=1747747771; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LZEie1OhAZfjtagVfLYxTcaBKPW2X7YkdVD9WseQzgE=;
        b=nifmLZU53DomkzKHAve3ShVvfVAHFOLQnvdfyS086xCv1Er9qdgdvxkOwXqCfnUvJi
         DXRwWZaabUUoES69jLeIN4dFR8PLVjCIeFB5a3pDsUgL/KGiJqQVd0kCbnPBO66j3GPG
         roWI5OvP7v/WTN9Q5YQuFNVF7M9KSVWiAiuQbNSad18xsPDW6PSiFr7f1yQ9V+9JtdZB
         WyoHzzbaDnx306Q8bvDdUaNwjEqN0LXt80BDSkVkByXEY3jPktm2kKcbXw0I+GO5nCTx
         WsnzyKfmhacXXgiTdynEohaq+iKfuwLSzgSemEEwCBZePV72JCsWS1zE8IV8eghJAd4J
         UAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142971; x=1747747771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZEie1OhAZfjtagVfLYxTcaBKPW2X7YkdVD9WseQzgE=;
        b=CLQfxA+QWYceTI5tjKqoOLXs2CDJBGbof9FT8OPh8ehnJO4sW7heyZJr9UHb0O7Z+g
         EA2D1NmHqx1/fjR4GyNW3IEXwGwKnlEILj4yb8Dp6VzJoeaLK4dGS5q6cPmCByl3sL3r
         ioYQRtAtCtE7iVldgUeNuLWjJOd9ndxC6jlZCEdM8I94VV7hxIarUr5eVgDDtfrYERUO
         nJxW4LIvYclzOCoMLiOOXgZl+pfPXQYwwag+fmRT8R7ZalGXJwnuNJm3q2pptPyJx6mP
         +MnI6J/TfZ6GBkgLoloZsRSY2uscmGHOjgWwUl0YTa3RueWQgcYcbSGgeD2cVwksLi2N
         4UcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn4p+Es1hpW9laKAIvevDEnhjsrbuf7LB8F2X15Hp4k4/Q3geYnINTCi6PyHPb2GICZKP+@lists.linux.dev
X-Gm-Message-State: AOJu0YxLjP1OjKNUiSdz63GZGa28smTWLcPm2qKXgwsxkh6tzBNzD2Yj
	IGF8ZTWzSOO+WJn1AZQJ4Vwb2ie7cbQ9NuUOLxXZ6kpaC66o1NpM4EIYdW5IW/BJPQUMe5KmSFl
	v7r1wiKx/iVMts9vXKhMv3DAnlU7haKXjsVhtBQ==
X-Gm-Gg: ASbGnctdYcqSUqpKs3gXMhuM6bAtii9weyQPtZGyiFz5r+pjkCpOCIP4b/qvQ22nWy4
	ys6bPoFA2IPHCVtNPvZhIoVmS7AHSww6N/kGcNHMumSnUxk9emZiq3psOVbKlmkB8aEBxVHNFtD
	7+m6NKEVARJ9Yj/Pr/yh2XFUFUsQXBJQ8=
X-Google-Smtp-Source: AGHT+IHlbMMFq5nAfSA83CCKmxe6r5lw+vXbf9voMmrMRSDCezf0HsCPwNDvoXL3icNnJqJh9L6Y0Q0gPm4WwUngrEA=
X-Received: by 2002:a05:6102:2c08:b0:4c1:9b88:5c30 with SMTP id
 ada2fe7eead31-4deed3d3870mr14789892137.19.1747142971375; Tue, 13 May 2025
 06:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250512172044.326436266@linuxfoundation.org> <CA+G9fYuO5m0EgOAbytJv2Ytp9uj-0jHVUGddaXHLckHk+ZLEHA@mail.gmail.com>
In-Reply-To: <CA+G9fYuO5m0EgOAbytJv2Ytp9uj-0jHVUGddaXHLckHk+ZLEHA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 May 2025 14:29:20 +0100
X-Gm-Features: AX0GCFvoub22XkeGUwB2DkAUVguhCcizeWQN8lgksWkCPZabNB8ZW-3lo3CS3bQ
Message-ID: <CA+G9fYsGTqCxiXQOY3HEu4Z3CEwmyQoOb8DnpzVToWMW-Y8R5A@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Marco Crivellari <marco.crivellari@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 11:40, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 18:43, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.14.7 release.
> > There are 197 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.7-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> Regressions on mips defconfig tinyconfig and allnoconfig builds failed with
> clang-20 toolchain on stable-rc  6.14.7-rc1, 6.12.29-rc1 and 6.6.91-rc1.
> But, builds pass with gcc-13.
>
> * mips, build
>   - clang-20-allnoconfig
>   - clang-20-defconfig
>   - clang-20-tinyconfig
>   - korg-clang-20-lkftconfig-hardening
>   - korg-clang-20-lkftconfig-lto-full
>   - korg-clang-20-lkftconfig-lto-thing
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Build regression: mips defconfig clang-20 instantiation error expected
> an immediate
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build error mips
> <instantiation>:7:11: error: expected an immediate
>  ori $26, r4k_wait_idle_size - 2
>           ^
> <instantiation>:10:13: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>             ^
> <instantiation>:10:29: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                             ^
> <instantiation>:7:11: error: expected an immediate
>  ori $26, r4k_wait_idle_size - 2
>           ^
> <instantiation>:10:13: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>             ^
> <instantiation>:10:29: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                             ^


The bisection found this as first bad commit,

    MIPS: Fix idle VS timer enqueue

    [ Upstream commit 56651128e2fbad80f632f388d6bf1f39c928267a ]

- Naresh Kamboju
