Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA427EFFA
	for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753207247; cv=none; b=cEkfCiBveyGOunel5wtlWwg6rjXDA14bsZYki+inG/cj0C53jJFjYyxL0xMOIp5kiKfJlAbDaPgqmk4UWnGZppP5YTFYpW5it/tbPNjjovMjUV7hzPJ87IIXdTtsniTBZ7eG569U/cLipkK2sn95j562Ltgd5g1moire4AMML4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753207247; c=relaxed/simple;
	bh=YVtu41alI3J1y0N+ZggPSzt7lkdH9t/iPzc26jPFrYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chYC4H165zTfGZ8R0CzxGY8Vhv71Z5QgL9i+BU4+z8hS92rR1xPPF2PNvhCIGXXHg380sawZpe98ISebyK706KitXwXSnTR3Ky22oGm8r3Pe3YFoTkmEQXqJcqrdyfy0HG06X/jC6DxuMDdjm+pUf7XCao2pI2XQsB7ZZlVE/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQsnW8xe; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQsnW8xe"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31c4a546cc2so4829226a91.2
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753207244; x=1753812044; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Px2ISLgVozuB6r8zgwA8tkISmDkVGlK4ZTL8goB7E8M=;
        b=qQsnW8xepJ2d2CB+6vDhi69tUSVyW/QhwJYxRe5VgOFL4hXicOMd8ghhBEAIOs9wvb
         yKLww7uukt0uHRpnfslbo/qNt9bFtvfHh6JWVwy9Ar8dVVow+eDhTikibzo+MOQVDEgO
         PoO/DKnr+t/Q7h/xEt9fM5T3zmzx3N2T2Q9MtPGnJUdTQj9J9AsqyPjT3yzD+6HzImze
         Ao89qIpidIV4mRq1OcgyVdslnfaV15LUW290VMF4aTruohitsG0qb5BGbmUcFs+S9k1o
         kAbKxBCYMG4pC/3woVrUG7LKGkrcIzdeTMMWzt8OC0NuAowOUEO3coNmzwX/N8DBRlnc
         hCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753207244; x=1753812044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Px2ISLgVozuB6r8zgwA8tkISmDkVGlK4ZTL8goB7E8M=;
        b=MT5pXRf2lDxz5MVvjgWhaS0Ujisd+4uIcy+YaJ8W+qoBOS+fTW+L12M/KBv6xwQI8K
         RmNYToNDZCj1NwnUAB8TQkakPLNuepd+uCqKcaoeU20ipdNYsaIl/hr3I0BRY/EbRyYi
         AlewoP2URIZA3GnhKMJZZs/cKC1ppcNZkuQNoCgXJcgRlBW9p78hXCu9AQZJlch9IWAY
         KNX/OSMFVxXEwlRFSQF8v26ssvrI+OcprV67tSbFePjDgaBl7Y4+mVlmCqRIZ7Bxg4FA
         kdRj3dych8vdqbuV+jRlTGv2kuG9m4ZEi5Xoylabnf6CCUHrPA+u5Yhot9ldHeUyj4rR
         BoKA==
X-Forwarded-Encrypted: i=1; AJvYcCWzdE4H+BKa5pi1wHrLuSgWEDGcpuq85jB218KB+5NObMdHO9WN6/iyvUc6K5b4+CCaVOWr@lists.linux.dev
X-Gm-Message-State: AOJu0YzLNYEA+PEFGPOvgfwaKuke30ifeYpLwj0CzHYBgks5zJ3C0mRz
	KWO/Wcgmc67ZJbsRV0jvSkH+dEaBWyl/AykXSq9cv5Mm9QMpW7C3cBwrcdprKNd60ZC6c7/bMXv
	B3+jLbnrIy+j8n8PRbdYb5CEEiCctwxoe1HpCIYVkQQ==
X-Gm-Gg: ASbGncskr5TnrASprgaEQ/sd8dhPyFrjURuHu2BT2CzWso4zNiWbchp8zMyiAXlo+7X
	jx3jyuXiTST9qBXFy+6V/YLa33BPtEWE4TiWw67FgJi5MAK9NwLhPe1/FN48vznS6hyKu57+8ZW
	pa8FeqN7TFc6+F27mC9Zfl0/3y6UvPPwO+76hEpoew7lL+EnsL29rLlUUYl2igoHT6qRmgZQ1+k
	7qvnkxBEkQ/STAboVTBZNjwjyWZBH+/CwJFyg==
X-Google-Smtp-Source: AGHT+IF1c0ECz1dHQBMozDVaGJegjDQ+xVWv6X/ujXbFpey4CFIuQxZFRfSj60viTUAnlrJuZLxqs44XGNMAeZvlUx8=
X-Received: by 2002:a17:90a:d60b:b0:311:f30b:c21 with SMTP id
 98e67ed59e1d1-31e5082cc31mr280553a91.26.1753207244493; Tue, 22 Jul 2025
 11:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722134340.596340262@linuxfoundation.org>
In-Reply-To: <20250722134340.596340262@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 22 Jul 2025 23:30:32 +0530
X-Gm-Features: Ac12FXzKOsmLQ8yujNcTxBZG6536oHN-0krbleAUzT7bCEwfhEyQGS7hbv_zCoY
Message-ID: <CA+G9fYu8JY=k-r0hnBRSkQQrFJ1Bz+ShdXNwC1TNeMt0eXaxeA@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/158] 6.12.40-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, clang-built-linux <llvm@lists.linux.dev>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jul 2025 at 19:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.40 release.
> There are 158 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 24 Jul 2025 13:43:10 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.40-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

With addition to the previous report on the stable-rc 6.15.8-rc1 review
While building allyesconfig build for arm64 and x86 with the toolchain
clang-nightly version 22.0.0 the following build warnings / errors
noticed on the stable-rc 6.12.40-rc1 review.

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: arm64 x86 kcsan_test.c error variable 'dummy' is
uninitialized when passed as a const pointer argument here

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log

kernel/kcsan/kcsan_test.c:591:41: error: variable 'dummy' is
uninitialized when passed as a const pointer argument here
[-Werror,-Wuninitialized-const-pointer]
  591 |         KCSAN_EXPECT_READ_BARRIER(atomic_read(&dummy), false);
      |                                                ^~~~~
1 error generated.


## Source
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 596aae841edf981aab1df1845e6df012bed94594
* Git describe: v6.12.39-159-g596aae841edf
* Architectures: arm64 x86
* Toolchains: Debian clang version 22.0.0
(++20250721112855+43a829a7e894-1~exp1~20250721112913.1588)
* Kconfigs: allyesconfig

## Build
* Build log: https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.12.y/v6.12.39-159-g596aae841edf/build/clang-nightly-allyesconfig/
* Build run: https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.12.y/v6.12.39-159-g596aae841edf/testruns/1703644/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30EXE6Cnct6e7DCgsWWrXlMdO0z/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30EXE6Cnct6e7DCgsWWrXlMdO0z/config

## Steps to reproduce
* tuxmake --runtime podman --target-arch arm64 --toolchain
clang-nightly --kconfig allyesconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
