Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6972
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 21:41:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="233064112"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="233064112"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 13:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741374968"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 13:41:52 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqMV6-0006xV-3S; Thu, 25 Nov 2021 21:41:52 +0000
Date: Fri, 26 Nov 2021 05:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: WARNING: modpost: vmlinux.o(.text+0x5b811): Section mismatch in
 reference from the function test_bit() to the variable
 .init.data:numa_nodes_parsed
Message-ID: <202111260506.fhLfHV1D-lkp@intel.com>
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
head:   b501b85957deb17f1fe0a861fee820255519d526
commit: d0a3ac549f389c1511a4df0d7638536305205d20 ubsan: enable for all*config builds
date:   12 months ago
config: x86_64-buildonly-randconfig-r001-20211122 (https://download.01.org/0day-ci/archive/20211126/202111260506.fhLfHV1D-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d0a3ac549f389c1511a4df0d7638536305205d20
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d0a3ac549f389c1511a4df0d7638536305205d20
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x5b811): Section mismatch in reference from the function test_bit() to the variable .init.data:numa_nodes_parsed
The function test_bit() references
the variable __initdata numa_nodes_parsed.
This is often because test_bit lacks a __initdata
annotation or the annotation of numa_nodes_parsed is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x5b877): Section mismatch in reference from the function __next_node() to the variable .init.data:numa_nodes_parsed
The function __next_node() references
the variable __initdata numa_nodes_parsed.
This is often because __next_node lacks a __initdata
annotation or the annotation of numa_nodes_parsed is wrong.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
