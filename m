Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4B4416
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662392322; x=1693928322;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vpctvD2zRB5LqefPBolG1QB5lRJ0zGDm6F+LeGawcF0=;
  b=fT6KjoVtkXWhNrBnWsdjm3OVCL9RUmHayUVHdZnHakr/hvHtlkoOxwSG
   6oXJhu0SWuR9S8Tv9xyg3Ls0y7XHAYJpya0Vw+HHmKZUjguXAE5IIX2iB
   wzDDrNfdo2Ws8o1aOmvpGcs0ejjqZaJeb4iAu+66QjsOtuZYLXHrjZJ5e
   6Twelj82DoPDirfYKf58KjBlnT94aBEePfIwZjxOYCtY58FybN31YZmVy
   5kx026jJWLYHpbptLLcmQ/sq0xq34l2dYoUBZCbmAhy2M+ypnwEc95L7S
   UpRZIZh+YMop/y4ByTK9cs6RB78F35WA43pMYATm94luWbq4TXa8wlg2x
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276808503"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="276808503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 08:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="643846705"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2022 08:38:31 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVEBD-0004HZ-10;
	Mon, 05 Sep 2022 15:38:31 +0000
Date: Mon, 5 Sep 2022 23:38:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9741/9999]
 net/bluetooth/l2cap_core.o: warning: objtool: l2cap_chan_close()+0x94: can't
 find switch jump table
Message-ID: <202209052358.SPSbkrWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Archie Pusaka <apusaka@chromium.org>
CC: "Shyh-In Hwang" <josephsih@chromium.org>
CC: Sonny Sasaka <sonnysasaka@chromium.org>

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 9b30b4dd29c7f6b53f53076d7339e112c308f05e [9741/9999] CHROMIUM: bluetooth: enable turn on/off debug logs at runtime
config: x86_64-randconfig-a013-20220905 (https://download.01.org/0day-ci/archive/20220905/202209052358.SPSbkrWh-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bluetooth/l2cap_core.o: warning: objtool: l2cap_chan_close()+0x94: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
