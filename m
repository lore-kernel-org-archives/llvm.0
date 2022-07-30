Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85D1FB8
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659146554; x=1690682554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gx5rycGitagPi3fepwPMLfTeT8Ptl0OD01QMIyKutxk=;
  b=Jcg77L5Z9+NVRpRmekeJmv7Cg9jfZA3ljcHP1reSPXwD27vAK/kJfyR7
   sghfLZrO13k1xqmnad1uOIqA/7qf1vvvL9+RgXRi1N09nkXFCs8bhVFPM
   XL6yAAHVVUGTqM+ctTR/NOJf815zF1v9RJA2m4Pg+QiggrOtrwJM26O9w
   XULrcnK+Qj8UZ0of+UO4oQoOcAMIcKarzYGvZghHagsEh3QBfQ9QXt1fo
   GPi987KUpmPXuj90dZ4PRy7qEFPr0ddzhAfVaP+7YGU2Wbn/5x0TmDioC
   FqXYWbbadNMwYqx7ije3G02+JkhHIe7UNW/Kr22gKaf6dGb0gkDaq1G2x
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="288894949"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="288894949"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 19:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="629585006"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jul 2022 19:02:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHboG-000CGl-0p;
	Sat, 30 Jul 2022 02:02:32 +0000
Date: Sat, 30 Jul 2022 10:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:x86/fineibt 3/4] ld.lld: error: undefined symbol:
 ftrace_stub_graph
Message-ID: <202207300957.x0WDB02K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt
head:   365543b24a9e31c0c89457717391cdb819cc5501
commit: 311ed6d0d57a551f834efd610dc8b14867012a68 [3/4] ftrace,kcfi: Separate ftrace_stub() and ftrace_stub_graph()
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220730/202207300957.x0WDB02K-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=311ed6d0d57a551f834efd610dc8b14867012a68
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/fineibt
        git checkout 311ed6d0d57a551f834efd610dc8b14867012a68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ftrace_stub_graph
   >>> referenced by fgraph.c
   >>>               trace/fgraph.o:(unregister_ftrace_graph) in archive kernel/built-in.a
   >>> referenced by fgraph.c
   >>>               trace/fgraph.o:(ftrace_graph_return) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
