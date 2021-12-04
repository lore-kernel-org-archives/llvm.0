Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197F68
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 21:17:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="261167246"
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="261167246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 13:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="514192798"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Dec 2021 13:17:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtcP0-000JSs-1U; Sat, 04 Dec 2021 21:17:02 +0000
Date: Sun, 5 Dec 2021 05:16:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [brauner:fs.binfmt_misc 2/2] fs/binfmt_misc.o: warning: objtool:
 bm_status_read()+0xc0: unreachable instruction
Message-ID: <202112050537.EDKcUjHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Laurent Vivier <laurent@vivier.eu>
CC: Christian Brauner <christian.brauner@ubuntu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git fs.binfmt_misc
head:   eb50eb90a694e05f6fd6533951a56ca3ed040761
commit: eb50eb90a694e05f6fd6533951a56ca3ed040761 [2/2] binfmt_misc: enable sandboxed mounts
config: x86_64-randconfig-a001-20211204 (https://download.01.org/0day-ci/archive/20211205/202112050537.EDKcUjHW-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?id=eb50eb90a694e05f6fd6533951a56ca3ed040761
        git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git
        git fetch --no-tags brauner fs.binfmt_misc
        git checkout eb50eb90a694e05f6fd6533951a56ca3ed040761
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/binfmt_misc.o: warning: objtool: bm_status_read()+0xc0: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
