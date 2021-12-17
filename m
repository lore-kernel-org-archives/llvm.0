Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE4173
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639760494; x=1671296494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E/Y/MmJZKj0VVy43VmIsiBaJIcYAtQN2Bvv55B5erTE=;
  b=ZppjMj3tXcfzPBn5TbaO2jgqYviXNs16mkcRqj8KRTG5uvnhjOGNZBFU
   GTNvwEGH/cOxaa1aV6Ltwn7+Lfg+RygmtaMMlcTBrOurZgXcAFIsrpMut
   Pi2kqjehi5PzB+n4W1TxMhTYnizMYaxgI+wrHZJK1Fr8cVUoCpReIsl19
   m8MC4L5VhQ7LpW+piWC5Kyg1aI5H7KWLA4aRIjw66USuSITYpiBIu2iDm
   GpAoyhmcPCmRw0xQi3BN0hzfDuY5tA53PNtlqWYmr/QY80xITDRCcmdk/
   LYecwsidN3MTeLz384gCfKT8KarJ3i3bQ6f8qy6mdlwERMt8seTF6JEnj
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="239742140"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="239742140"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 09:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="506827143"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2021 09:00:25 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myGan-0004zu-1u; Fri, 17 Dec 2021 17:00:25 +0000
Date: Sat, 18 Dec 2021 01:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v7 6/7] kallsyms: add /proc/kallmodsyms
Message-ID: <202112180057.UZKXPkGe-lkp@intel.com>
References: <20211216201919.234994-7-nick.alcock@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216201919.234994-7-nick.alcock@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Nick,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.16-rc5]
[cannot apply to masahiroy/kconfig jeyu/modules-next next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nick-Alcock/kbuild-bring-back-tristate-conf/20211217-051935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 136057256686de39cc3a07c2e39ef6bc43003ff6
config: arm-randconfig-r032-20211216 (https://download.01.org/0day-ci/archive/20211218/202112180057.UZKXPkGe-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/4487902c03d7f7e83c68807ab24d62c467338795
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nick-Alcock/kbuild-bring-back-tristate-conf/20211217-051935
        git checkout 4487902c03d7f7e83c68807ab24d62c467338795
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c:665:12: warning: no previous prototype for function 'arch_get_kallsym' [-Wmissing-prototypes]
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
              ^
   kernel/kallsyms.c:665:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
   ^
   static 
   kernel/kallsyms.c:1074:30: warning: unused variable 'kallsyms_proc_ops' [-Wunused-const-variable]
   static const struct proc_ops kallsyms_proc_ops = {
                                ^
>> kernel/kallsyms.c:1082:30: warning: unused variable 'kallmodsyms_proc_ops' [-Wunused-const-variable]
   static const struct proc_ops kallmodsyms_proc_ops = {
                                ^
   3 warnings generated.


vim +/kallmodsyms_proc_ops +1082 kernel/kallsyms.c

  1080	
  1081	#ifdef CONFIG_KALLMODSYMS
> 1082	static const struct proc_ops kallmodsyms_proc_ops = {
  1083		.proc_open	= kallmodsyms_open,
  1084		.proc_read	= seq_read,
  1085		.proc_lseek	= seq_lseek,
  1086		.proc_release	= seq_release_private,
  1087	};
  1088	#endif
  1089	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
