Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6515EFBD;
	Mon,  5 Aug 2024 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722878802; cv=none; b=qOHzugujk52FEF5340yS4gICryUKm5oCR7JZAiaLM0lIB2dVBNNbgajU0uBTdGMjM0xH2OCRsf/sPP23Azw1im8uqh4klmG7lzeRO93YMJZo1I78/CsYqHH/MzXp/vUpZs8L+4BlWKv7G5IU4Bkod+N+8qvOD/RrQFTiYR4dDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722878802; c=relaxed/simple;
	bh=uj/lzg9Ic52LjVCjBfzRv99OxofUNAoJUju8cbg43bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qO/gz2umH5OmJsl+vKTO+is7s6BhWC5/js6pjYkc+EC2mUsg7q2dR/IKFwHzraQShgUjTboMtBHwvSZTlvQnrBr1737vzNlVJdEAA0Mn/L88mEW0WzH+okUx8UOwElnXa6wTNIJVFcamN4+bl1hSsbwCh9zkC6j9yfy0LZNh5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l37EVoqV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l37EVoqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722878800; x=1754414800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uj/lzg9Ic52LjVCjBfzRv99OxofUNAoJUju8cbg43bs=;
  b=l37EVoqVCJwfDMBCepTRkOqgF8x9VnmJ+2Bon3gCH3Vlv2rLY/P4kfcs
   0dwti9be63SeBmJ8Yt/leJItyVtFMepwiFzVWdApV0QlXtW9axmgeCAKf
   5ljyzFnD1IaxKm7mTVoFTyoDgYhcJcs176sOcieufM4xumNeknMNE/doY
   UKxjX1194E82xoAN/6wysxKEajENXg8NJGDTxT6iiAwGXJqtSKDb2ju5S
   6dzAyvLjiJh7AStSjdreBbAwfc5mGJ4YXia7L/fa424RZKtJS8aJmd+lL
   wXbVu8S1GHTfMQi+x0DijlcJX/+5tLiJj7R3x9jWVxXENuWMMEKKRJZcL
   w==;
X-CSE-ConnectionGUID: q2BPg7O2R0WiG/swI62lxQ==
X-CSE-MsgGUID: KlstLIPvT6+XGSvGTcA1JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31491755"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="31491755"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 10:26:39 -0700
X-CSE-ConnectionGUID: CpcVIdDURCSY+AkA1Vy0SQ==
X-CSE-MsgGUID: RJv/9UWYRBePjnhBILo7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="61036436"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2024 10:26:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb1Ta-0003Jj-2q;
	Mon, 05 Aug 2024 17:26:32 +0000
Date: Tue, 6 Aug 2024 01:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 151/442] drivers/gpu/drm/drm_panic.c:681:29:
 error: use of undeclared identifier 'file'
Message-ID: <202408060134.3qrCi0eI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449894f5917ad62cb4083d1df948f4f5c92a01da
commit: 8790307566bc72d6fda9b3b49a3a075644b395fd [151/442] drm: panic: convert to read/write iterators
config: arm-randconfig-002-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060134.3qrCi0eI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060134.3qrCi0eI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060134.3qrCi0eI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_panic.c:25:
   In file included from include/drm/drm_modeset_helper_vtables.h:32:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/drm_panic.c:681:29: error: use of undeclared identifier 'file'
     681 |                 struct drm_plane *plane = file->private_data;
         |                                           ^
   1 warning and 1 error generated.


vim +/file +681 drivers/gpu/drm/drm_panic.c

813ca3aa8fecac Jocelyn Falempe 2024-04-09  674  
8790307566bc72 Jens Axboe      2024-08-03  675  static ssize_t debugfs_trigger_write(struct kiocb *iocb, struct iov_iter *from)
813ca3aa8fecac Jocelyn Falempe 2024-04-09  676  {
8790307566bc72 Jens Axboe      2024-08-03  677  	size_t count = iov_iter_count(from);
813ca3aa8fecac Jocelyn Falempe 2024-04-09  678  	bool run;
813ca3aa8fecac Jocelyn Falempe 2024-04-09  679  
8790307566bc72 Jens Axboe      2024-08-03  680  	if (kstrtobool_from_iter(from, count, &run) == 0 && run) {
813ca3aa8fecac Jocelyn Falempe 2024-04-09 @681  		struct drm_plane *plane = file->private_data;
813ca3aa8fecac Jocelyn Falempe 2024-04-09  682  
813ca3aa8fecac Jocelyn Falempe 2024-04-09  683  		draw_panic_plane(plane);
813ca3aa8fecac Jocelyn Falempe 2024-04-09  684  	}
813ca3aa8fecac Jocelyn Falempe 2024-04-09  685  	return count;
813ca3aa8fecac Jocelyn Falempe 2024-04-09  686  }
813ca3aa8fecac Jocelyn Falempe 2024-04-09  687  

:::::: The code at line 681 was first introduced by commit
:::::: 813ca3aa8fecaca9cf81f831d2e036d997ac3ee7 drm/panic: Add debugfs entry to test without triggering panic.

:::::: TO: Jocelyn Falempe <jfalempe@redhat.com>
:::::: CC: Jocelyn Falempe <jfalempe@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
