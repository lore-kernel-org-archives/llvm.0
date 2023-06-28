Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6F8C8E3;
	Wed, 28 Jun 2023 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687968828; x=1719504828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kncRiweq+MRFd8eaFvbJ+dnKNGlyiYY+YtKh9izeZTw=;
  b=jQtgzNdmJDWFMnr8QmQD66Or7FHnnryvvmbyXgMeyTudasDVfrDkxJoJ
   WqD4Dvb44Z/UQdhpvSAO6penqSiJbpi5wpykmk9Gfz4ChL1cQNwf1D1SU
   LP/Sz5U9OdoR4cMLrp2K6Jv+QoJZoAYgrl/0yPlAvhXw5yZadTuTX/luK
   6wj7Rk5+MeaUSHzoGuROroNZm1j9k8lPYSVNZeSj/tcO4sTV6Cs36r5C+
   4JRo20IsloYquzKXbewjn+iePpYHfVzF944eWRdYMTgLjH/nIhCYTfgAN
   8U0yTSahnrW8EQ/+sZDAn2Jh4v5mkAIHIUwOMr0GNlP7PaYvN4Fla8qLI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="346655282"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="346655282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 09:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="861595309"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="861595309"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 09:09:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEXjl-000DM5-2t;
	Wed, 28 Jun 2023 16:09:45 +0000
Date: Thu, 29 Jun 2023 00:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/9] cpu/SMT: Allow enabling partial SMT states via
 sysfs
Message-ID: <202306282340.Ihqm0fLA-lkp@intel.com>
References: <20230628100558.43482-7-ldufour@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628100558.43482-7-ldufour@linux.ibm.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/x86/core v6.4]
[cannot apply to tip/smp/core linus/master next-20230628]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Dufour/cpu-SMT-Move-SMT-prototypes-into-cpu_smt-h/20230628-181323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230628100558.43482-7-ldufour%40linux.ibm.com
patch subject: [PATCH v2 6/9] cpu/SMT: Allow enabling partial SMT states via sysfs
config: arm-randconfig-r025-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282340.Ihqm0fLA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282340.Ihqm0fLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306282340.Ihqm0fLA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cpu.c:2606:29: error: use of undeclared identifier 'cpu_smt_max_threads'; did you mean 'sysctl_max_threads'?
    2606 |             cpu_smt_num_threads != cpu_smt_max_threads)
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    sysctl_max_threads
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^
   include/linux/sysctl.h:294:5: note: 'sysctl_max_threads' declared here
     294 | int sysctl_max_threads(struct ctl_table *table, int write, void *buffer,
         |     ^
>> kernel/cpu.c:2606:29: error: use of undeclared identifier 'cpu_smt_max_threads'; did you mean 'sysctl_max_threads'?
    2606 |             cpu_smt_num_threads != cpu_smt_max_threads)
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    sysctl_max_threads
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^
   include/linux/sysctl.h:294:5: note: 'sysctl_max_threads' declared here
     294 | int sysctl_max_threads(struct ctl_table *table, int write, void *buffer,
         |     ^
>> kernel/cpu.c:2606:29: error: use of undeclared identifier 'cpu_smt_max_threads'; did you mean 'sysctl_max_threads'?
    2606 |             cpu_smt_num_threads != cpu_smt_max_threads)
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    sysctl_max_threads
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^
   include/linux/sysctl.h:294:5: note: 'sysctl_max_threads' declared here
     294 | int sysctl_max_threads(struct ctl_table *table, int write, void *buffer,
         |     ^
   3 errors generated.


vim +2606 kernel/cpu.c

  2594	
  2595	static ssize_t control_show(struct device *dev,
  2596				    struct device_attribute *attr, char *buf)
  2597	{
  2598		const char *state = smt_states[cpu_smt_control];
  2599	
  2600		/*
  2601		 * If SMT is enabled but not all threads are enabled then show the
  2602		 * number of threads. If all threads are enabled show "on". Otherwise
  2603		 * show the state name.
  2604		 */
  2605		if (cpu_smt_control == CPU_SMT_ENABLED &&
> 2606		    cpu_smt_num_threads != cpu_smt_max_threads)
  2607			return sysfs_emit(buf, "%d\n", cpu_smt_num_threads);
  2608	
  2609		return snprintf(buf, PAGE_SIZE - 2, "%s\n", state);
  2610	}
  2611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
