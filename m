Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723452C82
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642192108; x=1673728108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YKid5x2G3RibSq8lkqrK2/HGiyoSYh0VIRtJAhhNb8=;
  b=O+c6LPazgDQWnOLSi+nq+0hXIL9aWjLhPAsSC1Mq+2HqzJnej/82WLYk
   DCkZF0BK0sgQI99z8LNiTdWCWWFqeD2UrQgbLpfs12qTeuI4t5nmq/NQm
   YmzF0280jAI/L79ZXw1ZDlmwAtHyTvUvamlMEHTCkLE/d3/PJF0WZD6Ld
   ZpJoppegucMwcOdQ3vipTXjpjRV6SXO3//I6y4zJjuyFppot5ZDUkSIci
   36XoAPKUx2k2CJM2BzfDiuOLTFhw/uQe97+J45V8P0KKHZ9Dc6Va08bxV
   ixCssdFqbwYKrQvmlHitty67aJZ4AdtqmUBN3z9V4Q1mPz3p9B8/R3TfQ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="241887444"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="241887444"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 12:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="692339887"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2022 12:28:25 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8TBQ-0008xY-O7; Fri, 14 Jan 2022 20:28:24 +0000
Date: Sat, 15 Jan 2022 04:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1502/2383]
 ./usr/include/asm-generic/bpf_perf_event.h:4:10: fatal error:
 'uapi/linux/ptrace.h' file not found
Message-ID: <202201150437.qy7o7fCa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   d772004cd069a1947a890ccc8346e922f866ba1e
commit: b5253c772f85973787772c6bd4ee3026cd5d9386 [1502/2383] headers/deps: bpf: Use <uapi/linux/ptrace.h> in <uapi/asm-generic/bpf_perf_event.h>
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220115/202201150437.qy7o7fCa-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=b5253c772f85973787772c6bd4ee3026cd5d9386
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout b5253c772f85973787772c6bd4ee3026cd5d9386
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/asm/bpf_perf_event.h:1:
>> ./usr/include/asm-generic/bpf_perf_event.h:4:10: fatal error: 'uapi/linux/ptrace.h' file not found
   #include <uapi/linux/ptrace.h>
            ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
