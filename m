Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A94620;
	Thu, 11 May 2023 00:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683766012; x=1715302012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w37U31l3N1NJdAtg4nnqjiiM8XdZ5A64hKhcQXx9XSI=;
  b=VShVwaND9KvyC9hvxBRGzYwkSrl3SYgKSy2IwqWqvlgD56qSY3sa0VP7
   xlk1N49ogBT2s4sHA8arSrxwp+YwW9rrngLzq8DEfpic0xUE1Ruc3bp38
   ZkLibNwweo0t/RhkJSeeA1Lr28tUL5BaUXcHuoTwSzwU8lHSdr1wTTab7
   /cQJfeGvElCXnhjKladypMBcJjRQzAb3/7fWehxQZhbWcIVOWhsfqAd1o
   DjW3OR3xN4tH/FaM+7iMD9ORc90oecaotEcnALQAdDv+w04fcMOttfZp1
   bIVAboZEwkWTw6dJEFFetVCB5JdVRrlZBC2+i8WLy043LvM2rOy86ECi1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339616379"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="339616379"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 17:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="769102292"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="769102292"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 17:46:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwuSH-0003g6-1g;
	Thu, 11 May 2023 00:46:49 +0000
Date: Thu, 11 May 2023 08:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/1] trace,smp: Add tracepoints around remotelly
 called functions
Message-ID: <202305110816.mcNeYnWd-lkp@intel.com>
References: <20230510230128.150384-1-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510230128.150384-1-leobras@redhat.com>

Hi Leonardo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/trace-smp-Add-tracepoints-around-remotelly-called-functions/20230511-070554
base:   linus/master
patch link:    https://lore.kernel.org/r/20230510230128.150384-1-leobras%40redhat.com
patch subject: [RFC PATCH v3 1/1] trace,smp: Add tracepoints around remotelly called functions
config: riscv-buildonly-randconfig-r004-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110816.mcNeYnWd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/fcef1c202a1635b9c7244f06bbad605562b83d43
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Leonardo-Bras/trace-smp-Add-tracepoints-around-remotelly-called-functions/20230511-070554
        git checkout fcef1c202a1635b9c7244f06bbad605562b83d43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110816.mcNeYnWd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/smp.c:389:27: warning: passing 8-byte aligned argument to 32-byte aligned parameter 3 of 'csd_do_func' may result in an unaligned pointer access [-Walign-mismatch]
                   csd_do_func(func, info, csd);
                                           ^
   1 warning generated.


vim +/csd_do_func +389 kernel/smp.c

   369	
   370	/*
   371	 * Insert a previously allocated call_single_data_t element
   372	 * for execution on the given CPU. data must already have
   373	 * ->func, ->info, and ->flags set.
   374	 */
   375	static int generic_exec_single(int cpu, struct __call_single_data *csd)
   376	{
   377		if (cpu == smp_processor_id()) {
   378			smp_call_func_t func = csd->func;
   379			void *info = csd->info;
   380			unsigned long flags;
   381	
   382			/*
   383			 * We can unlock early even for the synchronous on-stack case,
   384			 * since we're doing this from the same CPU..
   385			 */
   386			csd_lock_record(csd);
   387			csd_unlock(csd);
   388			local_irq_save(flags);
 > 389			csd_do_func(func, info, csd);
   390			csd_lock_record(NULL);
   391			local_irq_restore(flags);
   392			return 0;
   393		}
   394	
   395		if ((unsigned)cpu >= nr_cpu_ids || !cpu_online(cpu)) {
   396			csd_unlock(csd);
   397			return -ENXIO;
   398		}
   399	
   400		__smp_call_single_queue(cpu, &csd->node.llist);
   401	
   402		return 0;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
