Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B31494AB
	for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291636; cv=none; b=ttm3359oEo+Y7qNfyqW89i6/P/N2J9eSze2XjgyPsYdJRZCSXwoSTOQDNQWdejNCCRZfkkFeEbwxTFjT+edWFrh11MMxTJPv7nIo+N5frCAY1NOWGbtpCK8OMKjn+iJgm38wiFYlLPbpFknjy5dvTQTU9Ch9gZyfCE82dbVdLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291636; c=relaxed/simple;
	bh=14Z/QPjhD+7BffP2eGAJ+9YQJulua94nuc8mbHlPwaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NY7mSRcU4c/d8qaVTSj80Q5ygsqB4QZoSu3XX4i50TKVtTTZbYhECLxHH5nXJf1zYO+dmKaimiHfIUcYL10rRj3MnJvvQCsktkH39TdODS+Dt7BLocIuRCtz/8icM+7mWC/410b7FMpGMus9Ky3Pyiafvz1lxHrBagsT6HdlTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YWGOj+BV; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YWGOj+BV"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-80d6c63af28so439457241.0
        for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718291633; x=1718896433; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YrxYBwFmJZ2ShtzXRL4Y2grRkz6qOWp2v7p/c2wyXj0=;
        b=YWGOj+BVUyKK8X2jXj/8vXpHl4/UvvM1kZL8YhRmg09jIvRPUfTCeWMiVKxcDXDMNJ
         JQ5g7eLfvKgAi6MbS/JV87ukcYxio4F8fdcsKzbdGeSIulvJz0ZbmzQmPtnTEhqOiVYx
         pPoGoHFp95CympxE9qNzHin7XWuIYY5MpZc9kBOEn96VyuGDuJBNL5fOjOHSxFchqTSU
         TnOWPQDqnx7vCOJNAkZ37+APpF+dSCwgFaql3pe90d16hHjQ03HTEL2U2/AvFvOJc9kC
         aLI+mXD1Ih2EjLOJ7dhUImmGV79iMf9IVrcgJDzabTbH+s65Ke6L3giwfT5o9EmtW08r
         axnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291633; x=1718896433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrxYBwFmJZ2ShtzXRL4Y2grRkz6qOWp2v7p/c2wyXj0=;
        b=D5OpzOb1dH4XbjyGrB7vaTalMTATPLFzF5wM49bTSvcDQuD2rFQtrjrtbsNXiEWSNc
         ZyqxUlLHoPG7Qo9du/WZxi2r+g5nWkivWWT67ssVK3BIzF1aZFiAe1JB9+9+swwijPMZ
         /YEuLKs1Q083xKNLEkUOhWIFOR/d44Fn15jGHjvkp+15ZFnEByO4uXEEse7iZYuz5OJy
         D0O5FQX2fh7BphEu/spYiYudi1XCWSXvQPnG2Gffg1rC7L/Fy1DqAyeRu2Jv9wP5P39e
         K3NJbFRSzDdo0lZMG6YgK0JN8RpvxItvPMSB8F9aUkGFdmujIFxqTHu9C8cxbol8AEZ6
         JFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLgIDMSfVVuI9tes9gQGRv2sOu7F4Q7ZEmaUxhJ5qCzRv0TEB7YfTtmXK8shi6NG7X9VJyWSWEIltCByv1X5fvmfYeWQ==
X-Gm-Message-State: AOJu0YyutyLF6gvPE0ZD81xcK5wQlUbD7uzzj9x4h0E2CHx6B2ZTGq42
	jJPX92TvSrfF7yorsF1v9cUKHVOsvTSoIkXkWkk3EWvYPxwOUgOS8iglWB4lWJoD7R9cRBDG3dI
	GvQmsUem6rQw/abQ128wbVp8MLHFeIoYrWdCY6Q==
X-Google-Smtp-Source: AGHT+IEN/IxLFSZi+7ySH7Yli8WEc2cF1WYEl0a+Gfrx6rp5ZdvnxPevY6/6w7U4zj4C97saSZZh8hfOmFU6AZ7IZKI=
X-Received: by 2002:a05:6122:c9f:b0:4ed:80:bd85 with SMTP id
 71dfb90a1353d-4ee3df992c1mr183882e0c.5.1718291633421; Thu, 13 Jun 2024
 08:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613113247.525431100@linuxfoundation.org>
In-Reply-To: <20240613113247.525431100@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 13 Jun 2024 20:43:41 +0530
Message-ID: <CA+G9fYvnVJi1RFhO5f6ZH2mpagZ6jcEdoQAxnSBxWPHsEVQwYg@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/317] 5.10.219-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, allen.lkml@gmail.com, 
	broonie@kernel.org, Anders Roxell <anders.roxell@linaro.org>, 
	Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 17:43, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.219 release.
> There are 317 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 15 Jun 2024 11:31:50 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.219-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


The following build errors are noticed on riscv with clang-18 toolchain
but gcc-12 builds pass.

However, compared with older releases this is a build regression on
stable-rc 5.10.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

riscv:
 defconfig - gcc-12 - PASS
 defconfig - clang-18 - FAILED

Build error:
------
arch/riscv/kernel/stacktrace.c:75:52: error: incompatible pointer to
integer conversion passing 'void *' to parameter of type 'unsigned
long' [-Wint-conversion]
   75 |                                 if
(unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
      |
                ^~~
include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
arch/riscv/kernel/stacktrace.c:75:57: error: incompatible integer to
pointer conversion passing 'unsigned long' to parameter of type 'void
*' [-Wint-conversion]
   75 |                                 if
(unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
      |
                     ^~
include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
2 errors generated.
make[3]: *** [scripts/Makefile.build:286:
arch/riscv/kernel/stacktrace.o] Error 1


Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.218-318-g853b71b570fb/testrun/24322227/suite/build/test/clang-18-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.218-318-g853b71b570fb/testrun/24322227/suite/build/test/clang-18-defconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2hp7bDTOjqzNr8hqqSWyMf943W8/

--
Linaro LKFT
https://lkft.linaro.org
