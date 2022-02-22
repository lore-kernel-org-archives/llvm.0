Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623FB2568
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645520955; x=1677056955;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QQTq3k6XW4P2HhA3E5lMvsij58MPRHrys7O5FQwWx8I=;
  b=M5lW2eKE5Syhg/qvtb9VmA6fhl5cRG51sSJk8Set+CP2taksJdEGcEqp
   ugLSycBZcV9lioULwGgukNiU2DZ4fQLuiDvhD4XcJR0Mm7rCGabWdhtNR
   d4V0zf1cQtan8gB9T2kuBabrfbbLl1dWZuOjJ+AaLRgBesMZYxDmatChf
   YPTALHGQtWrhP3DsnRJdBoewmKl/s8VEly41vMdUisiCV8J2kDQmW1jyP
   /ugntr7v2pQBwTOSFpXxVF2M3DTbQndZYzIOyxWIJ6cnzIJTH1vzN4wWo
   r4AF3tX8mnv6A+lc5s712i1wfZo77UQSmhtr8cwR0Nel+abBGz78s9JYx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="239063238"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="239063238"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 01:09:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="547654333"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.31.219]) ([10.255.31.219])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 01:09:13 -0800
Subject: Re: [kbuild-all] Re: [PATCH v2 03/12] pinctrl: renesas: Initial
 R8A779F0 PFC support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
 <202202220706.BSRvcjhD-lkp@intel.com>
 <CAMuHMdUD=GU=xtMesW+pVnn2qLgp+PBxYEFia8Z8f1SuZx4k4w@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <a0721eac-fe2b-dbea-d18d-30229f80dac5@intel.com>
Date: Tue, 22 Feb 2022 17:09:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUD=GU=xtMesW+pVnn2qLgp+PBxYEFia8Z8f1SuZx4k4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/22/2022 4:24 PM, Geert Uytterhoeven wrote:
> On Tue, Feb 22, 2022 at 12:31 AM kernel test robot <lkp@intel.com> wrote:
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
>> [also build test ERROR on robh/for-next linusw-pinctrl/devel v5.17-rc5 next-20220217]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
>> config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220706.BSRvcjhD-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          # https://github.com/0day-ci/linux/commit/a774a621c83874c65ae824a0a53f2741f3612df8
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
>>          git checkout a774a621c83874c65ae824a0a53f2741f3612df8
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/renesas/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/pinctrl/renesas/pfc-r8a779f0.c:998:20: error: incompatible function pointer types initializing 'int (*)(struct sh_pfc *, unsigned int, u32 *)' (aka 'int (*)(struct sh_pfc *, unsigned int, unsigned int *)') with an expression of type 'int (unsigned int, u32 *)' (aka 'int (unsigned int, unsigned int *)') [-Werror,-Wincompatible-function-pointer-types]
>>             .pin_to_pocctrl = r8a779f0_pin_to_pocctrl,
>>                               ^~~~~~~~~~~~~~~~~~~~~~~
>>     1 error generated.
> 
> Missing dependency:

Hi Geert,

Thanks for the feedback, we don't support adding the dependency 
automatically, but we'll take a look to avoid testing such cases.

Best Regards,
Rong Chen


> 
>      This depends on "[PATCH 01/10] pinctrl: renesas: Remove unused pfc
>      parameter from .pin_to_pocctrl()"[1].
> 
>      [1] https://lore.kernel.org/r/822133086f32618c7fc920123c6a96f5d4ea7ad6.1640270559.git.geert+renesas@glider.be/
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
