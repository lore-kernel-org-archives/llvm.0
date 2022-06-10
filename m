Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8767A
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654821776; x=1686357776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Abtzv61gyD6m6j05PPOUneDmgVQBlhQiIiZAGKrh7tk=;
  b=harO51onenVffh2PIh0dfNeg/e9ZHO3RAuhBqcKKdch9ZKvZ3Zqk3LgF
   tAFyanvNZg6iG0WhDUYFZr4faukD6jyt95gGOnPpMPABZWTrpr7sGimzS
   Fep875R0jUI8ZAqbqnM4XP//Ol9vhrZM9EDPl0zjWXiCRtN8jhwXbv+/D
   SVlfwcDMw+UJojbDWWhK6BQLCbVnsAcimC1duIOzKGarfSkPEXoZuf+DI
   xdvpxsC7G8Qx3zEH3kAr8dUe90LV7uHOLu7vZid7MJfi/61P6koA1a28J
   X1qk+A9D1LxCnK9D40fRbPaitwqWGu8i1za7GHIUomUZieqwcS56s541F
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="257898557"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="257898557"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 17:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="533853048"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jun 2022 17:42:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzSjl-000GX5-Rn;
	Fri, 10 Jun 2022 00:42:53 +0000
Date: Fri, 10 Jun 2022 08:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] jump_label: mips: move module NOP patching into arch
 code
Message-ID: <202206100833.t7F1rrMU-lkp@intel.com>
References: <20220608104512.1176209-3-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608104512.1176209-3-ardb@kernel.org>

Hi Ard,

I love your patch! Yet something to improve:

[auto build test ERROR on s390/features]
[also build test ERROR on tip/x86/core vgupta-arc/for-next arm64/for-next/core deller-parisc/for-next linus/master v5.19-rc1 next-20220609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/jump_label-get-rid-of-NOP-patching-where-possible/20220608-184857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: mips-rs90_defconfig (https://download.01.org/0day-ci/archive/20220610/202206100833.t7F1rrMU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 971e13d69e3e7b687213fef22952be6a328c426c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0f76bf7e2cda1943571bcfa08d52505950425ef8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ard-Biesheuvel/jump_label-get-rid-of-NOP-patching-where-possible/20220608-184857
        git checkout 0f76bf7e2cda1943571bcfa08d52505950425ef8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> arch/mips/kernel/jump_label.c:94:37: error: incomplete definition of type 'struct module'
           struct jump_entry *iter_start = mod->jump_entries;
                                           ~~~^
   include/linux/jump_label.h:196:8: note: forward declaration of 'struct module'
   struct module;
          ^
   arch/mips/kernel/jump_label.c:95:49: error: incomplete definition of type 'struct module'
           struct jump_entry *iter_stop = iter_start + mod->num_jump_entries;
                                                       ~~~^
   include/linux/jump_label.h:196:8: note: forward declaration of 'struct module'
   struct module;
          ^
>> arch/mips/kernel/jump_label.c:92:6: warning: no previous prototype for function 'jump_label_apply_nops' [-Wmissing-prototypes]
   void jump_label_apply_nops(struct module *mod)
        ^
   arch/mips/kernel/jump_label.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void jump_label_apply_nops(struct module *mod)
   ^
   static 
   1 warning and 2 errors generated.


vim +94 arch/mips/kernel/jump_label.c

    91	
  > 92	void jump_label_apply_nops(struct module *mod)
    93	{
  > 94		struct jump_entry *iter_start = mod->jump_entries;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
