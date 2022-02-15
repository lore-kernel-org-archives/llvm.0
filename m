Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACF4116E
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 04:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644900875; x=1676436875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YU6kcuUoeqMB68UCW/H5aAcGjz47jaCjs+uiY9fjG74=;
  b=LR4SqRqzm7UfQTiSlc/tRdnl4NsHYv8AqbS1Ec5Kf2yDsV5k4R2b1gJh
   R1uf23gAr2fafv8cgCrOnO89RZAZhNMZP2BpYnHjHIEZmpwfD0lw8jbXY
   LOzkVeHZwJe7dttz9luGXvZCMffVxWoWTfwcn618C/KIIRIaNGmmIYt1f
   7DncQ+vNfTgpLEWhaQEbVb/44rKrkwpTBlT1WKPaCZmwXK1t2HwBXc28M
   WTrYv+EAIZ8AJ0VmD0+LHqFpF0NKhIpQ52mKiGYLaqvbYXoAKf/RIMkgG
   ONxpD2SWqmTJ18PON2Af7Gd1IOJ0DdvELLle3OuHOHHEMlBSPqH21YveB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="237659689"
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; 
   d="scan'208";a="237659689"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 20:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; 
   d="scan'208";a="703432558"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Feb 2022 20:54:33 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJprF-0009Ho-0R; Tue, 15 Feb 2022 04:54:33 +0000
Date: Tue, 15 Feb 2022 12:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 13/39] ERROR:
 modpost: "netfs_releasepage" [fs/cifs/cifs.ko] undefined!
Message-ID: <202202151241.1W1hxLPK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-maple
head:   b995bc7182f60aa2b4d8930a7446f10dfbcebcc2
commit: d36d22552364a62e281dea83ff2ba46d471a21c0 [13/39] netfs: Provide invalidatepage and releasepage calls
config: i386-randconfig-a004-20220214 (https://download.01.org/0day-ci/archive/20220215/202202151241.1W1hxLPK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d36d22552364a62e281dea83ff2ba46d471a21c0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout d36d22552364a62e281dea83ff2ba46d471a21c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "netfs_releasepage" [fs/cifs/cifs.ko] undefined!
>> ERROR: modpost: "netfs_invalidatepage" [fs/cifs/cifs.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
