Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F892E628;
	Sat, 31 May 2025 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748671243; cv=none; b=gz9WjX0UABhJNVgN8z8vYXGDP8FEjKRHWSi0hcZg0vmYXzdItK3Ke+Bo+9jUfzNwUuQk7//6izWno/Dxs3brcYV+gQnCBRnU1g2yLmAljlJfGL4WYK/voBj6G+qu2+b7xiz5HGog1XNJDdOCxRonsxQEb5ysuDT/2095pFZkvY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748671243; c=relaxed/simple;
	bh=C2pTRq+WYhqu+xbipq0rpCyEmxZKzSJghOadHbF7F20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/4wE/fAX+8ceTTP53oFmt/Yu+IdT3D3dvOFOQtkwN6p4nNymPyq/jK2ECn9EVH9Hg7tsZ/isI/yp/5gjMxn2up2P3VRA9grkVKKjQRfTxajs9gotlUUzvsc8fpmdFkkcv+ciRVEGO/k0Pe+sSf9v6qGyxAAhLfeAxKWLVAscuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hh7xj83s; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hh7xj83s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748671242; x=1780207242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2pTRq+WYhqu+xbipq0rpCyEmxZKzSJghOadHbF7F20=;
  b=Hh7xj83smGJEuilN5BBsuZu1wq0SiWRJx+lHnxFn0lBrcdQvtN8gjoYK
   liqToAtBXDCejZPWMLHPfND1CVkL0SAV76DS2hw5q2eqbR/yp76Iu1vnN
   gRiaH+42fE/p4nnELcuwipw57G4bnhcVKL7e5ZE62gaO5PUi2XjOgHmky
   j3giJ18H+9b3Eoyd1VVepTSRpu7CVBUoAtG6fy3Ts8576mAwsu6jN+0cN
   snriuSjyYxN/S5aYBIRpETS1jAaCiH3F9rrXSP8jRwtYsxjw38p6MDgRS
   rnkZujnMnqRV38eDWG4NnEPqQZfS4Co9qPUfbLQGjIBGJXIYWZVbEoaAr
   g==;
X-CSE-ConnectionGUID: sR1T3nONQTSPyneiagwAwg==
X-CSE-MsgGUID: L4FFhSz9TLSCo28qLGiabQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50816113"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50816113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 23:00:39 -0700
X-CSE-ConnectionGUID: GIlhs7aST328ZsVVvVA4Lg==
X-CSE-MsgGUID: NeBI6ZEaS0KFsi1xkpP3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="174940381"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 23:00:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLFGl-000YE4-1j;
	Sat, 31 May 2025 06:00:35 +0000
Date: Sat, 31 May 2025 13:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 1/5] fs/f2fs/f2fs.h:4902:43: error: no member named
 'first_zoned_segno' in 'struct f2fs_sb_info'; did you mean
 'first_seq_zone_segno'?
Message-ID: <202505311327.eFLLIgds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   da08611e28ee951df3ed7bfa4d0d8174ed763ebf
commit: d6f1da168279ee76658fa5907d6cbaf30447717e [1/5] f2fs: zone: allow IPU for regular file in regular block device
config: s390-randconfig-002-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311327.eFLLIgds-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311327.eFLLIgds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311327.eFLLIgds-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/extent_cache.c:18:
>> fs/f2fs/f2fs.h:4902:43: error: no member named 'first_zoned_segno' in 'struct f2fs_sb_info'; did you mean 'first_seq_zone_segno'?
    4902 |         return f2fs_sb_has_blkzoned(sbi) && sbi->first_zoned_segno;
         |                                                  ^~~~~~~~~~~~~~~~~
         |                                                  first_seq_zone_segno
   fs/f2fs/f2fs.h:1796:15: note: 'first_seq_zone_segno' declared here
    1796 |         unsigned int first_seq_zone_segno;      /* first segno in sequential zone */
         |                      ^
   1 error generated.
--
   In file included from fs/f2fs/data.c:24:
>> fs/f2fs/f2fs.h:4902:43: error: no member named 'first_zoned_segno' in 'struct f2fs_sb_info'; did you mean 'first_seq_zone_segno'?
    4902 |         return f2fs_sb_has_blkzoned(sbi) && sbi->first_zoned_segno;
         |                                                  ^~~~~~~~~~~~~~~~~
         |                                                  first_seq_zone_segno
   fs/f2fs/f2fs.h:1796:15: note: 'first_seq_zone_segno' declared here
    1796 |         unsigned int first_seq_zone_segno;      /* first segno in sequential zone */
         |                      ^
>> fs/f2fs/data.c:2609:11: error: no member named 'first_zoned_segno' in 'struct f2fs_sb_info'; did you mean 'first_seq_zone_segno'?
    2609 |                                         sbi->first_zoned_segno)
         |                                              ^~~~~~~~~~~~~~~~~
         |                                              first_seq_zone_segno
   fs/f2fs/f2fs.h:1796:15: note: 'first_seq_zone_segno' declared here
    1796 |         unsigned int first_seq_zone_segno;      /* first segno in sequential zone */
         |                      ^
   2 errors generated.


vim +4902 fs/f2fs/f2fs.h

  4899	
  4900	static inline bool f2fs_blkzoned_has_regular_section(struct f2fs_sb_info *sbi)
  4901	{
> 4902		return f2fs_sb_has_blkzoned(sbi) && sbi->first_zoned_segno;
  4903	}
  4904	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
