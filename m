Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E12CA1
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641824175; x=1673360175;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Hb69bOJVrrE5GCSxx0fIGPj4KZNgq3EghWRwECcme2Q=;
  b=YCdWClpWvaM9U2c0JqaqTuQ8vgK2NbH1vqmzs7QeCxhoAE4SPoIuVDTN
   ItjtZyk869kmHOsha8vhLn684ct2Dztg0rJuyNzOvtQxynowONvaw86XX
   gAfoavEKtifSlbh71scnivPgWO4CoGQ5wjRnOzsS2eQkQqpw46yDaZez4
   Gc4gQezP7uC5UGGO0tMogh+stHFQMx58W+Wpzx/b0o3Mm75oR4//MoQ5x
   +jK2L82KRfDH8IsygFJmOZU2Ptskbi2wb2mn9aEN4MvX6QuNHpbFmn2p1
   GfpYpQGr2WGatykqpNlK2p5zNyK9FiA0mPcQ8k1tSdM9S4B3e7MNTnFYa
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="240784440"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; 
   d="scan'208";a="240784440"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 06:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; 
   d="scan'208";a="622685325"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 06:14:59 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6vRr-0003ag-3C; Mon, 10 Jan 2022 14:14:59 +0000
Date: Mon, 10 Jan 2022 22:14:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: arch/x86/kernel/devicetree.o: warning: objtool:
 early_init_dt_add_memory_arch()+0x9: unreachable instruction
Message-ID: <202201102203.bIHqlkiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Borislav Petkov <bp@suse.de>
CC: Frank Rowand <frank.rowand@sony.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: f2739ca15c414ebad88f4333e3186fd4144c1753 x86/of: Kill unused early_init_dt_scan_chosen_arch()
date:   3 months ago
config: x86_64-buildonly-randconfig-r001-20220108 (https://download.01.org/0day-ci/archive/20220110/202201102203.bIHqlkiR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f2739ca15c414ebad88f4333e3186fd4144c1753
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f2739ca15c414ebad88f4333e3186fd4144c1753
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/devicetree.o: warning: objtool: early_init_dt_add_memory_arch()+0x9: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
