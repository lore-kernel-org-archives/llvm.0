Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB6833EA
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649276835; x=1680812835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBKT+pkSxKYxEufXcN1rqUjEhRZcAM7HPyli/Ncj5Hs=;
  b=IJvrXMw1fduob2IvRjzXuX/kXkErMXLAz/niXwJkcWs0o0rStxdyQwcf
   tE4Y2fVxK0ghwCfVwpKOXUzhnAVzfhgI/E+PNlyj3a/WmKFUEgMXVE0WP
   XksH6dLer098XHAknQXwG8KHLsBDza2QMckOjCUprzxCzcoVsLi367CUf
   HDGhkrnU23JwX5EsBgdBx/FdvNN1WQvsFmbmpRnaL68B1AiQPY6/ZjeZ2
   vK1Ws7Dn3KMuZUvgRZ11lo7P0P2GGKclqvfYPAQBfqJ3IHwAeizLLP3ao
   rCkyqAuvC320PRqRKU5jJjyXNAf10Smtgdw/G0r7InPtjZy9HfDVu3Szd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="241735582"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="241735582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 13:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="658678638"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2022 13:26:42 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncCEj-0004ix-Ag;
	Wed, 06 Apr 2022 20:26:41 +0000
Date: Thu, 7 Apr 2022 04:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2296/2385] WARNING: modpost:
 vmlinux.o(.text+0x14bb816): Section mismatch in reference from the function
 wiphy_sysfs_init() to the function .init.text:set_reset_devices()
Message-ID: <202204070437.p3EkHIfz-lkp@intel.com>
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
head:   109f6d10ec17302c4666f7df3dfa0e31d8589d41
commit: bc1dcf8421ef30e35015ca2d4271f8c2c90e0bc4 [2296/2385] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220407/202204070437.p3EkHIfz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bc1dcf8421ef30e35015ca2d4271f8c2c90e0bc4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bc1dcf8421ef30e35015ca2d4271f8c2c90e0bc4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x14bb816): Section mismatch in reference from the function wiphy_sysfs_init() to the function .init.text:set_reset_devices()
The function wiphy_sysfs_init() references
the function __init set_reset_devices().
This is often because wiphy_sysfs_init lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.data+0x284f5c): Section mismatch in reference from the variable ieee80211_class to the function .init.text:set_reset_devices()
The variable ieee80211_class references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x13e72fa): Section mismatch in reference from the function br_mrp_del_impl() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13e7a36): Section mismatch in reference from the function br_mrp_rcv() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x28101c): Section mismatch in reference from the variable raw_notifier_lock to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x284c88): Section mismatch in reference from the variable rds_trans_sem to the function .meminit.text:init_reserve_notifier()
<< WARNING: modpost: vmlinux.o(.data+0x284c90): Section mismatch in reference from the variable rds_trans_sem to the function .init.text:loglevel()
<< WARNING: modpost: vmlinux.o(.data+0x2851e8): Section mismatch in reference from the variable reg_check_chans to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(__ex_table+0x2220): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
<< WARNING: modpost: vmlinux.o(.text+0x13e7e04): Section mismatch in reference from the function br_mrp_mrm_process() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13e7eac): Section mismatch in reference from the function br_mrp_mim_process() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13eb240): Section mismatch in reference from the function aarp_send_ddp() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13e72fa): Section mismatch in reference from the function br_mrp_del_impl() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13e7a36): Section mismatch in reference from the function br_mrp_rcv() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x28101c): Section mismatch in reference from the variable raw_notifier_lock to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x284c88): Section mismatch in reference from the variable rds_trans_sem to the function .meminit.text:init_reserve_notifier()
<< WARNING: modpost: vmlinux.o(.data+0x284c90): Section mismatch in reference from the variable rds_trans_sem to the function .init.text:loglevel()
<< WARNING: modpost: vmlinux.o(.data+0x2851e8): Section mismatch in reference from the variable reg_check_chans to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(__ex_table+0x2220): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
<< WARNING: modpost: vmlinux.o(.text+0x13e7e04): Section mismatch in reference from the function br_mrp_mrm_process() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13e7eac): Section mismatch in reference from the function br_mrp_mim_process() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x13eb240): Section mismatch in reference from the function aarp_send_ddp() to the function .exit.text:test_ww_mutex_exit()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
