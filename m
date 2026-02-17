Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DB32E122;
	Tue, 17 Feb 2026 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340212; cv=none; b=mLu6CJ0LbYgQnt6RtF/qsEMzUj2lx6nNXoc4cf/+9i5g6gEyn+pJ17kKh+8n6GG2letoFTKKUdEzwDqSSW2xq6++Vk4xIyr3wjK7NqDRwz1/AElOqf8q9oF8no8Rotx+E74Rk6KWxMIwQpf5F8rXGuU0vN/Bw5IJJXLLClknLuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340212; c=relaxed/simple;
	bh=8+UIna8zVntFjbyAuLSV2KfsFHoHRxUkGpRYhS+dTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VmDc7G3p1rEwwmqFfW6UbLlkk0YTESZxF5FD+bwUtiPu9j0pGujSpduoS41OH+siGHhD1TwUpwB/OZPY9I8/Vxc8fKQUICWm31/vsnpepCcFBexGTZGo1NShl+/aSEttwPqOg+AzZGn1YK7UrSEI3vSsOxmW9KXn2oy6+A9Eb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXLC2DYA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXLC2DYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771340210; x=1802876210;
  h=date:from:to:cc:subject:message-id;
  bh=8+UIna8zVntFjbyAuLSV2KfsFHoHRxUkGpRYhS+dTbQ=;
  b=XXLC2DYAXdxpJRaXM/RVVI7fxN5cZNxqqspWhsPhy0sZZds2jXwUQZ75
   WMfykpZM60dEGFgx80RsIs+e/FAGddSPYxPUrRsi6KvNAX8o7t5eWEPzq
   UoeszEuNihc3xgF8DbhqEeZRnL1q/AL+ktHzVkC8y2nlKzvaOF0akBdNG
   V8esRhkac/aoa+s812gspnJd65X02sgtKBznl/3EwKRp0Unt2YUC7OD6a
   ErzDXYQd/PBQUdI4xhHOGaiWA5s+hRd/5uHddaXiX+RV22goUtt76C9zN
   CxkOtZFCEMT51dU4miC2OtT6cv/6aXI1cT4/ZbAkiYySzrq6CuZnJ231H
   A==;
X-CSE-ConnectionGUID: zRLF6QsfRv2FlZuWAsq/MA==
X-CSE-MsgGUID: H93ln2Y8Sl6XpOTlshEnDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71429823"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="71429823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 06:56:50 -0800
X-CSE-ConnectionGUID: kS9UL96+RxatY/6GKeJypw==
X-CSE-MsgGUID: Zqv2phhZSYOA1Gp2c1fsGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="212790959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2026 06:56:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsMVK-00000001152-1gct;
	Tue, 17 Feb 2026 14:56:46 +0000
Date: Tue, 17 Feb 2026 22:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 18/18] fs/ntfs/file.c:657:6:
 error: call to undeclared function 'vma_desc_test_flags'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202602172218.9FUa0Nuv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Namjae,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   225383c049d157bd7d3af29707c830a9474bf74a
commit: 225383c049d157bd7d3af29707c830a9474bf74a [18/18] ntfs: update all remaining mmap_prepare users to use vma_flags_t
config: x86_64-randconfig-012-20260217 (https://download.01.org/0day-ci/archive/20260217/202602172218.9FUa0Nuv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172218.9FUa0Nuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172218.9FUa0Nuv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ntfs/file.c:657:6: error: call to undeclared function 'vma_desc_test_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
         |             ^
   1 error generated.


vim +/vma_desc_test_flags +657 fs/ntfs/file.c

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
 > 657		if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
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
