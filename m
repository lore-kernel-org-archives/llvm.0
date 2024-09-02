Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F313B7AE;
	Mon,  2 Sep 2024 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271494; cv=none; b=JMVkPX3j71MeCyvPXZvF1W7OeNfUjz5hGaex480oTT//Jxnu1KwY+t1nxzb4Ct+KQgrFPMvCiXlury2pwZ1UIaZthqhb6Rd04dG2OS7e7SQpJR1nmKR0dzwWaiOFM5QFtZxjxlOA3lgPqRlmRK42I2+QjkLNYPm7hvwrGREK/XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271494; c=relaxed/simple;
	bh=q39d6Wu7r5KVtiq7UiyJMFKniusd/YIl+hLBk+224U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j98VHM1I0Pm52LYq5WwpovM9hhN0CBNm9JleMF9RE+DXYsnA1+DmlLVnaSRQDNGuQ+3CW1qbFn8HAbXslTglKH5ixfRyUuR7I8MIwYdRHoTLbKoQdDtvJxO1QHEcnkuIWeY/HoGsOpg1JBnPCmYgxDrpbpV/qOVg7xEJ44uVRhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKfM1E+H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKfM1E+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725271492; x=1756807492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q39d6Wu7r5KVtiq7UiyJMFKniusd/YIl+hLBk+224U8=;
  b=TKfM1E+H7rbsgn/+qA6h2woxLuu9BmwNs42rCHB90J+BXIRP9X+pf8NI
   ZITMdWQRMjkgna1cPikLDBby3EByxW0Yl48XkeL9dPg7APMRyb+O6tmQc
   niXwpuGQhYTF4t1xIdOw3+qBsMtA1D+MzyhvFDIMfaBLLRdkoIcDUSxDQ
   7kOLHCM0h+JKZN1lylsJ6BOgQqyFPWSgS1Lu9Pj1G8Giefo3VDPf34HWo
   erEjmydOveIt5PlSS7Iima2Hi08r/HFUOWbFIM+wa/A7lDN6n1TmTPNNF
   hmEjvT/LbDRkTesGxTrclWiBeifcuZykTpelr9ix+cPQV0YQXkSTIn/8j
   Q==;
X-CSE-ConnectionGUID: bC3rh7gbSPOyE8sRgLm+DQ==
X-CSE-MsgGUID: y0X4IdU1Q2KiOMYHeFQrqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34456282"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="34456282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 03:04:51 -0700
X-CSE-ConnectionGUID: a98hSjKeRsqMRW3hrB1mwA==
X-CSE-MsgGUID: fbg8THvQTEGMZw6B1o9QOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="68952250"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 03:04:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl3vU-0005L6-0y;
	Mon, 02 Sep 2024 10:04:48 +0000
Date: Mon, 2 Sep 2024 18:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [djbw:devsec-20240829 5/6] drivers/pci/tsm.c:215:6: warning:
 variable 'pdev' is used uninitialized whenever 'if' condition is false
Message-ID: <202409021701.f3Xpx5wU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux.git devsec-20240829
head:   c412ecb5794c43513093a92b3730389cfd76e17f
commit: 5807465b92acdf29166415fcf35db30572ffa44b [5/6] PCI/TSM: Authenticate devices via platform TSM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240902/202409021701.f3Xpx5wU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021701.f3Xpx5wU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021701.f3Xpx5wU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/tsm.c:215:6: warning: variable 'pdev' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     215 |         if (tsm_ops)
         |             ^~~~~~~
   drivers/pci/tsm.c:219:19: note: uninitialized use occurs here
     219 |         for_each_pci_dev(pdev)
         |                          ^~~~
   include/linux/pci.h:550:80: note: expanded from macro 'for_each_pci_dev'
     550 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   drivers/pci/tsm.c:215:2: note: remove the 'if' if its condition is always true
     215 |         if (tsm_ops)
         |         ^~~~~~~~~~~~
     216 |                 return -EBUSY;
   drivers/pci/tsm.c:210:22: note: initialize the variable 'pdev' to silence this warning
     210 |         struct pci_dev *pdev;
         |                             ^
         |                              = NULL
   drivers/pci/tsm.c:250:6: warning: variable 'pdev' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     250 |         if (ops != tsm_ops)
         |             ^~~~~~~~~~~~~~
   drivers/pci/tsm.c:252:19: note: uninitialized use occurs here
     252 |         for_each_pci_dev(pdev)
         |                          ^~~~
   include/linux/pci.h:550:80: note: expanded from macro 'for_each_pci_dev'
     550 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   drivers/pci/tsm.c:250:2: note: remove the 'if' if its condition is always true
     250 |         if (ops != tsm_ops)
         |         ^~~~~~~~~~~~~~~~~~~
     251 |                 return;
   drivers/pci/tsm.c:245:22: note: initialize the variable 'pdev' to silence this warning
     245 |         struct pci_dev *pdev;
         |                             ^
         |                              = NULL
   2 warnings generated.


vim +215 drivers/pci/tsm.c

   207	
   208	int pci_tsm_register(const struct pci_tsm_ops *ops, const struct attribute_group *grp)
   209	{
   210		struct pci_dev *pdev;
   211	
   212		if (!ops)
   213			return 0;
   214		guard(rwsem_write)(&pci_tsm_rwsem);
 > 215		if (tsm_ops)
   216			return -EBUSY;
   217		tsm_ops = ops;
   218		pci_tsm_owner_attr_group = grp;
   219		for_each_pci_dev(pdev)
   220			__pci_tsm_init(pdev);
   221		return 0;
   222	}
   223	EXPORT_SYMBOL_GPL(pci_tsm_register);
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
