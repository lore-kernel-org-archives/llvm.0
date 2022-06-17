Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8F2F25
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655459553; x=1686995553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jatSVovl0RLNt7w5AfS9ZLovjM2lQp/8uEaP69S0yB8=;
  b=aeOrx62o1caz35EDNm5fbJRPIIk5AeEzhnMR6Y0PXc743hT05A0FxYVV
   5y+3G0OkNdMwZzJva+BBLtbGLXBcxI4O1rk3EjVDgRxWqA9N/rRZJlgep
   yqLENXM63JVoCYDLcmyiOC5T8SC1o838NvlKePF4ICIIpSW9lQwIiH+yk
   pI3sceQ4ybPkaNBXO5NEZBofWKOn9NGmclnAMeZGfIozfuTfjZwv5MB/h
   nuOLmXU/+QI0MwoM27ceeV1fy8xw6M9eINmBdyO5h1O4XU0cF68SG0ljr
   DAQ56LQz5wfucYzfYHNYermKtqUidct/aUjibMoWM8zj33BoCBoZ/hloZ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259319601"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259319601"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 02:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="641975098"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2022 02:51:43 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o28dd-000PLD-KT;
	Fri, 17 Jun 2022 09:51:37 +0000
Date: Fri, 17 Jun 2022 17:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Kalyani Akula <kalyani.akula@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 443/1181]
 drivers/crypto/xilinx/zynqmp-rsa.c:157:34: warning: unused variable
 'zynqmp_rsa_dt_ids'
Message-ID: <202206171706.Fh4kXeBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 79538c8ad4c8d1aef902abd2e948f8bea21475b0 [443/1181] crypto: zynqmp-rsa: Adopted RSA support for ZynqMP SoC
config: hexagon-randconfig-r022-20220617 (https://download.01.org/0day-ci/archive/20220617/202206171706.Fh4kXeBj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/79538c8ad4c8d1aef902abd2e948f8bea21475b0
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 79538c8ad4c8d1aef902abd2e948f8bea21475b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/xilinx/zynqmp-rsa.c:20:
   include/linux/firmware/xlnx-zynqmp.h:1168:12: warning: unused function 'zynqmp_pm_sec_read_reg' [-Wunused-function]
   static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1173:12: warning: unused function 'zynqmp_pm_sec_mask_write_reg' [-Wunused-function]
   static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
              ^
   include/linux/firmware/xlnx-zynqmp.h:1222:12: warning: unused function 'zynqmp_pm_fpga_get_version' [-Wunused-function]
   static int zynqmp_pm_fpga_get_version(u32 *value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1227:12: warning: unused function 'zynqmp_pm_fpga_get_feature_list' [-Wunused-function]
   static int zynqmp_pm_fpga_get_feature_list(u32 *value)
              ^
>> drivers/crypto/xilinx/zynqmp-rsa.c:157:34: warning: unused variable 'zynqmp_rsa_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id zynqmp_rsa_dt_ids[] = {
                                    ^
   5 warnings generated.


vim +/zynqmp_rsa_dt_ids +157 drivers/crypto/xilinx/zynqmp-rsa.c

   156	
 > 157	static const struct of_device_id zynqmp_rsa_dt_ids[] = {
   158		{ .compatible = "xlnx,zynqmp-rsa" },
   159		{ /* sentinel */ }
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
