Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03FF2CA1
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643263845; x=1674799845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=riEpO+QzrLVYviJfYIXLakybr7LU3I414OdzTpUAtXg=;
  b=AezUFuCaqYC37km095sia+6K0F0yjImZ7UxnWKeZ8oSrWWIOkHNlffMO
   bEQJKcr7B3yaXmats78r4Owy5khPab+7IQHN4nEhTdqu/apuRkIk1tM/L
   Z/z/mbFPH8duvLUMUEbLbu0DEmUSuWOqrkDg9fSfxTb4xHmo8eQZeWEa2
   0VCbJOC9jphOuAVQqYGDijRjtsYrAKLDcCc/iXtc8f6IqcKwB3NTrzNrQ
   6BJhDbVnDlQznoKxz4dftVXUGgeLJ023wTTqPSDgyNLxtB8A7wQ4Fij/t
   LakfTu9JfSeRu4ScRhDhtQ67ShytcjAnrvstBJkLbC1so4x/18T3yPBr0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333115553"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="333115553"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 22:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="696522154"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2022 22:10:43 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCxzX-000MDU-2p; Thu, 27 Jan 2022 06:10:43 +0000
Date: Thu, 27 Jan 2022 14:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Stephane Eranian <eranian@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 03/13] perf/x86/amd: add AMD Fam19h Branch Sampling
 support
Message-ID: <202201271410.cro07bYq-lkp@intel.com>
References: <20220126233454.3362047-4-eranian@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126233454.3362047-4-eranian@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stephane,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220125]
[cannot apply to tip/x86/core rafael-pm/linux-next tip/perf/core v5.17-rc1 v5.16 v5.16-rc8 v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephane-Eranian/perf-core-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
base:    d25ee88530253138d0b20d43511ca5acbda4e9f7
config: i386-randconfig-a011-20220124 (https://download.01.org/0day-ci/archive/20220127/202201271410.cro07bYq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/933d072f6e0c0409115a8038a89a56979a042d30
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephane-Eranian/perf-core-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
        git checkout 933d072f6e0c0409115a8038a89a56979a042d30
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/events/amd/ drivers/acpi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/core.c:676:24: warning: variable 'hwc' set but not used [-Wunused-but-set-variable]
           struct hw_perf_event *hwc;
                                 ^
   1 warning generated.


vim +/hwc +676 arch/x86/events/amd/core.c

   672	
   673	static void amd_pmu_enable_all(int added)
   674	{
   675		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 > 676		struct hw_perf_event *hwc;
   677		int idx;
   678	
   679		amd_brs_enable_all();
   680	
   681		for (idx = 0; idx < x86_pmu.num_counters; idx++) {
   682			hwc = &cpuc->events[idx]->hw;
   683	
   684			/* only activate events which are marked as active */
   685			if (!test_bit(idx, cpuc->active_mask))
   686				continue;
   687	
   688			amd_pmu_enable_event(cpuc->events[idx]);
   689		}
   690	}
   691	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
