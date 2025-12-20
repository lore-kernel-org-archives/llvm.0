Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2525D209;
	Sat, 20 Dec 2025 19:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258689; cv=none; b=kE1o+322k5BV0MWEmtS15Nkw6FN9SIBrUQeXg2YbvNHq/LRyp86OmawWTv3VAKNeZ6WmaGvprPsQRaAPachGP2GyJ9KR/uIB1VxO4aQGm0sF7z95bxwLUVhgfRe6sjM5kjMTs53qIV17xiarhMe5cDtOeopSEZJ3aTfPDM7zIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258689; c=relaxed/simple;
	bh=6TF01ZtrQwz6e8HxJcIxJclHgCUMrtA1YjdJvEh5Qq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac+T6eTpy0875x2w6b+dLEo3kRJgoLffb0D4cpdsAMszSbV4AMTx+VztfuyvuIxjpN5decLZ4QX7rEGuoT54UmG3EvgdGd0gWvpRTpY6CBPVPEs9xablZdvQPY6KZxBaoWsJt7AMvKypgq6Kyp3AQdigi0ZrdD+PDFW61/RUcds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZX2cVZGr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZX2cVZGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766258687; x=1797794687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TF01ZtrQwz6e8HxJcIxJclHgCUMrtA1YjdJvEh5Qq0=;
  b=ZX2cVZGrQ7aAef+FpEz43OW0oOYUss6fg+WtEw4JxE/rbS6rxqH8j19z
   KdkQFaR9dnNgeSQLKl0Sz/gwRlfIDfFvE+A5v20jV4CiEJz/hTigtObIk
   NBm1r4OCfm25SNR9b9pjDgkFxldZ2FOtvpNgFZ6dyRzCctLddZ8ltgjnx
   +TtX4HJp0E2X5pUk8N1N9K83/bTamXzhkSNaeM67tegQhAxUPcTv48wsM
   CO8fNXJ9zr8nbJgVe4CYh/tB3e2tq6or59TFFaekOgw0UaDNGxD365a3A
   R112kSiLBXLTg4GMsjanR+Ule0cTVehHB0cHWZfQnhVCQOMBj/Ev5pNIG
   Q==;
X-CSE-ConnectionGUID: pob2xuB6S5yZYtSogkp+eA==
X-CSE-MsgGUID: SLOoVXzQQRmgIwFLRs4qvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79550093"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79550093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:24:47 -0800
X-CSE-ConnectionGUID: h9GqUWeITNaiGDcxTZoFTw==
X-CSE-MsgGUID: 2CMvRn82SymoCjtNSXDD/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="230166813"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2025 11:24:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2ZH-000000004ki-3aAc;
	Sat, 20 Dec 2025 19:24:43 +0000
Date: Sat, 20 Dec 2025 20:24:09 +0100
From: kernel test robot <lkp@intel.com>
To: pr-hung <bkedx0000@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/26 1/1] drivers/net/netdevsim/fib.c:1502:58:
 error: expected ';' after top level declarator
Message-ID: <202512202042.eE0RgpF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/26
head:   0c125b4fcef40ea2c876496f0e3b9b6e74dcebde
commit: 0c125b4fcef40ea2c876496f0e3b9b6e74dcebde [1/1] Fix potential vulnerability in cloned code (drivers/net/netdevsim/fib.c)
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251220/202512202042.eE0RgpF8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202042.eE0RgpF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202042.eE0RgpF8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netdevsim/fib.c:58:21: error: duplicate member 'fib_flush_work'
      58 |         struct work_struct fib_flush_work;
         |                            ^
   drivers/net/netdevsim/fib.c:57:21: note: previous declaration is here
      57 |         struct work_struct fib_flush_work;
         |                            ^
>> drivers/net/netdevsim/fib.c:1502:58: error: expected ';' after top level declarator
    1502 | static void nsim_fib_flush_work(struct work_struct *work)
         |                                                          ^
         |                                                          ;
>> drivers/net/netdevsim/fib.c:1507:2: error: expected identifier
    1507 |         struct nsim_fib_data *data = container_of(work, struct nsim_fib_data,
         |         ^
>> drivers/net/netdevsim/fib.c:1507:2: error: expected identifier
>> drivers/net/netdevsim/fib.c:1509:9: error: use of undeclared identifier 'fib_flush_work'; did you mean 'flush_work'?
    1509 |                                                   fib_flush_work);
         |                                                   ^~~~~~~~~~~~~~
         |                                                   flush_work
   include/linux/container_of.h:24:36: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                                           ^
   include/linux/stddef.h:16:57: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^
   include/linux/workqueue.h:610:13: note: 'flush_work' declared here
     610 | extern bool flush_work(struct work_struct *work);
         |             ^
>> drivers/net/netdevsim/fib.c:1506:31: error: expected ';' after expression
    1506 |         struct nsim_fib_data *data = container_of(work, struct nsim_fib_data,
         |                                      ^
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^
   include/linux/stddef.h:16:63: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                                ^
>> drivers/net/netdevsim/fib.c:1506:31: error: expected expression
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^
   include/linux/stddef.h:16:63: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                                ^
>> drivers/net/netdevsim/fib.c:1511:22: error: redefinition of 'fib_rt'
    1511 |         struct nsim_fib_rt *fib_rt, *fib_rt_tmp;
         |                             ^
   drivers/net/netdevsim/fib.c:1510:22: note: previous definition is here
    1510 |         struct nsim_fib_rt *fib_rt, *fib_rt_tmp;
         |                             ^
>> drivers/net/netdevsim/fib.c:1511:31: error: redefinition of 'fib_rt_tmp'
    1511 |         struct nsim_fib_rt *fib_rt, *fib_rt_tmp;
         |                                      ^
   drivers/net/netdevsim/fib.c:1510:31: note: previous definition is here
    1510 |         struct nsim_fib_rt *fib_rt, *fib_rt_tmp;
         |                                      ^
>> drivers/net/netdevsim/fib.c:1526:34: error: expected ')'
    1526 |                                        nsim_fib_rt_ht_params);
         |                                                              ^
   drivers/net/netdevsim/fib.c:1524:25: note: to match this '('
    1524 |                 rhashtable_remove_fast(&data->fib_rt_ht, &fib_rt->ht_node,
         |                                       ^
>> drivers/net/netdevsim/fib.c:1527:33: error: extraneous ')' before ';'
    1527 |                                        nsim_fib_rt_ht_params);
         |                                                             ^
   drivers/net/netdevsim/fib.c:1509:9: warning: expression result unused [-Wunused-value]
    1509 |                                                   fib_flush_work);
         |                                                   ^~~~~~~~~~~~~~
   include/linux/container_of.h:24:36: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                                           ^~~~~~
   include/linux/stddef.h:16:57: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   drivers/net/netdevsim/fib.c:1527:12: warning: expression result unused [-Wunused-value]
    1527 |                                        nsim_fib_rt_ht_params);
         |                                        ^~~~~~~~~~~~~~~~~~~~~
   2 warnings and 11 errors generated.


vim +1502 drivers/net/netdevsim/fib.c

0ae3eb7b461120 Amit Cohen   2021-02-01  1501  
180a6a3ee60a7c Ido Schimmel 2022-07-28 @1502  static void nsim_fib_flush_work(struct work_struct *work)
0c125b4fcef40e pr-hung      2025-12-18  1503  static void nsim_fib_flush_work(struct work_struct *work)
0c125b4fcef40e pr-hung      2025-12-18  1504  {
180a6a3ee60a7c Ido Schimmel 2022-07-28  1505  {
180a6a3ee60a7c Ido Schimmel 2022-07-28 @1506  	struct nsim_fib_data *data = container_of(work, struct nsim_fib_data,
0c125b4fcef40e pr-hung      2025-12-18 @1507  	struct nsim_fib_data *data = container_of(work, struct nsim_fib_data,
0c125b4fcef40e pr-hung      2025-12-18  1508  						  fib_flush_work);
180a6a3ee60a7c Ido Schimmel 2022-07-28 @1509  						  fib_flush_work);
180a6a3ee60a7c Ido Schimmel 2022-07-28  1510  	struct nsim_fib_rt *fib_rt, *fib_rt_tmp;
0c125b4fcef40e pr-hung      2025-12-18 @1511  	struct nsim_fib_rt *fib_rt, *fib_rt_tmp;
180a6a3ee60a7c Ido Schimmel 2022-07-28  1512  
0c125b4fcef40e pr-hung      2025-12-18  1513  
0c125b4fcef40e pr-hung      2025-12-18  1514  	/* Process pending work. */
180a6a3ee60a7c Ido Schimmel 2022-07-28  1515  	/* Process pending work. */
180a6a3ee60a7c Ido Schimmel 2022-07-28  1516  	flush_work(&data->fib_event_work);
0c125b4fcef40e pr-hung      2025-12-18  1517  	flush_work(&data->fib_event_work);
180a6a3ee60a7c Ido Schimmel 2022-07-28  1518  
0c125b4fcef40e pr-hung      2025-12-18  1519  
0c125b4fcef40e pr-hung      2025-12-18  1520  	mutex_lock(&data->fib_lock);
180a6a3ee60a7c Ido Schimmel 2022-07-28  1521  	mutex_lock(&data->fib_lock);
180a6a3ee60a7c Ido Schimmel 2022-07-28  1522  	list_for_each_entry_safe(fib_rt, fib_rt_tmp, &data->fib_rt_list, list) {
0c125b4fcef40e pr-hung      2025-12-18  1523  	list_for_each_entry_safe(fib_rt, fib_rt_tmp, &data->fib_rt_list, list) {
0c125b4fcef40e pr-hung      2025-12-18  1524  		rhashtable_remove_fast(&data->fib_rt_ht, &fib_rt->ht_node,
180a6a3ee60a7c Ido Schimmel 2022-07-28  1525  		rhashtable_remove_fast(&data->fib_rt_ht, &fib_rt->ht_node,
180a6a3ee60a7c Ido Schimmel 2022-07-28 @1526  				       nsim_fib_rt_ht_params);
0c125b4fcef40e pr-hung      2025-12-18 @1527  				       nsim_fib_rt_ht_params);
180a6a3ee60a7c Ido Schimmel 2022-07-28  1528  		nsim_fib_rt_free(fib_rt, data);
0c125b4fcef40e pr-hung      2025-12-18  1529  		nsim_fib_rt_free(fib_rt, data);
0c125b4fcef40e pr-hung      2025-12-18  1530  	}
180a6a3ee60a7c Ido Schimmel 2022-07-28  1531  	}
180a6a3ee60a7c Ido Schimmel 2022-07-28  1532  	mutex_unlock(&data->fib_lock);
0c125b4fcef40e pr-hung      2025-12-18  1533  	mutex_unlock(&data->fib_lock);
0c125b4fcef40e pr-hung      2025-12-18  1534  }
180a6a3ee60a7c Ido Schimmel 2022-07-28  1535  }
180a6a3ee60a7c Ido Schimmel 2022-07-28  1536  

:::::: The code at line 1502 was first introduced by commit
:::::: 180a6a3ee60a7cb69ed1232388460644f6a21f00 netdevsim: fib: Fix reference count leak on route deletion failure

:::::: TO: Ido Schimmel <idosch@nvidia.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
