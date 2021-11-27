Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF6968
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 13:57:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="233255756"
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="233255756"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2021 05:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="476149456"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Nov 2021 05:57:53 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqyDA-0009bV-Ik; Sat, 27 Nov 2021 13:57:52 +0000
Date: Sat, 27 Nov 2021 21:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/net/ethernet/chelsio/cxgb4/sge.c:814:28: warning: unused
 function 'calc_tx_descs'
Message-ID: <202111272116.77QvtsrM-lkp@intel.com>
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
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 198688edbf77c6fc0e65f5d062f810d83d090166 MIPS: Fix inline asm input/output type mismatch in checksum.h used with Clang
date:   10 months ago
config: mips-buildonly-randconfig-r003-20211127 (https://download.01.org/0day-ci/archive/20211127/202111272116.77QvtsrM-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=198688edbf77c6fc0e65f5d062f810d83d090166
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 198688edbf77c6fc0e65f5d062f810d83d090166
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/ethernet/chelsio/cxgb4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/cxgb4/sge.c:814:28: warning: unused function 'calc_tx_descs'
   static inline unsigned int calc_tx_descs(const struct sk_buff
   ^
   fatal error: error in backend: Nested variants found in inline asm string: '.if ( 0x04 ) != -1)) 0x04 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/barrier.h", .line = 27, $); 0x04 ) != -1)) : $))) ) && ( (1 << 0) ); .set push; .set mips64r2; .rept (1 - (0x04 == 0x04)); sync 0x04; .endr; .set pop; .else; ; .endif'
   clang-14: error: clang frontend command failed with exit code 70 (use -v to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
   Target: mips64-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-5162b558d8/bin
   clang-14: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr


vim +/calc_tx_descs +814 drivers/net/ethernet/chelsio/cxgb4/sge.c

fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  805  
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  806  /**
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  807   *	calc_tx_descs - calculate the number of Tx descriptors for a packet
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  808   *	@skb: the packet
29bbf5d7f5efe84 drivers/net/ethernet/chelsio/cxgb4/sge.c Rahul Lakkireddy     2020-06-24  809   *	@chip_ver: chip version
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  810   *
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  811   *	Returns the number of Tx descriptors needed for the given Ethernet
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  812   *	packet, including the needed WR and CPL headers.
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  813   */
d0a1299c6bf7d80 drivers/net/ethernet/chelsio/cxgb4/sge.c Ganesh Goudar        2018-01-10 @814  static inline unsigned int calc_tx_descs(const struct sk_buff *skb,
d0a1299c6bf7d80 drivers/net/ethernet/chelsio/cxgb4/sge.c Ganesh Goudar        2018-01-10  815  					 unsigned int chip_ver)
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  816  {
d0a1299c6bf7d80 drivers/net/ethernet/chelsio/cxgb4/sge.c Ganesh Goudar        2018-01-10  817  	return flits_to_desc(calc_tx_flits(skb, chip_ver));
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  818  }
fd3a47900b6f9fa drivers/net/cxgb4/sge.c                  Dimitris Michailidis 2010-04-01  819  

:::::: The code at line 814 was first introduced by commit
:::::: d0a1299c6bf7d80c8bb8e181f36a7c407a4cabca cxgb4: add support for vxlan segmentation offload

:::::: TO: Ganesh Goudar <ganeshgr@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
