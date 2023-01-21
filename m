Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176462F;
	Sat, 21 Jan 2023 05:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674279901; x=1705815901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snS8jZ51DC6iV0zhvyypqOWD3HANDpz3jTxSHnat1xk=;
  b=NxgVBE4czXqVHCrIruyHOzb218/X7Si+hWFinOYXsEDMTNGWF6zZzNn4
   GyFhakyATfoulL6MDlmi109T3uTOHVv+Jy3gKbimqD6AOVilivaMb/GZr
   KIZhz+ACLp7Y15h5xO+dDHkadaJK9QZf/OrgGCZSDtDhTkKdpC59w5Ngh
   x4kDN/S5KgMIdDVbWey8QSbxgdoJsDe7s7pYwyhrEY8qS8qasmaCPygPl
   JDeNFrYeuEyfmv/mKMZOh+IpBnW60qloDzKfvLj6kXZPC5vR4jv8dmQDr
   W8YdmkHjRKRvIB3/Ev219hGaz/ze5dH297r/Mn3Vj4y9Df/ZVoeAm8Rpy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309336056"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="309336056"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 21:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834659713"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="834659713"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 21:44:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ6gR-0003aq-3B;
	Sat, 21 Jan 2023 05:44:55 +0000
Date: Sat, 21 Jan 2023 13:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/nmitest.2023.01.20a 5/5] ERROR:
 modpost: "set_nmi_torture" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202301211327.02xyAfS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/nmitest.2023.01.20a
head:   53e298568bde2c728ee2aac4ac634cca8550a4b4
commit: 53e298568bde2c728ee2aac4ac634cca8550a4b4 [5/5] rcutorture: Test NMI diagnostics
config: s390-randconfig-r044-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211327.02xyAfS3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/53e298568bde2c728ee2aac4ac634cca8550a4b4
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/nmitest.2023.01.20a
        git checkout 53e298568bde2c728ee2aac4ac634cca8550a4b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "set_nmi_torture" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
