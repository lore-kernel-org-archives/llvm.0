Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4A173
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642020436; x=1673556436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ro7YmMLSyQHR9qpLTfejuLr2mkbV2K976zCOwg1xLm4=;
  b=Us8/+Qf7Zx/vcQs4zA2pzy9H3fhcItp01rCUc6NN748grImLHsfA2BI4
   4rK5Q/LpNAjOiGYdNueVike/Q8isI5OyILgikNsVybLgfB9+R9pFEpxeL
   AIlnaSM6R62c9GvWG2XvJj01UGmAuQ5ajgplOJ6bAkaSetLi4TwdaJckE
   Jh1ZlS0txonQaPlDvhL1qsgpqcQaxvStsql+MX+05z6YB3p9zlHOetGDh
   b5rcsHPOotwSVVQSw0Q2dhg4Gv3hGHB4VmZpBcK62FrD/bNNhUF6WfHSw
   aNiwrOR+Ktw329sAdPG6e6baasBdcLxlusG6nufgfCJidp+3bxPvSbQcI
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307199222"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="307199222"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="670285600"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2022 12:47:13 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7kWX-0006O1-C3; Wed, 12 Jan 2022 20:47:13 +0000
Date: Thu, 13 Jan 2022 04:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:master 269/326]
 include/linux/firmware/xlnx-zynqmp.h:1244:5: warning: no previous prototype
 for function 'zynqmp_pm_get_meta_header'
Message-ID: <202201130455.ASiUDDqB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx master
head:   6a698dbaaf0e6caa053476c2f661b36885a0ce30
commit: 22272cc48b5399af99792722fa7004735b769e0a [269/326] firmware: xilinx: Add support to get the image meta-header info
config: hexagon-randconfig-r041-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130455.ASiUDDqB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/22272cc48b5399af99792722fa7004735b769e0a
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 22272cc48b5399af99792722fa7004735b769e0a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/fpga/zynqmp-fpga.c:14:
>> include/linux/firmware/xlnx-zynqmp.h:1244:5: warning: no previous prototype for function 'zynqmp_pm_get_meta_header' [-Wmissing-prototypes]
   int zynqmp_pm_get_meta_header(const u64 src, const u64 dst,
       ^
   include/linux/firmware/xlnx-zynqmp.h:1244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int zynqmp_pm_get_meta_header(const u64 src, const u64 dst,
   ^
   static 
   include/linux/firmware/xlnx-zynqmp.h:1212:12: warning: unused function 'zynqmp_pm_sec_read_reg' [-Wunused-function]
   static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1217:12: warning: unused function 'zynqmp_pm_sec_mask_write_reg' [-Wunused-function]
   static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
              ^
   3 warnings generated.


vim +/zynqmp_pm_get_meta_header +1244 include/linux/firmware/xlnx-zynqmp.h

  1243	
> 1244	int zynqmp_pm_get_meta_header(const u64 src, const u64 dst,
  1245				      const u32 size, u32 *count)
  1246	{
  1247		return -ENODEV;
  1248	}
  1249	#endif
  1250	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
