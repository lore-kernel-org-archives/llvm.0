Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB4E116E
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 04:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644900275; x=1676436275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/JPqNlTP+WilwmrmEowBfe9Qg4iyPhc8669i1DD13Zk=;
  b=VvrJe/SE8yPy7f8Ib9WmJMGjJ/XIFgTlwVUtAaWQq/c4LuK933Kj9fxH
   qcpz8d7nGI0tMxBjgOEt8q+I5KOeCmWH2WWzQXTfvmdz2MfbnPxI3qGbf
   omNua5XKGFDUHSAR34tQi8Twqrqj8QHMxi6xpvIzPKBdQQtt1AQ6vKrv8
   V8Mj5Oi4RD7B84hlm7hK2Dq1ypojb6nil0pK/uLs8zWJbCiNskoJtaw5C
   nF522eVFAA4dw7iyXR8OD1nZVqv66XTvumMYgKCAEe1uRcfnWrlKErNA6
   +Oxt2djTp6M9B8s3whUqDMwJqRntotCSU/xCphaT0NOh4z0owhpbD2hoo
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="233794927"
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; 
   d="scan'208";a="233794927"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 20:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; 
   d="scan'208";a="496753459"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 20:44:33 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJphY-0009HG-Mu; Tue, 15 Feb 2022 04:44:32 +0000
Date: Tue, 15 Feb 2022 12:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 35/39] ld.lld:
 error: undefined symbol: xa_store_range
Message-ID: <202202151240.VEpRJvjS-lkp@intel.com>
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
commit: e73334c9144cee0fd83afee287d7e5950e5d256d [35/39] netfs: Generate a buffered writeback from ->writepages()
config: i386-randconfig-a003-20220214 (https://download.01.org/0day-ci/archive/20220215/202202151240.VEpRJvjS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e73334c9144cee0fd83afee287d7e5950e5d256d
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout e73334c9144cee0fd83afee287d7e5950e5d256d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xa_store_range
   >>> referenced by flush.c:204 (fs/netfs/flush.c:204)
   >>>               netfs/flush.o:(netfs_flush_range) in archive fs/built-in.a
   >>> referenced by flush.c:232 (fs/netfs/flush.c:232)
   >>>               netfs/flush.o:(netfs_flush_range) in archive fs/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
