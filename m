Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534C42C82
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640187837; x=1671723837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q5IzpjwDTakeS71l4bdtn1zUHEflnchl8TUo+ftFuEY=;
  b=ZB9fHFslElodIZAmdxdCjqI0Anoqp6P41YI7mopYrUrdtHk0i+UY5ynR
   HtXPDGs6/eAU/Clp/1sXnf71qQmkfbi335XbJqu8BOgjWPXsKzc10Fh6R
   h+qn79rOyn5awpBXT2Z5vKrCEH85zvmdug0X0wIPLBkV1OeIMROcmTtm1
   obBadBegeqZjSMN53hl+4chqxKHtueyNK7uRx1kKnaLhZPwZTJ/vBhgZG
   7JCgWl8UabMNmQY1v4t5B/qTxMpZbJj7t213yLDnkV1Zm4auLdNeQPAL6
   oDoilJGxn4JjRaGStZJOqK0+B1SuLCN/ReaYKqVv/pAJgbO4wyw4Tsuc+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240451070"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="240451070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 07:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="758559565"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2021 07:43:53 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n03mS-0000iP-Rr; Wed, 22 Dec 2021 15:43:52 +0000
Date: Wed, 22 Dec 2021 23:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Tan Jui Nee <jui.nee.tan@intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 6/8] mfd: lpc_ich: Switch to generic p2sb_bar()
Message-ID: <202112222327.SSKo6SWM-lkp@intel.com>
References: <20211221173945.53674-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221173945.53674-6-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v5.16-rc6 next-20211221]
[cannot apply to lee-mfd/for-mfd-next helgaas-pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/PCI-Introduce-pci_bus_-printing-macros-when-device-is-not-available/20211222-022237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: i386-randconfig-a013-20211222 (https://download.01.org/0day-ci/archive/20211222/202112222327.SSKo6SWM-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/60075077ccdca2fec103fea5bf4e82d7053e7a6f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/PCI-Introduce-pci_bus_-printing-macros-when-device-is-not-available/20211222-022237
        git checkout 60075077ccdca2fec103fea5bf4e82d7053e7a6f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: p2sb_bar
   >>> referenced by lpc_ich.c:1137 (drivers/mfd/lpc_ich.c:1137)
   >>> mfd/lpc_ich.o:(lpc_ich_probe) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for P2SB
   Depends on X86 && X86_PLATFORM_DEVICES && X86_PLATFORM_DRIVERS_INTEL && PCI
   Selected by
   - LPC_ICH && HAS_IOMEM && PCI && X86

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
