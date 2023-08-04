Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51ECA64;
	Fri,  4 Aug 2023 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691167340; x=1722703340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Aix0fhmGUEkDVxFMY9z2Bt8WwWhM6K8bS2ydJILJ5a0=;
  b=F7ucg5bxOvxZZe4YunGxApbiJ8iIgPSSmbWx5ClDjUIE1aRn+wnvCSiz
   gSdLDG0JozOAaTZrcc5q5rZThd0HX3M7FnjVAOilDmrlnQa5TF7SyqX0E
   0N4aZYDteTU90xEXe4r0JoojmUo9XJlYmN+4Wb+pgm6YcBu5seO8b8Ftb
   oMaSBwN1FLNdnukpyQZADQGCWSneGZlekkYlTWQOpHGgn/YZDNDC0IBIf
   2a39sX0bWqIIuRT2lRP6pK6g1THMIFQ6yo+o+8BiPmFkxAgfwoX2LHd3W
   /llO7hHjB3R6UHGEghG4972xYYsf02MX36AwxKN79pbBRumqSEPKlVOaY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372940333"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372940333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 09:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733314163"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="733314163"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 09:41:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRxry-0002zL-09;
	Fri, 04 Aug 2023 16:41:42 +0000
Date: Sat, 5 Aug 2023 00:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Yejian <zhengyejian1@huawei.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, vnagarnaik@google.com, shuah@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tracing: Fix cpu buffers unavailable due to
 'record_disabled' messed
Message-ID: <202308050048.bUnVeBjV-lkp@intel.com>
References: <20230804124549.2562977-2-zhengyejian1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804124549.2562977-2-zhengyejian1@huawei.com>

Hi Zheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Yejian/tracing-Fix-cpu-buffers-unavailable-due-to-record_disabled-messed/20230804-204751
base:   linus/master
patch link:    https://lore.kernel.org/r/20230804124549.2562977-2-zhengyejian1%40huawei.com
patch subject: [PATCH 1/2] tracing: Fix cpu buffers unavailable due to 'record_disabled' messed
config: i386-randconfig-r025-20230731 (https://download.01.org/0day-ci/archive/20230805/202308050048.bUnVeBjV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050048.bUnVeBjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050048.bUnVeBjV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:5280:39: error: no member named 'max_buffer' in 'struct trace_array'
                           ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);
                                                          ~~  ^
   kernel/trace/trace.c:5286:38: error: no member named 'max_buffer' in 'struct trace_array'
                           ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
                                                         ~~  ^
   2 errors generated.


vim +5280 kernel/trace/trace.c

  5260	
  5261	int tracing_set_cpumask(struct trace_array *tr,
  5262				cpumask_var_t tracing_cpumask_new)
  5263	{
  5264		int cpu;
  5265	
  5266		if (!tr)
  5267			return -EINVAL;
  5268	
  5269		local_irq_disable();
  5270		arch_spin_lock(&tr->max_lock);
  5271		for_each_tracing_cpu(cpu) {
  5272			/*
  5273			 * Increase/decrease the disabled counter if we are
  5274			 * about to flip a bit in the cpumask:
  5275			 */
  5276			if (cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
  5277					!cpumask_test_cpu(cpu, tracing_cpumask_new)) {
  5278				atomic_inc(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
  5279				ring_buffer_record_disable_cpu(tr->array_buffer.buffer, cpu);
> 5280				ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);
  5281			}
  5282			if (!cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
  5283					cpumask_test_cpu(cpu, tracing_cpumask_new)) {
  5284				atomic_dec(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
  5285				ring_buffer_record_enable_cpu(tr->array_buffer.buffer, cpu);
  5286				ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
  5287			}
  5288		}
  5289		arch_spin_unlock(&tr->max_lock);
  5290		local_irq_enable();
  5291	
  5292		cpumask_copy(tr->tracing_cpumask, tracing_cpumask_new);
  5293	
  5294		return 0;
  5295	}
  5296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
