Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23F82C82
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639669818; x=1671205818;
  h=date:from:cc:subject:message-id:mime-version;
  bh=h84Gm3ZHasg7Vy/e69fP8hIOAnbf3DldLEcGhvClYcw=;
  b=jI62/08NFwbkdg9ckUWGsgdJu6gUMNOamvGRD5vnPyG6a9KJ3Htiq0SA
   Aazfo2nICPff5tSTvppQFcZ2ONuQYgaJkWUaUcrGRU3I0fSdziiMNtQaO
   p1XB6DqtfANlNZE/VPPCJS8PM1w4RwsE/hmnzbPEZIYoLMokxviN7ehf/
   LwAmEIbQw40zbTS/fMY/v7ktqoeZFfiUOJfJZZyBJGd9/FVhDR+S54u2T
   hi34c2GZ+zyrTD0Ivw0vGIN0FQEg1/BCPVBkHdD1LOCzzorsw/sjprGC1
   fTisYsfC6h39u73sDJ2/I/mCZ8ERnCV6ng6OrTsiDE0rwv0JcfLhya8aq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239746690"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="239746690"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 07:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="506336453"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 07:49:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxt0G-0003P9-Ej; Thu, 16 Dec 2021 15:49:08 +0000
Date: Thu, 16 Dec 2021 23:48:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [t-kristo-pm:usi-5.16-v5-bpf 9/19] drivers/hid/hid-core.o: warning:
 objtool: implement()+0x1ca: unreachable instruction
Message-ID: <202112162308.xLY5yWEO-lkp@intel.com>
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
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Tero Kristo <tero.kristo@linux.intel.com>

tree:   https://github.com/t-kristo/linux-pm usi-5.16-v5-bpf
head:   82a2c7cbd9682f2664179cd7e01647e46272c316
commit: 3401dc074672566b15f4f14b4fb64a8471e3b470 [9/19] HID: bpf: add bpf_hid_set_data() helper
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162308.xLY5yWEO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/t-kristo/linux-pm/commit/3401dc074672566b15f4f14b4fb64a8471e3b470
        git remote add t-kristo-pm https://github.com/t-kristo/linux-pm
        git fetch --no-tags t-kristo-pm usi-5.16-v5-bpf
        git checkout 3401dc074672566b15f4f14b4fb64a8471e3b470
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-core.o: warning: objtool: implement()+0x1ca: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
