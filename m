Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623C19BA3;
	Fri,  9 Jun 2023 17:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686332560; x=1717868560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmdC6MfIiMbsBDe6fFC30y1L4iCL2OUkvQGZe81L1Oo=;
  b=db/jyJF+y2pBnt3ciXYYm4FllWP5+estIJ+PGssqz16zzBJyrQfiVlCW
   QytFyJYOrQx2fS9Uv9Kolzct29//aSKv8KhmPHOs+0HxHX103Omc/hJ7J
   20EKfrbCAhXVUp7z7NNf1byTWulX6a3J4I/iKyCsr18wNS7zKyB7CoqJW
   +eAWeGv/MvOzJn7mWA+JzcKzukihbRRXgnpbOrh6fd40DtdYvRStnxeDK
   LnzOIp7uKwyt0WUW5N1epIRtS74chYAX3LRTtTJZh6Cw3McErZcL9FB2K
   GvakgSiO5KFgGzwEoVEcFkM5iCzYrs8BH3ug7gc78n9fkDBOejCiXx2Ra
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342330648"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="342330648"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 10:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957228706"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="957228706"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2023 10:42:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7g8D-0009GV-2x;
	Fri, 09 Jun 2023 17:42:37 +0000
Date: Sat, 10 Jun 2023 01:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v8 06/10] netdev: expose DPLL pin
 handle for netdevice
Message-ID: <202306100131.J58IIUTX-lkp@intel.com>
References: <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>

Hi Arkadiusz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue net-next/main net/main linus/master v6.4-rc5]
[cannot apply to next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/dpll-documentation-on-DPLL-subsystem-interface/20230609-202453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230609121853.3607724-7-arkadiusz.kubalewski%40intel.com
patch subject: [Intel-wired-lan] [RFC PATCH v8 06/10] netdev: expose DPLL pin handle for netdevice
config: x86_64-randconfig-r034-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100131.J58IIUTX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch tnguy-next-queue dev-queue
        git checkout tnguy-next-queue/dev-queue
        b4 shazam https://lore.kernel.org/r/20230609121853.3607724-7-arkadiusz.kubalewski@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100131.J58IIUTX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/rtnetlink.c:1059:11: error: no member named 'dpll_pin' in 'struct net_device'
           if (dev->dpll_pin)
               ~~~  ^
   net/core/rtnetlink.c:1060:41: error: no member named 'dpll_pin' in 'struct net_device'
                   size += dpll_msg_pin_handle_size(dev->dpll_pin);
                                                    ~~~  ^
   net/core/rtnetlink.c:1793:11: error: no member named 'dpll_pin' in 'struct net_device'
           if (dev->dpll_pin) {
               ~~~  ^
   net/core/rtnetlink.c:1794:43: error: no member named 'dpll_pin' in 'struct net_device'
                   ret = dpll_msg_add_pin_handle(skb, dev->dpll_pin);
                                                      ~~~  ^
   4 errors generated.


vim +1059 net/core/rtnetlink.c

  1054	
  1055	static size_t rtnl_dpll_pin_size(const struct net_device *dev)
  1056	{
  1057		size_t size = nla_total_size(0); /* nest IFLA_DPLL_PIN */
  1058	
> 1059		if (dev->dpll_pin)
  1060			size += dpll_msg_pin_handle_size(dev->dpll_pin);
  1061	
  1062		return size;
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
