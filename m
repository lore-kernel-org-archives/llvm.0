Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94F6AB3
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647287909; x=1678823909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5hLqAPtwDrTpIjnWP/nITosRUyTCLL8YBk1Kaj6UBw=;
  b=korZH+K1ysuCF4Q5N0r0c9ogSdqtFHdSa0bs8Dn0cyS+rWL9WXNGF/vN
   +ymYdHBtY8gCu1oZtEE3i7nzchCOU1ZI8TC5NDJ1Zn5J3HsL43nYzXLIy
   PF8XugjlnqbB5J89YsT2GzS3T8Nu4xhOEAlpSKjARKPRfExekftkUkToL
   VOYwdpwtZTLeJ2Y4yrjQJExWeTL3K+IvRLi/jtdza/Wj8YHNH1vjsVVDM
   KmFxA4jTNKAW+hSiZSR120QdUkO5NLlCo2gAkPBxpWtoeyIz+AfTCvP4N
   GvrMWOf2oot103ooOsIzKvUmbojqtgvrX2bnlZQkLZnKP/+kFJ0yRnVzO
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238303008"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="238303008"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="512348515"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Mar 2022 12:58:27 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTqpm-000ABg-G0; Mon, 14 Mar 2022 19:58:26 +0000
Date: Tue, 15 Mar 2022 03:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Subject: [pdx86-platform-drivers-x86:review-hans 67/67]
 drivers/platform/x86/hp-wmi.c:86: warning: wrong kernel-doc identifier on
 line:
Message-ID: <202203150330.81L3pgxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   9f7e383ebdee6712bee02e3a6c2027cf287950fc
commit: 9f7e383ebdee6712bee02e3a6c2027cf287950fc [67/67] Changing bios_args.data to be dynamically allocated
config: i386-randconfig-a016-20220314 (https://download.01.org/0day-ci/archive/20220315/202203150330.81L3pgxq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=9f7e383ebdee6712bee02e3a6c2027cf287950fc
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout 9f7e383ebdee6712bee02e3a6c2027cf287950fc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp-wmi.c:86: warning: wrong kernel-doc identifier on line:
    * struct bios_args buffer is dynamically allocated.  New WMI command types


vim +86 drivers/platform/x86/hp-wmi.c

    84	
    85	/**
  > 86	 * struct bios_args buffer is dynamically allocated.  New WMI command types
    87	 * were introduced that exceeds 128-byte data size.  Changes to handle
    88	 * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
    89	 */
    90	struct bios_args {
    91		u32 signature;
    92		u32 command;
    93		u32 commandtype;
    94		u32 datasize;
    95		u8 data[];
    96	};
    97	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
