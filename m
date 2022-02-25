Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EF310EF
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 02:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645755162; x=1677291162;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OjwBjKUhnyQUaR178VPG79ZiTP2RcSZHYXmNw8T4lRs=;
  b=M+uXnBkly+tNyfA6uVrcwE/TYcaAx12sBEsoOJ/bkFXV3t8xZv8SMPS5
   E8UUEVYx29lg85qdLydObL4fz6WKqnLKAz6sRFBzNiiiVrUy/45wdi0X/
   eQDr+JBOLCDqF8OkQgun+kB5bsd5UmueELYiVP6JQqqLKXzw6DvDsTVVp
   3fy15SZx21XOB1pJ/FxFxGHyDpG93G6Dya9Y9tfmN8z9F9AIZ7+faJ86s
   92cBE8GiIdYV/hF70FOs3jnLMM6ppW1AZ+qFK3ybX7FzFVqF3W7C012tm
   1WyPNyE2pwfIDlKXdUVvl5jWzy6WhkI4emD0+ZC3cDDCCTTbsnfUH6tvc
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="249981934"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="249981934"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 18:12:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="639958422"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.31.203]) ([10.255.31.203])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 18:12:34 -0800
Subject: Re: [kbuild-all] Re: [PATCH v2 6/9] KVM: arm64: Detect and handle
 hypervisor stack overflows
To: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Kalesh Singh <kaleshsingh@google.com>, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, Will Deacon
 <will@kernel.org>, Quentin Perret <qperret@google.com>,
 Fuad Tabba <tabba@google.com>, surenb@google.com,
 Android Kernel Team <kernel-team@android.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Morse
 <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Joey Gouly <joey.gouly@arm.com>,
 Peter Collingbourne <pcc@google.com>, Andrew Scull <ascull@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
References: <20220222165212.2005066-7-kaleshsingh@google.com>
 <202202231727.L621fVgD-lkp@intel.com> <875yp63ptg.wl-maz@kernel.org>
 <YhYpvfZaSjrAtkZp@rli9-dbox> <cb750267af0636c49d2f8aa354f086a5@kernel.org>
 <CAMj1kXHsNsQXbeeS1zcy+xYA7kSE5apbLpChohfvkABS7Z6jKg@mail.gmail.com>
 <89c48bd2a9b32b4607d1515714fa3c1b@kernel.org>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <16f47fa9-90b4-0b5c-33cb-cb004fc39266@intel.com>
Date: Fri, 25 Feb 2022 10:12:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <89c48bd2a9b32b4607d1515714fa3c1b@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/24/2022 6:39 PM, Marc Zyngier wrote:
> On 2022-02-23 12:56, Ard Biesheuvel wrote:
>> On Wed, 23 Feb 2022 at 13:54, Marc Zyngier <maz@kernel.org> wrote:
>>>
>>> On 2022-02-23 12:34, Philip Li wrote:
>>> > On Wed, Feb 23, 2022 at 09:16:59AM +0000, Marc Zyngier wrote:
>>> >> On Wed, 23 Feb 2022 09:05:18 +0000,
>>> >> kernel test robot <lkp@intel.com> wrote:
>>> >> >
>>> >> > Hi Kalesh,
>>> >> >
>>> >> > Thank you for the patch! Perhaps something to improve:
>>> >> >
>>> >> > [auto build test WARNING on 
>>> cfb92440ee71adcc2105b0890bb01ac3cddb8507]
>>> >> >
>>> >> > url:    
>>> https://github.com/0day-ci/linux/commits/Kalesh-Singh/KVM-arm64-Hypervisor-stack-enhancements/20220223-010522 
>>>
>>> >> > base:   cfb92440ee71adcc2105b0890bb01ac3cddb8507
>>> >> > config: arm64-randconfig-r011-20220221 
>>> (https://download.01.org/0day-ci/archive/20220223/202202231727.L621fVgD-lkp@intel.com/config) 
>>>
>>> >> > compiler: clang version 15.0.0 
>>> (https://github.com/llvm/llvm-project 
>>> d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
>>> >> > reproduce (this is a W=1 build):
>>> >> >         wget 
>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>> -O ~/bin/make.cross
>>> >> >         chmod +x ~/bin/make.cross
>>> >> >         # install arm64 cross compiling tool for clang build
>>> >> >         # apt-get install binutils-aarch64-linux-gnu
>>> >> >         # 
>>> https://github.com/0day-ci/linux/commit/7fe99fd40f7c4b2973218045ca5b9c9160524db1 
>>>
>>> >> >         git remote add linux-review 
>>> https://github.com/0day-ci/linux
>>> >> >         git fetch --no-tags linux-review 
>>> Kalesh-Singh/KVM-arm64-Hypervisor-stack-enhancements/20220223-010522
>>> >> >         git checkout 7fe99fd40f7c4b2973218045ca5b9c9160524db1
>>> >> >         # save the config file to linux build tree
>>> >> >         mkdir build_dir
>>> >> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang 
>>> make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/
>>> >> >
>>> >> > If you fix the issue, kindly add following tag as appropriate
>>> >> > Reported-by: kernel test robot <lkp@intel.com>
>>> >> >
>>> >> > All warnings (new ones prefixed by >>):
>>> >> >
>>> >> >    include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
>>> >> >    #define NULL ((void *)0)
>>> >> >                 ^~~~~~~~~~~
>>> >> >    arch/arm64/kvm/hyp/nvhe/switch.c:200:27: warning: initializer 
>>> overrides prior initialization of this subobject 
>>> [-Winitializer-overrides]
>>> >> >            [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
>>> >> >                                              ^~~~~~~~~~~~~~~~~~~~~
>>> >> >    arch/arm64/kvm/hyp/nvhe/switch.c:196:28: note: previous 
>>> initialization is here
>>> >> >            [0 ... ESR_ELx_EC_MAX]          = NULL,
>>> >> >                                              ^~~~
>>> >> >    include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
>>> >> >    #define NULL ((void *)0)
>>> >> >                 ^~~~~~~~~~~
>>> >>
>>> >> Kalesh, please ignore this nonsense. There may be things to improve,
>>> >> but this is *NOT* one of them.
>>> >>
>>> >> These reports are pretty useless, and just lead people to ignore real
>>> >> bug reports.
>>> >
>>> > Hi Kalesh, sorry there're some irrelevant issues mixed in the report,
>>> > kindly ignore them. And the valuable ones are the new ones that
>>> > prefixed by >>, as the below one in original report.
>>> >
>>> >>> arch/arm64/kvm/hyp/nvhe/switch.c:372:17: warning: no previous
>>> >>> prototype for function 'hyp_panic_bad_stack' [-Wmissing-prototypes]
>>> >    void __noreturn hyp_panic_bad_stack(void)
>>> >                    ^
>>>
>>> This is only called from assembly code, so a prototype wouldn't bring
>>> much.
>>>
>>
>> Should probably be marked as 'asmlinkage' then. I've suggested many
>> times already that this bogus diagnostic should either be disabled, or
>> disregard 'asmlinkage' symbols.
> 
> Yes, asmlinkage is definitely missing.
> 
> But it is pretty obvious that the robot people aren't interested in
> fixing this particular issue, given how long we have been suggesting
> this...
> 
>          M.

Hi Marc, Ard,

We have ignored the warning related to asmlinkage according to the below 
advice:
 
https://lore.kernel.org/lkml/CAMj1kXHrRYagSVniSetHdG15rkQS+fm4zVOtN=Zda3W0QaEoJA@mail.gmail.com/

do you want the bot ignore such warning if asmlinkage not specified?

Best Regards,
Rong Chen
