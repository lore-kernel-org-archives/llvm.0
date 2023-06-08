Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285B33B406;
	Thu,  8 Jun 2023 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686196583; x=1717732583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k99wrPIvy0sEGb2/m3VmAkXjfmuNeLcXmkCqr20amFY=;
  b=MCgpiRxO7AIYe0KaTfShs7VupWJYXmdiqHBmpJwUk/1pbyZuh5X63cMu
   N5XcXkKg+O+6fJP1McN6LZZzjgd7Ck7j3DQv8BLPVsqq3oG4defrK37fE
   NMpaG0WZmNr8a98ePM75489ranvtjtgHsgcsy1EsnXy1wVbNjzdHYR9+k
   d41VBQtu+8adUyXHQCuOMsiKc7xmBsg1mqT/YDG/W87Q9+TqxM8X0FQhJ
   eriF1rewc2Xy9FM4dFkMS6Ki4XApkpn6U2MlSeCexUI97Sy3NoxHdn8ai
   9ETN5BV8MLuRGGdW9ZNOe7KcABDBMhtl/yMOGUfii9bOV6XgvMb+0iT6n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360522644"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="360522644"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 20:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854174682"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="854174682"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 20:56:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q76l2-0007Dm-0x;
	Thu, 08 Jun 2023 03:56:20 +0000
Date: Thu, 8 Jun 2023 11:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v12 3/4] ice: add ability to
 read FW log data and configure the number of log buffers
Message-ID: <202306081116.lKcH4bg6-lkp@intel.com>
References: <20230607222443.119-4-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607222443.119-4-paul.m.stillwell.jr@intel.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230608-062658
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230607222443.119-4-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v12 3/4] ice: add ability to read FW log data and configure the number of log buffers
config: x86_64-randconfig-a006-20230607 (https://download.01.org/0day-ci/archive/20230608/202306081116.lKcH4bg6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/20230607222443.119-4-paul.m.stillwell.jr@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081116.lKcH4bg6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_debugfs.c:638:6: warning: variable 'debug_count' set but not used [-Wunused-but-set-variable]
           int debug_count;
               ^
   1 warning generated.


vim +/debug_count +638 drivers/net/ethernet/intel/ice/ice_debugfs.c

   623	
   624	/**
   625	 * ice_debugfs_data_read - read from 'data' file
   626	 * @filp: the opened file
   627	 * @buffer: where to write the data for the user to read
   628	 * @count: the size of the user's buffer
   629	 * @ppos: file position offset
   630	 */
   631	static ssize_t ice_debugfs_data_read(struct file *filp, char __user *buffer,
   632					     size_t count, loff_t *ppos)
   633	{
   634		struct ice_pf *pf = filp->private_data;
   635		struct ice_hw *hw = &pf->hw;
   636		int data_copied = 0;
   637		bool done = false;
 > 638		int debug_count;
   639	
   640		/* don't allow commands if the FW doesn't support it */
   641		if (!ice_fwlog_supported(&pf->hw))
   642			return -EOPNOTSUPP;
   643	
   644		if (ice_fwlog_ring_empty(&hw->fwlog_ring))
   645			return 0;
   646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
