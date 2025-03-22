Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0E23315B;
	Sat, 22 Mar 2025 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742670722; cv=none; b=BB0cGlP24LHbfWfBAgKCqkLc4uPAVryiXptzpEVKVPKyuLQXgSC/F+aFsq+ZZcVoKWdfGNReiWfsOgAfSf/vUzQe97m12f/ImIBn24V1yQFErMyZlL0SYilGMWeaDpFWh6y34cqOj+Rbyk3Ki0jQwdt1yAKMogcLgLWxCHE0QPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742670722; c=relaxed/simple;
	bh=VU7I/dlINbCBQ8hwFqa8JOaxED0Ue8wRgkCzv1K/bZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvj1IlA7U8W5SaCPuH4nDINmBFe7sGHqU4nA8iCS9BKYz/VDk+2bjWyUPs2TSar7hSCza7eIhvqUvMZkAE578teE2uNucjV3xDWKkdRNYxXOM2w6VUwZw4OxwQwXqKPWRNRBup3bmbtwDPqCwjPUraO8DpZPqgGYkDLl3bsSBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AryENNB1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AryENNB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742670721; x=1774206721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VU7I/dlINbCBQ8hwFqa8JOaxED0Ue8wRgkCzv1K/bZA=;
  b=AryENNB1XjRuN0RGaLwCtiWPZ2JEtzcfD321ULpAOLD//eXgZKRlEcKi
   Uhom2/YVJvfW+Li5epizJQjQTJBipxW+bVVaKmBEqMlvahvjC5sBePw1P
   /gaaVkfFPr3oUU79qPmP6u2QEjTkWzeI0UJ9ZduAJAqkXCgEmHaG/QuDP
   HUYO9Fbb/hhTLZCgtRkWbEt1NW1ywuhFZEeej/vejsRe99oP2Vsd8XKtl
   Ni1+wF/VbtuNV3/X3uaA6FM411dIIRmC6+07dk4xmvwt4WlP9vplNajlN
   aakKMCMs2kUuFobVpe/nTET3T1qyfw6DQaZ6CTFg1hUUyNnK8cwSmvBA/
   w==;
X-CSE-ConnectionGUID: Ny+abm+8ShOSX17M4IRnwA==
X-CSE-MsgGUID: +ZUI5lOgRm2K1+qHf6BYYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54548062"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="54548062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 12:12:00 -0700
X-CSE-ConnectionGUID: pPuPmEmfTvqwPJ0SWdRLDA==
X-CSE-MsgGUID: /TAzINjWRTqbTMaidIgw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="123693917"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2025 12:11:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw4G0-0002Ln-2r;
	Sat, 22 Mar 2025 19:11:50 +0000
Date: Sun, 23 Mar 2025 03:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/5] fs/f2fs/super.c:4320:8: error: call to
 undeclared function 'f2fs_zone_is_seq'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202503230328.DBv5fVsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   40cbb3a09cebf75b7141934e954fff0738704918
commit: 40cbb3a09cebf75b7141934e954fff0738704918 [5/5] f2fs: zone: fix to avoid inconsistence in between SIT and SSA
config: hexagon-randconfig-001-20250323 (https://download.01.org/0day-ci/archive/20250323/202503230328.DBv5fVsk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503230328.DBv5fVsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503230328.DBv5fVsk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/super.c:4320:8: error: call to undeclared function 'f2fs_zone_is_seq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4320 |                         if (f2fs_zone_is_seq(sbi, devi, zone))
         |                             ^
   fs/f2fs/super.c:4320:8: note: did you mean 'bdev_zone_is_seq'?
   include/linux/blkdev.h:1406:20: note: 'bdev_zone_is_seq' declared here
    1406 | static inline bool bdev_zone_is_seq(struct block_device *bdev, sector_t sector)
         |                    ^
   1 error generated.


vim +/f2fs_zone_is_seq +4320 fs/f2fs/super.c

  4307	
  4308	static inline unsigned int get_first_zoned_segno(struct f2fs_sb_info *sbi)
  4309	{
  4310		unsigned int segno;
  4311		int devi, i;
  4312	
  4313		for (devi = 0; devi < sbi->s_ndevs; devi++) {
  4314			if (!bdev_is_zoned(FDEV(devi).bdev))
  4315				continue;
  4316	
  4317			segno = GET_SEGNO(sbi, FDEV(devi).start_blk);
  4318			for (i = 0; i < FDEV(devi).total_segments; i++) {
  4319				unsigned int zone = GET_ZONE_FROM_SEG(sbi, segno);
> 4320				if (f2fs_zone_is_seq(sbi, devi, zone))
  4321					return segno;
  4322			}
  4323		}
  4324		return NULL_SEGNO;
  4325	}
  4326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
