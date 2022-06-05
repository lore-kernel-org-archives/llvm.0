Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C429AD
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 23:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654472779; x=1686008779;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xljTuTFufs+N6TrRvHo/Ihq/aVjf3JR/7dyNBOisnkg=;
  b=TM0SCrE6FH62XwDLCWxpTdZaeBoUcySU9jLDwnVTbLOQpWGtkVrMP2Tp
   756yj+w90gjBY8Ocfr9ykYB8kGwHkHZE0PSxID5RyfaYkU57Qm2gkGaiJ
   DSxcJBbJEOhLpBEckCDwlHycjm4JnawLnGQ3BQ28o7ZrEJhw0FGp1+9Tz
   XNZ0ZcxJhOKWEMbZOsdl8pU5QelS56IDb3+znt+4Ym74R1BSNB4f4utAa
   jagD+suLy4XaAUaIwBzIB6jGBAf2dx8XzHVuXGQW2WTeL/G8Hg/QPWozO
   2MIIskfROQzcnmjv4bNLAgun6MW9Rb0EQILNEpG948f7xBs57/ISWZYFq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="275380796"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="275380796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 16:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="564640769"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jun 2022 16:46:01 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxzwW-000CKu-Jl;
	Sun, 05 Jun 2022 23:46:00 +0000
Date: Mon, 6 Jun 2022 07:45:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-5.18-esp32 34/44] ld.lld: error:
 init/built-in.a(main.o):(function perf_trace_initcall_level: .text+0x250):
 relocation R_RISCV_HI20 out of range: 529617 is not in [-524288, 524287];
 references .L.str.24
Message-ID: <202206060740.cCsOmrTt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-5.18-esp32
head:   f33c50f28f170395c09dba9f5ad139d55d5edf1c
commit: 75614c064841745f42a9a250886e483790f81481 [34/44] xtensa: support artificial division by 0 exception
config: riscv-randconfig-r012-20220605 (https://download.01.org/0day-ci/archive/20220606/202206060740.cCsOmrTt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jcmvbkbc/linux-xtensa/commit/75614c064841745f42a9a250886e483790f81481
        git remote add jcmvbkbc-xtensa https://github.com/jcmvbkbc/linux-xtensa
        git fetch --no-tags jcmvbkbc-xtensa xtensa-5.18-esp32
        git checkout 75614c064841745f42a9a250886e483790f81481
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function perf_trace_initcall_level: .text+0x250): relocation R_RISCV_HI20 out of range: 529617 is not in [-524288, 524287]; references .L.str.24
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x150): relocation R_RISCV_HI20 out of range: 530526 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
