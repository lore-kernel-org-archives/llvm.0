Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8158635E;
	Tue,  4 Feb 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738656395; cv=none; b=MOQQUUhx8hNIYa6wG3ge9T4u9OvhpRci9oxDRG/d6gacX7GJEpn0u69HudiuXqilNoa/qfKggGmGBKHfnSqsswYLzhqKlaeyHDuGe3sjeA3KDIJvtr4sxYxkqklVT/6uJou8QXTlK2IcqUUfyw7s1hr2HDrYsQ5pi4dmi/iPWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738656395; c=relaxed/simple;
	bh=TrvkCF04MEiPuvtlS3hO+AoilWK1NPuWpdTo4cFzql0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7sWBK9ordHk0lXRGTRt7fLdNn0POShFHrTN5H2rFdn9POOpeut6/rBtxWnj0vfxyZ7yXBipGseUGWTtSK5VuaN8mf3OuHoQjO32gBauRVRakIB6+y+m0WoWDR+JKFE6U2mHE8tZXxbcVsEo146i2Q2i98XJecqdRli3IGkwN18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMSH4k0u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMSH4k0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738656393; x=1770192393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TrvkCF04MEiPuvtlS3hO+AoilWK1NPuWpdTo4cFzql0=;
  b=KMSH4k0u0RTxNIar6UVHgCHnQaQh+JoE3lsJxPQtmI9HFw3e4ktRYEOV
   ywGFNRFRykXbHD3Wa3pcLrx0Mlj1wz7baHE9UPeLzJcmFv0QQvloO//5U
   qMpdfcSYUByd6WHM8rznyk6w2Ms3lO+Lapb46ZDoE9JcEYxUMONUGv66d
   K/MSLFxAO7ZbDigmG/P+1AAsakJU4pC9yGneBhdjoX/fXWqPZEPtQj7Cc
   7/g7XFYOx6gQWDqZXqDydzMDqI3fVq1rAM/t5YFyRnzQhv9jj0nmJSOsF
   86HnTPRedMe1RCJvOZsK/rP6lALw/csnZdUIb0vt4Uud+CLDmgurhyS22
   Q==;
X-CSE-ConnectionGUID: cotHQs5rQxqduiggR40VgQ==
X-CSE-MsgGUID: 39sY1luDQW2JVH9E7F5iiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56707192"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="56707192"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:06:33 -0800
X-CSE-ConnectionGUID: MRQ9FLLtSL+1bqYsdw2RlA==
X-CSE-MsgGUID: 97tr8tbtSWOrrx927DjDWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="115524486"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2025 00:06:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfDwz-000sBX-0w;
	Tue, 04 Feb 2025 08:06:29 +0000
Date: Tue, 4 Feb 2025 16:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net
Subject: [jaegeuk-f2fs:dev-test 4/4] fs/f2fs/sysfs.c:923:6: warning: variable
 'res' is used uninitialized whenever 'if' condition is false
Message-ID: <202502041610.nmS1Brio-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   f0d674f43daa7e255465f8d847734a6b9b0f63db
commit: f0d674f43daa7e255465f8d847734a6b9b0f63db [4/4] f2fs: add a sysfs entry to request donate file-backed pages
config: i386-buildonly-randconfig-003-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041610.nmS1Brio-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041610.nmS1Brio-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041610.nmS1Brio-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:923:6: warning: variable 'res' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     923 |         if (!strcmp(a->attr.name, "reclaim_caches_kb"))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:926:33: note: uninitialized use occurs here
     926 |         return sysfs_emit(buf, "%u\n", res);
         |                                        ^~~
   fs/f2fs/sysfs.c:923:2: note: remove the 'if' if its condition is always true
     923 |         if (!strcmp(a->attr.name, "reclaim_caches_kb"))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     924 |                 res = f2fs_donate_files();
   fs/f2fs/sysfs.c:921:18: note: initialize the variable 'res' to silence this warning
     921 |         unsigned int res;
         |                         ^
         |                          = 0
   1 warning generated.


vim +923 fs/f2fs/sysfs.c

   918	
   919	static ssize_t f2fs_tune_show(struct f2fs_base_attr *a, char *buf)
   920	{
   921		unsigned int res;
   922	
 > 923		if (!strcmp(a->attr.name, "reclaim_caches_kb"))
   924			res = f2fs_donate_files();
   925	
   926		return sysfs_emit(buf, "%u\n", res);
   927	}
   928	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
