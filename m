Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2FC46A3
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656943951; x=1688479951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEGF7I0MVXcuG5dis5FxYZXp4JXJULB7tfTUkMfrz6w=;
  b=Ys8KIa4/BEElLfLe3uTJMlL54beUr71EfK8LY2mmC6E6dj1XMjr5hAZS
   vNeOT1b8ohTW0BFmQaXtCVie63dK0CUgbQnmYj6GBLihhhP85YTG9U058
   10+vz8T6jpn5wPyHyxTp3ugxCA0OkEywi4lsRnaRauhDL3ZUVJZVhvKuX
   gtrYMoMR3neB8sB8Ugl9jaNt8O2bWuVdPzrVdKq+D1Vs98GBfERiUvmhj
   YdRBLtbqjOQc7+4BbFOnrfFOQaSKKV/jUOC3M3WYUY0QxuvUzuDhcVriL
   1byHMdDME7BmOfvYeE0GdYl3j1Gf1nCK4ecgyoyN0+JIkLIuITV80HJoH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="262931788"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="262931788"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 07:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="625068484"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Jul 2022 07:12:19 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8MoF-000Hvl-3B;
	Mon, 04 Jul 2022 14:12:19 +0000
Date: Mon, 4 Jul 2022 22:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Subject: [pdx86-platform-drivers-x86:review-hans 66/68]
 drivers/platform/x86/intel/vsec.c:475:6: warning: no previous prototype for
 function 'intel_vsec_pci_resume'
Message-ID: <202207042202.lFuOlMKZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   530ef2a6e81c74c19f918713e519e85652e53a83
commit: 1039bb2698ab299a1fc30a4fc2df237867c089e0 [66/68] platform/x86/intel/vsec: Add PCI error recovery support to Intel PMT
config: i386-randconfig-r013-20220704 (https://download.01.org/0day-ci/archive/20220704/202207042202.lFuOlMKZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=1039bb2698ab299a1fc30a4fc2df237867c089e0
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout 1039bb2698ab299a1fc30a4fc2df237867c089e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/intel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/vsec.c:475:6: warning: no previous prototype for function 'intel_vsec_pci_resume' [-Wmissing-prototypes]
   void intel_vsec_pci_resume(struct pci_dev *pdev)
        ^
   drivers/platform/x86/intel/vsec.c:475:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_vsec_pci_resume(struct pci_dev *pdev)
   ^
   static 
   1 warning generated.


vim +/intel_vsec_pci_resume +475 drivers/platform/x86/intel/vsec.c

   474	
 > 475	void intel_vsec_pci_resume(struct pci_dev *pdev)
   476	{
   477		dev_info(&pdev->dev, "Done resuming PCI device\n");
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
