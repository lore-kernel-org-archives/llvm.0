Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607952A9CA;
	Thu,  8 Jun 2023 23:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686266271; x=1717802271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zIRFqQZGYUpqmuXRiKr+ofMBa2fPoHGSvJ5Kt4nl1s=;
  b=CwMi79MIWAWh2vRFlQTUD9ALj/T83Go6bLPkoQ/hmnpDjnIS00xNfnE0
   eoBVb/VoP6ou1jA01UdcgtT1yK3tGwW1vh28PFvF4EcvAJ8E0zbMW2elc
   L+Ev0b4fGnBoB9MZSN2ATjJBgZCwWrOTqhLv7Imh3FHFbf5ob0RLnVR15
   tuypV22+awoUHCRC4X3XLgxNFjccg9HPsPpUO/rmtNRPcPWBvBlWPFxHc
   /5wIPaHgR+sbtOxFB6tN8lW5K/ALjeP54j3zaX0SisBRqdjnpwzhWBZY/
   SxGP+HL6jnJBO+WBWRTa/IrNwemEPgbTjtZ0pHuIwSJdatzj2rn3oG4gw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337816532"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="337816532"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956921312"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="956921312"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 16:17:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7Ot0-0008LD-2b;
	Thu, 08 Jun 2023 23:17:46 +0000
Date: Fri, 9 Jun 2023 07:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>, linux-cifs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, smfrench@gmail.com,
	pc@cjr.nz, ronniesahlberg@gmail.com, nspmangalore@gmail.com
Subject: Re: [PATCH] smb/client: print "Unknown" instead of bogus link speed
 value
Message-ID: <202306090727.gIPzxR6M-lkp@intel.com>
References: <20230608201055.9716-1-ematsumiya@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608201055.9716-1-ematsumiya@suse.de>

Hi Enzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on cifs/for-next]
[also build test ERROR on linus/master v6.4-rc5 next-20230608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/smb-client-print-Unknown-instead-of-bogus-link-speed-value/20230609-041241
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20230608201055.9716-1-ematsumiya%40suse.de
patch subject: [PATCH] smb/client: print "Unknown" instead of bogus link speed value
config: x86_64-randconfig-x062-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090727.gIPzxR6M-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
        git fetch cifs for-next
        git checkout cifs/for-next
        b4 shazam https://lore.kernel.org/r/20230608201055.9716-1-ematsumiya@suse.de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090727.gIPzxR6M-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_speed_to_str" [fs/smb/client/cifs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
