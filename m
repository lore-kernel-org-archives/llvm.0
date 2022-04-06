Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9533CB
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649248056; x=1680784056;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mhFf4MzmEvEBuBGPHkwVC+jjG9nj2neUKRDHonPyJwc=;
  b=RY2U7Yli/4sR8xYJjG1GsyKZEiVDj2877oo6s2+DGw61NaUtmBuVhCvB
   Klbr9eyj3ZKgJeIre6IqHhq9c1ICRNalqYO5+oNrDmjGUKXM+ExmZKYKR
   XQbX38I5QQ8EipdNKLusNRE7PMl30WZ9RGB4qfZ6ci8j7WsjGehMHxq0M
   94/0g4XjL2Kx6VjdoBBzEZlk1Bj8a19wlm0QwHJ/DWXfKt4Hwgeus18jQ
   AHBAiKh2kNVl2B/qW0LS/Us9o7cU/YYJ4JtPRFMnOnzWHgzb+UnLoc99V
   aEM90d3B3ECCWEVa93pzIQ32cD4q8vKhzRzMFoNpIuVLbNycCq37lMmQp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240963951"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="240963951"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 05:27:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="570491704"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.173.64]) ([10.249.173.64])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 05:27:33 -0700
Subject: Re: [kbuild-all] Re: drivers/cpuidle/cpuidle-riscv-sbi.c:79:16:
 error: variable has incomplete type 'struct sbiret'
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Anup Patel <anup.patel@wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <202204051441.dQ4w35Ga-lkp@intel.com>
 <019baa48-a594-ba00-67a9-b0eb62b32ac0@infradead.org>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <fbd31f81-9c83-0e0b-38ba-a42ed1e49ec4@intel.com>
Date: Wed, 6 Apr 2022 20:27:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <019baa48-a594-ba00-67a9-b0eb62b32ac0@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/6/2022 2:26 AM, Randy Dunlap wrote:
> Hi,
> 
> On 4/4/22 23:11, kernel test robot wrote:
>> Hi Anup,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   3123109284176b1532874591f7c81f3837bbdc17
>> commit: c5179ef1ca0c39dab6955be6b0e3c034cc4164c8 RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
>> date:   4 weeks ago
>> config: riscv-randconfig-r022-20220405 (https://download.01.org/0day-ci/archive/20220405/202204051441.dQ4w35Ga-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install riscv cross compiling tool for clang build
>>          # apt-get install binutils-riscv64-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c5179ef1ca0c39dab6955be6b0e3c034cc4164c8
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout c5179ef1ca0c39dab6955be6b0e3c034cc4164c8
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
> 
> [delete many build warnings and errors]
> 
>>     3 warnings and 17 errors generated.
>>
>> Kconfig warnings: (for reference only)
>>     WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE
>>     Depends on CPU_IDLE && RISCV && RISCV_SBI
>>     Selected by
>>     - SOC_VIRT && CPU_IDLE
> 
> This Kconfig warning is the root of the problem. All of the build errors
> and warnings can be fixed by something like so. Is it OK?
> 
> ---
>   arch/riscv/Kconfig.socs |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20220404.orig/arch/riscv/Kconfig.socs
> +++ linux-next-20220404/arch/riscv/Kconfig.socs
> @@ -38,7 +38,7 @@ config SOC_VIRT
>   	select SIFIVE_PLIC
>   	select PM_GENERIC_DOMAINS if PM
>   	select PM_GENERIC_DOMAINS_OF if PM && OF
> -	select RISCV_SBI_CPUIDLE if CPU_IDLE
> +	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
>   	help
>   	  This enables support for QEMU Virt Machine.
>   
> [snip]
> 
> Also, to the @bot:
> 
> Why does the reported Kconfig warning look like it was generated
> by some older kconfig software?  Current Kconfig reports more info:

Hi Randy,

The contents were from a special method, not from the output directly,
I will take a look to keep the same with below results.

Best Regards,
Rong Chen

> 
> WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE
>    Depends on [n]: CPU_IDLE [=y] && RISCV [=y] && RISCV_SBI [=n]
>    Selected by [y]:
>    - SOC_VIRT [=y] && CPU_IDLE [=y]
> 
> Thanks.
>>
>> :::::: The code at line 79 was first introduced by commit
>> :::::: 6abf32f1d9c5009dcccded2c1e7ca899a4ab587b cpuidle: Add RISC-V SBI CPU idle driver
>>
>> :::::: TO: Anup Patel <anup.patel@wdc.com>
>> :::::: CC: Palmer Dabbelt <palmer@rivosinc.com>
>>
> 
