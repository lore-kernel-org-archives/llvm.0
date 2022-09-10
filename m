Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2E7A40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662798420; x=1694334420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8ljAVmxjMrw220kT17XocVDhRfU3GdakOMIPKvIUAc=;
  b=LfVCcUoXVCwlRedDNKmpIleK9MbG8RSQ5hQ6fPPcsTeqaRhSjOCM6mQS
   3xVOaQwJbrYR6VYT2DS8hukaawpJkcTvWG2Iohl27/6SPcCXv3YFgMSRj
   SdILBObltoAWEo6O0FpWta7Lh4FVMXO7aNut+gC38I8fTia4mSjsi2Zzd
   T5xca5JlTNYe5pLPp2Adslc5uVfbTglyz0bv/2Z4ZYOicObyDeq7kYGi2
   cm+BQjQutKgKBIy/ZcUHHjJqZ/+6LndJjqmbxwoJJyj6Ir+BRjdwmMQyb
   8X1h1WBfca0D8sBZst3lmoDF/HrVjxobFbZqhqwvNO59259AVpUHZbwDz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="323845005"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="323845005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 01:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="677459412"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Sep 2022 01:26:47 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWvp8-0002JX-1m;
	Sat, 10 Sep 2022 08:26:46 +0000
Date: Sat, 10 Sep 2022 16:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiebin Sun <jiebin.sun@intel.com>, akpm@linux-foundation.org,
	vasily.averin@linux.dev, shakeelb@google.com, dennis@kernel.org,
	tj@kernel.org, cl@linux.com, ebiederm@xmission.com,
	legion@kernel.org, manfred@colorfullife.com,
	alexander.mikhalitsyn@virtuozzo.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, tim.c.chen@intel.com,
	feng.tang@intel.com, ying.huang@intel.com, tianyou.li@intel.com,
	wangyang.guo@intel.com, jiebin.sun@intel.com
Subject: Re: [PATCH v5 1/2] percpu: Add percpu_counter_add_local and
 percpu_counter_sub_local
Message-ID: <202209101659.cvalTsSU-lkp@intel.com>
References: <20220909203636.2652466-2-jiebin.sun@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909203636.2652466-2-jiebin.sun@intel.com>

Hi Jiebin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiebin-Sun/percpu-Add-percpu_counter_add_local-and-percpu_counter_sub_local/20220910-053730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r041-20220909 (https://download.01.org/0day-ci/archive/20220910/202209101659.cvalTsSU-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/44e7288c01b9b125c7a5f97591ca26ffd90e3385
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiebin-Sun/percpu-Add-percpu_counter_add_local-and-percpu_counter_sub_local/20220910-053730
        git checkout 44e7288c01b9b125c7a5f97591ca26ffd90e3385
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/cred.h:17:
   In file included from include/linux/sched/user.h:7:
>> include/linux/percpu_counter.h:176:2: error: call to undeclared function 'percpu_counter_sub'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           percpu_counter_sub(fbc, amount);
           ^
   include/linux/percpu_counter.h:176:2: note: did you mean 'percpu_counter_set'?
   include/linux/percpu_counter.h:136:20: note: 'percpu_counter_set' declared here
   static inline void percpu_counter_set(struct percpu_counter *fbc, s64 amount)
                      ^
   include/linux/percpu_counter.h:229:20: error: static declaration of 'percpu_counter_sub' follows non-static declaration
   static inline void percpu_counter_sub(struct percpu_counter *fbc, s64 amount)
                      ^
   include/linux/percpu_counter.h:176:2: note: previous implicit declaration is here
           percpu_counter_sub(fbc, amount);
           ^
   2 errors generated.
   make[2]: *** [scripts/Makefile.build:117: arch/hexagon/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1206: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/percpu_counter_sub +176 include/linux/percpu_counter.h

   171	
   172	/* no smp percpu_counter_sub_local is the same with percpu_counter_sub */
   173	static inline void
   174	percpu_counter_sub_local(struct percpu_counter *fbc, s64 amount)
   175	{
 > 176		percpu_counter_sub(fbc, amount);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
