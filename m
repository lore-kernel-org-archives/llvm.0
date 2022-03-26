Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269D7E
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648336661; x=1679872661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVIOXsNAiUec6kUMxlkVMOpfok8ef399p3qrPosSQAI=;
  b=YToHKEfGRXj/NJ2gTDjf4SF5/F9VFNM9n/ipW8R34HWNC5jwIze5lN6A
   MTADXzsn8zDLOmTB/u3uFX7+FaqpIEGKI7rbxJ0wjY9O7mNYVLewAj5mW
   u82HFnvbul+9vkZ8nGOFYrHxUxtA9kkWEQvSiIhscUlJZ10UEZ5DtXkXH
   yMR96HGgwXcl4vmq+8RlAlf4VXwPCTMwOGBqFB1j86CnLu4sEiK+gcpMs
   ocYjr9PV/gVRwJPEEOeHDgkfBoSkGNQghwOSBTwxz26qY8QtYy+boVmoT
   TYEdr8rlWeTTK3GgfvrhYmYIy4UuWwVRxvNoBbNhlfx5UsANvzWJhu3S0
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10298"; a="258777351"
X-IronPort-AV: E=Sophos;i="5.90,214,1643702400"; 
   d="scan'208";a="258777351"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2022 16:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,214,1643702400"; 
   d="scan'208";a="650602565"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Mar 2022 16:17:39 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYFf9-0000Uc-6A; Sat, 26 Mar 2022 23:17:39 +0000
Date: Sun, 27 Mar 2022 07:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 14072/14381] WARNING: modpost:
 vmlinux.o(.data+0x12018c): Section mismatch in reference from the variable
 sensor_dev_attr_in5_alarm to the function .init.text:set_reset_devices()
Message-ID: <202203270755.7IViqD3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd4fbb998102ef7812d594121fbabd2b10dced1b
commit: 7451caef08ff6fd043cd14079d4abfd0540609af [14072/14381] Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
config: riscv-randconfig-r031-20220325 (https://download.01.org/0day-ci/archive/20220327/202203270755.7IViqD3s-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7451caef08ff6fd043cd14079d4abfd0540609af
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7451caef08ff6fd043cd14079d4abfd0540609af
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x12018c): Section mismatch in reference from the variable sensor_dev_attr_in5_alarm to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in5_alarm references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x12020c): Section mismatch in reference from the variable sensor_dev_attr_in6_alarm to the function .init.text:set_reset_devices()
The variable sensor_dev_attr_in6_alarm references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x114fc8): Section mismatch in reference from the variable dev_attr_in2_max to the function .init.text:set_reset_devices()
The variable dev_attr_in2_max references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x1d33ffc): Section mismatch in reference from the function v4l2_prio_open() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x103a64): Section mismatch in reference from the variable sbsm_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110cd8): Section mismatch in reference from the variable sensor_dev_attr_temp3_fault to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110cf8): Section mismatch in reference from the variable sensor_dev_attr_temp3_min_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110d18): Section mismatch in reference from the variable sensor_dev_attr_temp3_max_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110d38): Section mismatch in reference from the variable sensor_dev_attr_temp3_crit_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110fb8): Section mismatch in reference from the variable sensor_dev_attr_power_state to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110ff8): Section mismatch in reference from the variable emc1402_alarms to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x11342c): Section mismatch in reference from the variable fxxxx_fan_attr to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x11368c): Section mismatch in reference from the variable fxxxx_fan_beep_attr to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1d33ffc): Section mismatch in reference from the function v4l2_prio_open() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x103a64): Section mismatch in reference from the variable sbsm_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110cd8): Section mismatch in reference from the variable sensor_dev_attr_temp3_fault to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110cf8): Section mismatch in reference from the variable sensor_dev_attr_temp3_min_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110d18): Section mismatch in reference from the variable sensor_dev_attr_temp3_max_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110d38): Section mismatch in reference from the variable sensor_dev_attr_temp3_crit_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110fb8): Section mismatch in reference from the variable sensor_dev_attr_power_state to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110ff8): Section mismatch in reference from the variable emc1402_alarms to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x11342c): Section mismatch in reference from the variable fxxxx_fan_attr to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x11368c): Section mismatch in reference from the variable fxxxx_fan_beep_attr to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1d33ffc): Section mismatch in reference from the function v4l2_prio_open() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x103a64): Section mismatch in reference from the variable sbsm_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110cd8): Section mismatch in reference from the variable sensor_dev_attr_temp3_fault to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110cf8): Section mismatch in reference from the variable sensor_dev_attr_temp3_min_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110d18): Section mismatch in reference from the variable sensor_dev_attr_temp3_max_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110d38): Section mismatch in reference from the variable sensor_dev_attr_temp3_crit_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110fb8): Section mismatch in reference from the variable sensor_dev_attr_power_state to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x110ff8): Section mismatch in reference from the variable emc1402_alarms to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x11342c): Section mismatch in reference from the variable fxxxx_fan_attr to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x11368c): Section mismatch in reference from the variable fxxxx_fan_beep_attr to the function .init.text:set_reset_devices()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
