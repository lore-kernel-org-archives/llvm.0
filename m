Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E239474;
	Thu, 21 Dec 2023 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAsmpOX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703137873; x=1734673873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZO16lnEyNB1xd51OxcJDTdEnt6qhvZdxM5sQG3d0P4=;
  b=QAsmpOX6xLhdkJ/53/LxGABaXdFXZGxD4N+tYDE59XYIUUSdNa5jBFME
   aV6XjuV6eYcCTH3fWgxqZlJPpFjoZ2Y2THuPqZno4TgWTu4nemiVILhju
   hR0/3ufLnlSrbr04n0IiF2shWTU/1aHe9YSPXT2gFvdTQcLL0FgV7aviU
   ahPQFrWzBahprwQXON2Fm1l+/SMLwdHkp2duNfmJxP5z/1prfhbUrdT/v
   ArGxVQe+tVq2iSLXaU5QL+CDW5KHjI6HEW7ZSap0U0/cIKdDYaRm3Dc46
   8xbfywJmvHyTJaaD5gYCtkIeqVLRe2o1HkWK44WTsdl8ojtJl3Q+i5aJo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="376075305"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="376075305"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 21:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810863066"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="810863066"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Dec 2023 21:51:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGBxc-0007wa-2q;
	Thu, 21 Dec 2023 05:51:08 +0000
Date: Thu, 21 Dec 2023 13:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 51/110] fs/resctrl/monitor.c:51:
 warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty
 RMID each CLOSID has.
Message-ID: <202312211301.8AKnb1D0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: 5c5d737a85643e62cbdce6dd572c2175ea53154b [51/110] x86/resctrl: Move the filesystem portions of resctrl to live in '/fs/'
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231221/202312211301.8AKnb1D0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312211301.8AKnb1D0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312211301.8AKnb1D0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:51: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 51 - I thought it was a doc line


vim +51 fs/resctrl/monitor.c

    49	
    50	/**
  > 51	 * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    52	 *     Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
    53	 *     Indexed by CLOSID. Protected by rdtgroup_mutex.
    54	 */
    55	static u32 *closid_num_dirty_rmid;
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
