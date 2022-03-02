Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB44179
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646202946; x=1677738946;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QDBresT4kLR1cCfGWTt3ps8fR9YuwZAWE6RflB2ZJZ0=;
  b=UOoLIWhXKlreXBD4Hh9ynkJk2vawE1WKgN0e31TlitMiAF29BfV/ylpy
   cNCDBWR8uI1eXGcHKVVpzY7Ht5USC2G+byD6ERI8vG01BUpXMwxzP7gGu
   d0mCfuHHKhIwdED2WMZlEIqJmthyaV48LuMl0T0uSn0ZGfh4D3EypQHSk
   eUNReu50saOQUKi8hV9ig6AcD8WJG3C/UHg0w/RmlvJ7KiQF2sCsn3zOm
   HqsG+fzp90FbBcY7+v+KdprsT+KsW9lc3LzsbjRbyf67iJvcFesyPghaV
   r8JYjKiFB71mtAbDpw60H5WBNkGHy4CJrXaD4UNlSV7QxBtsXc7i83EWi
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253517523"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="253517523"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 22:35:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="535260489"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.171.245]) ([10.249.171.245])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 22:35:43 -0800
Subject: Re: [linux-next:master 4044/9592] arch/arm/kernel/ftrace.c:229:6:
 warning: no previous prototype for function 'prepare_ftrace_return'
To: Ard Biesheuvel <ardb@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
References: <202203020913.I6LbmH7l-lkp@intel.com>
 <CAMj1kXEhEUbiS1QcbAd2+6vg2gWoqYwoDhmxPb1r1GVerjTOTA@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <2db6ea89-846a-8d4e-a5c3-954411332029@intel.com>
Date: Wed, 2 Mar 2022 14:35:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEhEUbiS1QcbAd2+6vg2gWoqYwoDhmxPb1r1GVerjTOTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/2/2022 2:15 PM, Ard Biesheuvel wrote:
> (cc Rong Chen)
> 
> On Wed, 2 Mar 2022 at 03:52, kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   e6ada6df471f847da3b09b357e246c62335bc0bb
>> commit: 41918ec82eb6f80c8b401422f27ca76c85aa0cb7 [4044/9592] ARM: ftrace: enable the graph tracer with the EABI unwinder
>> config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20220302/202203020913.I6LbmH7l-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm cross compiling tool for clang build
>>          # apt-get install binutils-arm-linux-gnueabi
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=41918ec82eb6f80c8b401422f27ca76c85aa0cb7
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 41918ec82eb6f80c8b401422f27ca76c85aa0cb7
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> arch/arm/kernel/ftrace.c:229:6: warning: no previous prototype for function 'prepare_ftrace_return' [-Wmissing-prototypes]
>>     void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>>          ^
>>     arch/arm/kernel/ftrace.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>>     void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>>     ^
>>     static
>>     1 warning generated.
>>
> 
> This function is asmlinkage so why is this still being reported?

Hi Ard,

Thanks for the information, we only checked 'asmlinkage' from warning 
messages:

   >>>> arch/arm/kernel/ftrace.c:229:6: warning: no previous prototype 
for function 'prepare_ftrace_return' [-Wmissing-prototypes]
 >>     void prepare_ftrace_return(unsigned long *parent, unsigned long 
self_addr,

but actually 'asmlinkage' is in another line:

    asmlinkage
    void prepare_ftrace_return(unsigned long *parent, unsigned long 
self_addr,

we missed this kind of problem, I'll take a look at it.

Best Regards,
Rong Chen
