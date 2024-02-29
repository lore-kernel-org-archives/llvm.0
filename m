Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124274BFE;
	Thu, 29 Feb 2024 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709245623; cv=none; b=VtpTkpeHWemJjeKIQp2mfi7n/vjnpEw35r2+s3EWN5eib1o8t5LGboDrDHKsHdpkTp2iPYdm8yViI9qINkLaiG/TYw4FLFE4mps6tloADqNMtQlqfXxEGnpF4LzqCzbIw+EDfftJDUOghCVTnUbu2s8GiaAnflEZAxk9SHPm914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709245623; c=relaxed/simple;
	bh=nEaPwo9nxCX3AKrj4I5+7AeuJMw1iCEr7cpfhKS5Dnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXfvj1wW9JXWIpXdDvwHdoVj2gBAJ8r2aUr9Faj76SgUoGZXmQY24QHwxhv5tz8z/BEJDM3y0mpKmiXv8br+Bfyc3l4g/Rj6FajZNTKmFhP3pC2ZUI6Y3i9vo3vRJkFzw7fGh5H56DnzgwbXhugN6Cv2Lq5hr1KAGMPQMa+n664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gol6sJNk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gol6sJNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709245621; x=1740781621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEaPwo9nxCX3AKrj4I5+7AeuJMw1iCEr7cpfhKS5Dnk=;
  b=Gol6sJNkO1Hn4llZCcxO6iklOu7s08IHJDi3CWfbV/n0NFJ3Y5rRQnqL
   snVSsvbOYIjLluZ+ZaqPaIOLiyfh8I5uwJIu8adP+P6LsVekhPfIL2XiP
   tT+i8/xEUU6XGNa8omVbANRqPDZN4JS9i5UxL2NHAAdyZOURIgiphzcdQ
   M7FskN33LZ0gMjahHw3QbHbaaLlhuibwZXdyebQ46tFhii/tR5gLwDOrY
   asVtp4c+zaBdCOUB4B6TsAg6NoEEnMcFsI0p99I8/0+I/W5OwIbsOGBoO
   pT/R7w2q6INC2TL7EEMDngtCPGzzKpK0umQkoGwqKq/zWbJiCGr4Sbpei
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="4336521"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="4336521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 14:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="38987292"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Feb 2024 14:26:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rforI-000DKB-0h;
	Thu, 29 Feb 2024 22:26:32 +0000
Date: Fri, 1 Mar 2024 06:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Wendy Liang <wendy.liang@xilinx.com>,
	Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 21/860]
 drivers/remoteproc/zynqmp_r5_remoteproc.c:69: warning: Function parameter or
 member 'max_banks' not described in 'xlnx_rpu_soc_data'
Message-ID: <202403010623.pyenOecZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: a5fe1c1d116f2534a25d0fb511bbdeb5d1971a3e [21/860] remoteproc: Add initial zynqmp R5 remoteproc driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010623.pyenOecZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010623.pyenOecZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010623.pyenOecZ-lkp@intel.com/

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
