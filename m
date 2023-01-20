Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C328E7;
	Fri, 20 Jan 2023 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674227530; x=1705763530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDizxFYtcrdcS+pecIKpIZ3JBIK2YM1sC5jvep+VtDQ=;
  b=Q54iPnH7iELc2vschmBsS+x+uV4P7uEfWz1TutsLsxz8JndQnfRmGKqw
   J7to3/r9RFGL2Bef5Jbc0ima5Xzt++WSlr0L9xliXjM+28BNoo6W9dqP5
   7+u5ewD6VwyN63t872reT5btTMSiIzy93PrPpM7i80wjnbbwpui55yNnp
   muqldnO/ewPZUZ//1OZkTscfaMKxyj8SfhRKhLNWH6T/HMYkNJoecH3VE
   YioSBIuAEbIaoMFCwNZ1Hn7E409ueWKKr9NMczl3O4/kReMqno/XS6wD2
   WtFu8Ruy0dNP5Yre0yQmAObkkupmOtS0vyOZBczS42t36PHYe5r/lv8c5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323286313"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="323286313"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 07:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692884382"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="692884382"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 07:12:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIt3m-0002e6-1E;
	Fri, 20 Jan 2023 15:12:06 +0000
Date: Fri, 20 Jan 2023 23:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Izhar Ameer Shaikh <izhar.ameer.shaikh@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Tanmay Shah <tanmay.shah@xilinx.com>,
	Rajan Vaja <rajan.vaja@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:master 40/773]
 include/linux/firmware/xlnx-zynqmp.h:1124:12: warning: unused function
 'zynqmp_pm_sec_read_reg'
Message-ID: <202301202325.4Cm9ujVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   155ae9648df275d38841cfe45231ba0471baa1cb
commit: 41adf9b5d9695095fe08233b2d702251b4081609 [40/773] firmware: xilinx: Add support for secure read/write ioctl interface
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230120/202301202325.4Cm9ujVl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/41adf9b5d9695095fe08233b2d702251b4081609
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 41adf9b5d9695095fe08233b2d702251b4081609
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:
>> include/linux/firmware/xlnx-zynqmp.h:1124:12: warning: unused function 'zynqmp_pm_sec_read_reg' [-Wunused-function]
   static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
              ^
>> include/linux/firmware/xlnx-zynqmp.h:1129:12: warning: unused function 'zynqmp_pm_sec_mask_write_reg' [-Wunused-function]
   static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
              ^
   2 warnings generated.


vim +/zynqmp_pm_sec_read_reg +1124 include/linux/firmware/xlnx-zynqmp.h

  1123	
> 1124	static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
  1125	{
  1126		return -ENODEV;
  1127	}
  1128	
> 1129	static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
  1130						u32 mask, u32 value)
  1131	{
  1132		return -ENODEV;
  1133	}
  1134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
