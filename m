Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D21FC8
	for <llvm@lists.linux.dev>; Sun,  3 Apr 2022 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648993684; x=1680529684;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=C4ZvdQ5tcQQ8GPLm2xVF3kLJpO9BhdLw6cioFdv2fgc=;
  b=jdrEQSxldu0quAkEGtwSoCTWyOTY/BHN8zeuNr77SlU1qTqV4G8Q8wZS
   hxn+hg15E2D9lvtqDBnE11kYK8FuvBcx7wtgbBb4kAU4UFM6NgHFqBTyC
   xF+l3KLEFvaRvrQw3ipyCUFsxXhaOE6gFav9sqJTfCQVbZ8RELSB3LTII
   iScMualMI+gYcYsO4MqGCG2GIV30LAo4Bpe223jniJA0qjIIe292Q+0bU
   k/1/cTxZvRl9ePjgJUWJCjZOvyeHybrBf8P64JtME5OuIF65PBYT7+F3s
   2jGer+eUv5kYn4zVicRvm+9nTOPfzrgshCSQWefZjtFFHAKBGNO5szAqZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="323561474"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="323561474"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 06:48:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="548363507"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.170.117]) ([10.249.170.117])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 06:48:02 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 14270/15002] ld.lld: error:
 init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x24):
 relocation R_RISCV_HI20 out of range: 530109 is not in [-524288, 524287];
 references initramfs_cookie
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel test robot <lkp@intel.com>
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <202204030606.gML0qvDb-lkp@intel.com>
 <d403df3f-4277-7800-b583-94bdbd7aa9c5@csgroup.eu>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <c1037ece-7b8c-17d5-506e-57a53908669a@intel.com>
Date: Sun, 3 Apr 2022 21:48:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d403df3f-4277-7800-b583-94bdbd7aa9c5@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 4/3/2022 5:40 PM, Christophe Leroy wrote:
> 
> 
> Le 03/04/2022 à 00:08, kernel test robot a écrit :
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
>> commit: af41d2866f7d75bbb38d487f6ec7770425d70e45 [14270/15002] powerpc/64: Fix build failure with allyesconfig in book3s_64_entry.S
>> config: riscv-randconfig-r022-20220403 (https://download.01.org/0day-ci/archive/20220403/202204030606.gML0qvDb-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
>> reproduce (this is a W=1 build):
>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>           chmod +x ~/bin/make.cross
>>           # install riscv cross compiling tool for clang build
>>           # apt-get install binutils-riscv64-linux-gnu
>>           # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af41d2866f7d75bbb38d487f6ec7770425d70e45
>>           git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>           git fetch --no-tags linux-next master
>>           git checkout af41d2866f7d75bbb38d487f6ec7770425d70e45
>>           # save the config file to linux build tree
>>           mkdir build_dir
>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> I can't understand how a change in assembly in POWERPC would impact a


Hi Christophe,

Thanks for the feedback, we'll add the commit to ignore list.

> RISCV build.
> 
> There must be something wrong with the robot.

I checked the errors in parent commit, they are different with the 
errors in the reports:

errors in parent:
   ld.lld: error: init/built-in.a(calibrate.o):(function 
calibrate_delay: .text+0xc4): relocation R_RISCV_HI20 out of range: 
531524 is not in [-524288, 524287]; references __per_cpu_offset
 >>> referenced by calibrate.c
 >>> defined in mm/built-in.a(percpu.o)

   ld.lld: error: init/built-in.a(calibrate.o):(function 
calibrate_delay: .text+0xd8): relocation R_RISCV_HI20 out of range: 
528123 is not in [-524288, 524287]; references cpu_loops_per_jiffy
 >>> referenced by calibrate.c
 >>> defined in init/built-in.a(calibrate.o)

   ld.lld: error: init/built-in.a(calibrate.o):(function 
calibrate_delay: .text+0x104): relocation R_RISCV_HI20 out of range: 
530109 is not in [-524288, 524287]; references preset_lpj
 >>> referenced by calibrate.c
 >>> defined in init/built-in.a(calibrate.o)

The robot only can find the commit, but can't confirm these new errors
are introduced by the commit.

Best Regards,
Rong Chen

> 
> Christophe
> 
> 
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x24): relocation R_RISCV_HI20 out of range: 530109 is not in [-524288, 524287]; references initramfs_cookie
>>      >>> referenced by initramfs.c
>>      >>> defined in init/built-in.a(initramfs.o)
>> --
>>>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0x2c): relocation R_RISCV_HI20 out of range: 530099 is not in [-524288, 524287]; references .LCPI0_0
>>      >>> referenced by cpu.c
>>      >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
>> --
>>>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_parent_hartid: .text+0x160): relocation R_RISCV_HI20 out of range: 529283 is not in [-524288, 524287]; references .L.str
>>      >>> referenced by cpu.c
>>      >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
>> --
>>>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_parent_hartid: .text+0x19c): relocation R_RISCV_HI20 out of range: 530099 is not in [-524288, 524287]; references .LCPI1_0
>>      >>> referenced by cpu.c
>>      >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
>> --
>>>> ld.lld: error: init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x3c): relocation R_RISCV_HI20 out of range: 529437 is not in [-524288, 524287]; references initramfs_domain
>>      >>> referenced by initramfs.c
>>      >>> defined in init/built-in.a(initramfs.o)
>> --
>>>> ld.lld: error: init/built-in.a(initramfs.o):(function panic_show_mem: .text+0xa8): relocation R_RISCV_HI20 out of range: 530099 is not in [-524288, 524287]; references .LCPI8_0
>>      >>> referenced by initramfs.c
>>      >>> defined in init/built-in.a(initramfs.o)
>>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
