Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711762CA7
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 21:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639691826; x=1671227826;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bcvtlcVKFK+82DfTjQqPAdHXYH02KYKDFiqzkeKJwEY=;
  b=CE/3B31qJYncl+XC+SHj7PgHG5XJgtKJonW1BxTg7LUV3ifR27sfeSk4
   nJ5TCDbsvpUM66qZOm7Z3ny7ioHpWQiL4zYALzBeqmwwd9g5HVMix1xf1
   bJELhxE1hlXbPEoSK57R+XJL1eqP461dnOEs2DnDNUVL6o2kEgVa3Rp4R
   vercKTjljnKTm4L72CgHCibI9Jo04nwEZ7QITAOrf5Yh89nfIimDoiQNU
   gWfDzkeHj1neEiVgVRsCmH6lLsRulg6rWN0G1K5dHOG0OH76ACDwIW/w+
   R4bVf80Thcm068JVaZynfMl//sXMqk8Myi+4ekxd8MRlSv72bT6XomoQO
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="226470937"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="226470937"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 13:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="466235342"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2021 13:56:24 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxyjg-0003ra-8t; Thu, 16 Dec 2021 21:56:24 +0000
Date: Fri, 17 Dec 2021 05:56:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: net/mptcp/protocol.o: warning: objtool: mptcp_hash()+0x7:
 unreachable instruction
Message-ID: <202112170523.cmGf0o7m-lkp@intel.com>
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
TO: Paolo Abeni <pabeni@redhat.com>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

Hi Paolo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b14864acbaaf03d9c01982e243a84632524c3ac
commit: 33d41c9cd74c56643a710810703b6bce6eb25efa mptcp: more accurate timeout
date:   4 months ago
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170523.cmGf0o7m-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=33d41c9cd74c56643a710810703b6bce6eb25efa
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 33d41c9cd74c56643a710810703b6bce6eb25efa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/mptcp/protocol.o: warning: objtool: mptcp_hash()+0x7: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
