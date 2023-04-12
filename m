Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596ED362;
	Wed, 12 Apr 2023 03:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681270560; x=1712806560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgZok1KXQKT0lsE++nffC3lJ1l9TeQipDKYFszOO+vo=;
  b=IbKDlrgsxx//8955oW5c+9cBemvFhRv+lqo6NB5IMDXaakwDQ3MvNwBu
   Z4aAc2YKM7y9bgi4qovPH8V9VoGgpIFO2aUFItTnAly4+hJ7OWbJIeKTx
   ddbzAz0PCDhP0mZDXgt95VdGS6CdEfpRGYUtSe/uLgDUEUGDI4hZQkU2m
   0HB5MwOjbs72frKgZ/oCfHknP8dPsbWBby4uEiNBk7371y+dbx983Vnck
   g7CmeDDaoE6kZSvozBlgBN1SJaqkNHl4w8leKD4fhD+r/4D6S13Gsm6JL
   RFV/fzC5zbJWT2c74V5+WGPh5T00nexwL7MzYAY5+WpsmnAf5iRAJ+4h4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341278250"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="341278250"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 20:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="832576604"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="832576604"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2023 20:35:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmRGy-000XER-0b;
	Wed, 12 Apr 2023 03:35:52 +0000
Date: Wed, 12 Apr 2023 11:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:pending-fixes 146/186] ld.lld: error: undefined symbol:
 vfp_entry
Message-ID: <202304121127.8klViEwi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   99455a05abbda682706286b04307f4fe04221b4a
commit: 62fa0c124d5ff1d1b1fab988ed4ef0e82e3ece16 [146/186] ARM: 9294/1: vfp: Fix broken softirq handling with instrumentation enabled
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20230412/202304121127.8klViEwi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=62fa0c124d5ff1d1b1fab988ed4ef0e82e3ece16
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout 62fa0c124d5ff1d1b1fab988ed4ef0e82e3ece16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121127.8klViEwi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vfp_entry
   >>> referenced by arch/arm/vfp/entry.o:(do_vfp) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
