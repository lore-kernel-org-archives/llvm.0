Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273E158217;
	Fri, 14 Jun 2024 15:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377208; cv=none; b=meCs7mkL+g1hISs+HYW/7uScVfx6KfxrDuYPsjTg9v7rBw0r+3/RLnC1BsxPF6Ii9McER2C5d1+Sun013Yi+LYQKaCO5UEvVkb6HMve16m9uDYcQA/QFESAM3yOo7PwHATevoQWm8/Qm5pO6tgdSyEudRELxhgXeaAhm2p/1d98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377208; c=relaxed/simple;
	bh=3F2knH2K1LJ/XJ6dM6L+kEtyFuqdZt9D2ei175bUrWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gspgQqCyrVHUjGBHQli1B+Opj4bv4cLUf2BZwwimHAskwbxtIsF0Cy1K6RTcZMjQVI8rMlEzPH8W2FjfxHl2EYsvmSHGBJY48wxVKIG1q3brUVIhwkVcRsuhmFZPJ42WgmFtHdAiFkbzMnAXR6WDstogfP5xPzyvgWncBmCsaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNor18Iq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNor18Iq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718377207; x=1749913207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3F2knH2K1LJ/XJ6dM6L+kEtyFuqdZt9D2ei175bUrWU=;
  b=HNor18IqlraZWCdDya4Sseb5EwKMpALnt9IjAvV+6sV0uhaAFbgffXSj
   HOWa1uQScDMGIaoLw/+sLs9yXOpOzI6fQBmIgDA1QNA/bc0vd0iA09SvF
   FbRHTeDuxd+Nc5nOXA4aj/qPozGAuJWFprTZ7bHSeprmqC/LiWX91qu5v
   njBRbtgxqDWFt3hlElirvz76lL6gvEggcV60BdXhD5e8ur44J+/7MAESt
   Blkt55hf41o4LwV0Hd6VGxFYRL+SLCJKPDLMAOjc7bP5Jl0krpnQC2Bfe
   OVW1kZydB6GUEtnlm7eS0DQLrkoa/52U5crlFbyHjKcRkZZGPl/S2QMRF
   w==;
X-CSE-ConnectionGUID: F8CFe3xKSHSzB6GYWBNfhg==
X-CSE-MsgGUID: CnzK/sQVSES9rGnSjlRWUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26662645"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="26662645"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:00:06 -0700
X-CSE-ConnectionGUID: KgSADDZWTuuDv/8hK3xINA==
X-CSE-MsgGUID: +DQ9X1eGQ+GiQNAtnrYZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40655809"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 08:00:05 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI8PL-0001Qn-09;
	Fri, 14 Jun 2024 15:00:03 +0000
Date: Fri, 14 Jun 2024 22:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot/v6.10-rc1 95/114]
 drivers/platform/arm64/mpam/mpam_resctrl.c:33: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202406142227.9SGqPIPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.10-rc1
head:   d9ba67a1a8dc6551a0b3254a8f2ee9993ad17957
commit: b3015be71d9bb40b55d832bdcc6b4641cbce3ba1 [95/114] untested: arm_mpam: resctrl: Add support for csu counters
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240614/202406142227.9SGqPIPG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142227.9SGqPIPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142227.9SGqPIPG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/arm64/mpam/mpam_resctrl.c:33: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The classes we've picked to map to resctrl events.


vim +33 drivers/platform/arm64/mpam/mpam_resctrl.c

    31	
    32	/**
  > 33	 * The classes we've picked to map to resctrl events.
    34	 * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
    35	 * array lets us find the actual class backing the event counters. e.g.
    36	 * the only memory bandwith counters may be on the memory controller, but to
    37	 * make use of them, we pretend they are on L3.
    38	 * Class pointer may be NULL.
    39	 */
    40	static struct mpam_class *mpam_resctrl_counters[QOS_NUM_EVENTS];
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
