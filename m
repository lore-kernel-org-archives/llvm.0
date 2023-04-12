Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A9917EA;
	Wed, 12 Apr 2023 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681284603; x=1712820603;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XCOIIDhICYWk35v4yl/X0d85lQo6w0/v9+FS3ZsxJpE=;
  b=E+Ssw4F8wD/A0hXN5zNJbEw97hAZhElJsjVL0SPXPrD1JeEid5D3rDs2
   25BvqijzN2cmoATxefBsO0Q6UvFUS5iudh9T2PLkY2Ph7aGyXdJWiWOmP
   wEI+GLYtVzNqObmmxyPowaQVngtAKpJDIt1or8SmHcAC/nt5aWPYnMicU
   joSX59hn7qk3g1mwJIp+C4LOUJO6xgzhA/10zv9XIM7HDhdnypBsFcOEJ
   cV431OwmYGLWjw01pzV5Y2LRdGxVQvTHYIiAUkVtI9bBHacb7NtH3R7xF
   ckKJxsXCpqHtXLaO2x63BmxiMYkItnAdiaGUrarfW8/ARQV1LoM+lg86o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342580831"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="342580831"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 00:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="639117664"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="639117664"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Apr 2023 00:30:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmUvY-000XSN-1J;
	Wed, 12 Apr 2023 07:30:00 +0000
Date: Wed, 12 Apr 2023 15:29:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9741/9999]
 net/bluetooth/l2cap_core.o: warning: objtool: l2cap_state_change()+0x7b:
 can't find switch jump table
Message-ID: <202304121544.dNzbmt1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Archie Pusaka <apusaka@chromium.org>
CC: "Shyh-In Hwang" <josephsih@chromium.org>
CC: Sonny Sasaka <sonnysasaka@chromium.org>

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 9b30b4dd29c7f6b53f53076d7339e112c308f05e [9741/9999] CHROMIUM: bluetooth: enable turn on/off debug logs at runtime
config: x86_64-randconfig-a003-20230410 (https://download.01.org/0day-ci/archive/20230412/202304121544.dNzbmt1w-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/9b30b4dd29c7f6b53f53076d7339e112c308f05e
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 9b30b4dd29c7f6b53f53076d7339e112c308f05e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/bluetooth/ net/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121544.dNzbmt1w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/l2cap_core.o: warning: objtool: l2cap_state_change()+0x7b: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
