Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01682C9E
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 19:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639681415; x=1671217415;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GfoxP/2yL/45j4wpDiOAksgXiHmMVjO1uVCmFptuBsI=;
  b=M+1LpujPVdWopPFruYXBmMDN3v88Br6AGrVuBumNgFDHc9rqmZppBArW
   CzKgb5dIb5R6ElwEt08OmYrYYla4xc1jJnWy8EXkxcRBRCT5w/7blMWk2
   Qdub7SyjQGipdgMCBWIFEnZOys8q6qWck2JOt5id0M0ZKMbLXMvWiHgVp
   ha3rr7nvOqh/vwpPeQi4a5/Ah/raBZrIjHNGAPiMyWVIL7CVqEgNYmR8T
   yhb/9vsl3TgUKrdff3Xjyvdlc+y+fMLOhmjWjxKEgOe6/FUW/Vk2bXzod
   SyDPkDteKDPK/dJwJzHyEshEB6jwh8/5AKsJol3bdHQZYRBQrIpJ13AHk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="238313891"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="238313891"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 11:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="506422616"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 11:03:20 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxw2B-0003hI-M9; Thu, 16 Dec 2021 19:03:19 +0000
Date: Fri, 17 Dec 2021 03:02:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] kernel/sched/core.o: warning:
 objtool: migration_cpu_stop()+0x624: unreachable instruction
Message-ID: <202112170225.sFZ5ZZr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   889f8be857d8e1a2a8d7bb4a0d7bedcb12c1a401
commit: 889f8be857d8e1a2a8d7bb4a0d7bedcb12c1a401 [1/1] ANDROID: sched: Introducing PELT multiplier
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170225.sFZ5ZZr5-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 889f8be857d8e1a2a8d7bb4a0d7bedcb12c1a401
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/core.o: warning: objtool: migration_cpu_stop()+0x624: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
