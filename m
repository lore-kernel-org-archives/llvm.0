Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C59B672;
	Sat,  2 Aug 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754122488; cv=none; b=VK0uBY8MkYaYxEbjZIP7YdclRUWNSp0Vc74u2tY/ujxTYFIGfpHbTVVhyNcEXoYCxCtQlMx0YYJjCN9icYuXWdxVbP4i7O+mYxt8lTZ3HTv+1WNql6/bY6OOxP77SVRAURT47lphu5gbHy8LySbIKxLfBi2imNxG6bI7TY//xgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754122488; c=relaxed/simple;
	bh=gPgdoG6DKACUz+wbpkMrrqo9G1KgXvXEJHqtTviapgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFYqYDaSzQ6/zbkWMCMBDtqdNUXFHxbzBpbN43QnBrrQmYs6XAQyZ3FwSTkIh4WEUMQv12k8CdavbMIDfYe9OVz5m8Sfb8o9N/j476UaCXWXh+yfQrE45Ik5PwcwmH5xjCPFJweyUW5YBxzLIueRCoMSKRMTi35rtzz5qFLxb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijnmkPFw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijnmkPFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754122487; x=1785658487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPgdoG6DKACUz+wbpkMrrqo9G1KgXvXEJHqtTviapgw=;
  b=ijnmkPFwkrBm60T5F9bEwuLuwquwHi9Vv+ftTPoRJgtcan5f5XRY2A4P
   dyjQvU4UaJrTWTn992G9TkR3i++tS7C08yQDGpsUAT024si1PRh+mfxiJ
   WpYtFu4npCigoGRsw5fQabuvAiGeh/c6/aakwpjtfIgnOtAgS6XuUaIw+
   CKm9BlbMoEng8uoldaTMi5e7RwuATFmfIUWEqqnfrplBDrsoxBMff8xc9
   QrAPup+/GFDHo7dcekFgt3jhA+YHR0nBPGoc91sE6eztxd1h0oBtuAsLk
   JJJ3xzE36etJt+q/hFrrdyaksyIdjUgDDet4yxuZUOatJwrR0DfSpczPb
   g==;
X-CSE-ConnectionGUID: Ggo3wMOJQCSUy3fvOIYnRQ==
X-CSE-MsgGUID: qAy8kxpBTJ24heaNW/rJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67530152"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67530152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 01:14:46 -0700
X-CSE-ConnectionGUID: 2300p3UoT5KcC+AHc8nkkA==
X-CSE-MsgGUID: 4xKOult4RT+SOh1NOym/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="167937655"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Aug 2025 01:14:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui7O6-0005FI-0P;
	Sat, 02 Aug 2025 08:14:42 +0000
Date: Sat, 2 Aug 2025 16:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12906/13054] fs/bcachefs/dirent.c:752:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202508021612.sgqqMGQr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 4c3205637f1ecb1af44e99c92a9931ae2f84bc58 [12906/13054] bcachefs: CLASS(btree_iter)
config: x86_64-randconfig-008-20250630 (https://download.01.org/0day-ci/archive/20250802/202508021612.sgqqMGQr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021612.sgqqMGQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021612.sgqqMGQr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/dirent.c:752:3: error: cannot jump from this goto statement to its label
     752 |                 goto err;
         |                 ^
   fs/bcachefs/dirent.c:756:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     756 |         CLASS(btree_iter, iter)(trans, BTREE_ID_dirents, pos, BTREE_ITER_intent);
         |                           ^
   1 error generated.
--
>> fs/bcachefs/io_misc.c:275:3: error: cannot jump from this goto statement to its label
     275 |                 goto err;
         |                 ^
   fs/bcachefs/io_misc.c:277:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     277 |         CLASS(btree_iter, fpunch_iter)(trans, BTREE_ID_extents,
         |                           ^
   1 error generated.


vim +752 fs/bcachefs/dirent.c

758ea4ff812b4d Kent Overstreet 2025-03-20  743  
758ea4ff812b4d Kent Overstreet 2025-03-20  744  int bch2_fsck_remove_dirent(struct btree_trans *trans, struct bpos pos)
758ea4ff812b4d Kent Overstreet 2025-03-20  745  {
758ea4ff812b4d Kent Overstreet 2025-03-20  746  	struct bch_fs *c = trans->c;
758ea4ff812b4d Kent Overstreet 2025-03-20  747  	struct bch_inode_unpacked dir_inode;
758ea4ff812b4d Kent Overstreet 2025-03-20  748  	struct bch_hash_info dir_hash_info;
758ea4ff812b4d Kent Overstreet 2025-03-20  749  
4c3205637f1ecb Kent Overstreet 2025-07-30  750  	int ret = lookup_first_inode(trans, pos.inode, &dir_inode);
758ea4ff812b4d Kent Overstreet 2025-03-20  751  	if (ret)
758ea4ff812b4d Kent Overstreet 2025-03-20 @752  		goto err;

:::::: The code at line 752 was first introduced by commit
:::::: 758ea4ff812b4dfd4cef6dba0eb4b0025a7b147e bcachefs: Move bch2_check_dirent_target() to namei.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
