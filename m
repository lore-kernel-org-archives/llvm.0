Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9B3B23
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647454019; x=1678990019;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZlSYxyPwOOZ+3GmwhSq3L0adUNnNONwDWaP0HH/ffCY=;
  b=iofu9Lk41J5xA1rXAbj69+CFypJr3A5nCgXmYsrs1V8SnyU3TzvTRqcq
   n6Gu13FbQ45zMnIZk12aKNxvUPAcDQNqwcq42RcjnmmikmmS7ujjJs4Lj
   NjET65jvGpcsvVd4jBKlBBfjZl8/9OcrN7W6JrPTpmp3AImXr5L4pvSNl
   hmgYEOKY6eucJ5oYZQAzp17BNwze8Xrw1zXBIY2r7X0Tg3NMgJE4h2DQl
   kf9a+x9MO9U+sVPnmCTT1gGnPji3rYNuz8O5Prmj5dd68c4tLfeYHcxaD
   PzbFrshhWMa3M7QPqMAungXJ5NpJ92iU8C7gR7gRXyD56p4LeH3zQ+geN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="317398763"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="317398763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 11:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="714716054"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2022 11:06:55 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUY2w-000CiS-5K; Wed, 16 Mar 2022 18:06:54 +0000
Date: Thu, 17 Mar 2022 02:05:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [asahilinux:asahi 78/171] kernel/reboot.o: warning: objtool:
 sys_off_handler_power_off()+0xb7: sibling call from callable instruction
 with modified stack frame
Message-ID: <202203170244.ghsqkc3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux asahi
head:   2a904d884c710b730c9c1c712072f86fb7d2e9b2
commit: ec159207530d80c0a0bd04c1ac94db5766bbc3c0 [78/171] kernel: Add combined power-off+restart handler call chain API
config: x86_64-randconfig-a014-20220314 (https://download.01.org/0day-ci/archive/20220317/202203170244.ghsqkc3L-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/ec159207530d80c0a0bd04c1ac94db5766bbc3c0
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux asahi
        git checkout ec159207530d80c0a0bd04c1ac94db5766bbc3c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/reboot.o: warning: objtool: sys_off_handler_power_off()+0xb7: sibling call from callable instruction with modified stack frame

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
