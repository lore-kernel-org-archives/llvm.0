Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B177CEDF;
	Fri,  4 Nov 2022 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667542133; x=1699078133;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+tU/lOoBWBox0mdi+ziiZ54yP1You4GLwSqhkkOENZc=;
  b=C/q7ZFw606elNQAwdKFN6HOXDonH38NLd9zpimabNSd4C/HTiO0iLbNl
   AnDUOEXXgI7JMeYDP1tmSxGajYESkAEtqt0gj9cbmWLF/GQuNNXJKNZv7
   tWFmpvadZ503Zxo4t1Y13VF4BD4Uj5pWQbz/ZWgrv+zAEr3i9EyvqT8ie
   DnG0V+jKFqMNclgrpUeM+7A6HXGOTNgPUp4mCv7TuHohooswGzfTDoEIV
   JMZrHqICJCAKurPTjBlLJeYV9ynPAcViRtEjS00WV+l+7ve/2F+niJneZ
   GnHwKb8KgRVFUN8TuMM/mWrhl2WIoE2l58Ki4UlucfVhWfaw/nwbFVcEk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="371996476"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="371996476"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 23:08:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724232835"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="724232835"
Received: from yuhongwe-mobl.ccr.corp.intel.com (HELO [10.254.215.240]) ([10.254.215.240])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 23:08:50 -0700
Subject: Re: [tip:perf/core 1/2] kernel/events/core.c:181:48: error:
 redefinition of 'cpu_context' as different kind of symbol
To: Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Ravi Bangoria <ravi.bangoria@amd.com>
References: <202210272227.jWuKg5y6-lkp@intel.com>
 <Y1q8DcG09Z0PYXEf@hirez.programming.kicks-ass.net>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <cafa4dbc-0801-9675-a508-6c6c1073cc5d@intel.com>
Date: Fri, 4 Nov 2022 14:08:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y1q8DcG09Z0PYXEf@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/28/2022 1:12 AM, Peter Zijlstra wrote:
> On Thu, Oct 27, 2022 at 10:03:53PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
>> head:   dc39beffcfc19a8dd2a09c5818dcd1a4e9099033
>> commit: 983bd8543b5ab8e9a2870ae258bccd4ce7a22c7c [1/2] perf: Rewrite core context handling
>> config: mips-randconfig-r024-20221026
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install mips cross compiling tool for clang build
>>          # apt-get install binutils-mips64el-linux-gnuabi64
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=983bd8543b5ab8e9a2870ae258bccd4ce7a22c7c
>>          git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
>>          git fetch --no-tags tip perf/core
>>          git checkout 983bd8543b5ab8e9a2870ae258bccd4ce7a22c7c
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> kernel/events/core.c:181:48: error: redefinition of 'cpu_context' as different kind of symbol
>>     static DEFINE_PER_CPU(struct perf_cpu_context, cpu_context);
>>                                                    ^
>>     arch/mips/include/asm/mmu_context.h:106:19: note: previous definition is here
>>     static inline u64 cpu_context(unsigned int cpu, const struct mm_struct *mm)
> 
> *sigh*.. robot people.. this patch has sat in my queue.git for weeks now
> :/

Hi Peter,

Sorry about that, I checked the internal reports, the error was first
found on Oct 14, but it's blocked due to commit id changed in the same
branch, we'll enhance the check logic to avoid blocking such cases.

   [peterz-queue:perf/core 5/6] kernel/events/core.c:181:48: error: 
'cpu_context' redeclared as different kind of symbol


Best Regards,
Rong Chen

> 
> anyway, lemme go fix, this shouldn't be hard.
> 
