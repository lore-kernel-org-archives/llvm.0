Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A674F131BDF;
	Mon,  5 Aug 2024 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875592; cv=none; b=R/IxZOMNI0nP1Y+FE4b4vX5pShakbzxnwkqmQMqfFP0dp57h3TcuOUEvsy3W1X7I9mveMSlGJZc3Dc7xtKZZRuDoXnkC9NEP1vWnDmN47poa7414m6VxMDixIGztXt+LQ92DRTALr2I6VDQlgw1Xl6bpBX42FlwVK+LowsnPVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875592; c=relaxed/simple;
	bh=HLra3pOX4rLuYZsE8N+OeO0Hvt3DmFzvBG3GfN2GKTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AL50gYgCbldYRtmnBSW6012t+AURlLAldvZwpDohUtYGQ1O7tYOiYFP+9/UuQ90gVot45HaTEuXzU9FojLbIQoe5/LT1U71txrKqiVnANL7T7my2aKUH/LD79B5R7dqcuyv1j6Zv2g6mjpJZIkZiNMRUDgDp59RkKtxlZvJb/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYJALKRI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYJALKRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722875591; x=1754411591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLra3pOX4rLuYZsE8N+OeO0Hvt3DmFzvBG3GfN2GKTk=;
  b=PYJALKRINJG+gSxBZFNAwsXahNm5ZyH6PfcjNMDQQQg1WSZAuc/KR+cb
   dcphWo/g/tH9FZBt7dTlw7FvqFYtvXmmLERRneI9/QEBJ1xtb8hKrE1Sg
   mMVeFux8+ClgLKv9/3ZxZxoiJ9nvqonMP17Uieu6BNLa2L2S3a5chLBOv
   GD5kixNo7DSdL04fqVLlsCv06eTKNsxlydlldKiio5pFEOM9aMeZxGYuw
   zZC2OxKnJX0DJIhVQwwvegcLTdVswsue14EpDEO2mqybeRa14SA9hYciy
   BxC/mXTonMOiiTI4aauvuUD/nKWH9bywSnXVV8qXt/EM1xiQ56EXSydUr
   Q==;
X-CSE-ConnectionGUID: 0wDiTWkvSiuvq1V4GxRzBw==
X-CSE-MsgGUID: rrlB/pmHRYmACv/U4cDHYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31512667"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="31512667"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 09:33:10 -0700
X-CSE-ConnectionGUID: l/bVIwbnTm+Qhew7r+XvTg==
X-CSE-MsgGUID: y4YP57iDROmfyTLmT1oQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="61179639"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Aug 2024 09:33:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb0dp-0003BE-2d;
	Mon, 05 Aug 2024 16:33:03 +0000
Date: Tue, 6 Aug 2024 00:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 332/442] arch/x86/kernel/apm_32.c:1446:28:
 error: use of undeclared identifier 'fp'
Message-ID: <202408060005.Ab59iVi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   51036f9719aad90aa0e0ca1aa9443e6ce79c0fd2
commit: 3da08857bbcbd903db68fc36c7a2f79f8fecbadb [332/442] x86/kernel: convert to read/write iterators
config: i386-buildonly-randconfig-002-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060005.Ab59iVi3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060005.Ab59iVi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060005.Ab59iVi3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apm_32.c:1446:28: error: use of undeclared identifier 'fp'
    1446 |         if ((queue_empty(as)) && (fp->f_flags & O_NONBLOCK))
         |                                   ^
   1 error generated.


vim +/fp +1446 arch/x86/kernel/apm_32.c

^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1433  
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1434  static ssize_t do_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1435  {
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1436  	size_t count = iov_iter_count(to);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1437  	struct apm_user *as;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1438  	int i;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1439  	apm_event_t event;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1440  
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1441  	as = iocb->ki_filp->private_data;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1442  	if (check_apm_user(as, "read"))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1443  		return -EIO;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1444  	if ((int)count < sizeof(apm_event_t))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1445  		return -EINVAL;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16 @1446  	if ((queue_empty(as)) && (fp->f_flags & O_NONBLOCK))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1447  		return -EAGAIN;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1448  	wait_event_interruptible(apm_waitqueue, !queue_empty(as));
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1449  	i = count;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1450  	while ((i >= sizeof(event)) && !queue_empty(as)) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1451  		event = get_queued_event(as);
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1452  		if (!copy_to_iter_full(&event, sizeof(event), to)) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1453  			if (i < count)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1454  				break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1455  			return -EFAULT;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1456  		}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1457  		switch (event) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1458  		case APM_SYS_SUSPEND:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1459  		case APM_USER_SUSPEND:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1460  			as->suspends_read++;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1461  			break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1462  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1463  		case APM_SYS_STANDBY:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1464  		case APM_USER_STANDBY:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1465  			as->standbys_read++;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1466  			break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1467  		}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1468  		i -= sizeof(event);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1469  	}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1470  	if (i < count)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1471  		return count - i;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1472  	if (signal_pending(current))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1473  		return -ERESTARTSYS;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1474  	return 0;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1475  }
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1476  

:::::: The code at line 1446 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
