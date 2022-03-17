Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE1D2F41
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 00:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647478699; x=1679014699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8bXk3IskXH8eFFzpaNPyeyddF0leRb7wqn21Yw5bec=;
  b=YVLu8DNzBp+6vacIJ5wNX7YGa9LQBdiGj7ZI6qOLF8pCa3SW0YZPj2Wx
   e4ysYd9i3EWqxv4ZJZ9dOILLu6rsWZ+ReoFmLB9wqmcmKcZOm/P4iiLFV
   8Rad/gIrOT9Fge9AotjA+HauHZMZcUFIOKuiSgHzlNran3iKBOmlozm0+
   kJqsMzQ6gk9lmMSjmcDh7US4WJHX2IEJVsQ787HrfOR+mMLGn+XbIoAcS
   FGQxqAqGtF9SfinYYBYKn/keuHqxrQwg4NXJX8O2vdvmT1ZOhhLR6WtQE
   velMCpwhTC3hKkIxjNWwMRDGfVLdOUir0KbX433tR6dS+NTigVlHT2DoI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="343187513"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="343187513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 17:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="516566728"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2022 17:58:17 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUeT2-000D96-OS; Thu, 17 Mar 2022 00:58:16 +0000
Date: Thu, 17 Mar 2022 08:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 915/2335] ./usr/include/linux/if_tunnel.h:5:10:
 fatal error: 'uapi/linux/sockios.h' file not found
Message-ID: <202203170800.LxF9hGll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: b8d36bc5384ae56de169ae667aec58547181384f [915/2335] headers/deps: Add header dependencies to .h files: <uapi/linux/sockios.h>
config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220317/202203170800.LxF9hGll-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=b8d36bc5384ae56de169ae667aec58547181384f
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout b8d36bc5384ae56de169ae667aec58547181384f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/if_tunnel.h:5:10: fatal error: 'uapi/linux/sockios.h' file not found
   #include <uapi/linux/sockios.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/kcm.h:18:10: fatal error: 'uapi/linux/sockios.h' file not found
   #include <uapi/linux/sockios.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/x25.h:15:10: fatal error: 'uapi/linux/sockios.h' file not found
   #include <uapi/linux/sockios.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/rds.h:38:10: fatal error: 'uapi/linux/sockios.h' file not found
   #include <uapi/linux/sockios.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
