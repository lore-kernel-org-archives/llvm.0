Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DA433A8;
	Sat, 22 Feb 2025 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740248575; cv=none; b=ctX7KqDEwkWmpZwJxtpZtuCCUVeCyItmOyLkHlL4KInmYtqnoK8iuYpFgF7TtPgAJLVMkk9BlF1SjgJdNeL0TxvI6GBSSiHzXVZpjZozH5KdA3hTvbMhDXSqEsXBpnA03P+6bazYS4PP9vKjkLGxPxbkRCrpbvHO8AtSch8A0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740248575; c=relaxed/simple;
	bh=YL7qmVDc8oOw9cMkrUiIEd1Shy3LpdM6/qMB5kfEIbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qM1fh8vWu9BI+7S0XatywM9WB/NCQBsCXKWPVjkLf4wSPKDSk3MEa4q9YsXObZuungUHV6Zy19D3vhUFAKdaBFKybCkcjxEbUeoAfhBRSbeJCjbMhPCRAkAQihrXKqqxwcRmA2UIHCO+HIb5vx1MtsmbQKHFI4jAwdInQngHYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgD1POJC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgD1POJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740248573; x=1771784573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YL7qmVDc8oOw9cMkrUiIEd1Shy3LpdM6/qMB5kfEIbY=;
  b=IgD1POJCs7EdeXXn/tZgQmvr0pnHltTSJ5krI/r5aUE4Evad8nqK6bEZ
   TfSFWKaw6NkwZaD2qbgibdpUSGBfbk3bv2C8URoiFHhey10qrAUcJkSaq
   hgeheUvLu0p3XGaSBE7myeevie4bzPpkq0GDOvRz2fJ0L8vkDB7mT5xuH
   WFFnYO+fU44gkx27yA+8+oVOgD5rUEFWBISE9ZNoAXU3zHfODQAbTGHfi
   QLL/m9EjQAhEtcvT9Gc9YgjWzAn3/DavSooDNmC92/Ng5hbogngINReM3
   ZqUgsYX7jp4Tn2yoEiAo+oaS99Oy3WNN0GllNLUsbL+o8afJ6do//mH6t
   Q==;
X-CSE-ConnectionGUID: HlDCi8dBRqmMEHGi+TAXaA==
X-CSE-MsgGUID: wSfMFX1bQ4ySng1VWsX25g==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="63521068"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="63521068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 10:22:53 -0800
X-CSE-ConnectionGUID: uNENAsG1T1qXaZ6/Ae2ssA==
X-CSE-MsgGUID: 6S5PpyFjTCi+Crep5V9o6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="116177417"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2025 10:22:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlu9I-0006nt-1T;
	Sat, 22 Feb 2025 18:22:48 +0000
Date: Sun, 23 Feb 2025 02:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 111/118] fs/bcachefs/super-io.c:387:13:
 error: non-object type 'unsigned int (struct block_device *)' is not
 assignable
Message-ID: <202502230249.UT2nbUp0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   770fdbafa7d34c4232ef6ca0f27dd3433aadcb87
commit: 8b55cc03f1048217138fa910d53a4e1439c0351b [111/118] bcachefs: bs > ps support
config: hexagon-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230249.UT2nbUp0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230249.UT2nbUp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230249.UT2nbUp0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/super-io.c:387:13: error: non-object type 'unsigned int (struct block_device *)' is not assignable
     387 |         block_size = le16_to_cpu(sb->block_size);
         |         ~~~~~~~~~~ ^
   1 error generated.


vim +387 fs/bcachefs/super-io.c

a02a0121b3de81 Kent Overstreet 2023-06-28  362  
a5c3e265d3b61a Kent Overstreet 2024-05-08  363  static int bch2_sb_validate(struct bch_sb_handle *disk_sb,
a5c3e265d3b61a Kent Overstreet 2024-05-08  364  			    enum bch_validate_flags flags, struct printbuf *out)
a02a0121b3de81 Kent Overstreet 2023-06-28  365  {
a02a0121b3de81 Kent Overstreet 2023-06-28  366  	struct bch_sb *sb = disk_sb->sb;
9af26120f06e03 Hunter Shaffer  2023-09-25  367  	struct bch_sb_field_members_v1 *mi;
a02a0121b3de81 Kent Overstreet 2023-06-28  368  	enum bch_opt_id opt_id;
a02a0121b3de81 Kent Overstreet 2023-06-28  369  	int ret;
a02a0121b3de81 Kent Overstreet 2023-06-28  370  
a02a0121b3de81 Kent Overstreet 2023-06-28  371  	ret = bch2_sb_compatible(sb, out);
a02a0121b3de81 Kent Overstreet 2023-06-28  372  	if (ret)
a02a0121b3de81 Kent Overstreet 2023-06-28  373  		return ret;
a02a0121b3de81 Kent Overstreet 2023-06-28  374  
c258f28ebab6be Kent Overstreet 2018-11-12  375  	if (sb->features[1] ||
efe68e1d65c008 Kent Overstreet 2022-01-03  376  	    (le64_to_cpu(sb->features[0]) & (~0ULL << BCH_FEATURE_NR))) {
401ec4db630802 Kent Overstreet 2023-02-03  377  		prt_printf(out, "Filesystem has incompatible features");
78c0b75c34209c Kent Overstreet 2022-11-19  378  		return -BCH_ERR_invalid_sb_features;
efe68e1d65c008 Kent Overstreet 2022-01-03  379  	}
c258f28ebab6be Kent Overstreet 2018-11-12  380  
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  381  	if (BCH_VERSION_MAJOR(le16_to_cpu(sb->version)) > BCH_VERSION_MAJOR(bcachefs_metadata_version_current) ||
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  382  	    BCH_SB_VERSION_INCOMPAT(sb) > bcachefs_metadata_version_current) {
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  383  		prt_printf(out, "Filesystem has incompatible version");
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  384  		return -BCH_ERR_invalid_sb_features;
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  385  	}
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  386  
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @387  	block_size = le16_to_cpu(sb->block_size);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  388  
efe68e1d65c008 Kent Overstreet 2022-01-03  389  	if (bch2_is_zero(sb->user_uuid.b, sizeof(sb->user_uuid))) {
401ec4db630802 Kent Overstreet 2023-02-03  390  		prt_printf(out, "Bad user UUID (got zeroes)");
78c0b75c34209c Kent Overstreet 2022-11-19  391  		return -BCH_ERR_invalid_sb_uuid;
efe68e1d65c008 Kent Overstreet 2022-01-03  392  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  393  
efe68e1d65c008 Kent Overstreet 2022-01-03  394  	if (bch2_is_zero(sb->uuid.b, sizeof(sb->uuid))) {
6bf3766b5211dd Colin Ian King  2023-09-12  395  		prt_printf(out, "Bad internal UUID (got zeroes)");
78c0b75c34209c Kent Overstreet 2022-11-19  396  		return -BCH_ERR_invalid_sb_uuid;
efe68e1d65c008 Kent Overstreet 2022-01-03  397  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  398  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  399  	if (!sb->nr_devices ||
efe68e1d65c008 Kent Overstreet 2022-01-03  400  	    sb->nr_devices > BCH_SB_MEMBERS_MAX) {
401ec4db630802 Kent Overstreet 2023-02-03  401  		prt_printf(out, "Bad number of member devices %u (max %u)",
efe68e1d65c008 Kent Overstreet 2022-01-03  402  		       sb->nr_devices, BCH_SB_MEMBERS_MAX);
78c0b75c34209c Kent Overstreet 2022-11-19  403  		return -BCH_ERR_invalid_sb_too_many_members;
efe68e1d65c008 Kent Overstreet 2022-01-03  404  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  405  
efe68e1d65c008 Kent Overstreet 2022-01-03  406  	if (sb->dev_idx >= sb->nr_devices) {
401ec4db630802 Kent Overstreet 2023-02-03  407  		prt_printf(out, "Bad dev_idx (got %u, nr_devices %u)",
efe68e1d65c008 Kent Overstreet 2022-01-03  408  		       sb->dev_idx, sb->nr_devices);
78c0b75c34209c Kent Overstreet 2022-11-19  409  		return -BCH_ERR_invalid_sb_dev_idx;
efe68e1d65c008 Kent Overstreet 2022-01-03  410  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  411  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  412  	if (!sb->time_precision ||
efe68e1d65c008 Kent Overstreet 2022-01-03  413  	    le32_to_cpu(sb->time_precision) > NSEC_PER_SEC) {
401ec4db630802 Kent Overstreet 2023-02-03  414  		prt_printf(out, "Invalid time precision: %u (min 1, max %lu)",
efe68e1d65c008 Kent Overstreet 2022-01-03  415  		       le32_to_cpu(sb->time_precision), NSEC_PER_SEC);
78c0b75c34209c Kent Overstreet 2022-11-19  416  		return -BCH_ERR_invalid_sb_time_precision;
efe68e1d65c008 Kent Overstreet 2022-01-03  417  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  418  
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  419  	/* old versions didn't know to downgrade this field */
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  420  	if (BCH_SB_VERSION_INCOMPAT_ALLOWED(sb) > le16_to_cpu(sb->version))
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  421  		SET_BCH_SB_VERSION_INCOMPAT_ALLOWED(sb, le16_to_cpu(sb->version));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  422  
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  423  	if (BCH_SB_VERSION_INCOMPAT(sb) > BCH_SB_VERSION_INCOMPAT_ALLOWED(sb)) {
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  424  		prt_printf(out, "Invalid version_incompat ");
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  425  		bch2_version_to_text(out, BCH_SB_VERSION_INCOMPAT(sb));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  426  		prt_str(out, " > incompat_allowed ");
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  427  		bch2_version_to_text(out, BCH_SB_VERSION_INCOMPAT_ALLOWED(sb));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  428  		if (flags & BCH_VALIDATE_write)
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  429  			return -BCH_ERR_invalid_sb_version;
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  430  		else
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  431  			SET_BCH_SB_VERSION_INCOMPAT_ALLOWED(sb, BCH_SB_VERSION_INCOMPAT(sb));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  432  	}
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  433  
a5c3e265d3b61a Kent Overstreet 2024-05-08  434  	if (!flags) {
b8559f1a212a70 Kent Overstreet 2022-03-21  435  		/*
b8559f1a212a70 Kent Overstreet 2022-03-21  436  		 * Been seeing a bug where these are getting inexplicably
a02a0121b3de81 Kent Overstreet 2023-06-28  437  		 * zeroed, so we're now validating them, but we have to be
b8559f1a212a70 Kent Overstreet 2022-03-21  438  		 * careful not to preven people's filesystems from mounting:
b8559f1a212a70 Kent Overstreet 2022-03-21  439  		 */
b8559f1a212a70 Kent Overstreet 2022-03-21  440  		if (!BCH_SB_JOURNAL_FLUSH_DELAY(sb))
b8559f1a212a70 Kent Overstreet 2022-03-21  441  			SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
b8559f1a212a70 Kent Overstreet 2022-03-21  442  		if (!BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
b8559f1a212a70 Kent Overstreet 2022-03-21  443  			SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 1000);
813e0cecd1473d Kent Overstreet 2023-07-15  444  
813e0cecd1473d Kent Overstreet 2023-07-15  445  		if (!BCH_SB_VERSION_UPGRADE_COMPLETE(sb))
813e0cecd1473d Kent Overstreet 2023-07-15  446  			SET_BCH_SB_VERSION_UPGRADE_COMPLETE(sb, le16_to_cpu(sb->version));
cecf72798b25fc Kent Overstreet 2024-08-07  447  
cecf72798b25fc Kent Overstreet 2024-08-07  448  		if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_disk_accounting_v2 &&
cecf72798b25fc Kent Overstreet 2024-08-07  449  		    !BCH_SB_ALLOCATOR_STUCK_TIMEOUT(sb))
cecf72798b25fc Kent Overstreet 2024-08-07  450  			SET_BCH_SB_ALLOCATOR_STUCK_TIMEOUT(sb, 30);
c7652f253a6d59 Kent Overstreet 2024-07-31  451  
c7652f253a6d59 Kent Overstreet 2024-07-31  452  		if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_disk_accounting_v2)
c7652f253a6d59 Kent Overstreet 2024-07-31  453  			SET_BCH_SB_PROMOTE_WHOLE_EXTENTS(sb, true);
b8559f1a212a70 Kent Overstreet 2022-03-21  454  	}
b8559f1a212a70 Kent Overstreet 2022-03-21  455  

:::::: The code at line 387 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
