Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51261514F8
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000381; cv=none; b=Ev2gkSZxTv0sJz3Yk5L8LJl6J7LR8fcurxqy1EetWqbg7RM7NAbzriighSm9LS3HTG9vW1breKLN+frjIXOukgqLX1ijw/0z4XZR9Qj7T52q1wLZMTYh9BNJPwI1ge4PXKlNSe4Ej2hUfat2+pwaOj/IEGF0BVFAnyZMLwiaMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000381; c=relaxed/simple;
	bh=FWQOlZwru2thEbhL4lTMF6xjCwNMEnaS/bczPp/hIus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRUMqd6bLeO31TYT9foSaFfprqCpjHdpeClW+nYhr0Lt7ZyAagVY4+BPrUovSPGC8IRHGu13t3YOjYa7mbzgpP/XgQA9gmDa4NpOIiTnmeaQTcDWhXkRGahCoS67IHSRO8YQcsibz/igQzamRF2CKGX+mFc25GZOW26DeGmlWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HxqXVUAG; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HxqXVUAG"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4a47ec4ef2cso766343137.1
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729000379; x=1729605179; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iexUV/ndk4U1Dhl/r8ShAJPbiDOAMvjVeQipylX0EJE=;
        b=HxqXVUAGCFvq+RLVtDpazr+xt3d0fQMTvl27A7ufkD7d9/esGvI6U5d8+hAt9nUxOY
         QufMzV4zKxjpbryWWBIpw8CoIO+CO3Xt4/dAjErrmerjqXHJT2GSPaeH3tUELa6eZTCY
         gI+CWUBIWkWwfi/8B4xg0N+NBUBUnb9V817j4BBXbDeZVfB+Avsd2y9KIztMeL9zbDVZ
         jDUCnW9CHXrAAgi2s8V0hX8p5Gtwk1yjzFZzzF18wcA8CxtE87CZx4W/6Cef8W+N8FvJ
         HMXp5Sye0F4WX8inJhH9vnFN5Ph6G59bhKRaSR6Bii2H8Xvl94+yPI/CWRextwh2yKqV
         Dcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000379; x=1729605179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iexUV/ndk4U1Dhl/r8ShAJPbiDOAMvjVeQipylX0EJE=;
        b=hXCAdEW4Jzngz1wH1PEQzzqCXCAFHzfeAUbmqQHPgthlscjun4bWRlECIY6NM7FwJD
         N8+6vQDtovMbonlRp/HhcW8Q77hLn+IE4sgvxPn2SShOOxD1ua0LTx0JiKZZLpmMDRg/
         qse/KklzrAYE828H5Pj4osOTgCjlacq4/FbYidCRf1/XWaSDl/cpN1Ig8W4IM/yBDya6
         4Ldf8dOR8IxNYkzLmDNnrbmcE2FV/aAl1ec7a72H7l/r5g6abfe51hefFer24QQTcbic
         CTYR7xWdI/Hjq6And2gLtt5d78oddRlIHv9lLa0Elf8VJGCejXaPFdOjRH9jhrpvD82m
         XqAw==
X-Forwarded-Encrypted: i=1; AJvYcCV+FidwMO0CV8JqtDJSFZqu0mlEqfl2TG1bswxek3q4cs3jvLm+5TYlXsCP+Tkj+vL0Hm6B@lists.linux.dev
X-Gm-Message-State: AOJu0YzAPaDFJRyuzW7ZVeVtzEZn4hLFfZghgvUQqbrsm8+LyBYSy6jS
	0DirynVJzHa815+98V00J1ExRPFFUcz4bviKeK1gkilGh+Cl8dOb3XqmR14yMKKhPhuF6UoJ6rV
	5TDILUXE4QETW/ba14CJu9CvmXUks/MQvz5tjfw==
X-Google-Smtp-Source: AGHT+IH2roGFwbjAPfRe/dAsoUkaB0X5KgBCAg1wOBa1OFnEfproIcRvnwE2U7eCCjeyZrdFKKgEIyw21oL0+FIDqp8=
X-Received: by 2002:a05:6102:954:b0:4a3:bb4d:1965 with SMTP id
 ada2fe7eead31-4a47600f27fmr7219973137.28.1729000378624; Tue, 15 Oct 2024
 06:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015123916.821186887@linuxfoundation.org>
In-Reply-To: <20241015123916.821186887@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Oct 2024 19:22:46 +0530
Message-ID: <CA+G9fYuZun789CY2rZ6WqxzdFswDYCf_fMpT9d-4M0bzJfJrhw@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/518] 5.10.227-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, allen.lkml@gmail.com, 
	broonie@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 18:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.227 release.
> There are 518 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 17 Oct 2024 12:37:45 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.227-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

A larger set of clang-19 builds failed on arm, i386 and x86 due to
following stable-rc linux-5.10.y.

And gcc-13 and gcc-12 builds passed.

List of build regressions,
* arm, build
  - clang-19-at91_dt_defconfig
  - clang-19-axm55xx_defconfig
  - clang-19-bcm2835_defconfig
  - clang-19-clps711x_defconfig
  - clang-19-davinci_all_defconfig
  - clang-19-defconfig
...

* x86_64, build
  - clang-19-lkftconfig
  - clang-19-lkftconfig-kcsan
  - clang-19-lkftconfig-no-kselftest-frag
  - clang-19-x86_64_defconfig
  - clang-nightly-lkftconfig-kselftest

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The bisect points to,
  da1084f5722a9a46bdcadc09429dc4b56ac31de4
  i2c: Add i2c_get_match_data()
    [ Upstream commit 564d73c4d9201526bd976b9379d2aaf1a7133e84 ]

Build log:
-----------
drivers/i2c/i2c-core-base.c:101:31: error: passing 'const struct
device *' to parameter of type 'struct device *' discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
  101 |         data = device_get_match_data(&client->dev);
      |                                      ^~~~~~~~~~~~
include/linux/property.h:382:50: note: passing argument to parameter 'dev' here
  382 | const void *device_get_match_data(struct device *dev);
      |                                                  ^
1 error generated.


Build link,
-------
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.226-519-g5807510dd577/testrun/25457427/suite/build/test/clang-19-vexpress_defconfig/log
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2nTXZNd4wRQOyppVvH0kgAPF6cE/

Build history:
----------
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.226-519-g5807510dd577/testrun/25457427/suite/build/test/clang-19-vexpress_defconfig/history/

metadata:
----
  git describe: v5.10.226-519-g5807510dd577
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  git sha: 5807510dd5773e507a5ba5ca98fce623d87256a0
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2nTXZNd4wRQOyppVvH0kgAPF6cE/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2nTXZNd4wRQOyppVvH0kgAPF6cE/
  toolchain: clang-19
  config: defconfig
  arch: arm, arm64, i386 and x86

Steps to reproduce:
-------
# tuxmake --runtime podman --target-arch arm --toolchain clang-19
--kconfig vexpress_defconfig LLVM=1 LLVM_IAS=0

--
Linaro LKFT
https://lkft.linaro.org
