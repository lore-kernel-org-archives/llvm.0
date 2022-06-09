Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51227C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 20:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654808342; x=1686344342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIIrenfbdVYvsmeA88bEpmXD3GGdFN0sjDFRgWiUWlg=;
  b=TZu7Jqqq+yv+VpGsT2cblEhKuyAYXScPVJP0ZpC+VfBQETZqn/qHUheS
   PSQ4uldS2VTHR2HvOTrlb0bZgYVc4keYjh90uCw5vrEcXzYyaULSjZRaF
   RflADing7uDx90YO4qhSVZknXLex3pAzwr2vq6GCgNUXXmXsfzfF6p3GI
   ElrsAqeVY2wCWAJxQnYJUa7qYXIQVeyMNfJ27K1rCxpVmnq/J5b912hed
   3Aw1TecwKGTegtM//aQn96Hev5Ufp0CkxOj7L1UME3HNtmM0uP5RLq5Vz
   WI9RB5zL01rJLZ40SMRtJzQTa4QAnU4YtR1eV+/UOhG1RFsiGD6qXy9DL
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339171641"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="339171641"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 13:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="637733488"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2022 13:58:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzPEu-000GNh-LA;
	Thu, 09 Jun 2022 20:58:48 +0000
Date: Fri, 10 Jun 2022 04:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:tiwai/sound/test/ctl-xarray 8/8] ld.lld: error:
 undefined symbol: xa_store_range
Message-ID: <202206100457.ZFP279WB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block tiwai/sound/test/ctl-xarray
head:   2abf12b6cfb00c1904dc99425ad19a6c03a1fef3
commit: 2abf12b6cfb00c1904dc99425ad19a6c03a1fef3 [8/8] ALSA: control: Use xarray for faster lookups
config: hexagon-randconfig-r045-20220609 (https://download.01.org/0day-ci/archive/20220610/202206100457.ZFP279WB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 971e13d69e3e7b687213fef22952be6a328c426c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/2abf12b6cfb00c1904dc99425ad19a6c03a1fef3
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tiwai/sound/test/ctl-xarray
        git checkout 2abf12b6cfb00c1904dc99425ad19a6c03a1fef3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xa_store_range
   >>> referenced by control.c
   >>>               core/control.o:(add_hash_entries) in archive sound/built-in.a
   >>> referenced by control.c
   >>>               core/control.o:(add_hash_entries) in archive sound/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
