Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E51531F2
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269990; cv=none; b=YuIkths+H3osRdVSYQanefZSgjJarGbq7z8oXArv5qvgfpqh635icxYlty/BaOc40bLuNVqLjBVOEv4NEtoUOLhLrr3jzuMcDTeBc2rfLvazj06dVaVVvwVXcLCKJbQ1hI3gjVY5tYtQMHbQ9kPMXYRLyzqSUmEzN7KhnFxafLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269990; c=relaxed/simple;
	bh=8vWkfwZ9uoFTAqFoovaPX7Bjye6a8c5yTgefFSZ3pCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1u/F+SefrSO9wLNMyDvcRZwhrMWQ2WclNldNn1W9g+7t9H0KskX76nifpM/oNGvHbnj1sSNclHOpg7eIjwyHvTirr1CGneDVEJIrbkH0pOpPpB8MvS1x9pV2sX7dm0ZaPhECfxqfs6S9fR2tyNuUT5MaQWviY6KqQfplFSmXU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ke8bYnwo; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ke8bYnwo"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86b7185d653so265376241.0
        for <llvm@lists.linux.dev>; Thu, 06 Mar 2025 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741269987; x=1741874787; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hnDdSUGNxHZHOtmoWx7c7YzOTo1FiWV3Vqxq9lxjEQc=;
        b=Ke8bYnwot+pFPhXYN/QWtuLqVD2FgJvMENNwkCor/vDlGNBRZjNaod6/zAIDMYCJQ3
         RozjXXiP5xFUKQM2w81a0Y1RV8zEwAcrGWfgLC8ZSQYRUwNI1h+j1G4VasV8ceZbay20
         NlKxY0kGcQuSXAEuZdBPTfYFp93yfMNVERt4A32aPlQR+TWXsEtmKkY2HFDi45s+V7hT
         p9tuaTYCR4sp1ipE6MAlW++3pAIvV03UrqN7Co4etmxZCagtfpTZn7wfocWdrdlUhfru
         FGH7b1Q/s92v1XWAIE2SW5dw6iLCdtg+kdTKz7xVj2oZgwBpWQN+ncFtRTo8twpfEJzv
         gJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741269987; x=1741874787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnDdSUGNxHZHOtmoWx7c7YzOTo1FiWV3Vqxq9lxjEQc=;
        b=B+0dmy4y8Y7HQ4XpX0TyzRvYURzsELeWVtaMu7cF4D1VAUosgPmoV8awOXyE+sgmMs
         xK0rHYlqTfH1yXoKiVkIphwbc+dDpaUPcswzJ+g8WegXey0zlnwpOG/aFEJZwLc1hlGb
         040rczhu/S64cmH0tGDn7Y4auEfidevUMc1A+Oi9AZ9DmFPLVCuVdg7d/T42+6DeLRq0
         V1/gcN10fYdzq7KcB+pI9Yho6QvMFFGw6xBVKXQqiJpEZzKjJm3tmZ825N6Y2fFi30th
         W7u45kRVHdZU4C58OvB1Ame8GDuAyxEbDhneevArRWNJxuCjvfROWFkZvsyAJFXW8bf1
         uoKg==
X-Forwarded-Encrypted: i=1; AJvYcCVZdWnXMm+qWWy5biGvcFaKKhItEPrhX5jENapUO+pY4Z93675odKp3/pm/LnmnLdR6NWOr@lists.linux.dev
X-Gm-Message-State: AOJu0YzrqwWrUK64Z57C5qPj8nRAqe3M0Bcgj8BwnZTSuVBa1HfaZ1yY
	/IYW2/B92dr3dImFaEQjXlOlIl1leVqGq0dVAeE0m+yDLrl2/t28PKLuoi8Rdh7rzDl0u7XtJGS
	2bt0B8zPRN06LpJBcqzcLKd8OhifQVHHU1nMl6g==
X-Gm-Gg: ASbGncsf6saSP1jAmUPR5po9/0WoJD27mSA1/bGC0ZBp1jF9yfsWUKZyu6cGvtTIzPD
	kd0qkgG2bFgeOxTiscTluZOVm9PYAr/n6cWuP8MrxsszdQ+sGShHSP80i1bUcPVgL8PVmXoUe8B
	PnASWyqvjmPNSxCk9WAgCJlxl+meJtF9lQGFliLumws7iBJbAijdXoIQH+5z8=
X-Google-Smtp-Source: AGHT+IFYYVIMAXWvuGMo7KhLWndEUFvJgOqbF7iDEk1iAt4N1mORmaJKT3kVe35xC4vstbek2/qR99nsdifAiR58JMA=
X-Received: by 2002:a05:6122:658d:b0:520:4539:4b4c with SMTP id
 71dfb90a1353d-523c6289f5bmr4380467e0c.9.1741269986969; Thu, 06 Mar 2025
 06:06:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305174500.327985489@linuxfoundation.org>
In-Reply-To: <20250305174500.327985489@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 6 Mar 2025 19:36:15 +0530
X-Gm-Features: AQ5f1Jrk2nyka3XPmEIXPsBdkX75IZVBh9HDyYyhUqxg9qoZ6sVv7JRLz0R3L_c
Message-ID: <CA+G9fYufChZpBjB_WG6Qy-L8Gmj-zBbs+PyydaADcsrB42ec0Q@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/142] 6.6.81-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, 
	nik.borisov@suse.com, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 23:28, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.81 release.
> There are 142 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 07 Mar 2025 17:44:26 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.81-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on x86_64 and i386 the defconfig builds failed with clang-20
and gcc-13 the stable-rc v6.6.78-437-g9f243f9dd268

First seen on the v6.6.78-437-g9f243f9dd268
 Good: v6.6.78
 Bad: v6.6.78-437-g9f243f9dd268

* x86_64 and i386, build
  - clang-20-defconfig
  - clang-nightly-defconfig
  - gcc-13-defconfig
  - gcc-8-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: x86_64 i386  microcode amd.c 'equiv_id' is used uninitialized
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
arch/x86/kernel/cpu/microcode/amd.c:820:6: error: variable 'equiv_id'
is used uninitialized whenever 'if' condition is false
[-Werror,-Wsometimes-uninitialized]
  820 |         if (x86_family(bsp_cpuid_1_eax) < 0x17) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## Source
* Kernel version: 6.6.81-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 9f243f9dd2684b4b27f8be0cbed639052bc9b22e
* Git describe: v6.6.78-437-g9f243f9dd268
* Project details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.78-437-g9f243f9dd268

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.78-437-g9f243f9dd268/testrun/27508291/suite/build/test/clang-20-lkftconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.78-437-g9f243f9dd268/testrun/27508300/suite/build/test/clang-20-lkftconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.78-437-g9f243f9dd268/testrun/27508291/suite/build/test/clang-20-lkftconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2tuO7pCGJaGnX0ygcbTOaEDzr9M/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2tuO7pCGJaGnX0ygcbTOaEDzr9M/config

## Steps to reproduce
- tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
--kconfig defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
