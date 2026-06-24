Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0862F531B;
	Wed, 24 Jun 2026 03:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270440; cv=none; b=kEolveFxRpaq7uNcrbLIkszqrWZx9Zmzzh3JB8L0mU+DHNvSBEOh7RDaDfFtwa3hdBbTXPSZWbRklCQ7V16Id4DOYmzUWWFhpvM+E9+9Y+nfOvchLXTg7Kcuv3T4YXFAfTfifcvcZ7Rk57WU3Ar8WvV2SHeQgojzPXYYAahYz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270440; c=relaxed/simple;
	bh=KNjiPxUwKsG/KZRzOxOpt1XZSQ2n2PWM2qhbr95sn7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W/6e1GJ+Cdcv+oUrVl4vyk7naR2GHfaMYIxS2ic+2cMLNTeEcucoMOrQ1+9TRW7STPIkJQhNL2LAbJeTrd1J4YcP4OwtTe7gcHJQA4oYiApsPes7+iKge9RxDR+StWJ/CIuFvKhCjIJhJnloDZ99obJXwB1obBwEmk4apyV2w50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vc3Aaq+w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vc3Aaq+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782270439; x=1813806439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KNjiPxUwKsG/KZRzOxOpt1XZSQ2n2PWM2qhbr95sn7s=;
  b=Vc3Aaq+w0VAOY8iNoaRGAxLeraiq/9i0ub4e/MHk2i6I4JSetU0jJo7q
   A6f2UoCR4pJWqdVB5AWCL6suEJqxg+hi4CXajqj3kcU+tO8zMFg8yb5Fd
   enk7WbgMsQywGGC/IJMrCQeAwFVf0ZBqVhdtdeEa+OVDNT11xeNjraQc0
   oGPDjN1gRlFCt/Wav4EAkU3zzpGA5dXfH8BARQTf6qKUS1GE7FiLflEnN
   XP6q742fmHWQLu5OjFIs9u6kUg5NFe7swwrUVm+vdbwWdSjnzHC9V0Gt5
   18kh5LiG9QvXtEfJeVWBI90/1WekONvg7ufLOjmlcgkt1Qlnj3y35AKEm
   w==;
X-CSE-ConnectionGUID: sItjihziTvuDzn4xRpEADg==
X-CSE-MsgGUID: ttBEimKTSlGdQIRCUwCp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82891948"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82891948"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 20:07:18 -0700
X-CSE-ConnectionGUID: MAF5IoK3Q4OmcAmUqNCuaw==
X-CSE-MsgGUID: zGv23mGOQ5yb1Uvw41fH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="245556920"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2026 20:07:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcDxF-0000000035T-2rJ6;
	Wed, 24 Jun 2026 03:07:12 +0000
Date: Wed, 24 Jun 2026 11:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-prep-easy 20/57]
 fs/f2fs/sysfs.c:1363:1: error: incompatible function pointer types
 initializing 'ssize_t (*)(const struct f2fs_attr *, struct f2fs_sb_info *,
 char *)' (aka 'long (*)(const struct f2fs_attr *, struct f2fs_sb_info *, char
 *)') with an expression of type 'ss...
Message-ID: <202606241155.vPQKU5q5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-prep-easy
head:   67a3c6abb9033d2ce2a9ac12d4cfb9530148b38f
commit: 8a368f6b39b939b42a5bc9faff00f93d907f2143 [20/57] f2fs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606241155.vPQKU5q5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241155.vPQKU5q5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241155.vPQKU5q5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:1363:1: error: incompatible function pointer types initializing 'ssize_t (*)(const struct f2fs_attr *, struct f2fs_sb_info *, char *)' (aka 'long (*)(const struct f2fs_attr *, struct f2fs_sb_info *, char *)') with an expression of type 'ssize_t (struct f2fs_attr *, struct f2fs_sb_info *, char *)' (aka 'long (struct f2fs_attr *, struct f2fs_sb_info *, char *)') [-Wincompatible-function-pointer-types]
    1363 | F2FS_GENERAL_RO_ATTR(defrag_blocks);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:1166:69: note: expanded from macro 'F2FS_GENERAL_RO_ATTR'
    1166 | static const struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
         |                                                                     ^~~~~~~~~~~
   <scratch space>:74:1: note: expanded from here
      74 | defrag_blocks_show
         | ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1363 fs/f2fs/sysfs.c

6201c478dedcf7 Yangtao Li       2023-05-06  1343  
8f1572f7ce6169 Jaegeuk Kim      2017-10-24  1344  F2FS_GENERAL_RO_ATTR(dirty_segments);
fc7100ea2a52fc Hridya Valsaraju 2020-01-22  1345  F2FS_GENERAL_RO_ATTR(free_segments);
0823427989c112 Jaegeuk Kim      2021-03-01  1346  F2FS_GENERAL_RO_ATTR(ovp_segments);
8ceffcb29e61ba Chao Yu          2017-06-14  1347  F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
bf9e697ecd4214 Jaegeuk Kim      2017-07-21  1348  F2FS_GENERAL_RO_ATTR(features);
80d421450187e8 Yunlong Song     2017-10-27  1349  F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1350  F2FS_GENERAL_RO_ATTR(unusable);
5aba54302a46fd Daniel Rosenberg 2019-07-23  1351  F2FS_GENERAL_RO_ATTR(encoding);
3fea0641b06ff4 Chao Yu          2025-05-06  1352  F2FS_GENERAL_RO_ATTR(encoding_flags);
1bd119da0b93d6 Daniel Lee       2025-08-04  1353  F2FS_GENERAL_RO_ATTR(effective_lookup_mode);
a7e679b53393c7 Jaegeuk Kim      2020-02-25  1354  F2FS_GENERAL_RO_ATTR(mounted_time_sec);
ffcde4b29a5f20 Dehe Gu          2020-07-03  1355  F2FS_GENERAL_RO_ATTR(main_blkaddr);
ae2e2804caa120 Jaegeuk Kim      2021-11-29  1356  F2FS_GENERAL_RO_ATTR(pending_discard);
6f092b55e1ad2d liujinbao1       2024-02-21  1357  F2FS_GENERAL_RO_ATTR(atgc_enabled);
a3951cd199a5d2 Yangtao Li       2022-10-25  1358  F2FS_GENERAL_RO_ATTR(gc_mode);
fc7100ea2a52fc Hridya Valsaraju 2020-01-22  1359  #ifdef CONFIG_F2FS_STAT_FS
fc7100ea2a52fc Hridya Valsaraju 2020-01-22  1360  F2FS_GENERAL_RO_ATTR(moved_blocks_background);
fc7100ea2a52fc Hridya Valsaraju 2020-01-22  1361  F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
fc7100ea2a52fc Hridya Valsaraju 2020-01-22  1362  F2FS_GENERAL_RO_ATTR(avg_vblocks);
265dccda706667 liujinbao1       2026-02-27 @1363  F2FS_GENERAL_RO_ATTR(defrag_blocks);
fc7100ea2a52fc Hridya Valsaraju 2020-01-22  1364  #endif
bf9e697ecd4214 Jaegeuk Kim      2017-07-21  1365  

:::::: The code at line 1363 was first introduced by commit
:::::: 265dccda706667b9c2b6d690636db1df1f751948 f2fs: Add defrag_blocks sysfs node

:::::: TO: liujinbao1 <liujinbao1@xiaomi.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
