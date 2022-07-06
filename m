Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAE7C
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657135404; x=1688671404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9W5dFEwCL++hgdF4pj9Fp2+eAdDKMsj+bU7iZIeUnl4=;
  b=YWbkWVKbzza9m624ZwWyLnJZncURox3UqqUJExvpPbStrPeQhPFVzl8K
   WShPj5EUNN+gtd8jtppLSsv7xVO5kGJXPxCoV2x48Th9BWoz8G7AJB9iT
   tCjaStUN2ZljptAUTaLM6832H2WUNbihN6vswMPbyfRUpLdiXc227JoVQ
   /bTjvHiRn9eKEdAn83EoeW3znxgqHG19NZM/R1PCHFHEdyOyQ+WHi3Xak
   YUzfA1CbJddSwQ2NEolSBxOjHYuZy3mtQ7GExESqkGjb3ozUtpTMObDLG
   hsPJzKbAGVO+HAiBVhVzAO4HHLaQNHBdLKwBc+gNAI30iXsrKOSvoAgeK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284588775"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="284588775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 12:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="626032279"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2022 12:23:21 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9AcL-000KxF-0k;
	Wed, 06 Jul 2022 19:23:21 +0000
Date: Thu, 7 Jul 2022 03:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hongchen Zhang <zhanghongchen@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: Re: [PATCH] MIPS: fix pmd_mkinvalid
Message-ID: <202207070340.HGbiEUlO-lkp@intel.com>
References: <1657098456-29244-1-git-send-email-zhanghongchen@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657098456-29244-1-git-send-email-zhanghongchen@loongson.cn>

Hi Hongchen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc5 next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongchen-Zhang/MIPS-fix-pmd_mkinvalid/20220706-171327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e35e5b6f695d241ffb1d223207da58a1fbcdff4b
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20220707/202207070340.HGbiEUlO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cc17741b8218515ea05dd64f5db2402a67e7a821
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hongchen-Zhang/MIPS-fix-pmd_mkinvalid/20220706-171327
        git checkout cc17741b8218515ea05dd64f5db2402a67e7a821
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/mips/mm/init.c:60:6: warning: no previous prototype for function 'setup_zero_pages' [-Wmissing-prototypes]
   void setup_zero_pages(void)
        ^
   arch/mips/mm/init.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void setup_zero_pages(void)
   ^
   static 
>> arch/mips/mm/init.c:454:2: error: call to __compiletime_assert_347 declared with 'error' attribute: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
           BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:354:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:342:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:335:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:174:1: note: expanded from here
   __compiletime_assert_347
   ^
   1 warning and 1 error generated.


vim +/error +454 arch/mips/mm/init.c

1132137e87898d Jiang Liu   2013-07-03  447  
1132137e87898d Jiang Liu   2013-07-03  448  void __init mem_init(void)
1132137e87898d Jiang Liu   2013-07-03  449  {
05d013a0366d50 Paul Burton 2019-09-18  450  	/*
05d013a0366d50 Paul Burton 2019-09-18  451  	 * When _PFN_SHIFT is greater than PAGE_SHIFT we won't have enough PTE
05d013a0366d50 Paul Burton 2019-09-18  452  	 * bits to hold a full 32b physical address on MIPS32 systems.
05d013a0366d50 Paul Burton 2019-09-18  453  	 */
05d013a0366d50 Paul Burton 2019-09-18 @454  	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
05d013a0366d50 Paul Burton 2019-09-18  455  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
