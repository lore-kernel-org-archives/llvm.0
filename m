Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8DC1FC0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650551842; x=1682087842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsPJo/C0ybgqsg0hBbD7oY+lO1N2A92sGm7qEPTNZW0=;
  b=E2DyUldb43RMO6t3XupnsA9HxB53MpTLaULtWUmLEkS3L99GjU/B2ZXV
   q99UTEu1TS0p3do8c/bcrIBlOHGStAMMQi7T8SrIUkOs5oLP8TkJrHPDj
   2TlWbO9hRTjzzZJHkKa6UDTauGFM1TlRSmUPNWGC76n8iCjkB6O7+hTeh
   YLebpAIkF17CFypLuUEIJE/bHP/+JFBL8bDaIMiToj/AER7MQsl7ACiu8
   0zN8z/EzMFMgcdTED7tE/1bh5JdBb4p5sj4KlvWA+TW8z90MDF1cOmReY
   jDmIHhMbrHtSlggSInfHt1Zmf2Gi/hLE4MXOyfYYHVf4hVAJpJwMCNN0c
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="261965225"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="261965225"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 07:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="593677144"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Apr 2022 07:37:20 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhXvs-0008U6-3Q;
	Thu, 21 Apr 2022 14:37:20 +0000
Date: Thu, 21 Apr 2022 22:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yajun Deng <yajun.deng@linux.dev>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: net/ipv4/arp.c:1412:36: warning: unused variable 'arp_seq_ops'
Message-ID: <202204212201.GQb844HH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yajun,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: e968b1b3e9b86c4751faea019a5d340fee9e9142 arp: Remove #ifdef CONFIG_PROC_FS
date:   5 months ago
config: hexagon-randconfig-r045-20220420 (https://download.01.org/0day-ci/archive/20220421/202204212201.GQb844HH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e968b1b3e9b86c4751faea019a5d340fee9e9142
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e968b1b3e9b86c4751faea019a5d340fee9e9142
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/arp.c:1412:36: warning: unused variable 'arp_seq_ops' [-Wunused-const-variable]
   static const struct seq_operations arp_seq_ops = {
                                      ^
   1 warning generated.


vim +/arp_seq_ops +1412 net/ipv4/arp.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1411  
f690808e17925f Stephen Hemminger 2007-03-12 @1412  static const struct seq_operations arp_seq_ops = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1413  	.start	= arp_seq_start,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1414  	.next	= neigh_seq_next,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1415  	.stop	= neigh_seq_stop,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1416  	.show	= arp_seq_show,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1417  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  1418  

:::::: The code at line 1412 was first introduced by commit
:::::: f690808e17925fc45217eb22e8670902ecee5c1b [NET]: make seq_operations const

:::::: TO: Stephen Hemminger <shemminger@linux-foundation.org>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
