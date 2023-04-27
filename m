Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E91FCC;
	Thu, 27 Apr 2023 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682585602; x=1714121602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PdNhUJSX/iPV5VcAroLPn/fmTZiuZY8KaHlnELWC/K4=;
  b=hOHmVc6wGT7zLEJb1UolwIcx5anIhrr4rUOL62mTVIMjlA9nRUKwdkY6
   l6aLNzPC7W4JajDFsuVLqvYqOtnMggeKLuONnY8GLKk/y+GdDqEffuMNl
   qiC1ueg6fCB9kZnuAb3NdfHfCQtRJO9fTtQDxDcc75TSO8vFRKiW3QARJ
   VUVkW7fwRvTTmRPMZpjIOibauqq2Z++5zYuaLGfFGauQGRCEeEwHhB3gS
   FQQZZMphKH8bOwJzI9RD2GDEL8YPDc0Ae57iB1HOsc+bDfKfP8tyCDuoQ
   D8sHWE+RUniQ+pQOPKVe4eJyaW79nlidpmkJkuRsctc1iCGUOP+LJCJyx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349327866"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="349327866"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 01:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688332868"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="688332868"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Apr 2023 01:53:18 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prxNN-00008D-1G;
	Thu, 27 Apr 2023 08:53:17 +0000
Date: Thu, 27 Apr 2023 16:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bblock@linux.ibm.com, acelan.kao@canonical.com,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] PM: suspend: Define pm_suspend_target_state
Message-ID: <202304271651.DsSWc2rx-lkp@intel.com>
References: <20230427050603.612145-1-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427050603.612145-1-kai.heng.feng@canonical.com>

Hi Kai-Heng,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master pavel-leds/for-next v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/ata-libata-Defer-rescan-on-suspended-device/20230427-130726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230427050603.612145-1-kai.heng.feng%40canonical.com
patch subject: [PATCH v3 1/2] PM: suspend: Define pm_suspend_target_state
config: mips-randconfig-r002-20230427 (https://download.01.org/0day-ci/archive/20230427/202304271651.DsSWc2rx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/03ca901d88f622ddd3bfd75b9f1b62d99881e430
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kai-Heng-Feng/ata-libata-Defer-rescan-on-suspended-device/20230427-130726
        git checkout 03ca901d88f622ddd3bfd75b9f1b62d99881e430
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271651.DsSWc2rx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pm_suspend_target_state
   >>> referenced by wakeup.c
   >>>               drivers/base/power/wakeup.o:(device_wakeup_enable) in archive vmlinux.a
   >>> referenced by wakeup.c
   >>>               drivers/base/power/wakeup.o:(device_wakeup_enable) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
