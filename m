Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745641C7F;
	Mon, 11 Mar 2024 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171050; cv=none; b=b2AdkPQLBrfUSq7BG9EVZsoVOdlBEx/SxhVXHApz556NsuU4m37FiK8yjFinWpK9hw34+Pf0MsAJLxZZbUbiRhTs//HqdEI0uD0Xtq7KsCqx7iInkzQzpsl5XK6YD6caa3fO37PtGMjZon/TE2Byzyepa+mqzpb+bTR3kGcK03o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171050; c=relaxed/simple;
	bh=s4fiVm6+6Tws3hnjP0MD6ORSuQ9Fl2z1TbmyD5aBwAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRxZ1152+vwmC3j9Y/r3ucLHgucilz0s7BKh/4kZyaUThGMc9QAJXjk+CS5xsiTduOyG6gV3WJSAEB1X8OQW0Vphh1WP/sg81kARmpumqL52VtT2BRl9JnZjd7Bd7vMW7eUAI1CswuknC5+HTt4G2sx/iZWckiP6tdtwUdn/bQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnZXcPDM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnZXcPDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710171048; x=1741707048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4fiVm6+6Tws3hnjP0MD6ORSuQ9Fl2z1TbmyD5aBwAI=;
  b=UnZXcPDM+kk2XZ2Oa9dXPKjmHruDK1AGvzf2MUdnDX7o2gKdt+0ehNB2
   EsKquOGtQO9UDJ0YqLw87FYywcdhzbCCETgcPv011ulSKJ+k0w8KUIsD3
   xB8uOV1cplJ7CLdHS+QjjxUfLftAUQGOQ208QeXvhBUk8C3x/9tB4bQ6X
   V3PQU+XbWiKhd+R1AdzXBhRmBkhDG32c9+dDSF5d1mSywqPrnENKoh3U3
   KJ45XAq3iZC+VzLTD9jtwSaT+CcPNizn/1KSF4Hpuuc+X0/FOODLPi1LX
   efs7fe96qn6IZCAS20XRpSRe9TNR0M7PmxNfV5GDNpvtBDr34zYrzShq8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8655529"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8655529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 08:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="42116764"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2024 08:30:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjhbv-0009Cp-2x;
	Mon, 11 Mar 2024 15:30:43 +0000
Date: Mon, 11 Mar 2024 23:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 143/145] fs/bcachefs/fs-ioctl.c:504:5:
 warning: ignoring return value of function declared with
 'warn_unused_result' attribute
Message-ID: <202403112348.VdoxraGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   964337312db426db662cde052d6a56c96657f7fb
commit: 57c6ac42e14b4593a73133062c2d7b63a0d6d776 [143/145] bcachefs: new subvol ioctls
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240311/202403112348.VdoxraGn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403112348.VdoxraGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403112348.VdoxraGn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fs-ioctl.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/fs-ioctl.c:504:5: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     504 |                   copy_to_user_errcode(&user_arg->buf, path.data, path.nr);
         |                   ^~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +/warn_unused_result +504 fs/bcachefs/fs-ioctl.c

   492	
   493	static long bch2_ioctl_subvolume_path(struct bch_fs *c, struct file *file,
   494					      struct bch_ioctl_subvolume_path __user *user_arg)
   495	{
   496		struct bch_ioctl_subvolume_path arg;
   497		darray_char path = {};
   498	
   499		int ret = copy_from_user_errcode(&arg, user_arg, sizeof(arg)) ?:
   500			  bch2_subvol_to_path_checked(c, file->f_path.mnt, arg.subvolid, &path);
   501			  (path.nr > arg.buflen ? -ERANGE : 0) ?:
   502			  (arg.buflen = path.nr, 0) ?:
   503			  copy_to_user_errcode(user_arg, &arg, sizeof(arg)) ?:
 > 504			  copy_to_user_errcode(&user_arg->buf, path.data, path.nr);
   505	
   506		darray_exit(&path);
   507		return ret;
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
