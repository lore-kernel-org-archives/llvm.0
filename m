Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F62C0F7C;
	Wed, 31 Dec 2025 20:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211938; cv=none; b=fZ4dgEq/QHy1EKc9TcALAlqF5Xeev7jWUIdxYaIWRgQjLbpHa2ECGdnuWWOOeEvoNBCuQi6vdLYKRhUYDt6VZlCQMJjUW3PFUE74l+OZ8VvoaPPX/tBVsTjFoDKPNgedrQXMvXIEziQGLczPluJeBZkSmO9ElJh1Dsx/waAjjCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211938; c=relaxed/simple;
	bh=rtcpSlV4otllEvszA0uCP33efmeDHNTuJFf2xC4IG6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HEyue8UUIuSwHqsukomocwM8OJdPM50M/XBwGj5KqKnWF2OGiVRIBzMJR5sJrHlxO6eAU/P4BMDFPen6eXZj1+Rmx1FYSSZS4QwsG3iyttdQ2ylMGK0zgExSrULS420rC2fTnitl/NPUET+dlR5eyYmSToNCY2llJ+tA9xlFGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBWwSM4q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBWwSM4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767211937; x=1798747937;
  h=date:from:to:cc:subject:message-id;
  bh=rtcpSlV4otllEvszA0uCP33efmeDHNTuJFf2xC4IG6g=;
  b=CBWwSM4qWd6k+EYs6QtvotAP0egfADDTqmZEaM4SeNkDGKyp1ziMrPbr
   Sy2ytzp//wqbuEMiie110LP3isJBJUiRtzrmHwQjfRxyFiP0qYW5jY5sg
   HNa27QkBAf2b3Qu+tlZnueZAEho4XOnGPMN12YZUnn7435KxSVZiRGmDU
   IBcl4uQIR3tyxE0vhejsU29bntRoOZbzXBVymCEsKMF+6iJnofLCh9zgC
   aE+G2sxdNXk4snALyyfgzC7YngDG3irtcfxwZq/BZ6NO3XezBNr7D5KYR
   nN/CYibmnRkpixyDx3nSHZAJ2s0waH+6YPyJ6TmFQXIUyQ+RHNzKlCsaw
   A==;
X-CSE-ConnectionGUID: 7xIduURrRBmlJJ+HCOdrYg==
X-CSE-MsgGUID: RU0ZGk9NQxe1AsaTTsa6XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68844591"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68844591"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 12:12:16 -0800
X-CSE-ConnectionGUID: ZOdCzR3mQGaP/h7JRHVVng==
X-CSE-MsgGUID: E3DvLC77S8+UvF3N8Y+LJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="205984439"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Dec 2025 12:12:14 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb2YF-000000001ST-3DOY;
	Wed, 31 Dec 2025 20:12:11 +0000
Date: Thu, 01 Jan 2026 04:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 16/16]
 fs/ntfs3/inode.c:1021:6: warning: variable 'folio' is used uninitialized
 whenever 'if' condition is true
Message-ID: <202601010644.FIhOXy6Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   099ef9ab9203dff327f2d61e44773f9acbc01f13
commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13 [16/16] fs/ntfs3: implement iomap-based file operations
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260101/202601010644.FIhOXy6Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010644.FIhOXy6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010644.FIhOXy6Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/inode.c:1021:6: warning: variable 'folio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1021 |         if (is_resident(ni)) {
         |             ^~~~~~~~~~~~~~~
   fs/ntfs3/inode.c:1024:48: note: uninitialized use occurs here
    1024 |                 while ((folio = writeback_iter(mapping, wbc, folio, &err)))
         |                                                              ^~~~~
   fs/ntfs3/inode.c:1021:2: note: remove the 'if' if its condition is always false
    1021 |         if (is_resident(ni)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
    1022 |                 struct folio *folio;
         |                 ~~~~~~~~~~~~~~~~~~~~
    1023 | 
    1024 |                 while ((folio = writeback_iter(mapping, wbc, folio, &err)))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1025 |                         err = ntfs_resident_writepage(folio, wbc);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1026 | 
    1027 |                 return err;
         |                 ~~~~~~~~~~~
    1028 |         }
         |         ~
   fs/ntfs3/inode.c:1022:22: note: initialize the variable 'folio' to silence this warning
    1022 |                 struct folio *folio;
         |                                    ^
         |                                     = NULL
   1 warning generated.


vim +1021 fs/ntfs3/inode.c

  1001	
  1002	static int ntfs_writepages(struct address_space *mapping,
  1003				   struct writeback_control *wbc)
  1004	{
  1005		int err;
  1006		struct inode *inode = mapping->host;
  1007		struct ntfs_inode *ni = ntfs_i(inode);
  1008		struct iomap_writepage_ctx wpc = {
  1009			.inode = mapping->host,
  1010			.wbc = wbc,
  1011			.ops = &ntfs_writeback_ops,
  1012		};
  1013	
  1014		/* Avoid any operation if inode is bad. */
  1015		if (unlikely(is_bad_ni(ni)))
  1016			return -EINVAL;
  1017	
  1018		if (unlikely(ntfs3_forced_shutdown(inode->i_sb)))
  1019			return -EIO;
  1020	
> 1021		if (is_resident(ni)) {
  1022			struct folio *folio;
  1023	
  1024			while ((folio = writeback_iter(mapping, wbc, folio, &err)))
  1025				err = ntfs_resident_writepage(folio, wbc);
  1026	
  1027			return err;
  1028		}
  1029	
  1030		return iomap_writepages(&wpc);
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
