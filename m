Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87238384;
	Wed, 12 Mar 2025 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764317; cv=none; b=eufGx/f/4KGBspHENwZPIxX8Zq+V2mvxjzjAomYZic6iwv/qXjF6i7zsw2ji68O3/lhL1FvUswogl199GCtWDkRJ+VfcYPgVWeCiqORwjz+Sil+AqTVLGMK5aMLQvDM2GIJjRelDYI3RL7+Hs54IQCgg4W2TE/H/IiT/EiDiME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764317; c=relaxed/simple;
	bh=SNjA+2PggPZGEB+Qo0KnyamhzUujGaZLaW7bPNW3ZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9GDUYmfcZkZJn5iOijxjkL0xThJd+liAe8MN5hFcPtMjT+Wckcif/dirWB41H/OnNwlqrEzyeGufcJbIoUGuTR1JX8cJNFabbnZ1v+Qd/hIgFdrsKCqoU+eUFzPnD9Z1Id5y3/jYlxYocyLm9K8WOsRe/pxBUUqm/pnIIU+40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNSjdCN/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNSjdCN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741764316; x=1773300316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNjA+2PggPZGEB+Qo0KnyamhzUujGaZLaW7bPNW3ZOc=;
  b=XNSjdCN/8Blcc3cRZz0+U6wHlTVQA6te2fQJpDOqmio2C8ItoBZhJnWk
   /hvQQPPofay6fJuVBdP5mImIVqxP6gJyovnwv0fe3kKw3IR64+k1MsLyJ
   bNHcoI5X+CvHEFJqucRpslvCZWj859JoMQl7PkcXFLGk+ieBFvy+4mRNu
   56foxpB6pSkPOROHbe1rKo7OV3e7o9grE25yb15kcw+WJKV+SOf3Oh21X
   2uqPkGX1Riy60lmYkD5S+XgSzsJMMorg+5waODoZ2zoS5/YBa0vh28xA3
   Zp79EzF+3e0GZ2Xex5Zr3e3R07u4a00KSK0bu3OOSkFWN4364YYFVUQIo
   Q==;
X-CSE-ConnectionGUID: ZaPmVMuHSF+DBJA/3ezQKQ==
X-CSE-MsgGUID: s7O6uOrqQAG9Q3pLkpj63g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42552930"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42552930"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:25:15 -0700
X-CSE-ConnectionGUID: z98GSnSMQruGJop43qE18w==
X-CSE-MsgGUID: PaeWUKgHSSOxdHSI4rwJKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="151369914"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2025 00:25:13 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsGSO-0008DU-1F;
	Wed, 12 Mar 2025 07:25:06 +0000
Date: Wed, 12 Mar 2025 15:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v5 11/14] kernel/kexec_handover.c:386:9: warning: variable
 'err' is uninitialized when used here
Message-ID: <202503121551.InIOkfiZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v5
head:   d5a7d2cfaba824b4c5af065e4a88b5d5676ce370
commit: 4381c43cfcbab7c3822ade60ab9547007ea1bbcf [11/14] arm64: Add KHO support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503121551.InIOkfiZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121551.InIOkfiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121551.InIOkfiZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec_handover.c:386:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
     386 |         return err;
         |                ^~~
   kernel/kexec_handover.c:370:9: note: initialize the variable 'err' to silence this warning
     370 |         int err;
         |                ^
         |                 = 0
   1 warning generated.
--
>> kernel/kexec_handover.c:798: warning: Function parameter or struct member 'size' not described in 'kho_preserve_phys'


vim +/err +386 kernel/kexec_handover.c

6d6f81c097d286f Alexander Graf 2024-01-17  365  
fab9bce0dd59678 Alexander Graf 2024-01-17  366  /* Handling for debugfs/kho/in */
fab9bce0dd59678 Alexander Graf 2024-01-17  367  static __init int kho_in_debugfs_init(const void *fdt)
fab9bce0dd59678 Alexander Graf 2024-01-17  368  {
fab9bce0dd59678 Alexander Graf 2024-01-17  369  	struct dentry *file;
fab9bce0dd59678 Alexander Graf 2024-01-17  370  	int err;
fab9bce0dd59678 Alexander Graf 2024-01-17  371  
fab9bce0dd59678 Alexander Graf 2024-01-17  372  	kho_in.dir = debugfs_create_dir("in", debugfs_root);
fab9bce0dd59678 Alexander Graf 2024-01-17  373  	if (!kho_in.dir)
fab9bce0dd59678 Alexander Graf 2024-01-17  374  		return -ENOMEM;
fab9bce0dd59678 Alexander Graf 2024-01-17  375  
fab9bce0dd59678 Alexander Graf 2024-01-17  376  	kho_in.fdt.size = fdt_totalsize(fdt);
fab9bce0dd59678 Alexander Graf 2024-01-17  377  	kho_in.fdt.data = (void *)fdt;
fab9bce0dd59678 Alexander Graf 2024-01-17  378  	file = debugfs_create_blob("fdt", 0400, kho_in.dir, &kho_in.fdt);
fab9bce0dd59678 Alexander Graf 2024-01-17  379  	if (!file)
fab9bce0dd59678 Alexander Graf 2024-01-17  380  		goto err_rmdir;
fab9bce0dd59678 Alexander Graf 2024-01-17  381  
fab9bce0dd59678 Alexander Graf 2024-01-17  382  	return 0;
fab9bce0dd59678 Alexander Graf 2024-01-17  383  
fab9bce0dd59678 Alexander Graf 2024-01-17  384  err_rmdir:
fab9bce0dd59678 Alexander Graf 2024-01-17  385  	debugfs_remove(kho_in.dir);
fab9bce0dd59678 Alexander Graf 2024-01-17 @386  	return err;
fab9bce0dd59678 Alexander Graf 2024-01-17  387  }
fab9bce0dd59678 Alexander Graf 2024-01-17  388  

:::::: The code at line 386 was first introduced by commit
:::::: fab9bce0dd59678d69807e8ee4864ce8af2f2d42 kexec: Add KHO parsing support

:::::: TO: Alexander Graf <graf@amazon.com>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
