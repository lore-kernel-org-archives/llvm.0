Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442729B0;
	Thu, 23 Jan 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633316; cv=none; b=moBy/Ou3+p4MwruvgrJuLsfYIwzUMx2FOWqP29L7pNiUELjJR/zsumPIUl3WnMgU2OqLemXKhTuDRLSWa+8BcsHdTsdklPyPU73gb7fN7XQbio7zojp1L8DHSAVU1LyIAo7TuP9GzEdhw7KdTdFjs/j6wcdaz+6RJJlgpgTIZcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633316; c=relaxed/simple;
	bh=P6Km8srof5mA6WEeJG5U9M4FtGeOcGvSbWdKjnJxEWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7EmMhCtO3aNG0LCO+tCvX1teFqaUSEl2X5sYaAunbVqmmdqnUPVN8gWoLvwk2m66HJcygYG5H0lI+/LJv/pafOI8+Z+1JqGgnAUsIwQj/kOvIpQh/3+03HanqBr6wJRBWiU9CyOA4LDhxBPxS55cqwHK6UaCNoij7CshMP92JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVWFHS79; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVWFHS79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737633315; x=1769169315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6Km8srof5mA6WEeJG5U9M4FtGeOcGvSbWdKjnJxEWQ=;
  b=OVWFHS79SCaB9qE0JJT3wa3BGB0Mm/E0IsmPw66+Z9WBC+5CFUsfTwbS
   DQO2+PfAgqPV+uot1WokFFOuNpuwUUo2SkztJ2H4twZ4s2Mzupt+CDd6b
   WphgzyJFSLPZHOKEL1PRHLY3bHdFBOPzu9ec5uQtwgFUQyF4fzwIHT4PT
   bxkf/tLoJp3ZuQcOuL9uyG8XNj6mSRzYOx2ghwKgOUsqJoh/MkuIFqmdI
   prdLt9bRWpT4QLs8x8GrjcJrIWSANsisJ/ovVvY1ukyhW2GciKbPy0+On
   RLIHHiXn8SVh/Snx+UYsHLiZU2BkwyQAUOBae2C0onqKb1JPhZ+Q3JJq1
   g==;
X-CSE-ConnectionGUID: P5b/3jBfQfuHcXFxl7iSRg==
X-CSE-MsgGUID: mKWX3SPuTguPH+xc9aSvFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48792614"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="48792614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:55:14 -0800
X-CSE-ConnectionGUID: aM53XUAsTUqDYIJkqa2F9w==
X-CSE-MsgGUID: opHTRDHfS7+rRSutNK/pjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112403311"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2025 03:55:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tavni-000b8e-35;
	Thu, 23 Jan 2025 11:55:10 +0000
Date: Thu, 23 Jan 2025 19:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-tiny-kfree_rcu 7/7] ERROR: modpost: "kvfree_call_rcu"
 [kernel/rcu/rcuscale.ko] undefined!
Message-ID: <202501231907.BX4JFBtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-tiny-kfree_rcu
head:   d8cf97ccfbdeb8f997ea14888a148a02384b3188
commit: d8cf97ccfbdeb8f997ea14888a148a02384b3188 [7/7] slab: don't batch kvfree_rcu() with SLUB_TINY
config: arm64-randconfig-003-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231907.BX4JFBtN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231907.BX4JFBtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231907.BX4JFBtN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kvfree_call_rcu" [kernel/rcu/rcuscale.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [fs/autofs/autofs4.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [fs/orangefs/orangefs.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [fs/ceph/ceph.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [lib/test_vmalloc.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [drivers/gpu/drm/etnaviv/etnaviv.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [drivers/infiniband/core/ib_core.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [drivers/infiniband/core/ib_cm.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [drivers/infiniband/core/ib_uverbs.ko] undefined!
WARNING: modpost: suppressed 26 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
