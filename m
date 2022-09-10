Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6AFA40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662797148; x=1694333148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdZEgvnSQknkUv7xOP/nKaIkrQLGzCwviZhfCZwmB+4=;
  b=f886N9YDW+SRAcQcFgtUktBsQL6zwpnFChWU80BNL3iMrffTm5a/0bv/
   rTz1mCzsoyEnukwArmni5rEsW9mFYasvv9yA7f2bOMX8AHkopDbI8Yhmn
   sIalxC305FoMZT5QjpgFetLNQ9evqiwTt9rONSJWIdoDERqSQk+yp8xIK
   C88UF1EucEz4kFfB/mm9VicpNdSSErVJt4fUnSoXjRkVmnQRNvxulNNDo
   3LfaeJPyCjuO/zjywitP3ZMnyRlxHNtvZhaTNa7U7ALJ/9Wc8SpZzN6jw
   GmEuGg0CuC0JOWoQjJzXIBmefOKouNM5FzKR+QCgtv3owcvz0KAIvaRA2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295207028"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="295207028"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 01:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="645821087"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2022 01:05:46 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWvUo-0002IV-0V;
	Sat, 10 Sep 2022 08:05:46 +0000
Date: Sat, 10 Sep 2022 16:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-mm@kvack.org
Subject: [vbabka-slab:for-6.1/fit_rcu_head 2/2] mm/slab.h:94:1: error:
 static_assert failed due to requirement '((__builtin_offsetof(struct slab,
 counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct
 slab, counters), 16)"
Message-ID: <202209101614.lMCcS0Zj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-6.1/fit_rcu_head
head:   2af0ec317dc8f99f0620af23ff6c288bb6f49be5
commit: 2af0ec317dc8f99f0620af23ff6c288bb6f49be5 [2/2] mm/sl[au]b: rearrange struct slab fields to allow larger rcu_head
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220910/202209101614.lMCcS0Zj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?id=2af0ec317dc8f99f0620af23ff6c288bb6f49be5
        git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
        git fetch --no-tags vbabka-slab for-6.1/fit_rcu_head
        git checkout 2af0ec317dc8f99f0620af23ff6c288bb6f49be5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
>> mm/slab.h:94:1: error: static_assert failed due to requirement '((__builtin_offsetof(struct slab, counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct slab, counters), 16)"
   static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   1 error generated.


vim +94 mm/slab.h

    90	
    91	#undef SLAB_MATCH
    92	static_assert(sizeof(struct slab) <= sizeof(struct page));
    93	#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && defined(CONFIG_SLUB)
  > 94	static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
    95	#endif
    96	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
