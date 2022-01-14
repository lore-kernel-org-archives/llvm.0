Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B2168
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642127510; x=1673663510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnfkjBhZcb2uuNePhngqlLH0cl9KfuymZhcGpa9HMTE=;
  b=NIdNCrBaUUVpaZer1SZMntTuNO/2zjomFJhtSU0JOCnB12x2ZsPWFS1z
   IqYNoH7AuCzfPVm39oWdZ71YgjpTJCjTXDLvq083t/8vQ3ZpWmoxmCR2N
   BkLZ7WvTpOtJNH+oDBvE8lA/65meLUbq3CuIyxkYHfUnzF7TDi1OD0wVv
   uzq5hSwPakZocwG5+JXW/zTEUFN3VzM0W2hskKhxVv08ZsdvO5ArhKJuJ
   Z9cvDCerf74GRiZvNnjm1RR85aPqN405w+t00Y5HzYZI1LVF2pR+SugFV
   kV8ueUCY1BGQy86niTJVQmw3v7lDl2qWuIfaOS9MrwChuMGe1aze9amj3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="241730569"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="241730569"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 18:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="491345643"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jan 2022 18:29:20 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8CLA-0007yn-5f; Fri, 14 Jan 2022 02:29:20 +0000
Date: Fri, 14 Jan 2022 10:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 102/2382] ./usr/include/asm-generic/shmbuf.h:7:10:
 fatal error: 'uapi/asm-generic/ipcbuf.h' file not found
Message-ID: <202201141048.lZL29hek-lkp@intel.com>
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
head:   1a880941a087613ed42f77001229edfcf75ea8a5
commit: bfc9d5c126bd10a654139934f14575c9b4f627ae [102/2382] headers/deps: Remove <linux/sem.h> from <linux/sched.h>
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220114/202201141048.lZL29hek-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=bfc9d5c126bd10a654139934f14575c9b4f627ae
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout bfc9d5c126bd10a654139934f14575c9b4f627ae
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/shm.h:26:
   In file included from ./usr/include/asm/shmbuf.h:6:
>> ./usr/include/asm-generic/shmbuf.h:7:10: fatal error: 'uapi/asm-generic/ipcbuf.h' file not found
   #include <uapi/asm-generic/ipcbuf.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
