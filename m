Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3747F6
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655723093; x=1687259093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hadbjLn9iyhfjtzEfVoW93Wg0bJVBjUMIX1xkBxQtf0=;
  b=E9NkNcNiVjnWZds5v6wLKVdU4b+DsA+wyVLfhlRQDVkH9z2JKaISdqKg
   Q2EIbU1ooEelTFnEq8SgsKJHn9G2uco0t9nwlO2xa77tkvGl13rY4riFJ
   I/1juYUbPhRtsUQZzn9qU5QNsqQLCL96nIpkl1vN4Wklwaj5iy//WJEf1
   an1lcTJ8yFl2LTbr+a30MjNcCt1I2mgp84FvxbA8RIoTBRhRju3gt+Rth
   Iz8LTy5lGN5I3lomJmwSswis6LVRmOw4uHtkcURCCEICB/z8gmoFeDYDj
   CiBcJUdZwMvnI6KTGQqd1xAfO1GhiWNCtWclyiChavF9PsSfNBHGGLKC5
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366190987"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="366190987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 04:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="620064851"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2022 04:04:50 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3FD7-000Sp5-QE;
	Mon, 20 Jun 2022 11:04:49 +0000
Date: Mon, 20 Jun 2022 19:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 778/1181]
 drivers/media/platform/xilinx/xilinx-dprxss.c:521:12: warning: result of
 comparison of constant 18446744073709551615 with expression of type 'u32'
 (aka 'unsigned int') is always false
Message-ID: <202206201904.c5yfGHoB-lkp@intel.com>
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
commit: 1606e76a608339cc67dfd9b03542976482b90805 [778/1181] v4l: xilinx: Driver support for Xilinx DP Rx subsystem
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220620/202206201904.c5yfGHoB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/1606e76a608339cc67dfd9b03542976482b90805
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 1606e76a608339cc67dfd9b03542976482b90805
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/ drivers/media/platform/xilinx/ drivers/phy/xilinx/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-dprxss.c:521:12: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           regval |= FIELD_PREP(clr_mask, set_data);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:52:28: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
                   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:322:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:310:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:302:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/media/platform/xilinx/xilinx-dprxss.c:1571:14: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
           if (val < 1 && val > 4) {
               ~~~~~~~~^~~~~~~~~~
   2 warnings generated.


vim +521 drivers/media/platform/xilinx/xilinx-dprxss.c

   513	
   514	static void xdprxss_clrset(struct xdprxss_state *dp, u32 addr,
   515				   u32 clr_mask, u32 set_data)
   516	{
   517		u32 regval;
   518	
   519		regval = xdprxss_read(dp, addr);
   520		regval &= ~clr_mask;
 > 521		regval |= FIELD_PREP(clr_mask, set_data);
   522		xdprxss_write(dp, addr, regval);
   523	}
   524	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
