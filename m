Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39813168
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 19:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640114055; x=1671650055;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O0A8zWBlW/A7dXkSiXINUJssLRQvGQrkhC+tOFQWQpc=;
  b=aZAXeGv201KlGhVh/ncL6lTKJk2LISoN+rYRxf7n/ffA4IqsC3JIYR+U
   ATiQoyiZfzVu6UQwiE8B/JyRd3JQvKyXa3uwDcCKzrL2ZWtKAGs8nEDBr
   JlGNF0BFkAq9zciSgtCkYyOhmaVs+KQ5CciDvvdYwNQnHXwEyma+CZV7u
   KXepVE9X5ukquCom8Y9xr6AiWI6s5B+lu0lDLyVZDR6Zzar+8+RjYO+h4
   qwZk/6vT0LDQ12gnc9GOWK6GdzGGHeRLHbmIHXIEITcqCBoivzb6kvZO8
   QsUszY0Mn62f9Oro6CEec33ZR+l7L37YjYQEC0wbcY98w469lgDdgsZms
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227325240"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227325240"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 11:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="466406112"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Dec 2021 11:14:13 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzkaT-0009S9-48; Tue, 21 Dec 2021 19:14:13 +0000
Date: Wed, 22 Dec 2021 03:13:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7 7/7] kallsyms: add reliable symbol size info
Message-ID: <202112220307.S5LeBkql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

In-Reply-To: <20211216201919.234994-8-nick.alcock@oracle.com>
References: <20211216201919.234994-8-nick.alcock@oracle.com>
TO: Nick Alcock <nick.alcock@oracle.com>

Hi Nick,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.16-rc6]
[cannot apply to masahiroy/kconfig jeyu/modules-next next-20211221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nick-Alcock/kbuild-bring-back-tristate-conf/20211217-051935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 136057256686de39cc3a07c2e39ef6bc43003ff6
config: riscv-randconfig-r042-20211220 (https://download.01.org/0day-ci/archive/20211222/202112220307.S5LeBkql-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6c2bf01270a8a52b7986d5c49eaa7ad1c7083ec5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a42fff4e29ff06e7c8e7f2e505787138b765976d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nick-Alcock/kbuild-bring-back-tristate-conf/20211217-051935
        git checkout a42fff4e29ff06e7c8e7f2e505787138b765976d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x2a8): relocation R_RISCV_PCREL_HI20 out of range: -524438 is not in [-524288, 524287]; references kallsyms_sizes
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
