Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ECC3A7F58
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417109; cv=pass; b=LxzJjVwsbf8yTltaUyjJyyqsUiL8+qADxFOMrIVPZ9GnsFUwhNa+bHzdxrea2he1SZIH2LmtKAxknSpS/N7dmK9+XGMYqVG0DQHR520m4K7BHQW6zR0d+Azu3kithRz6hwptr42wwlFXheSPfKUrs+9a+hKPRX7zMQhTXGoY09E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417109; c=relaxed/simple;
	bh=hZqD33S6TaBeP1U8RwrHN4MgbX19/ibIMOcdz9Suo8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTWIezovP94FQgVv7IfCk4XyDWue3cROIb4M0IfGgLhC8gLLPIbNxrUQX1k9kPUmW0dXuAh3uFDWnKQmL4qprYg88zIGv44uZZYCetb8t4vpppPpwZT4tzN/B7tPEgy7kIAztBFGMHCxUe24INnM9/JDwKiCiLtBcoQ4DDsKbGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0p7Tq9m; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0p7Tq9m"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-651c5d525f6so448478d50.3
        for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 02:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776417107; cv=none;
        d=google.com; s=arc-20240605;
        b=I30VOln8+Yzt99JPeY0y8UizPgCXheSd8ntRE95vItCc0QiosMrIkXhrNT85JoDtW0
         RvktnAwkpv3eWkTFmb2i0LDgXbLpetRzWN++AUc63GtkyyedT/p9GxWwG8OnrA+ythJu
         ZmTMsUFSGjv91kuzUFIHaF6sfFoGwZT3w9rzwGbfmIm3jPKOjOhkAM8Y0MQqE3LKeb1R
         4/9yUu6zj9EE5If/hUwMuwZKDh+tIUtl0WmIrGk8mG1Km75IdfZYZg159nncNnU6sSL6
         KwleJ2a+84w4LP2xV4qynDIxPOYbWkxXpcox3GOq2a3UERGuiMXEDrCMybnZry22BqEJ
         FOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        fh=Ruf922XaQRGcOhYHBxlVdRi0UwppxaDHwerbadW0dqc=;
        b=lgnBCKG2LZaAQQq8rjDoNmW1hnanlaQa5i1Ki+eRCeS35ap1JmeZEGRE1wLex/DLuo
         5oDtniXaEr7ppwPnOXLVu5figtWjmPEPcs8qgeeaNCuburu6l/2ceSiQItApKChXhLSM
         NiZpBBdJJxsOS6Gq40vtSrnN7LIYU5gd359PB1VOqcBLdOadF+BNsLULscTqCTQkv44Z
         APtAzedaOrP87EKHjGYpeG5xKEGNp6ngcrlyjIsln/TxddNHi72aSVDUaKlVujqmCKQt
         c6YVxFGkDXeE93vqLnzCI3E0nIox1WC+XBM7ImEseevCiX+yL83Qe76K0LilEN1xJMN8
         lIEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776417107; x=1777021907; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        b=Q0p7Tq9mcKbWehC7s+FDYhZMZMNDgpkJUxm5V5Piq8V8c5Ft4gX+9yVEUbSOLkd4rD
         LzVQ5sQn75MXCDV202YItEgRWMsxMwiY+7FJpctz3E6LXlk1l8ZAz9NGe0+KYW0/VMAe
         eqTkq15DNNGTwGTtEoBn4YhoLNh2l8ySwQjOJtnzqEgHzWT5TZpAyCr18qMcLGwrUK4w
         Ui/rUTdbHyJV64go0bvjXXVaoHneH/AN64bHH9xInE+okIlZpkTI8gEXOtIVA4/tctIW
         qR4gWexs9DZ6h5fbh8nJKyr1p2FYDkLP0aVGJOHT5hpAJC596i0UQB6i1H2AN3cztpAV
         Sofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776417107; x=1777021907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        b=Obd6VPoYL4YCO5DYNUiwihvO4d9Y1P1uhUW7kBcY3Eik2VloAqBchBv47OVlhkn89i
         uveNA3EQxtohJ8fRNlH4flk0HZhfg98brgtcazO3JWKgc/nSEfPSPMcYVgq5tm4pnNLF
         yqjY4pOWqXPCnW9lVI9JnEI/TUCnBs2qxZNw6HPyyVrEvqOhGi7kpr5bcNnZX3tlsuTK
         bsHuz0vQH3lyg/SCRV2Id1nK+Wn0kSnCfMP7yjtiInSw1YkRWHS3PeHi4rIi334z2HfI
         Xllubtyjyy3gmBOXliNpF+NT0IAgAJbsTrM4C4UZ1+5NM83cLQvlrbjNGPsB6j4u3s5x
         63Vw==
X-Forwarded-Encrypted: i=1; AFNElJ96XY3S2c3nCbI8qPHNVSKGtpPSf/KFlGPIpIadadUes2PqkMhRgBeLVybkl8sfz0M/ukpQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ2mABmOACl71I1GzLTiAi/OB6QROF7j49SVHuZ5ZCHZoqSZbj
	abAW6JphHI6Vz47LLB9I0BSVX0Tj1vvLK4w8nvPpZrilgnnNZPJEyUhzMZEnc74EPjrJw0ueSaj
	YhWkyQ7uis6MUp13Dx7SGh9WY4mcc59k=
X-Gm-Gg: AeBDieu6otY/tWjLubOmNHDdiTjdnV4CEhmkd6TUynvQiVvSO+Yv2rjLv7wwIoo4fMU
	wb7kIcIipMl10ye/X8osIZ4bhvnIF8KmIu9ojl2AcFRj5bYh6Wpanjjo8PuDgiigrw9GGIysdKw
	GHnOgaGHUWZ38NsB9LGe7hK5DadBTiQld3GU9flwztZXz2yks8ZVKDxN5qnH/yirQo3CJGLzADW
	tZ+TgNAAHu/hHiLl+M6PQTDEw/kBXZ6Fjdty/4QGtOTBBtD+/97QKPfRm7ZD3eGwdwxrNa8D/pQ
	gTd5YNuvxESg2LvOpvpO
X-Received: by 2002:a05:690e:130e:b0:651:d634:6d32 with SMTP id
 956f58d0204a3-6531085f25cmr1805344d50.20.1776417106750; Fri, 17 Apr 2026
 02:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com> <202604171609.wl8JLCit-lkp@intel.com>
In-Reply-To: <202604171609.wl8JLCit-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 17 Apr 2026 17:11:36 +0800
X-Gm-Features: AQROBzCVBYydseR7J8ekLAtPw3aL9_q0Qe5MzF8i8S3g1XrJyVxsBCHjMaTpGHI
Message-ID: <CANUHTR8SyfZouETXFpDv4ivzin+DC8OTDYhbSQ1cRaoNqYPduA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: kernel test robot <lkp@intel.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Olof Johansson <olof@lixom.net>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 17 Apr 2026 at 16:47, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on chrome-platform/for-next]
> [also build test ERROR on chrome-platform/for-firmware-next linus/master v7.0 next-20260416]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/platform-chrome-fix-reference-leak-on-failed-device-registration/20260416-135638
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260415175038.3633384-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] platform/chrome: fix reference leak on failed device registration
> config: x86_64-randconfig-013-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171609.wl8JLCit-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171609.wl8JLCit-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604171609.wl8JLCit-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/chrome/chromeos_pstore.c:131:3: error: use of undeclared identifier 'ret'
>      131 |                 ret = platform_device_register(&chromeos_ramoops);
>          |                 ^
>    drivers/platform/chrome/chromeos_pstore.c:132:7: error: use of undeclared identifier 'ret'
>      132 |                 if (ret)
>          |                     ^
>    drivers/platform/chrome/chromeos_pstore.c:135:10: error: use of undeclared identifier 'ret'
>      135 |                 return ret;
>          |                        ^
>    3 errors generated.
>
>
> vim +/ret +131 drivers/platform/chrome/chromeos_pstore.c
>
>    119
>    120  static int __init chromeos_pstore_init(void)
>    121  {
>    122          bool acpi_dev_found;
>    123
>    124          if (ecc_size > 0)
>    125                  chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
>    126
>    127          /* First check ACPI for non-hardcoded values from firmware. */
>    128          acpi_dev_found = chromeos_check_acpi();
>    129
>    130          if (acpi_dev_found || dmi_check_system(chromeos_pstore_dmi_table)) {
>  > 131                  ret = platform_device_register(&chromeos_ramoops);
>    132                  if (ret)
>    133                          platform_device_put(&chromeos_ramoops);
>    134
>    135                  return ret;
>    136          }
>    137
>    138          return -ENODEV;
>    139  }
>    140
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Yes, the build error is because in the first version I accidentally
forgot to declare the local variable ret in chromeos_pstore_init().

Sorry for the oversight, and thanks for the report.

Also, the underlying issue here appears to be related to the
platform_device_register() core/API behavior. We are currently
discussing in another similar case whether the better fix, if any,
should be made in the core/API code rather than in individual callers:

https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Once that discussion reaches a conclusion, we will revisit this and
make the appropriate fix if needed.

Thanks,
Guangshuo
