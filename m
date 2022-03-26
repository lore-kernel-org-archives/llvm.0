Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A302F56
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648277943; x=1679813943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYrf/B8kMTsq/PiS31xCTD9BYAirC6JhFSYdYCzH648=;
  b=lMX4iLzLtVjfalsS9slcbpjOUk3h9QKWZDONqgQgu4gK0unDbmBpCNIY
   WUY96ge9SfeInZMPHRC/uI8lFzrC0q3oDMOPZqMlddy55/OIRKvb9mIYE
   yN64TaPF5HHmlp5XxZmXPuFP4CPAoleqGI7tcCuPQWsuE1zOEQZSylLdj
   +1K6yH+dUlJwyCrh3RBsaQjd9pqvCPdBVd1FipYyNfLcUSyvCdsTf8Ve0
   9/3Jqqm8zNDxzuttmxFjheexzY096Iy+N9XsiVDsVemC/HWhaIyZoIRG6
   n/B7Nhl77qV/bwuvleGR9th88GWaY7Gbwerm5Xj4e5oLHJTjuT9mNakcO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="256338111"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="256338111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 23:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="520440911"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Mar 2022 23:58:59 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nY0O2-000N6A-W5; Sat, 26 Mar 2022 06:58:59 +0000
Date: Sat, 26 Mar 2022 14:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: WARNING: modpost: vmlinux.o(.data+0x10816c): Section mismatch in
 reference from the variable sensor_dev_attr_fan1_min to the function
 .init.text:set_reset_devices()
Message-ID: <202203261403.MQr5HvWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: f334f5668bedf7307f6df1d98b14f55902931926 ilog2: force inlining of __ilog2_u32() and __ilog2_u64()
date:   2 days ago
config: riscv-randconfig-r031-20220325 (https://download.01.org/0day-ci/archive/20220326/202203261403.MQr5HvWs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f334f5668bedf7307f6df1d98b14f55902931926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f334f5668bedf7307f6df1d98b14f55902931926
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x10816c): Section mismatch in reference from the variable sensor_dev_attr_fan1_min to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_fan1_min references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10820c): Section mismatch in reference from the variable sensor_dev_attr_fan2_div to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_fan2_div references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x106cf0): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in2_min references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10da34): Section mismatch in reference from the variable sensor_dev_attr_in2_input to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in2_input references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10e468): Section mismatch in reference from the variable sensor_dev_attr_temp1_alarm to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_temp1_alarm references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10e488): Section mismatch in reference from the variable sensor_dev_attr_temp2_alarm to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_temp2_alarm references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10e4a8): Section mismatch in reference from the variable sensor_dev_attr_temp3_alarm to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_temp3_alarm references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x101ed0): Section mismatch in reference from the variable dev_attr_w1_seq to the function .init.text:set_reset_devices()
The variable dev_attr_w1_seq references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10e528): Section mismatch in reference from the variable sensor_dev_attr_in3_max to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in3_max references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10e5a8): Section mismatch in reference from the variable sensor_dev_attr_in7_max to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in7_max references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x10eb88): Section mismatch in reference from the variable sensor_dev_attr_in2_alarm to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in2_alarm references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

..

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0xff0ac): Section mismatch in reference from the variable af9033_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x104ff0): Section mismatch in reference from the variable twl4030_bci_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108408): Section mismatch in reference from the variable sensor_dev_attr_fan5_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108428): Section mismatch in reference from the variable sensor_dev_attr_fan5_div to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108448): Section mismatch in reference from the variable sensor_dev_attr_fan5_alarm to the variable .init.text:.LBB58_27
<< WARNING: modpost: vmlinux.o(.data+0x108488): Section mismatch in reference from the variable sensor_dev_attr_pwm5_mode to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084a8): Section mismatch in reference from the variable sensor_dev_attr_fan6_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x1084c8): Section mismatch in reference from the variable sensor_dev_attr_fan6_min to the variable .init.text:.LBB58_28
<< WARNING: modpost: vmlinux.o(.data+0x108508): Section mismatch in reference from the variable sensor_dev_attr_fan6_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x108528): Section mismatch in reference from the variable sensor_dev_attr_pwm6 to the function .init.text:set_reset_devices()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
