Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3261BF58;
	Tue, 15 Oct 2024 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728953721; cv=none; b=nvxn5ghdQVLWsIh0zATpM02ZVJ9i5hyaxQg1i5VQigcZveUyoMdw3LIb1uoAR08sOgLN3c3DNJCWlsI1d5T0lrORaVD4lWPsyKAQ++f42g8Zm0BWT+1JOfyG2UNa2PdXzEE/2RxndnW27xvgXejyB6rMWdQCndY704w3Cay08Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728953721; c=relaxed/simple;
	bh=+N0sTIgv975VDn8Bs7GxqvHTBoaiWaixmReazI1tdoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOsgYTz9EmGPVarFreCkBdaF6sFtFEFePadt+VTMDBCHz06Hbtxh2hsb6W50fMMclj3LxGpNIREcCUUGiQR6Wddk0wojQ0zgB8NTnZwifQPPsYLHtdaBav8B3Z3/q8OUhsFDFONLfhBVMQzIuBbZjCzSURNVo2yaTkrUi/gCKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW8lHevj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW8lHevj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728953719; x=1760489719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+N0sTIgv975VDn8Bs7GxqvHTBoaiWaixmReazI1tdoI=;
  b=NW8lHevjhzYrLGAKp69xxDnIdvN9li1goV78wc2dvWtGe6hs49XIhiY+
   B80YCzxBLsoYBJru6jwQT67VqIcMsYTgQG+dXCn+V9ZOo9Bie4tTEQJVI
   Yw74tSKlDmBmXBq2ETCOFylwYSWG7eOSD4khIJqM2YEnf6yyvT6S61GHJ
   myBnSeZUffibmwwiMQPg0DZf1uQPhvPuYZOY/yzFqjoe9NZ1P3J9ps2BY
   u5vYWuhLMIZStUF+8oCOXBCbUQODlPxl+TYyNjYTKGedQoAkn9WYhFXhL
   xDMuu5YT85pJD02MEopzNI3YbuMo/p+HIWt0zH1a+gwtE8XOsZV0XvgKZ
   w==;
X-CSE-ConnectionGUID: wFVCpSl2Tf2/pQeVyWvS5Q==
X-CSE-MsgGUID: EurlY2irRwSSYLCZrSUEiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50856844"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50856844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:18 -0700
X-CSE-ConnectionGUID: +iDCFSh3RhGtU2PPbkisQw==
X-CSE-MsgGUID: SeMNkn6PSxG0c9R9fjPRFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77813887"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2024 17:55:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0VqE-000HOZ-2X;
	Tue, 15 Oct 2024 00:55:14 +0000
Date: Tue, 15 Oct 2024 08:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daniel-lezcano:thermal/dev-perf-v1 8/9]
 kernel/power/perf_qos.c:478:6: warning: variable 'ret' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202410150841.ENr6fkg9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/daniel.lezcano/linux thermal/dev-perf-v1
head:   03ae7e42a7f5cb3a3639292f533c1dd6c4c3c11b
commit: 1f7344467a794485263db9704f9d20fea8e2d1d7 [8/9] selftests: Add perf_qos selftests
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241015/202410150841.ENr6fkg9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150841.ENr6fkg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150841.ENr6fkg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/perf_qos.c:478:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     478 |         if (pq->minor < 0)
         |             ^~~~~~~~~~~~~
   kernel/power/perf_qos.c:513:17: note: uninitialized use occurs here
     513 |         return ERR_PTR(ret);
         |                        ^~~
   kernel/power/perf_qos.c:478:2: note: remove the 'if' if its condition is always false
     478 |         if (pq->minor < 0)
         |         ^~~~~~~~~~~~~~~~~~
     479 |                 goto out_kfree_pq_descr;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
   kernel/power/perf_qos.c:440:9: note: initialize the variable 'ret' to silence this warning
     440 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +478 kernel/power/perf_qos.c

0fc86ce46fc05c Daniel Lezcano 2024-10-07  433  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  434  struct perf_qos *perf_qos_device_create(const char *name,
0fc86ce46fc05c Daniel Lezcano 2024-10-07  435  					struct perf_qos_ops *ops,
0fc86ce46fc05c Daniel Lezcano 2024-10-07  436  					struct perf_qos_value_descr *descr)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  437  {
0fc86ce46fc05c Daniel Lezcano 2024-10-07  438  	struct device *dev;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  439  	struct perf_qos *pq;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  440  	int ret;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  441  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  442  	if (!ops->set_perf_qos_max || !ops->set_perf_qos_min)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  443  		return ERR_PTR(-EINVAL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  444  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  445  	if (descr->unit < 0 || descr->unit >= PERF_QOS_UNIT_MAX)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  446  		return ERR_PTR(-EINVAL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  447  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  448  	if (descr->limit_min > descr->limit_max)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  449  		return ERR_PTR(-EINVAL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  450  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  451  	if (descr->unit == PERF_QOS_UNIT_NORMAL) {
0fc86ce46fc05c Daniel Lezcano 2024-10-07  452  		if (descr->limit_min < 0 || descr->limit_max > 1024)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  453  			return ERR_PTR(-EINVAL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  454  	}
0fc86ce46fc05c Daniel Lezcano 2024-10-07  455  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  456  	pq = kzalloc(sizeof(*pq), GFP_KERNEL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  457  	if (!pq)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  458  		return ERR_PTR(-ENOMEM);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  459  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  460  	INIT_LIST_HEAD(&pq->perf_min);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  461  	INIT_LIST_HEAD(&pq->perf_max);	
0fc86ce46fc05c Daniel Lezcano 2024-10-07  462  	spin_lock_init(&pq->lock);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  463  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  464  	pq->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  465  	if (!pq->ops) {
0fc86ce46fc05c Daniel Lezcano 2024-10-07  466  		ret = -ENOMEM;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  467  		goto out_kfree_pq;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  468  	}
0fc86ce46fc05c Daniel Lezcano 2024-10-07  469  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  470  	pq->descr = kmemdup(descr, sizeof(*descr), GFP_KERNEL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  471  	if (!pq->descr) {
0fc86ce46fc05c Daniel Lezcano 2024-10-07  472  		ret = -ENOMEM;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  473  		goto out_kfree_pq_ops;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  474  	}
0fc86ce46fc05c Daniel Lezcano 2024-10-07  475  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  476  	pq->minor = idr_alloc(&perf_qos_minors, pq, 0,
0fc86ce46fc05c Daniel Lezcano 2024-10-07  477  			      NUM_PERF_QOS_MINORS, GFP_KERNEL);
0fc86ce46fc05c Daniel Lezcano 2024-10-07 @478  	if (pq->minor < 0)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  479  		goto out_kfree_pq_descr;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  480  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  481  	pq->perf_qos_devt = MKDEV(MAJOR(perf_qos_devt), pq->minor);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  482  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  483  	cdev_init(&pq->perf_qos_cdev, &perf_qos_fops);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  484  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  485  	ret = cdev_add(&pq->perf_qos_cdev, pq->perf_qos_devt, 1);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  486  	if (ret < 0)
0fc86ce46fc05c Daniel Lezcano 2024-10-07  487  		goto out_idr_remove;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  488  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  489  	dev = device_create(perf_qos_class, NULL,
0fc86ce46fc05c Daniel Lezcano 2024-10-07  490  			    pq->perf_qos_devt, NULL, name);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  491  	if (IS_ERR(dev)) {
0fc86ce46fc05c Daniel Lezcano 2024-10-07  492  		ret = PTR_ERR(dev);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  493  		goto out_cdev_del;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  494  	}
0fc86ce46fc05c Daniel Lezcano 2024-10-07  495  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  496  	return pq;
0fc86ce46fc05c Daniel Lezcano 2024-10-07  497  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  498  out_cdev_del:
0fc86ce46fc05c Daniel Lezcano 2024-10-07  499  	cdev_del(&pq->perf_qos_cdev);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  500  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  501  out_idr_remove:
0fc86ce46fc05c Daniel Lezcano 2024-10-07  502  	idr_remove(&perf_qos_minors, pq->minor);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  503  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  504  out_kfree_pq_descr:
0fc86ce46fc05c Daniel Lezcano 2024-10-07  505  	kfree(pq->descr);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  506  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  507  out_kfree_pq_ops:
0fc86ce46fc05c Daniel Lezcano 2024-10-07  508  	kfree(pq->ops);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  509  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  510  out_kfree_pq:
0fc86ce46fc05c Daniel Lezcano 2024-10-07  511  	kfree(pq);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  512  
0fc86ce46fc05c Daniel Lezcano 2024-10-07  513  	return ERR_PTR(ret);
0fc86ce46fc05c Daniel Lezcano 2024-10-07  514  }
0fc86ce46fc05c Daniel Lezcano 2024-10-07  515  

:::::: The code at line 478 was first introduced by commit
:::::: 0fc86ce46fc05cc6b90d32d578efabf2530078a7 power: Userspace performance QoS

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
