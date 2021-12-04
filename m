Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CF12C9D
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 17:52:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="217160285"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="217160285"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 09:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="610785216"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Dec 2021 09:51:56 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtZCV-000JG4-QM; Sat, 04 Dec 2021 17:51:55 +0000
Date: Sun, 5 Dec 2021 01:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mark:linkage/alias-rework 4/5] ERROR: modpost: "memcpy"
 [net/nsh/nsh.ko] undefined!
Message-ID: <202112050153.bnxO7Qm2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git linkage/alias-rework
head:   bd779ad653870d718d0df57731b1637dae509337
commit: b1f797b9db51e1b30e01ffb1527a56356437b73f [4/5] x86: simplify symbol aliasing
config: x86_64-randconfig-a011-20211203 (https://download.01.org/0day-ci/archive/20211205/202112050153.bnxO7Qm2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=b1f797b9db51e1b30e01ffb1527a56356437b73f
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark linkage/alias-rework
        git checkout b1f797b9db51e1b30e01ffb1527a56356437b73f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "memcpy" [net/nsh/nsh.ko] undefined!
>> ERROR: modpost: "memcpy" [net/openvswitch/openvswitch.ko] undefined!
>> ERROR: modpost: "memset" [net/openvswitch/openvswitch.ko] undefined!
>> ERROR: modpost: "memset" [net/batman-adv/batman-adv.ko] undefined!
>> ERROR: modpost: "memcpy" [net/batman-adv/batman-adv.ko] undefined!
>> ERROR: modpost: "memcpy" [net/6lowpan/6lowpan.ko] undefined!
>> ERROR: modpost: "memset" [net/6lowpan/6lowpan.ko] undefined!
>> ERROR: modpost: "memset" [net/caif/caif_usb.ko] undefined!
>> ERROR: modpost: "memset" [net/caif/caif_socket.ko] undefined!
>> ERROR: modpost: "memcpy" [net/caif/caif_socket.ko] undefined!
WARNING: modpost: suppressed 1040 unresolved symbol warnings because there were too many)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
