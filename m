Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365087C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 21:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654809592; x=1686345592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gfyhXXo27GkQGMxpWCd1bH5lESB+He+9oYSHM0JWOqg=;
  b=ldmbmuul7qJZYg+HVyh2kFUMDaW8PEB15MXK8iDdupTNL/KfpJx/XdAz
   zaXlL2fL3+J7x7GDrTCHwsGQ6mbezH3n+5aLII2oxo2AyJdoiokdCwj3/
   K91KWiYIkyYOXfYfF3Dk7f2u268dPUFFg8uebUHfhKaS7GsnDDkjsKb64
   o7kBzg+QdRXvvOa5G9TVSA0qBTH8lATUYoSI/N8swld4GvZCIErbNHDAq
   5kSJAiK/kQmlPRGAhHbUXeWyjCerU+Ot2TlQ2YfNo5IHY40gzSnV4c2dy
   gIlhfN3JAocvb7envahBpsREcsz8dAXnf7xUzevVgM0MeqyjyGECh+j7l
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266193793"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="266193793"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 14:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="908539139"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2022 14:19:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzPZF-000GOy-8c;
	Thu, 09 Jun 2022 21:19:49 +0000
Date: Fri, 10 Jun 2022 05:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:tiwai/sound/test/ctl-xarray 8/8] ERROR: modpost:
 "xa_store_range" [sound/core/snd.ko] undefined!
Message-ID: <202206100538.Gz40sURP-lkp@intel.com>
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
config: hexagon-randconfig-r041-20220609 (https://download.01.org/0day-ci/archive/20220610/202206100538.Gz40sURP-lkp@intel.com/config)
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

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xa_store_range" [sound/core/snd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
