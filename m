Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DC4D521;
	Fri, 14 Jul 2023 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689350381; x=1720886381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GcWt58ymzFf+c4Q3JBdGxJV0WurD66SSlbL7CiH9cx0=;
  b=dQQHjoyQGm9rCn13tweJAqj6Ld+pvC719kWjcpw0uK59skZo7ylieobD
   X9Mlbmqy0hNNGfWfDrADFaVmZRcswSmmvKzJakD3cWDDVuqz3J8dp2RaU
   j1FDl6XMlBhH6C7uLeehMxvQwLvvXFs1wWW0gD06Ne6b34nOFv8Eez5eE
   yfdH4/PVZLP+lzrTOwiHai1EwAHk+iIwpktX9wetZFLQrKqQcwPKtxvll
   9yKoKpPfkRKNg9s5LV4N8nAIf+8jvJ2jUlLKcxWjG0C798mmzI/Nb7ycD
   Z06dyyctI8yjzNzm2IcHW2ge+UeVHWA24D/s2jnL/gYXCcdmDlZZ5zqE9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="355438827"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="355438827"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 08:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="716379709"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="716379709"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Jul 2023 08:59:38 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKLCj-0007XF-2d;
	Fri, 14 Jul 2023 15:59:37 +0000
Date: Fri, 14 Jul 2023 23:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 28/106] drivers/dma/bestcomm/bestcomm.c:80:13:
 error: call to undeclared function 'irq_of_parse_and_map'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202307142328.J9cxABDZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   75186f928a91b0ae83e5861463a9d7fb73c3b381
commit: 7a95d2b3843216ca853c8e084bf8d15539871164 [28/106] dmaengine: Explicitly include correct DT includes
config: powerpc-randconfig-r011-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142328.J9cxABDZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142328.J9cxABDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142328.J9cxABDZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/bestcomm/bestcomm.c:80:13: error: call to undeclared function 'irq_of_parse_and_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
         |                    ^
>> drivers/dma/bestcomm/bestcomm.c:105:4: error: call to undeclared function 'irq_dispose_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     105 |                         irq_dispose_mapping(tsk->irq);
         |                         ^
   drivers/dma/bestcomm/bestcomm.c:128:2: error: call to undeclared function 'irq_dispose_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     128 |         irq_dispose_mapping(tsk->irq);
         |         ^
   3 errors generated.


vim +/irq_of_parse_and_map +80 drivers/dma/bestcomm/bestcomm.c

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   44  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   45  struct bcom_task *
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   46  bcom_task_alloc(int bd_count, int bd_size, int priv_size)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   47  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   48  	int i, tasknum = -1;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   49  	struct bcom_task *tsk;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   50  
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-03-22   51  	/* Don't try to do anything if bestcomm init failed */
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-03-22   52  	if (!bcom_eng)
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-03-22   53  		return NULL;
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-03-22   54  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   55  	/* Get and reserve a task num */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   56  	spin_lock(&bcom_eng->lock);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   57  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   58  	for (i=0; i<BCOM_MAX_TASKS; i++)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   59  		if (!bcom_eng->tdt[i].stop) {	/* we use stop as a marker */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   60  			bcom_eng->tdt[i].stop = 0xfffffffful; /* dummy addr */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   61  			tasknum = i;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   62  			break;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   63  		}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   64  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   65  	spin_unlock(&bcom_eng->lock);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   66  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   67  	if (tasknum < 0)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   68  		return NULL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   69  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   70  	/* Allocate our structure */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   71  	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   72  	if (!tsk)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   73  		goto error;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   74  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   75  	tsk->tasknum = tasknum;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   76  	if (priv_size)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   77  		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   78  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   79  	/* Get IRQ of that task */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  @80  	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
aa570be6de67f3 drivers/dma/bestcomm/bestcomm.c         Michael Ellerman   2016-09-10   81  	if (!tsk->irq)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   82  		goto error;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   83  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   84  	/* Init the BDs, if needed */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   85  	if (bd_count) {
6da2ec56059c3c drivers/dma/bestcomm/bestcomm.c         Kees Cook          2018-06-12   86  		tsk->cookie = kmalloc_array(bd_count, sizeof(void *),
6da2ec56059c3c drivers/dma/bestcomm/bestcomm.c         Kees Cook          2018-06-12   87  					    GFP_KERNEL);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   88  		if (!tsk->cookie)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   89  			goto error;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   90  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   91  		tsk->bd = bcom_sram_alloc(bd_count * bd_size, 4, &tsk->bd_pa);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   92  		if (!tsk->bd)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   93  			goto error;
adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2021-10-14   94  		memset_io(tsk->bd, 0x00, bd_count * bd_size);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   95  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   96  		tsk->num_bd = bd_count;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   97  		tsk->bd_size = bd_size;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   98  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16   99  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  100  	return tsk;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  101  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  102  error:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  103  	if (tsk) {
aa570be6de67f3 drivers/dma/bestcomm/bestcomm.c         Michael Ellerman   2016-09-10  104  		if (tsk->irq)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16 @105  			irq_dispose_mapping(tsk->irq);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  106  		bcom_sram_free(tsk->bd);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  107  		kfree(tsk->cookie);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  108  		kfree(tsk);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  109  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  110  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  111  	bcom_eng->tdt[tasknum].stop = 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  112  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  113  	return NULL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  114  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  115  EXPORT_SYMBOL_GPL(bcom_task_alloc);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  116  

:::::: The code at line 80 was first introduced by commit
:::::: 2f9ea1bde0d12d8fb5a7bdc7ab6834275d456262 [POWERPC] bestcomm: core bestcomm support for Freescale MPC5200

:::::: TO: Sylvain Munaut <tnt@246tNt.com>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
