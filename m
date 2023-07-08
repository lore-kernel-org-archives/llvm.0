Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBC1851;
	Sat,  8 Jul 2023 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688836413; x=1720372413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rzUu+oZlSmldGm40Ut2AeFFgioWscbUel1B8Sy+aws=;
  b=SPHLjCbPFMHK7NBbE3qL3SkW37+ThmNE42ld88rJ+bHlqLEXfN0ExJKS
   Z81Pr6q3x4t6YFjIAuWcjMmsSfMUVTg5Xa+uU9FA23E1jYQcM3WDeoahN
   jkXf1mNGKlwkmVZskd3KXSoptd5PKGZ6QgytkGMzaIZP79octvLs3dZir
   svYrlxY5VZlEGQQX7bYLOrL/XjXEdNUcUjhjvskAHcYt9LdDf9/g5hK1o
   a1i9R2rddm24F+vsMwdr+Byz8YL9Nq13U5yP2S44YuX+ccaDdDKwQHauh
   OnUB8iB62RMtVk0h531NdCerqzLSilhRy0o1ECy7jMi6f0jNwDA3P1+VB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="367571158"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="367571158"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 10:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="966953224"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="966953224"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jul 2023 10:13:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIBUw-0002oq-3B;
	Sat, 08 Jul 2023 17:13:30 +0000
Date: Sun, 9 Jul 2023 01:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Tim C Chen <tim.c.chen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/maybe 8/13] kernel/sched/topology.c:1290:31:
 warning: incompatible integer to pointer conversion passing 'int' to
 parameter of type 'const struct cpumask *'
Message-ID: <202307090100.O0VfVUS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
head:   442ca5588ff277c79f1cd6c29d4df9373c1006ad
commit: 0d045c1e0af4c25c053c9a5719b66e7f5648a3b2 [8/13] sched/topology: Record number of cores in sched group
config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20230709/202307090100.O0VfVUS9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090100.O0VfVUS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307090100.O0VfVUS9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:89:
   kernel/sched/topology.c:1290:31: error: implicit declaration of function 'cpu_smt_mask' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           cpumask_andnot(mask, mask, cpu_smt_mask(cpu));
                                                      ^
   arch/powerpc/include/asm/smp.h:139:22: note: expanded from macro 'cpu_smt_mask'
   #define cpu_smt_mask cpu_smt_mask
                        ^
   kernel/sched/topology.c:1290:31: note: did you mean 'cpu_cpu_mask'?
   arch/powerpc/include/asm/smp.h:139:22: note: expanded from macro 'cpu_smt_mask'
   #define cpu_smt_mask cpu_smt_mask
                        ^
   include/linux/topology.h:243:37: note: 'cpu_cpu_mask' declared here
   static inline const struct cpumask *cpu_cpu_mask(int cpu)
                                       ^
   In file included from kernel/sched/build_utility.c:89:
>> kernel/sched/topology.c:1290:31: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct cpumask *' [-Wint-conversion]
                           cpumask_andnot(mask, mask, cpu_smt_mask(cpu));
                                                      ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/smp.h:139:22: note: expanded from macro 'cpu_smt_mask'
   #define cpu_smt_mask cpu_smt_mask
                        ^
   include/linux/cpumask.h:610:29: note: passing argument to parameter 'src2p' here
                                     const struct cpumask *src2p)
                                                           ^
   1 warning and 1 error generated.


vim +1290 kernel/sched/topology.c

  1264	
  1265	/*
  1266	 * Initialize sched groups cpu_capacity.
  1267	 *
  1268	 * cpu_capacity indicates the capacity of sched group, which is used while
  1269	 * distributing the load between different sched groups in a sched domain.
  1270	 * Typically cpu_capacity for all the groups in a sched domain will be same
  1271	 * unless there are asymmetries in the topology. If there are asymmetries,
  1272	 * group having more cpu_capacity will pickup more load compared to the
  1273	 * group having less cpu_capacity.
  1274	 */
  1275	static void init_sched_groups_capacity(int cpu, struct sched_domain *sd)
  1276	{
  1277		struct sched_group *sg = sd->groups;
  1278		struct cpumask *mask = sched_domains_tmpmask2;
  1279	
  1280		WARN_ON(!sg);
  1281	
  1282		do {
  1283			int cpu, cores = 0, max_cpu = -1;
  1284	
  1285			sg->group_weight = cpumask_weight(sched_group_span(sg));
  1286	
  1287			cpumask_copy(mask, sched_group_span(sg));
  1288			for_each_cpu(cpu, mask) {
  1289				cores++;
> 1290				cpumask_andnot(mask, mask, cpu_smt_mask(cpu));
  1291			}
  1292			sg->cores = cores;
  1293	
  1294			if (!(sd->flags & SD_ASYM_PACKING))
  1295				goto next;
  1296	
  1297			for_each_cpu(cpu, sched_group_span(sg)) {
  1298				if (max_cpu < 0)
  1299					max_cpu = cpu;
  1300				else if (sched_asym_prefer(cpu, max_cpu))
  1301					max_cpu = cpu;
  1302			}
  1303			sg->asym_prefer_cpu = max_cpu;
  1304	
  1305	next:
  1306			sg = sg->next;
  1307		} while (sg != sd->groups);
  1308	
  1309		if (cpu != group_balance_cpu(sg))
  1310			return;
  1311	
  1312		update_group_capacity(sd, cpu);
  1313	}
  1314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
