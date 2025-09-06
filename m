Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99C79F2;
	Sat,  6 Sep 2025 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757136721; cv=none; b=m2hV4WRYy0ZmIAIkwxR+qbroOCfPx2s7MntFU87ZScakpKv98jSCEJIV44dUdF4hidwPeX/0x0JwFhQ+EFGgXkdwX6SWfbWMCDzZypkn94AN8qWgs4mDW7t1UIHM1U3H3I4ZeKm+DIKbbfKZtyvvut6yspBRm3hpDSZ++Qefxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757136721; c=relaxed/simple;
	bh=TRog8V2zzRaih4pVcDXsx02GVrHWpiqzfQ2lhT5sXv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaDVWa0ac5o99hqa1A35f6pSrF6KGhnfqRPD/5Rppsh+JEOwgSykzLywdkkjIOt1E8PA7JVh64CLffRN4greWKQw3nXpKtNXHBe8SBwgFjmu+lzKJCzK0Bl6fprJ4h+c7fHaQB17D8+cujasVIIG2XxCmxdo5XkaFtd5tVAcngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exqqIdIS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exqqIdIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757136719; x=1788672719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TRog8V2zzRaih4pVcDXsx02GVrHWpiqzfQ2lhT5sXv4=;
  b=exqqIdIScgewHxedvo9r/axYHpvvtJU+iXKFSVpRorgSCQ/WU/9j5yoB
   pRQ9iWq8dWcyp0FKRFEWIvPhUHFLjy1U/X5pSaG4MiYj6Sc6sEba8kbsN
   uBCQPnxvjhoKwyhZRziPwRb9QBwB98o7q2EW2xBURc37so2ALscWZaW2f
   unYO4i69biBniRtSo6I+mBlDC406VD5SXWiMbw6X5waky+YL8EGBLkPrg
   d6izGgA3W0sKNCK/6/B8FHBK8TQY4LtLuhhbzAfd+3ssLcUSORanoS+ft
   0GBXoMF5kE4sG1p2NpCryVxFytTC/hwBaPSQt753vqXefgO7AlWOmxX3+
   g==;
X-CSE-ConnectionGUID: Nk6TYtTVQ+aLCRLRKHfF6Q==
X-CSE-MsgGUID: TtGsq5FlRWW0Wrd9bwDNug==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59590483"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="59590483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 22:31:58 -0700
X-CSE-ConnectionGUID: 22QApUWyS+ivNoKnJgkOMw==
X-CSE-MsgGUID: i8ay8JSYQ6e8p28aVhwwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="172247149"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2025 22:31:58 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uulWl-0001EJ-2C;
	Sat, 06 Sep 2025 05:31:55 +0000
Date: Sat, 6 Sep 2025 13:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 365/365]
 fs/bcachefs/btree_io.c:30:17: warning: unused variable
 'bch2_btree_read_corrupt_ratio'
Message-ID: <202509061356.XlQ8syVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   149a8691d3f20c0f344f3bbc7f2d037dbf44a122
commit: 149a8691d3f20c0f344f3bbc7f2d037dbf44a122 [365/365] fixup! bcachefs: btree_read_corrupt_device modparam
config: i386-buildonly-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061356.XlQ8syVI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061356.XlQ8syVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061356.XlQ8syVI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_io.c:30:17: warning: unused variable 'bch2_btree_read_corrupt_ratio' [-Wunused-variable]
      30 | static unsigned bch2_btree_read_corrupt_ratio;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/bch2_btree_read_corrupt_ratio +30 fs/bcachefs/btree_io.c

4e4758c6cbbbc3 Kent Overstreet 2020-03-27  29  
9c2be641dfafa9 Kent Overstreet 2025-07-03 @30  static unsigned bch2_btree_read_corrupt_ratio;
149a8691d3f20c Kent Overstreet 2025-09-05  31  static int bch2_btree_read_corrupt_device;
149a8691d3f20c Kent Overstreet 2025-09-05  32  

:::::: The code at line 30 was first introduced by commit
:::::: 9c2be641dfafa99d733f9200d6be2bee32961f70 bcachefs: Debug param for injecting btree node corruption on read

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
