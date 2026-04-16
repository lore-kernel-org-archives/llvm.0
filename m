Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A182352F95;
	Thu, 16 Apr 2026 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776371602; cv=none; b=QIuu50hw7IBueFrdwHCQm9lfJKw/MlGrz5Z4nC9XvRoHrA2G329RU7/r5jEWm4t+fq8CCuadIE+MTGUDFOl13KYTCphqahluAgx0BSn8ao0NjHCnv3M70UooKN5OlkVsI7nI6oufBz3/G1kniN0n4LEeceI/8BQfcb/xI4mQ4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776371602; c=relaxed/simple;
	bh=Ei5va1fjDg0bcmTbnHyQtpvSn+raLTs8Tox89Wo4KIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bAW5LK+nH6IsABMAPwKE4Nu3WLqmBxhAX72t2YsDPsNIT/ykJyjRj4YPgOTHuZEGd9AsyXZMN3tXI/Z9KDXN4NHdiw/qjAI+ZIuOzzKRAHF2tN9nD1Kk0NQ0kQfxRoW0X8lzmfz9CoygZXbWRi9S4sH/7P0JlHex2AKg49BjLsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP4YsaIf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP4YsaIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776371601; x=1807907601;
  h=date:from:to:cc:subject:message-id;
  bh=Ei5va1fjDg0bcmTbnHyQtpvSn+raLTs8Tox89Wo4KIo=;
  b=QP4YsaIfrt6mYbxXDVbuWIdaQphntZB2U3vulsUEvZUKYQN8afNYnWS6
   V6MRJqSUgbtxCg3pK5/MUwJzyP3Lqdy8e3HxBacUv4SbOt4NMT/p9l4M5
   YrnPfkNbfQGkKR71W9/PTOikEt66MZ7P3MniAcaOpGZ3ortP/d+H1KlQ1
   PQSbUqc2+N4MsCY/BM/+rmxlp59PirmTetIgDLUWlJ3RG3ajjsT5ntd/4
   LTYvcOCj5sp4MuxYz+fGVw1qrfS2K2o+wbWgq9HcYMyh4eQN+xd1ycjAJ
   lWy3R8Wz9JfitXtk8IwENC83vea7VVOYkfNnblKZl/6k5O1qBXlME8kEu
   Q==;
X-CSE-ConnectionGUID: Ytf84KysQRStjlgQE6NJZA==
X-CSE-MsgGUID: v8wQPJ0SQqOE9b2rHptDHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81265556"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81265556"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 13:33:20 -0700
X-CSE-ConnectionGUID: Ozu4AvwoRc6WF0NQP0aq0w==
X-CSE-MsgGUID: 4LPlzfuUQ8aHvVK+45uPNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="226493407"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2026 13:33:18 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDTOm-000000001vG-1NIy;
	Thu, 16 Apr 2026 20:33:16 +0000
Date: Fri, 17 Apr 2026 04:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Namjae Jeon <linkinjeon@kernel.org>
Subject: [linkinjeon-ntfs:ntfs-next 47/48] fs/ntfs/file.c:657:6:
 error: call to undeclared function 'vma_desc_test'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202604170407.bqLb88Ri-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   75579d45c31244811d57ae99692b6c3d197560b4
commit: 50ba0870ccdba0b8fa15f1eb0e11bfa08185c383 [47/48] ntfs: fix build error due to vma_desc_test() rename
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260417/202604170407.bqLb88Ri-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170407.bqLb88Ri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170407.bqLb88Ri-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ntfs/file.c:657:6: error: call to undeclared function 'vma_desc_test'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (vma_desc_test(desc, VMA_WRITE_BIT)) {
               ^
   1 error generated.


vim +/vma_desc_test +657 fs/ntfs/file.c

   645	
   646	static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
   647	{
   648		struct file *file = desc->file;
   649		struct inode *inode = file_inode(file);
   650	
   651		if (NVolShutdown(NTFS_SB(file->f_mapping->host->i_sb)))
   652			return -EIO;
   653	
   654		if (NInoCompressed(NTFS_I(inode)))
   655			return -EOPNOTSUPP;
   656	
 > 657		if (vma_desc_test(desc, VMA_WRITE_BIT)) {
   658			struct inode *inode = file_inode(file);
   659			loff_t from, to;
   660			int err;
   661	
   662			from = ((loff_t)desc->pgoff << PAGE_SHIFT);
   663			to = min_t(loff_t, i_size_read(inode),
   664				   from + desc->end - desc->start);
   665	
   666			if (NTFS_I(inode)->initialized_size < to) {
   667				err = ntfs_extend_initialized_size(inode, to, to, false);
   668				if (err)
   669					return err;
   670			}
   671		}
   672	
   673	
   674		file_accessed(file);
   675		desc->vm_ops = &ntfs_file_vm_ops;
   676		return 0;
   677	}
   678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
