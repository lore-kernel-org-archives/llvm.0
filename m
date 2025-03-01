Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805C130E58;
	Sat,  1 Mar 2025 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740840057; cv=none; b=nS6pQZBwfXkAClzraOFshGFIajbkg2SNRMn1GylLpTIYfEXck9F4ptVHQ8PVVHwAgPnYdvTCOlasJVSE3LTX71F6x+iePoJQ73nz5HmEzhUJoyv7eWEUtWltnFI1t18jc98COCnZYi3a8U8ZZ+ilvitGZHrW49Z9qZhOft5X96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740840057; c=relaxed/simple;
	bh=fvc0GFY49vtdwlvQOiX7jyfeQ4jH4gnCmwZDVEIASPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDSs23hR4YkafXdAZ8Nuxq0bkJ9vrzEWESvCE7q3CUgtDNGFgB97N8en6VgfCgH5sm+VsqRikFcJ53iKI1sxn3Y66c+e3ZfamPxUTFboPGrB0TakE9wSUetLtV8yPSDypMKlxsX51GydQNRWTXTI08olKntDFJUpCJsUY5YOQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZXodT5UB; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZXodT5UB"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 000772E09035;
	Sat,  1 Mar 2025 16:40:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740840052;
	bh=AoF13J8yxL2hOUdDriZFd3dGmbL2Va9UciqCeTZ8KJA=;
	h=Received:From:Subject:To;
	b=ZXodT5UB2htlIMeCtQoTe50MkDPvE20jUQDFvIaCOeDdffAKtMbd6OItweFXasbBO
	 qOlq5vTChuI/pgMJCYXWmn7EmNrAPtlF4DGV/N8SquF1zAuLrywkhqfX6wr8FI4YeB
	 jl8jfdHbEiieVFfQJJRayUGUG3EkAyc4m6mzl2Dk=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30613802a59so34661441fa.0;
        Sat, 01 Mar 2025 06:40:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/p/SbatW7Vd9cjoOZQq1Htlw66oKz+Sb2krQgsY5NqWQp7KroCC7RCtXPdIcS9aXNiN40@lists.linux.dev,
 AJvYcCXlo7cAlDBWADvbrz27hGF0zV0Yfr16J/o/i6LAIGSISiL72n+qYcQ5eMArfXpNOD+FohD5Ineo+OexpHVgMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxlRYWKYuWl25eyJ9pzvPEg0Q0EM26qg4fcILSWcCPediUGj2i
	F3YQachAadw9MlJPFrTBoyTsLu7qkrLuoZzctfTDSCmxZsFFf3BPlNsdwv1OIiJuokL16Vsa/dI
	mfdCWvovJRdYulF+6ATE3OBagxhA=
X-Google-Smtp-Source: 
 AGHT+IF42FFJSZGsRTc4ejVijbncPKYRFc6Y7m4mFVtrifwjxPS4IMR2tLWBSG+1P79JGvqbybjaFQY+khTKeEv/KwU=
X-Received: by 2002:a2e:be03:0:b0:309:1d7b:f027 with SMTP id
 38308e7fff4ca-30b9320f37bmr29454671fa.9.1740840051093; Sat, 01 Mar 2025
 06:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250222161824.172511-12-lkml@antheas.dev>
 <202503012254.EtBZW7gW-lkp@intel.com>
In-Reply-To: <202503012254.EtBZW7gW-lkp@intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 1 Mar 2025 15:40:40 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFcVDMPeUqHP_S+Prf=TkvPQ3UEMVGbF9SGMcXMxRAf8w@mail.gmail.com>
X-Gm-Features: AQ5f1JqR03mBJLIvKw2lTHt6pPHFgGDzKan73hLzrnP8lmbF4yL3QOPCUXJkAJM
Message-ID: 
 <CAGwozwFcVDMPeUqHP_S+Prf=TkvPQ3UEMVGbF9SGMcXMxRAf8w@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] platform/x86: oxpec: Move hwmon/oxp-sensors to
 platform/x86
To: kernel test robot <lkp@intel.com>
Cc: linux-hwmon@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>, Eileen <eileen@one-netbook.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174084005232.13467.16442669301461226098@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 1 Mar 2025 at 15:32, kernel test robot <lkp@intel.com> wrote:
>
> Hi Antheas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on groeck-staging/hwmon-next]
> [also build test ERROR on sre-power-supply/for-next amd-pstate/linux-next amd-pstate/bleeding-edge rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.14-rc4 next-20250228]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/hwmon-oxp-sensors-Distinguish-the-X1-variants/20250223-003148
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> patch link:    https://lore.kernel.org/r/20250222161824.172511-12-lkml%40antheas.dev
> patch subject: [PATCH v2 11/12] platform/x86: oxpec: Move hwmon/oxp-sensors to platform/x86
> config: x86_64-randconfig-078-20250301 (https://download.01.org/0day-ci/archive/20250301/202503012254.EtBZW7gW-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503012254.EtBZW7gW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503012254.EtBZW7gW-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: devm_hwmon_device_register_with_info
>    >>> referenced by oxpec.c:1051 (drivers/platform/x86/oxpec.c:1051)
>    >>>               vmlinux.o:(oxp_platform_probe)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Guess it doesn't merge anymore. I have two other nits I fixed so I was
planning for a V2.

Question for the charge_type ABI. Should we switch to charge_behaviour
since that also allows for autodiscovery?

Antheas
