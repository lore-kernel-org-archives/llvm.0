Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA1481AA;
	Fri, 12 Apr 2024 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712903678; cv=none; b=DqjDyiFq8hD+O6eGUlaRzC1+w53EoK5gz/MF4lbfRk+wd08Wxh4sw9c8l0EYHiFXbZvBkgO8rm0uhceKn/hASgNgFmt63uRDL/XaXxpKOJbnIyz6fPDcuVLEvcOZZTUZWJRWobO1QR5yHkyPC3EcZy8tp9zPsQeO2aZwdZtLgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712903678; c=relaxed/simple;
	bh=JNknBqEdJQfgNh6dvBE/qdT5W4cShHCqEi7SXViVMxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WWdVfNYhA9mlb5bIiwnD2fuhZE0jgK95rbmvuvQtbuY0cwcP2aoivQ/8LasdS69HyDzLEk5T0LPQG0VuU/WQ6AIH2f9XNl4pdUUFqFVfufbP+O4msCBQWjPtbQmojwMJbk+JDZfc36SJcrZoPGbBcXd7ODWIjQy1CIv5ZPJCgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7gnDR11; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7gnDR11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712903676; x=1744439676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNknBqEdJQfgNh6dvBE/qdT5W4cShHCqEi7SXViVMxk=;
  b=k7gnDR11VNNhomDWfl2S9ir3HD/RMZplnuiUFbnAEDrgF65spozSuSwD
   4Av23cYk4JOpgiHkj8Th/wLPK/by9SSgQBMs/MK6bswfz7kM3/vMNyf6j
   wB4mQ95JDzQVB/RDd5mwz/pMoWREcYfjflxkR2TTVoBx01OCJDV06VnBv
   Kw6UFPQNBzw/a9sGT+SGsaCT6trVEcDonRzhCqhtm+5AwXxrIcIg6tltR
   fTex66xofshtOjMAhL77W8ykcvdm2B4SSZ4eT0uA6yqgMN1x5b9gXpiV+
   LN/36JNWOvlVl/HIIOFYPcKEzWy0muBG5lS2bVTBddZSOdmqicwCVeR1U
   A==;
X-CSE-ConnectionGUID: oSQS4BkKRKO08+AfAfV5dQ==
X-CSE-MsgGUID: 0DKxzlAkQK6QIx83wV9Rhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8220732"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8220732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 23:34:35 -0700
X-CSE-ConnectionGUID: X/LWGuhrTeqmXcmRMVmkFQ==
X-CSE-MsgGUID: zi1AEEpkTiarl1wHRfEoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21202898"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2024 23:34:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvAUZ-0009TB-37;
	Fri, 12 Apr 2024 06:34:31 +0000
Date: Fri, 12 Apr 2024 14:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 129/130]
 fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in
 a function definition is a C2x extension
Message-ID: <202404121412.fTDFGSkH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ecb7f8abc97ccf1ab18363dcd37591329ae42cc2
commit: 60ec285a67d2cdd4ef950a3aed690e8c7f379720 [129/130] bcachefs: Path must be locked if trans->locked && path->should_be_locked
config: i386-randconfig-005-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121412.fTDFGSkH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121412.fTDFGSkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121412.fTDFGSkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/extents.c:13:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   1 warning generated.
--
   In file included from fs/bcachefs/journal_io.c:5:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/journal_io.c:1591:35: warning: unused function 'journal_last_unwritten_buf' [-Wunused-function]
    1591 | static inline struct journal_buf *journal_last_unwritten_buf(struct journal *j)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m


vim +428 fs/bcachefs/btree_locking.h

   423	
   424	#ifdef CONFIG_BCACHEFS_DEBUG
   425	void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *);
   426	void bch2_trans_verify_locks(struct btree_trans *);
   427	#else
 > 428	static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
   429	static inline void bch2_trans_verify_locks(struct btree_trans *trans) {}
   430	#endif
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
