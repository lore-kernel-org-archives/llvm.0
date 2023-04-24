Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C87C;
	Mon, 24 Apr 2023 01:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682301459; x=1713837459;
  h=date:from:cc:subject:message-id:mime-version;
  bh=olIacq1qB3BykiGW6TZbstpPcEkI4743NXJEYe38UWU=;
  b=gyW8RtGQ/aetSf4urHH4GGQUokHoDxX0Y98kg+QbTbfH52UWWzgbkAfb
   c5rWNDA709qG3brZUcKKdm9Dl4hlNPrL/YY+Z7OyT1JJLUqZ+21uBiVP2
   MgjlJTw6fwuPi9WmPwNCkNAcg/HGkei+bwbhcpc7afdnbeekfE22di1rU
   FK/bmTAgD6FEUG6R6F7sapz1rd3tnTIwwJyDE1RDKGxq7qBeUyasQUBMq
   /EmJ7PqFdqrbdGn3bJFzaOcXSU8pOfzAabmFV8Qhg//QzKdv06e1IQ+y5
   8GrnQJu55ktMERADvAR7UfFA6j7lmsD9B4UbvI3fCn0aRIivEnl4dIP36
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="409270051"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="409270051"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 18:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="686600306"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="686600306"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Apr 2023 18:57:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqlST-000iDU-2D;
	Mon, 24 Apr 2023 01:57:37 +0000
Date: Mon, 24 Apr 2023 09:56:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: rtl92cu_hw_init() falls through to next
 function rtl92cu_card_disable()
Message-ID: <202304240900.0PrWkvPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   457391b0380335d5e9a5babdec90ac53928b23b4
commit: 08feafe8d1958febf3a9733a3d1564d8fc23340e objtool: Fix function fallthrough detection for vmlinux
date:   1 year ago
config: x86_64-buildonly-randconfig-r005-20230424 (https://download.01.org/0day-ci/archive/20230424/202304240900.0PrWkvPr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08feafe8d1958febf3a9733a3d1564d8fc23340e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08feafe8d1958febf3a9733a3d1564d8fc23340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240900.0PrWkvPr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_internal()+0x857: stack state mismatch: cfa1=4+296 cfa2=4+272
>> vmlinux.o: warning: objtool: rtl92cu_hw_init() falls through to next function rtl92cu_card_disable()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
