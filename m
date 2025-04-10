Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C31F7092
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270864; cv=none; b=qtD5n6nBogRtNa7yzWnGX4J6jMjp44lmA8jvi7OFezA+sfPkT9JlvVlvE7hD8v6VkkjS8ttSZ6ei85lQ4FQuwsKgcD2C7gjvCJXvD4yIvi7vWx1PDxS4avlHvgGvmxlg7YlKJZabDuRpamL0v7YeNQYZKvMGSwrKCpvui0XfG1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270864; c=relaxed/simple;
	bh=ni0oIAGGnEHzUbLGkPF1Eh2YJyK+eXQpqb0to3WEHlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDBgO3bxDpw3j0j3v3jIqU564m4eyHSqF137GZOenPJDK2b3qOKOr5d8llCGPTeDPRiqtm6VfV8xknXKOJTEVRjz9H3M7CGUuBwWnEXdO2pgroipoKkSyBud02LkIlkmbjua2/rno2LI8oUaAS3Vk05jAUMjV8o1r7DBrHhMdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rpnFQaW+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rpnFQaW+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c091b54aaso4246731fa.3
        for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744270861; x=1744875661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abln28vSs00yPYpNqKbQexZ2vOfOVw8mIqaX3hbLzPg=;
        b=rpnFQaW+RgfeAY9JgoFgSHx5gqaTIUYBT0MUhoyIftpFJPERNWQTWWTqOxf6TfF6CT
         yt5Trd9xx0GfDSKofdziEkt5iZFzKYcpRStdy+yH2/s6Z7j1cvAkXPoQVzwCUTsW7Agp
         A6NdDn7kILeu4/4PTtctZ8qYMsDzJMpZPX3v5m8RsGrZMDOzflo/lZtz5WTMtPT2LCKc
         xbUt7DnOQBLg38+jnXd6irQvg2pSh+sAySGNp4tkU5cp54DQOh5zBGY4gfc2BhbEAZe/
         k/c1hpTiHjrLXvTSLipWsg6SLLhfhWrjKEs0Ewry7KEQf6cIGzAfRWbk+oAp57kTsQ1x
         4UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270861; x=1744875661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abln28vSs00yPYpNqKbQexZ2vOfOVw8mIqaX3hbLzPg=;
        b=cdJ8MZFp4Z6MiHMlwu4iGy6OF8K6tFBLg1i0fXhMUDYgDpk3IzWtUxoEv7HG/uq0Q3
         ow28g2PErRt91YC4LKN27ESMXDUIOzegPIUEOCVyGE3jCbAJZq3TSZ4BR1khxuA2HyoP
         2YhpXtQuaa7+MHBATue8NrltU0fELinsSDcZPs2b9C6vQLQ92bdXMjsiHa2dUg4HA2br
         Obh2s0tdy0VQxhaeXz/sZ+DHyRzR0WAMmI35Xd0Bd2kadGxFDkThS1Es/fCMYOAU4izf
         s3SaUynjotctNtDddrHSrazAcfBXiTAyo9HuE1JnQmNteuHm85Bas6e9P8nUNmBGVo7q
         GTLA==
X-Forwarded-Encrypted: i=1; AJvYcCXElEIPnSYfdh5RV0IBQodR/Pi7uzRG3dvEGTuVQFCQm/Mu3B8r86M/YJv5Gd0MOTC5gXyi@lists.linux.dev
X-Gm-Message-State: AOJu0YyxXPnb02WVL3qL0BIZ8IafKDFNV/S0SMS//nw1HpDWGYU1gBA0
	Z29IU50qQVQlUQm41UKUVJEgoQm6nTPTKCZktYaVhD/yPyQlSYzfMToxrebOm/zOb89FeZcojcP
	zKJzW08o0ODVOM6vzFpTpQHxyR5YcSrxb4JtOQQ==
X-Gm-Gg: ASbGnct5XzFGpzOyz6tsL7fJA/kW806dQ27PbbA3EBAZ7rnjR7SkD40zB4RtQE0HJiE
	kuVco4smNXXQcXRLGrUiF4CI+06LfPzSC1woiwpfExVQR1Q16xt3v0XyP/R2aKUYo4ZSPVIviUt
	4HC0Dlr9ShyxWrL2hAI0rJ6rf2YxLHcAEfK/0s434TlQ+Wf0WDtuACnUihTc2Vrv7q
X-Google-Smtp-Source: AGHT+IH5PI8f41X0hvTGTHZxcCz8ZXmi2rZvmUlakPAmNIx0w+gDOySuYq2drttiG7+Ajp3CrQ4F8hOHk0BBGH+SMNY=
X-Received: by 2002:a05:651c:12ca:b0:30c:2da3:1493 with SMTP id
 38308e7fff4ca-30facc1fb07mr6678671fa.19.1744270860523; Thu, 10 Apr 2025
 00:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504100718.3Ftgs2zL-lkp@intel.com>
In-Reply-To: <202504100718.3Ftgs2zL-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 09:40:49 +0200
X-Gm-Features: ATxdqUGumQROsZI_kX3-lMz2QpKRez23K5HAhR7PptUCEYb8cq0EtZgnCw4lEHc
Message-ID: <CAMRc=McmkAXSb3HDYFRHOakF_b8dN0ym1kacLz2Kj8B0FezBcw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 13/18] ld.lld: error: relocation
 R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_start'; recompile with -fPIC
To: kernel test robot <lkp@intel.com>
Cc: Koichiro Den <koichiro.den@canonical.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 2:02=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   6d7f0c1103ef3935eb3f302d09af4ef9e85212a3
> commit: 86f162e73d2d81ef6d819c06a3b6c2fda77a79b8 [13/18] gpio: aggregator=
: introduce basic configfs interface
> config: powerpc-randconfig-003-20250410 (https://download.01.org/0day-ci/=
archive/20250410/202504100718.3Ftgs2zL-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 9=
2c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250410/202504100718.3Ftgs2zL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504100718.3Ftgs2zL-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbo=
l 'vdso32_start'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/powerpc/kernel/vdso32_wrapper.o)
>    >>> referenced by vdso.c
>    >>>               arch/powerpc/kernel/vdso.o:(arch_setup_additional_pa=
ges) in archive vmlinux.a
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>    Depends on [n]: SMP [=3Dy] && (PPC_PSERIES [=3Dn] || PPC_PMAC [=3Dn] |=
| PPC_POWERNV [=3Dn] || FSL_SOC_BOOKE [=3Dn])
>    Selected by [y]:
>    - PM_SLEEP_SMP [=3Dy] && SMP [=3Dy] && (ARCH_SUSPEND_POSSIBLE [=3Dy] |=
| ARCH_HIBERNATION_POSSIBLE [=3Dy]) && PM_SLEEP [=3Dy]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

This looks like a false-positive, it doesn't make sense for it to be
caused by the aggregator change.

Bart
