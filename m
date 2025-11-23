Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60DD18027;
	Sun, 23 Nov 2025 02:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863408; cv=none; b=tHUg8SCNtdkUeVsO7oEJefi7iMJTqP9grhWoYip1UaBX8W0xZzWCpuszBBYaxhiCuq1TpALvFqR6zL3tTmr59wWl11w/yKcHLyZKlEOiU58SniwfJHX7zaqGq6HaYE3m/AfVfPEMN5f3/mktz8uJWhnoiYAziUu8RCJBnnSoQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863408; c=relaxed/simple;
	bh=sd1mgJtzDD9Nm1ySa4cX9bFP4ResKfbqI+sgKLUq5mU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UnS28faMCi83WeHGRMnjETgSoZAdXLc6khCFOHAaxb3+JaC0l8l5LAlOsCWNs63UOBXf9WTBT8HX91+34RgL3+8KATiddXMlNWRCSFzgPyQemCqTiSKfY8h0YFgqzlx+ullffRp5L6EgNfg+dgS4cBzhi+hsb3QpTmrN/RSxz7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1JGVMnJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1JGVMnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863407; x=1795399407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sd1mgJtzDD9Nm1ySa4cX9bFP4ResKfbqI+sgKLUq5mU=;
  b=d1JGVMnJuL3/h4k1SplGPR5CzqNCiUqTz2WxOG9wXmMai3q5TEfqvteK
   b08w0+Aqf+GYrVAmy/CFBnuwoq28KOaRjvUnjnDO/qsLbmG84kq0VtkyI
   Nyezru/pbyEKGGylUKbQTsfOMB6hNWbZ87xMBha2aq4nJbZGJCCNvq5h2
   TkQfZmdnlSnrQV8DgMgigi5LnI7xe8QAO10aK7ka2QOLI0iFNjTR3M7cx
   AUapz91ROMg4mZqRvGiTzwjvfkysM8oMuqqixoLAtHH9yXi98Ep7iLrfI
   G4VUafjnecLpoJ9pmXxl3dpfQfzVrNUlfiajxtohySVmDwo2NAYUzWT9W
   Q==;
X-CSE-ConnectionGUID: s/NnJt+8QkiyRqeXNCXH5Q==
X-CSE-MsgGUID: rMX/uhTCQfmLhzBjXC0BQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65801483"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65801483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:03:26 -0800
X-CSE-ConnectionGUID: hdTvJxPLS0O2kMFQ7799VA==
X-CSE-MsgGUID: 7xkqKQtXQTWbBngzvsmA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192482622"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2025 18:03:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzRi-0007z5-35;
	Sun, 23 Nov 2025 02:03:22 +0000
Date: Sun, 23 Nov 2025 10:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 36/51]
 arch/powerpc/platforms/pseries/papr-hvpipe.c:512:8: error: use of undeclared
 label 'free_buf'
Message-ID: <202511231206.7og5sgu2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: 32d597046f4f06db9377a81c80cf4cec01f4c3c4 [36/51] papr-hvpipe: convert papr_hvpipe_dev_create_handle() to FD_PREPARE()
config: powerpc64-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231206.7og5sgu2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231206.7og5sgu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231206.7og5sgu2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-hvpipe.c:512:8: error: use of undeclared label 'free_buf'
     512 |                 goto free_buf;
         |                      ^
   1 error generated.


vim +/free_buf +512 arch/powerpc/platforms/pseries/papr-hvpipe.c

814ef095f12c9f Haren Myneni      2025-09-09  479  
814ef095f12c9f Haren Myneni      2025-09-09  480  static int papr_hvpipe_dev_create_handle(u32 srcID)
814ef095f12c9f Haren Myneni      2025-09-09  481  {
32d597046f4f06 Christian Brauner 2025-11-20  482  	struct hvpipe_source_info *src_info __free(kfree) = NULL;
814ef095f12c9f Haren Myneni      2025-09-09  483  	long err;
814ef095f12c9f Haren Myneni      2025-09-09  484  
814ef095f12c9f Haren Myneni      2025-09-09  485  	spin_lock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  486  	/*
814ef095f12c9f Haren Myneni      2025-09-09  487  	 * Do not allow more than one process communicates with
814ef095f12c9f Haren Myneni      2025-09-09  488  	 * each source.
814ef095f12c9f Haren Myneni      2025-09-09  489  	 */
814ef095f12c9f Haren Myneni      2025-09-09  490  	src_info = hvpipe_find_source(srcID);
814ef095f12c9f Haren Myneni      2025-09-09  491  	if (src_info) {
814ef095f12c9f Haren Myneni      2025-09-09  492  		spin_unlock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  493  		pr_err("pid(%d) is already using the source(%d)\n",
814ef095f12c9f Haren Myneni      2025-09-09  494  				src_info->tsk->pid, srcID);
814ef095f12c9f Haren Myneni      2025-09-09  495  		return -EALREADY;
814ef095f12c9f Haren Myneni      2025-09-09  496  	}
814ef095f12c9f Haren Myneni      2025-09-09  497  	spin_unlock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  498  
814ef095f12c9f Haren Myneni      2025-09-09  499  	src_info = kzalloc(sizeof(*src_info), GFP_KERNEL_ACCOUNT);
814ef095f12c9f Haren Myneni      2025-09-09  500  	if (!src_info)
814ef095f12c9f Haren Myneni      2025-09-09  501  		return -ENOMEM;
814ef095f12c9f Haren Myneni      2025-09-09  502  
814ef095f12c9f Haren Myneni      2025-09-09  503  	src_info->srcID = srcID;
814ef095f12c9f Haren Myneni      2025-09-09  504  	src_info->tsk = current;
814ef095f12c9f Haren Myneni      2025-09-09  505  	init_waitqueue_head(&src_info->recv_wqh);
814ef095f12c9f Haren Myneni      2025-09-09  506  
32d597046f4f06 Christian Brauner 2025-11-20  507  	FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
32d597046f4f06 Christian Brauner 2025-11-20  508  		   anon_inode_getfile("[papr-hvpipe]", &papr_hvpipe_handle_ops,
32d597046f4f06 Christian Brauner 2025-11-20  509  				      (void *)src_info, O_RDWR));
32d597046f4f06 Christian Brauner 2025-11-20  510  	err = ACQUIRE_ERR(fd_prepare, &fdf);
32d597046f4f06 Christian Brauner 2025-11-20  511  	if (err)
814ef095f12c9f Haren Myneni      2025-09-09 @512  		goto free_buf;
814ef095f12c9f Haren Myneni      2025-09-09  513  
32d597046f4f06 Christian Brauner 2025-11-20  514  	retain_and_null_ptr(src_info);
814ef095f12c9f Haren Myneni      2025-09-09  515  	spin_lock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  516  	/*
814ef095f12c9f Haren Myneni      2025-09-09  517  	 * If two processes are executing ioctl() for the same
814ef095f12c9f Haren Myneni      2025-09-09  518  	 * source ID concurrently, prevent the second process to
814ef095f12c9f Haren Myneni      2025-09-09  519  	 * acquire FD.
814ef095f12c9f Haren Myneni      2025-09-09  520  	 */
814ef095f12c9f Haren Myneni      2025-09-09  521  	if (hvpipe_find_source(srcID)) {
814ef095f12c9f Haren Myneni      2025-09-09  522  		spin_unlock(&hvpipe_src_list_lock);
32d597046f4f06 Christian Brauner 2025-11-20  523  		return -EALREADY;
814ef095f12c9f Haren Myneni      2025-09-09  524  	}
814ef095f12c9f Haren Myneni      2025-09-09  525  	list_add(&src_info->list, &hvpipe_src_list);
814ef095f12c9f Haren Myneni      2025-09-09  526  	spin_unlock(&hvpipe_src_list_lock);
32d597046f4f06 Christian Brauner 2025-11-20  527  	return fd_publish(fdf);
814ef095f12c9f Haren Myneni      2025-09-09  528  }
814ef095f12c9f Haren Myneni      2025-09-09  529  

:::::: The code at line 512 was first introduced by commit
:::::: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces

:::::: TO: Haren Myneni <haren@linux.ibm.com>
:::::: CC: Madhavan Srinivasan <maddy@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
