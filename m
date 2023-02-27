Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E1B374;
	Mon, 27 Feb 2023 02:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677463698; x=1708999698;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qb9FwDQ2gmlKbGmftjWpNiCxHFZ2LUcACXx7CEdZ+X8=;
  b=HuAxCXCl4ta5KyXqVeFjuAQlx9pmuCWWKI2dEghzo94ArBbN4mk6ljgl
   jS+kuEXhn5llrQbK23+UaRrNugG2UZAoaIRf3ByN1F2+Cbg7MOv8oESIH
   jPk4S6Ibsn3wnzJW4he7VrrspSdswpMOABQ8c9CWMZYnUTSdrFXGOsADR
   WWe3H5vhk3yGO2TMlt6gS8aOTFqKwOITImA7btp0o7twm9e+YXpvQ/tJR
   KkgzU0atkSf/Waa+HJ3Vfsfj3t4j7/S33TRPet0MDlKXyqVeXKn3+O1V4
   Lo4ftyRpUpbpmZ80VphTsJ4bK+Yl36uNVEZpmPa8v2WP71NWM0vqQQo2h
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="313434730"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="313434730"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 18:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="666822786"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="666822786"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Feb 2023 18:08:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWSw3-00040h-0l;
	Mon, 27 Feb 2023 02:08:15 +0000
Date: Mon, 27 Feb 2023 10:07:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 9406/9999]
 drivers/media/dvb-frontends/mxl5xx.o: warning: objtool:
 convert_endian()+0x5b: can't find switch jump table
Message-ID: <202302271008.L8JTElon-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Matthias Kaehlcke <mka@chromium.org>
CC: Guenter Roeck <groeck@chromium.org>

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: a1691c2ff23ab6d9ace207b0b6097762d225e812 [9406/9999] BACKPORT: FROMLIST: Revert "kbuild: use -Oz instead of -Os when using clang"
config: x86_64-buildonly-randconfig-r004-20230227 (https://download.01.org/0day-ci/archive/20230227/202302271008.L8JTElon-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/a1691c2ff23ab6d9ace207b0b6097762d225e812
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout a1691c2ff23ab6d9ace207b0b6097762d225e812
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=drivers/media/dvb-frontends

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271008.L8JTElon-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/dvb-frontends/mxl5xx.o: warning: objtool: convert_endian()+0x5b: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
