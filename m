Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FF15359D;
	Wed,  3 Apr 2024 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712177596; cv=none; b=HnRJcXi16uK77vIB/jQZnHb4LKIkZRBKcMyOPCGFb/SAIyMOKXB0FVnd347z1mhl/ZRjSRzZEtjWVb5H8QEFWlCkwPDhA8/B9ZWtaGyWbL7N3/iR0D6Qc5u4s0/D1hvHCXjnaXSQsaeohFEE4Q58gO380QgecYMOzOss2nHEVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712177596; c=relaxed/simple;
	bh=V2DegrOQTTOTEA5aZ3Z5myPABWvk0CL070gEcw4i/3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aadQNGMi3UTnwrl1qcD9IyoVkjkMSuZOjFZFIt1bWawZFsP7uYSPGtx+XMfI4eZcgLrXPqbT/omVv7ef+3IgKeRaTngL1l66/hEmpUNHWdMaPezxQ95nacmtKtgt78HJf82TVL/Ly0gy0RmIvCk7Egi6wlIEP9yjart0G+NQJSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRDaVPjT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRDaVPjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712177594; x=1743713594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2DegrOQTTOTEA5aZ3Z5myPABWvk0CL070gEcw4i/3s=;
  b=nRDaVPjT8kou9/ZE3bpVHlB3DUl8UbggjnlYoxU/PQTiuAquiHu9NvWn
   laDSXtMsyXJFMtD7xJDNtdKIozBHbxcuXKHSYH6nKZqCot/vsz22ssY4Y
   AEL4UR6KQicmJBVFBef0EnFRyR32gHiQ4slerl5ESV+CYygevFPlv77CV
   omkdWXp5fHlWks7WcixV7gui5VVkdHmkMdo6dMWrRHkL+SZJvBu8SLudK
   rWRF5SrhaTHMW7nGJ/bq3v2IEDh7+4pKPsZXOywbh5Ic+lO/oymy4A/by
   EFy+Q/3qki9u6VJdRcXhzV2C8L1H5Zv643xR+oXxAP9L+9m7DD8ebpFA+
   w==;
X-CSE-ConnectionGUID: 1XkWDbr/Tr+EMs4OsmB7RQ==
X-CSE-MsgGUID: hDK7AOAlSpqqpNqwRsWu/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="24943034"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="24943034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 13:53:13 -0700
X-CSE-ConnectionGUID: UR+G5ixYSQOPSqxxFg7b5w==
X-CSE-MsgGUID: BofBKiVPRiy/yaccSGBvxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18495327"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2024 13:53:12 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs7ba-0000EE-1a;
	Wed, 03 Apr 2024 20:53:10 +0000
Date: Thu, 4 Apr 2024 04:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 5/10] fs/debugfs/file.c:36:9: error: implicit
 declaration of function 'iov_iter_count' is invalid in C99
Message-ID: <202404040448.aafNQ1ic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8b68c0bba37e427ceb23ae39861ba6816fdec1f9
commit: 9c9b194abb1f6b266a4db14859611801811cf0b3 [5/10] debugfs: convert to ->read_iter()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040448.aafNQ1ic-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040448.aafNQ1ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040448.aafNQ1ic-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/debugfs/file.c:36:9: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return iov_iter_count(from);
                  ^
   1 error generated.


vim +/iov_iter_count +36 fs/debugfs/file.c

    33	
    34	static ssize_t default_write_file_iter(struct kiocb *iocb, struct iov_iter *from)
    35	{
  > 36		return iov_iter_count(from);
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
