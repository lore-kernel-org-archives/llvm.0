Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0A7FA
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 01:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661994963; x=1693530963;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nLNeIamA4X8Q4pDLdvjBAtHHFqdpaLeSXEbhWluqMuk=;
  b=H/JAGGTqUvaJPYDR0KuayjdH6TAyJHDHCzslgm5FZWS1jULCLUtBKRJK
   xDI/deX2E77yw6UavDn5vGBR9sDnPl/2VbkqyzrbTHaBy7DKFanav6DV0
   UNyNgm4JLUSBwJfvEIBv/fD6pRGa0G7xVo2o4Yc0ErhjmzSyeCruREOBO
   kL/VGlK2y8gO4Z7w6DtBjZk6EwNEmdm1UB471KWy0iwSDJz87KKkrVxGT
   rIDif9kcQxTM7NEKwF8/iFekH1wES/MHfiDXdY3lwR+5RzdI7Y6KXzC5c
   5rl75vFVe5HGa/9RDJPvlHNA9ansqVq49SBNn0MQYALYkTYsF7GQGPb0I
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="381884249"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="381884249"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 18:16:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="673613016"
Received: from yuxiongj-mobl1.ccr.corp.intel.com (HELO [10.254.213.173]) ([10.254.213.173])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 18:16:00 -0700
Subject: Re: [kbuild-all] Re: powerpc-linux-objdump: Warning: Unrecognized
 form: 0x23
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202208311414.4OPuYS9K-lkp@intel.com>
 <Yw+A+0BY26l0AC5j@dev-arch.thelio-3990X>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <b0b8fecd-4041-d04e-9a11-2c7947e5d5a0@intel.com>
Date: Thu, 1 Sep 2022 09:15:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yw+A+0BY26l0AC5j@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/31/2022 11:40 PM, Nathan Chancellor wrote:
> On Wed, Aug 31, 2022 at 02:52:36PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
>> commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_INFO selectable from a choice
>> date:   5 months ago
>> config: powerpc-buildonly-randconfig-r003-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311414.4OPuYS9K-lkp@intel.com/config)
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install powerpc cross compiling tool for clang build
>>          # apt-get install binutils-powerpc-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f9b3cd24578401e7a392974b3353277286e49cee
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout f9b3cd24578401e7a392974b3353277286e49cee
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
> 
> Given this is clang 16.0.0 with
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y, which uses DWARF5 by
> default instead of DWARF4, it looks like older binutils not
> understanding DWARF5. What version of binutils is being used by the bot?

Hi Nathan,

We're using binutils v2.38.90.20220713-2

||/ Name           Version            Architecture Description
+++-==============-==================-============-==========================================
ii  binutils       2.38.90.20220713-2 amd64        GNU assembler, linker 
and binary utilities

Best Regards,
Rong Chen

> CONFIG_DEBUG_INFO_DWARF5 requires 2.35.2, it seems like it might be
> worth trying to extend those dependencies to
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT to avoid issues like this,
> especially in lieu of Nick's series here, which is already codifying the
> implicit default DWARF version of the compiler.
> 
> https://lore.kernel.org/20220826181035.859042-1-ndesaulniers@google.com/
> 
> Cheers,
> Nathan
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
