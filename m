Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B361FBA
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650586771; x=1682122771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4J/5UKagLoRW1miQ6Kgk2SRBFCed7jhYgAAQPoIBM4U=;
  b=LS2tzh/X4FrzfQIFmccuxjN1sWMzP+vVBSWxJMuNldoA6AY6d7PAw02j
   IJd/KEB25828KaWhdZEcPt4zublTFoKCF1uY4mCTGg8xHbh5YTbKd8jzN
   ugrRL4F060Hn/ASo/Dbj4vUoK8fuCtpPDZwINtCy1hZyANxozasXh2D8u
   wodXuDaUkaFb68m7Zjngyl27f6lCQ9N3WE7/EH5bwb1f7+w7IVx3wDEOT
   o198G/tT18qS83abj7WkbIf1M8dIRWFcsSzwVkGt/hZE+tC0xjNPNrBGH
   tlTnVMPXyuD8ajcK3BBLcEpy79Si1JHvjJgnJUKhXr7x2BcAeAt9WzYbD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="262120877"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="262120877"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 17:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="671443819"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2022 17:19:28 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhh1D-00090A-TD;
	Fri, 22 Apr 2022 00:19:27 +0000
Date: Fri, 22 Apr 2022 08:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: [hnaz-mm:master 1/291] WARNING: modpost: vmlinux.o(.data+0x25c2ac):
 Section mismatch in reference from the variable ad7418_driver to the
 function .init.text:set_reset_devices()
Message-ID: <202204220814.GIektaty-lkp@intel.com>
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
commit: c94c865a5858f9ddb424d9b57b33d1664a986044 [1/291] origin
config: riscv-randconfig-r015-20220420 (https://download.01.org/0day-ci/archive/20220422/202204220814.GIektaty-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/hnaz/linux-mm/commit/c94c865a5858f9ddb424d9b57b33d1664a986044
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout c94c865a5858f9ddb424d9b57b33d1664a986044
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x25c2ac): Section mismatch in reference from the variable ad7418_driver to the function .init.text:set_reset_devices()
The variable ad7418_driver references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x126d798): Section mismatch in reference from the function ir_raw_get_allowed_protocols() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1505c8e): Section mismatch in reference from the function tb_debugfs_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2356bc): Section mismatch in reference from the variable tuners to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x25c43c): Section mismatch in reference from the variable ad7417_attrs to the function .meminit.text:init_reserve_notifier()
<< WARNING: modpost: vmlinux.o(.data+0x25c444): Section mismatch in reference from the variable ad7417_attrs to the variable .meminit.text:.LBB9_3
<< WARNING: modpost: vmlinux.o(.data+0x25c454): Section mismatch in reference from the variable sensor_dev_attr_in1_input to the function .meminit.text:init_reserve_notifier()
<< WARNING: modpost: vmlinux.o(.data+0x25c474): Section mismatch in reference from the variable sensor_dev_attr_in2_input to the function .meminit.text:init_reserve_notifier()
<< WARNING: modpost: vmlinux.o(.data+0x25c494): Section mismatch in reference from the variable sensor_dev_attr_in3_input to the function .meminit.text:init_reserve_notifier()
<< WARNING: modpost: vmlinux.o(.data+0x25c4b4): Section mismatch in reference from the variable sensor_dev_attr_in4_input to the variable .meminit.text:.LBB9_4
<< WARNING: modpost: vmlinux.o(.data+0x25c4c8): Section mismatch in reference from the variable sensor_dev_attr_in4_input to the function .meminit.text:init_reserve_notifier()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
