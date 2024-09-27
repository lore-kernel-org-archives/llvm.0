Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9B1B375A;
	Fri, 27 Sep 2024 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476795; cv=none; b=MNXcJveAkPsmJr4w1IWItbkFn4xx0hRXa9mPN3b1fFlaoEBcOjwN4FawxglcpI9w68nU2IKmpReIoldvyTQqvNkb63xNGjJyy9UPHbjhjWcBt0tEH9mKc4rzFUd2Jmz9cIFfuTN39dr4gVRY4I1jROMC8g2ycRC0i2TU2luI740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476795; c=relaxed/simple;
	bh=J77Ymn+fLS6ZIblJzGi9l65BaDtISc6bLGcj6BCJdaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INAYEYtjVjAKsjaKLx8Zn7Dtk1yMkBOgZ4VDpWnvC1B6xexRytGgPD4nE8vxsGwmo/we9JelW54KilOWFKywxiFc6mF7iJnVwjHLI56xj/Wf4SqV62SeoCBhGp9+YpuM7J/QQJyAwzuqcC+NTZWfkhVamTPojSRq3DJRtapZ4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC4NqNCV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC4NqNCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727476793; x=1759012793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J77Ymn+fLS6ZIblJzGi9l65BaDtISc6bLGcj6BCJdaM=;
  b=OC4NqNCVb4XCkA+0eZqkdfRCSL2hufM3QlyE/9zIibOFUTJ5fAMlZp2s
   LLrrfVP/hAHZLevhAp+u02rpTfpN8behmhA/Keqp4RIGKdtaWcSMxGzD+
   dMs/DuJhbWDLN8qqQqs2K3527lxMmy4jOCCWUFLNTPauPy09N9ovSOoQA
   4xbVxe1AI0fZU08zv9zy0tvAX0BSIivxHZRrXx+KdPic5El38kBAiv5BX
   TkVao76pyW+9Jazubi4CyK7UGMFxSh54Lh+s+vnghKflrS53e0HDvvu/o
   Oq05c9evWpQReb5waAk7emoY2T/vznMRQ2J+etBonkgxvOa+p7/Fmu6Ez
   g==;
X-CSE-ConnectionGUID: HHFFr6HLQ7mDgN/CmmHuCg==
X-CSE-MsgGUID: lyMjL8k4Tg+sKTg1SmVH3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30341093"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="30341093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 15:39:53 -0700
X-CSE-ConnectionGUID: C+vfVv9IQCus3Wk6lGnj6w==
X-CSE-MsgGUID: BMndFm0gT/2r8bPOxIzt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77049756"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 15:39:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suJcp-000MhT-2v;
	Fri, 27 Sep 2024 22:39:47 +0000
Date: Sat, 28 Sep 2024 06:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Wendy Liang <wendy.liang@xilinx.com>,
	Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 21/1001]
 drivers/remoteproc/zynqmp_r5_remoteproc.c:69: warning: Function parameter or
 member 'max_banks' not described in 'xlnx_rpu_soc_data'
Message-ID: <202409280641.xwhdvzKw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: a5fe1c1d116f2534a25d0fb511bbdeb5d1971a3e [21/1001] remoteproc: Add initial zynqmp R5 remoteproc driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280641.xwhdvzKw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280641.xwhdvzKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280641.xwhdvzKw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/zynqmp_r5_remoteproc.c:69: warning: Function parameter or member 'max_banks' not described in 'xlnx_rpu_soc_data'


vim +69 drivers/remoteproc/zynqmp_r5_remoteproc.c

    51	
    52	/**
    53	 * struct xlnx_rpu_soc_data - match data to handle SoC variations
    54	 * @soc_type:	enum to denote which SOC this is running. on. Some EEMI calls
    55	 *		behave differently on various SoC's so denote here.
    56	 * @tcm_bases:	collection of device addresses that SoC has for TCM banks
    57	 * @num_tcms:	number of entries in the tcm base collection.
    58	 *		for each core.
    59	 * @max_rprocs: Maximum number of remoteproc instances allowed per RPU core.
    60	 * max_banks:	Maximnum number of banks allowed for All Remoteproc instances
    61	 *		for a given SOC.
    62	 */
    63	struct xlnx_rpu_soc_data {
    64		enum soc_type_t soc_type;
    65		unsigned int tcm_bases[MAX_BANKS_PER_CORE];
    66		unsigned int num_tcms;
    67		unsigned int max_rprocs;
    68		unsigned int max_banks;
  > 69	};
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
