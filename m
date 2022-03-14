Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F807469
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 23:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647298935; x=1678834935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaV6oL4I/FyyR5iNIPQSHqtEHwPP6w7CGUb3lzX8owI=;
  b=PNQ4NAYGtBga9sdZv5goOjKuRZ/mq5dpX4Et74RJNHQ7Ux58vvVdIHfQ
   fDYPhgPpaqPBQJe1xytRK4H1N2IjnJehJW/shc5XFSjAXX45VjhzEsnM0
   q7HC3aGluan6QHDa1/b1bCuwQCnzHWccnwd+ZwC9fgvsefdlPNBsQUCa5
   +qPV8hpKCLp65/FGZYGcCzK2tkzJakLaGqjByZQSHuTzaY/SM2vwRb9hj
   Z8W/RtuTGDB/4U/eYIuSrBjBnYAgQvBLC7vWpNwVcNaYWvIP46WhHS8lh
   rAG3667pSgEnAr6JPA9PXaZNdSb3FBAJgAPyXaqcuNDDUcF7AH+sXu/36
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238332146"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="238332146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 16:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="819323692"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Mar 2022 16:02:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTthc-000AJb-A0; Mon, 14 Mar 2022 23:02:12 +0000
Date: Tue, 15 Mar 2022 07:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mauricio Faria de Oliveira <mfo@canonical.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11943/11953] WARNING: modpost:
 vmlinux.o(.data+0x29bf44): Section mismatch in reference from the variable
 ip_vs_ftp to the function .init.text:set_reset_devices()
Message-ID: <202203150613.IspFektS-lkp@intel.com>
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
commit: ce5dfdfe401f01f58e5c98661c8a8bd566374585 [11943/11953] mm: fix race between MADV_FREE reclaim and blkdev direct IO read
config: riscv-randconfig-r042-20220314 (https://download.01.org/0day-ci/archive/20220315/202203150613.IspFektS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ce5dfdfe401f01f58e5c98661c8a8bd566374585
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ce5dfdfe401f01f58e5c98661c8a8bd566374585
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x29bf44): Section mismatch in reference from the variable ip_vs_ftp to the function .init.text:set_reset_devices()
The variable ip_vs_ftp references
the function __init set_reset_devices()
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x1448b7a): Section mismatch in reference from the function tcp4_proc_exit() to the function .init.text:set_reset_devices()
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
