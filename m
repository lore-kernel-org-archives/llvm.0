Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1223A4
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650616600; x=1682152600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYswYbGhBvjXESRAHzaTDAvWjmzhQx+25B4YSVEtLWQ=;
  b=F8Xk7QzJ5FlCrOb5NHP945R/Ra30QhQVihAEZEpjE6c6IIXwms7FhGW5
   Ayo+Osh+nFA31ZyIPMB0IyhQmgYm13+9cLFA3XCTqwfWwx7gJpZ3n6TVW
   lFL5ssmAkDIFNP7kuOldQ2RBhBvX8bXOfpGWqGYq0qxqJYe56Hn0GqCiw
   mk6j30PXaiRyJ+BcBDUPTYC6bKw2qBZYZ3I0Rl1d1HHJESbWvj0kIifgt
   VR073852Y4/adNgtOEq3Y2gGDjF8Cdf7l0S56uXF7a6wPikLKV1O9+CFl
   FV1WgubPmZdWA0LgJghYYze4saxpYE0hvhMYs2FlbK+fEd0lvKoJXjxUG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264093036"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="264093036"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 01:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="626908927"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2022 01:36:36 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhomK-0009vr-7q;
	Fri, 22 Apr 2022 08:36:36 +0000
Date: Fri, 22 Apr 2022 16:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
	Joel Savitz <jsavitz@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [hnaz-mm:master 12/291] WARNING: modpost: vmlinux.o(.data+0x23acb0):
 Section mismatch in reference from the variable rc_class to the function
 .init.text:set_reset_devices()
Message-ID: <202204221628.Qw9iZP1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/hnaz/linux-mm master
head:   ba42854fa9997614e0ffdbc35b082df3ba6e59da
commit: 85dd63c3a11207bd98815d579b153c63a9efc96d [12/291] oom_kill.c: futex: delay the OOM reaper to allow time for proper futex cleanup
config: riscv-randconfig-r015-20220420 (https://download.01.org/0day-ci/archive/20220422/202204221628.Qw9iZP1o-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/hnaz/linux-mm/commit/85dd63c3a11207bd98815d579b153c63a9efc96d
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 85dd63c3a11207bd98815d579b153c63a9efc96d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x23acb0): Section mismatch in reference from the variable rc_class to the function .init.text:set_reset_devices()
The variable rc_class references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x23ad08): Section mismatch in reference from the variable rc_ida to the function .init.text:set_reset_devices()
The variable rc_ida references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x23ad30): Section mismatch in reference from the variable empty_map to the function .init.text:set_reset_devices()
The variable empty_map references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:

--
>> WARNING: modpost: vmlinux.o(.data+0x2660e0): Section mismatch in reference from the variable dme1737_zone3_attr to the function .init.text:set_reset_devices()
The variable dme1737_zone3_attr references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x1505de2): Section mismatch in reference from the function tb_debugfs_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2304c4): Section mismatch in reference from the variable ov6650_i2c_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2596cc): Section mismatch in reference from the variable w83781d_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de80): Section mismatch in reference from the variable sensor_dev_attr_in1_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de9c): Section mismatch in reference from the variable sensor_dev_attr_in1_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25debc): Section mismatch in reference from the variable sensor_dev_attr_in2_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25dedc): Section mismatch in reference from the variable sensor_dev_attr_in2_max to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25defc): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the variable .init.text:.LBB120_29
<< WARNING: modpost: vmlinux.o(.data+0x25df00): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25df1c): Section mismatch in reference from the variable sensor_dev_attr_in2_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1505de2): Section mismatch in reference from the function tb_debugfs_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2304c4): Section mismatch in reference from the variable ov6650_i2c_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2596cc): Section mismatch in reference from the variable w83781d_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de80): Section mismatch in reference from the variable sensor_dev_attr_in1_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de9c): Section mismatch in reference from the variable sensor_dev_attr_in1_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25debc): Section mismatch in reference from the variable sensor_dev_attr_in2_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25dedc): Section mismatch in reference from the variable sensor_dev_attr_in2_max to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25defc): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the variable .init.text:.LBB120_29
<< WARNING: modpost: vmlinux.o(.data+0x25df00): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25df1c): Section mismatch in reference from the variable sensor_dev_attr_in2_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1505de2): Section mismatch in reference from the function tb_debugfs_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2304c4): Section mismatch in reference from the variable ov6650_i2c_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2596cc): Section mismatch in reference from the variable w83781d_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de80): Section mismatch in reference from the variable sensor_dev_attr_in1_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de9c): Section mismatch in reference from the variable sensor_dev_attr_in1_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25debc): Section mismatch in reference from the variable sensor_dev_attr_in2_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25dedc): Section mismatch in reference from the variable sensor_dev_attr_in2_max to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25defc): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the variable .init.text:.LBB120_29
<< WARNING: modpost: vmlinux.o(.data+0x25df00): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25df1c): Section mismatch in reference from the variable sensor_dev_attr_in2_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1505de2): Section mismatch in reference from the function tb_debugfs_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2304c4): Section mismatch in reference from the variable ov6650_i2c_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2596cc): Section mismatch in reference from the variable w83781d_driver to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de80): Section mismatch in reference from the variable sensor_dev_attr_in1_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25de9c): Section mismatch in reference from the variable sensor_dev_attr_in1_alarm to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25debc): Section mismatch in reference from the variable sensor_dev_attr_in2_input to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25dedc): Section mismatch in reference from the variable sensor_dev_attr_in2_max to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25defc): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the variable .init.text:.LBB120_29
<< WARNING: modpost: vmlinux.o(.data+0x25df00): Section mismatch in reference from the variable sensor_dev_attr_in2_min to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25df1c): Section mismatch in reference from the variable sensor_dev_attr_in2_alarm to the function .init.text:set_reset_devices()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
