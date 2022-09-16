Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77167E
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 06:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663310247; x=1694846247;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Dm6j0K+r+AWswqX95zRx3GP14ivXJ3chFsRKEvv7R5M=;
  b=cAiKqvcoGrTPwKZtiZ+Pxb0vlg9YSmLbOYEA1c4cBbyuEAVzgID6Zezz
   WQ5WWJl7/I3J3rvXnUbopBXBoi6lcykNzZY0KKIAf966NsSXZ5z54QGeT
   qVd6xetXghwunZTYvLCjLBa2HM043lM1946MKIQQk8RRIAHgwrUZ0aJC1
   1OY/np5jbVF5wsJC3lD5uuQ1objWZEb6EMZuI1COVmNXCcnTW9YBZkz2b
   lvM5BulVla1fVnsT13vLQlqPLf8B7/tkux1gmbdGUdlKnXX+X9CL43TDp
   mqZgRa8Mco2b3OB/LpvdDHFjlwPrRjogS1Q4X/TsKR1D25r6wVyNYNV+N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="385216405"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="385216405"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 23:37:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="721313970"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.210.244]) ([10.254.210.244])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 23:37:25 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 6296/7172] ERROR: modpost:
 "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
To: Masahiro Yamada <masahiroy@kernel.org>, kernel test robot <lkp@intel.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202209150959.hEWCNjXH-lkp@intel.com>
 <CAK7LNARnratU5EcWWEc7m-sxO3pyUJtO_zUhQ+7VF2Fy=au5PQ@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <97021145-ea61-197c-919e-4a3d606547cf@intel.com>
Date: Fri, 16 Sep 2022 14:37:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK7LNARnratU5EcWWEc7m-sxO3pyUJtO_zUhQ+7VF2Fy=au5PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/15/2022 11:39 AM, Masahiro Yamada wrote:
> On Thu, Sep 15, 2022 at 10:37 AM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   f117c01187301a087412bd6697fcf5463cb427d8
>> commit: 6676e2cdd7c339dc40331faccbaac1112d2c1d78 [6296/7172] kbuild: use obj-y instead extra-y for objects placed at the head
>> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220915/202209150959.hEWCNjXH-lkp@intel.com/config)
>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6676e2cdd7c339dc40331faccbaac1112d2c1d78
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 6676e2cdd7c339dc40331faccbaac1112d2c1d78
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "___ratelimit" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "__warn_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "kvm_find_user_return_msr" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "smp_call_function_single" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "cpu_number" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "__per_cpu_offset" [arch/x86/kvm/kvm-intel.ko] undefined!
>>>> ERROR: modpost: "__phys_addr" [arch/x86/kvm/kvm-intel.ko] undefined!
>> WARNING: modpost: suppressed 34935 unresolved symbol warnings because there were too many)
> 
> 
> 
> 
> 
> Sorry, I cannot reproduce this.
> Seeing the full log might be helpful.

Hi Masahiro,

Sorry for the inconvenience, the error can be found with clang-14,
but no error with clang-15, it shouldn't be a kernel issue.

Best Regards,
Rong Chen

> 
> 
> 
> 
> 
>> --
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
> 
> 
> 
