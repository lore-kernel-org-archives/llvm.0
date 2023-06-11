Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237BCEA8;
	Mon, 12 Jun 2023 00:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686528029; x=1718064029;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+8OYfuwjJxVc+h2uUjA8CSZD6syvZHni1W5byveufbY=;
  b=Gt30Rt9H3ULNCY5F5Q9/DcD92HjmIDVrNQPEJiQ1sB/yAqUONOFB7ErQ
   DlEfEhnblETPLVW57oYD7hn0ZIaGwHoNgISZ+lQ7BlVDYJH0rxGm4D987
   Il2v0yGQweN8RwdRqUStsbYHYAvuwW7qA2mgyIb3/6q1/TscGjI00aLN6
   3rTFHZyKizFEIVspU92KKRqGG0Ni+GZChmWIOFesRGxoHEfPlJQy3kUN3
   Kxd0p9BhmiyM6jwS7LtcC/UF/eEyIdpuXd3XxFUVvMXZlysRZIRjgiOwB
   97Nig6xdDe0TsP7txGGwu8yL2oNQGoTUjVzz7/6U5Yg05vggs5SnKwL54
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="342601511"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="342601511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 17:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="885210073"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="885210073"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jun 2023 17:00:18 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Uyn-000B9c-2y;
	Mon, 12 Jun 2023 00:00:17 +0000
Date: Mon, 12 Jun 2023 07:59:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr()
 is missing an ELF size annotation
Message-ID: <202306120731.Zr3BTrhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Manish Mandlik <mmandlik@google.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   858fd168a95c5b9669aac8db6c14a9aeab446375
commit: ab4e4380d4e158486e595013a2635190e07e28ce Bluetooth: Add vhci devcoredump support
date:   7 weeks ago
config: x86_64-randconfig-a001-20230612 (https://download.01.org/0day-ci/archive/20230612/202306120731.Zr3BTrhU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ab4e4380d4e158486e595013a2635190e07e28ce
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ab4e4380d4e158486e595013a2635190e07e28ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306120731.Zr3BTrhU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_vhci.o: warning: objtool: vhci_coredump_hdr() is missing an ELF size annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
