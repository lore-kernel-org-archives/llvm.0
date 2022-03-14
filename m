Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2113FEC
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647284781; x=1678820781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9eYCz3qDCCSFkac5uy8vhRJ/mXF052JjK3aEXTF4Ns=;
  b=cfZeCu4Iemk/L8JRYOPPTpmC7S+XnkimMqT3kMWSVgRjVH10bOWP40lZ
   m7ruNefAl2VrWiSdYODgpsl1Lhj/KiLd+b0mn4DZIfR/ST+uIVY9pSqhD
   3fwmfuOUV08cKjUUVg7v9KxsvkTUiKjvbiDAh6DPTjiJ7hOKC7Sq6WUNW
   +mdpSAUJjCZZSnZRxul8KoSDXCMbslAl4v3vmaz/jCGStMUwjM/KdrO2A
   REmGMUpT06i1mWZ/IhqWDJh1NO7wdLygTZH+9FCr4SztBAHkw6+2GvuQq
   2R5LqrdVqcLyDMuH/Ll8lfxwO6T02tkt+N7rLJPScFmlmODLKf59h8Z14
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238292334"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="238292334"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="515568278"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Mar 2022 12:06:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTq1K-000A95-TH; Mon, 14 Mar 2022 19:06:18 +0000
Date: Tue, 15 Mar 2022 03:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11931/11953] WARNING: modpost:
 vmlinux.o(.data+0x29c244): Section mismatch in reference from the variable
 ipv4_route_table to the function .init.text:set_reset_devices()
Message-ID: <202203150329.AC4pjgdo-lkp@intel.com>
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
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 8a676c9d1697eaf76d2e81b5b18e09af21d7c7bd [11931/11953] mm: optimize do_wp_page() for fresh pages in local LRU pagevecs
config: riscv-randconfig-r042-20220314 (https://download.01.org/0day-ci/archive/20220315/202203150329.AC4pjgdo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8a676c9d1697eaf76d2e81b5b18e09af21d7c7bd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8a676c9d1697eaf76d2e81b5b18e09af21d7c7bd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x29c244): Section mismatch in reference from the variable ipv4_route_table to the function .init.text:set_reset_devices()
The variable ipv4_route_table references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x1448b2a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b15e8): Section mismatch in reference from the variable event_rpcgss_ctx_init to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b15ec): Section mismatch in reference from the variable event_rpcgss_ctx_init to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1618): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b1638): Section mismatch in reference from the variable event_rpcgss_ctx_destroy to the variable .exit.text:.LBB0_1
<< WARNING: modpost: vmlinux.o(.data+0x2b1660): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.data+0x2b1690): Section mismatch in reference from the variable trace_event_fields_rpcgss_svc_gssapi_class to the function .init.text:init_nls_cp737()
<< WARNING: modpost: vmlinux.o(.data+0x2b1be8): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.data+0x2b1c08): Section mismatch in reference from the variable event_rpcgss_svc_unwrap to the variable .init.text:.LBB1_1
<< WARNING: modpost: vmlinux.o(.data+0x293824): Section mismatch in reference from the variable nf_ct_proto_mutex to the function .init.text:loglevel()

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
