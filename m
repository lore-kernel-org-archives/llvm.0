Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3C10E1
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655824937; x=1687360937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1flX2RejbeqfiODphgVCmQ1ehxJD9lWgF0DaPcQBkuA=;
  b=DbTirIg1muUM+0BeyH1Ed5bUZO0/qqAD3W68JouiZWW+OmogSCrJWl4k
   LgyhrYNlDtV2Nvcu8LAXLt5rC5sFbhCMFh4+Ztk7LnD342dscFnQEqqxO
   BS5u6xeRezO6YdXAHEL3X/q75BjMUb5KdcRSbvI5ki0kVQpPOwVsM1UmC
   mc0LubVB5icp60JmuNUZPNAaeIiB3ATC3hF3NUj59qsA5p1CHlDzSmjNK
   mXZqbBV1na6QXFjGYXyR0+1xgSKzWVs7MIdBpVAqpOUDC1lSQ2WwsK1zP
   2iP4dBEeayxyFxAB2EL2oMQLa6p5Nesq20+BtqPRfhl3yPuNqRh/2vuWQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280876499"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="280876499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 08:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="585807080"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2022 08:22:02 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3fhZ-00004Z-LC;
	Tue, 21 Jun 2022 15:22:01 +0000
Date: Tue, 21 Jun 2022 23:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>, michal.simek@xilinx.com,
	hao.wu@intel.com, trix@redhat.com, mdf@kernel.org,
	yilun.xu@intel.com, gregkh@linuxfoundation.org,
	ronak.jain@xilinx.com, rajan.vaja@xilinx.com,
	abhyuday.godhasara@xilinx.com, piyush.mehta@xilinx.com,
	harsha.harsha@xilinx.com, lakshmi.sai.krishna.potthuri@xilinx.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org, git@xilinx.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/3] firmware: xilinx: Add pm api function for PL
 readback
Message-ID: <202206212247.2Ky8WLW2-lkp@intel.com>
References: <20220621092833.1057408-3-nava.manne@xilinx.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621092833.1057408-3-nava.manne@xilinx.com>

Hi Nava,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc3 next-20220621]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/fpga-manager-change-status-api-prototype-don-t-use-older/20220621-183524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 78ca55889a549a9a194c6ec666836329b774ab6d
config: hexagon-randconfig-r003-20220620 (https://download.01.org/0day-ci/archive/20220621/202206212247.2Ky8WLW2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6b66792a9e4acd718d58c0e5a33ca2426837be87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nava-kishore-Manne/fpga-manager-change-status-api-prototype-don-t-use-older/20220621-183524
        git checkout 6b66792a9e4acd718d58c0e5a33ca2426837be87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/fpga/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/fpga/zynqmp-fpga.c:13:
>> include/linux/firmware/xlnx-zynqmp.h:747:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +747 include/linux/firmware/xlnx-zynqmp.h

   743	
   744	static int zynqmp_pm_fpga_read(const u32 reg_numframes,
   745				       const phys_addr_t phys_address,
   746				       bool readback_type, u32 *value);
 > 747	{
   748		return -ENODEV;
   749	}
   750	#endif
   751	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
