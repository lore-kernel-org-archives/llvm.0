Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04018EBD;
	Wed,  3 Jan 2024 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSczjFz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704284403; x=1735820403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozs7xkgpGaxEqLQpNzzTPksf0hY115ZEKGLqa1JJavY=;
  b=NSczjFz1Iq0A9kuEEExwmNptxxaAc8jK5jF6S6HMkpImppjlr0PLTC0o
   PAC0dalonfhI/wJET7nH6eU4Uydncu3giDslDAsXkFiI+qC8BDNUtJ1/7
   t5dxbt5ykMNeewjwC3lBc5dc9XVFP7HD8HYjwS8zsIpcX1ttYp1EEHr9B
   Fh1kehtVFVNtZivzNYymzDADQPxYSzyPa0bYmVk0ZCAQl74rlgoO1zRtu
   T/G0p/4Fz4YNu7jUy/vpWaMkCNRuAZgx8EKHGIA2/EyasVD2TamoJfRIa
   qTxAazEuhC7ut+iBxOfYVzKTU8FPMWfoTjyqG+UbX/D8vIteVbqJE1sAX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="394154147"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="394154147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 04:20:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="808821608"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="808821608"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2024 04:19:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL0Dz-000M4a-24;
	Wed, 03 Jan 2024 12:19:55 +0000
Date: Wed, 3 Jan 2024 20:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	luming.yu@gmail.com, ke.zhao@shingroup.cn, dawei.li@shingroup.cn,
	shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH v1 1/1] powerpc/powernv: fix up kernel compile issues
Message-ID: <202401032003.71Dm6nhR-lkp@intel.com>
References: <9D8FEE1731685D9B+20240102024834.1276-2-luming.yu@shingroup.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9D8FEE1731685D9B+20240102024834.1276-2-luming.yu@shingroup.cn>

Hi Luming,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.7-rc8 next-20240103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luming-Yu/powerpc-powernv-fix-up-kernel-compile-issues/20240102-105402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/9D8FEE1731685D9B%2B20240102024834.1276-2-luming.yu%40shingroup.cn
patch subject: [PATCH v1 1/1] powerpc/powernv: fix up kernel compile issues
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20240103/202401032003.71Dm6nhR-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project baf8a39aaf8b61a38b5b2b5591deb765e42eb00b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401032003.71Dm6nhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401032003.71Dm6nhR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/nx/nx-common-powernv.c:718:13: error: call to undeclared function 'cpu_to_chip_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     718 |                 chip_id = cpu_to_chip_id(i);
         |                           ^
   1 error generated.


vim +/cpu_to_chip_id +718 drivers/crypto/nx/nx-common-powernv.c

b0d6c9bab5e41d drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-08-31  703  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  704  /*
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  705   * Identify chip ID for each CPU, open send wndow for the corresponding NX
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  706   * engine and save txwin in percpu cpu_txwin.
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  707   * cpu_txwin is used in copy/paste operation for each compression /
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  708   * decompression request.
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  709   */
4aebf3ce26ca21 drivers/crypto/nx/nx-common-powernv.c Haren Myneni   2020-04-17  710  static int nx_open_percpu_txwins(void)
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  711  {
4aebf3ce26ca21 drivers/crypto/nx/nx-common-powernv.c Haren Myneni   2020-04-17  712  	struct nx_coproc *coproc, *n;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  713  	unsigned int i, chip_id;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  714  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  715  	for_each_possible_cpu(i) {
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  716  		struct vas_window *txwin = NULL;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  717  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24 @718  		chip_id = cpu_to_chip_id(i);
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  719  
4aebf3ce26ca21 drivers/crypto/nx/nx-common-powernv.c Haren Myneni   2020-04-17  720  		list_for_each_entry_safe(coproc, n, &nx_coprocs, list) {
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  721  			/*
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  722  			 * Kernel requests use only high priority FIFOs. So
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  723  			 * open send windows for these FIFOs.
4aebf3ce26ca21 drivers/crypto/nx/nx-common-powernv.c Haren Myneni   2020-04-17  724  			 * GZIP is not supported in kernel right now.
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  725  			 */
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  726  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  727  			if (coproc->ct != VAS_COP_TYPE_842_HIPRI)
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  728  				continue;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  729  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  730  			if (coproc->chip_id == chip_id) {
4aebf3ce26ca21 drivers/crypto/nx/nx-common-powernv.c Haren Myneni   2020-04-17  731  				txwin = nx_alloc_txwin(coproc);
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  732  				if (IS_ERR(txwin))
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  733  					return PTR_ERR(txwin);
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  734  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  735  				per_cpu(cpu_txwin, i) = txwin;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  736  				break;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  737  			}
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  738  		}
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  739  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  740  		if (!per_cpu(cpu_txwin, i)) {
6905c461e539ca drivers/crypto/nx/nx-842-powernv.c    Colin Ian King 2017-11-14  741  			/* shouldn't happen, Each chip will have NX engine */
6905c461e539ca drivers/crypto/nx/nx-842-powernv.c    Colin Ian King 2017-11-14  742  			pr_err("NX engine is not available for CPU %d\n", i);
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  743  			return -EINVAL;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  744  		}
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  745  	}
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  746  
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  747  	return 0;
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  748  }
976dd6490b1b45 drivers/crypto/nx/nx-842-powernv.c    Haren Myneni   2017-09-24  749  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
