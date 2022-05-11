Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96882F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652290144; x=1683826144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bhnfCNtIOXA3pWntWcwwVfFEZU9diSfyJB8QnfCwTDI=;
  b=VrN4Csy6oJ3nFxl7DSiTFWcO1mFu9VxFkkdxgDy5ZR/Qd4CScD/n8b/W
   OxdKcgrsB4e1Tfl+xTUJqbItD2Y7bXQDDFCc9EeD87QoQFSqu+XQYKf7Z
   v+fjyEnjcFicgTNf027lQjmh3hRG+zCuyDzp8cwoaU8Ke8UW5pvcsOfV3
   ZbCZYzdhG92rOebtsygOnVd3qVsz0sOAaIXq16piv/ERwPHApbq0NFTGA
   xr47pc5Gw25m4UkroNOunynx+w2yeD+HQ9O6jiF+NhYqS42+VQUs4QW5y
   1uMw4lYMWcpCKUpU8nTwNnMeBO2hp7Z7viS7zjQYh35JBVBJyi936S/On
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269435197"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="269435197"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 10:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="658250318"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2022 10:29:01 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noq8z-000JMm-9E;
	Wed, 11 May 2022 17:29:01 +0000
Date: Thu, 12 May 2022 01:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v10 08/16] riscv: Add task switch support for vector
Message-ID: <202205120146.F7wGCoud-lkp@intel.com>
References: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f544b952369e55f72a8771d0bec387c2ff49ae0.1652257230.git.greentime.hu@sifive.com>

Hi Greentime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.18-rc6]
[cannot apply to kees/for-next/execve next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
config: riscv-randconfig-r031-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120146.F7wGCoud-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/dcb5b4bc0fc33bba0eb3219b9a8d29ddff58bbef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610
        git checkout dcb5b4bc0fc33bba0eb3219b9a8d29ddff58bbef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:149:6: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
   void arch_release_task_struct(struct task_struct *tsk)
        ^
   arch/riscv/kernel/process.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void arch_release_task_struct(struct task_struct *tsk)
   ^
   static 
   1 warning generated.


vim +/arch_release_task_struct +149 arch/riscv/kernel/process.c

   148	
 > 149	void arch_release_task_struct(struct task_struct *tsk)
   150	{
   151		/* Free the vector context of datap. */
   152		if (has_vector() && tsk->thread.vstate.datap)
   153			kfree(tsk->thread.vstate.datap);
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
