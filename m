Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4924C88
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645679165; x=1677215165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qIoWIpSnB9jCOr9MVo+8J53FScWhjMOW3e1rbFRVZFk=;
  b=GDT60dFQAR4TCcPpqe3zhHfK2nT4bAa23W5KzB9CG3BrcXGjnr+OyHoI
   Jpf2Sx9owdvKmu7PUrzGLpDLL9bMsOuttpoFAC6PsXDnGzCnHgHSGbOkS
   C0wlVfOVQnIxk+8bijq6Jtf3DXhf0G4g6QM7XmB+S2q77UtJPHnoMX8R6
   Ip4ZYEZXjqSELh7tg3UJuMFSesbEFqQz2Abi0rnfDHK3GOl1+KGfgLddg
   pGBkpLmyBob5aqFfW+fTSLu1BtpF6Cmk61njeH5TU90ALOVGyfCt4BDXq
   +m5bKDyBw3YP5qSkJedbbkx3pHPFnyD2NVQG8GHLI1gGqq9lfnzfz9dpG
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="235659828"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="235659828"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 21:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="707321452"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Feb 2022 21:06:03 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN6KI-0002Hq-WD; Thu, 24 Feb 2022 05:06:03 +0000
Date: Thu, 24 Feb 2022 13:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvdimm@lists.01.org, Dan Williams <dan.j.williams@intel.com>
Subject: [nvdimm:libnvdimm-for-next 4/7] drivers/nvdimm/nd_perf.c:163:3:
 error: implicit declaration of function 'perf_pmu_migrate_context'
Message-ID: <202202241242.zqzGkguy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
head:   49abc2610fb1a0879db35a9ad981cdfea783b707
commit: 30b80fbdb8cc3079fcb81503e1e8f2ed8f18a9f2 [4/7] drivers/nvdimm: Add perf interface to expose nvdimm performance stats
config: riscv-randconfig-r023-20220223 (https://download.01.org/0day-ci/archive/20220224/202202241242.zqzGkguy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git/commit/?id=30b80fbdb8cc3079fcb81503e1e8f2ed8f18a9f2
        git remote add nvdimm https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
        git fetch --no-tags nvdimm libnvdimm-for-next
        git checkout 30b80fbdb8cc3079fcb81503e1e8f2ed8f18a9f2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/nvdimm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/nvdimm/nd_perf.c:163:3: error: implicit declaration of function 'perf_pmu_migrate_context' [-Werror,-Wimplicit-function-declaration]
                   perf_pmu_migrate_context(&nd_pmu->pmu, cpu, target);
                   ^
>> drivers/nvdimm/nd_perf.c:308:7: error: implicit declaration of function 'perf_pmu_register' [-Werror,-Wimplicit-function-declaration]
           rc = perf_pmu_register(&nd_pmu->pmu, nd_pmu->pmu.name, -1);
                ^
>> drivers/nvdimm/nd_perf.c:324:2: error: implicit declaration of function 'perf_pmu_unregister' [-Werror,-Wimplicit-function-declaration]
           perf_pmu_unregister(&nd_pmu->pmu);
           ^
   3 errors generated.


vim +/perf_pmu_migrate_context +163 drivers/nvdimm/nd_perf.c

   127	
   128	static int nvdimm_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
   129	{
   130		struct nvdimm_pmu *nd_pmu;
   131		u32 target;
   132		int nodeid;
   133		const struct cpumask *cpumask;
   134	
   135		nd_pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
   136	
   137		/* Clear it, incase given cpu is set in nd_pmu->arch_cpumask */
   138		cpumask_test_and_clear_cpu(cpu, &nd_pmu->arch_cpumask);
   139	
   140		/*
   141		 * If given cpu is not same as current designated cpu for
   142		 * counter access, just return.
   143		 */
   144		if (cpu != nd_pmu->cpu)
   145			return 0;
   146	
   147		/* Check for any active cpu in nd_pmu->arch_cpumask */
   148		target = cpumask_any(&nd_pmu->arch_cpumask);
   149	
   150		/*
   151		 * Incase we don't have any active cpu in nd_pmu->arch_cpumask,
   152		 * check in given cpu's numa node list.
   153		 */
   154		if (target >= nr_cpu_ids) {
   155			nodeid = cpu_to_node(cpu);
   156			cpumask = cpumask_of_node(nodeid);
   157			target = cpumask_any_but(cpumask, cpu);
   158		}
   159		nd_pmu->cpu = target;
   160	
   161		/* Migrate nvdimm pmu events to the new target cpu if valid */
   162		if (target >= 0 && target < nr_cpu_ids)
 > 163			perf_pmu_migrate_context(&nd_pmu->pmu, cpu, target);
   164	
   165		return 0;
   166	}
   167	
   168	static int nvdimm_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
   169	{
   170		struct nvdimm_pmu *nd_pmu;
   171	
   172		nd_pmu = hlist_entry_safe(node, struct nvdimm_pmu, node);
   173	
   174		if (nd_pmu->cpu >= nr_cpu_ids)
   175			nd_pmu->cpu = cpu;
   176	
   177		return 0;
   178	}
   179	
   180	static int create_cpumask_attr_group(struct nvdimm_pmu *nd_pmu)
   181	{
   182		struct perf_pmu_events_attr *pmu_events_attr;
   183		struct attribute **attrs_group;
   184		struct attribute_group *nvdimm_pmu_cpumask_group;
   185	
   186		pmu_events_attr = kzalloc(sizeof(*pmu_events_attr), GFP_KERNEL);
   187		if (!pmu_events_attr)
   188			return -ENOMEM;
   189	
   190		attrs_group = kzalloc(2 * sizeof(struct attribute *), GFP_KERNEL);
   191		if (!attrs_group) {
   192			kfree(pmu_events_attr);
   193			return -ENOMEM;
   194		}
   195	
   196		/* Allocate memory for cpumask attribute group */
   197		nvdimm_pmu_cpumask_group = kzalloc(sizeof(*nvdimm_pmu_cpumask_group), GFP_KERNEL);
   198		if (!nvdimm_pmu_cpumask_group) {
   199			kfree(pmu_events_attr);
   200			kfree(attrs_group);
   201			return -ENOMEM;
   202		}
   203	
   204		sysfs_attr_init(&pmu_events_attr->attr.attr);
   205		pmu_events_attr->attr.attr.name = "cpumask";
   206		pmu_events_attr->attr.attr.mode = 0444;
   207		pmu_events_attr->attr.show = nvdimm_pmu_cpumask_show;
   208		attrs_group[0] = &pmu_events_attr->attr.attr;
   209		attrs_group[1] = NULL;
   210	
   211		nvdimm_pmu_cpumask_group->attrs = attrs_group;
   212		nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR] = nvdimm_pmu_cpumask_group;
   213		return 0;
   214	}
   215	
   216	static int nvdimm_pmu_cpu_hotplug_init(struct nvdimm_pmu *nd_pmu)
   217	{
   218		int nodeid, rc;
   219		const struct cpumask *cpumask;
   220	
   221		/*
   222		 * Incase of cpu hotplug feature, arch specific code
   223		 * can provide required cpumask which can be used
   224		 * to get designatd cpu for counter access.
   225		 * Check for any active cpu in nd_pmu->arch_cpumask.
   226		 */
   227		if (!cpumask_empty(&nd_pmu->arch_cpumask)) {
   228			nd_pmu->cpu = cpumask_any(&nd_pmu->arch_cpumask);
   229		} else {
   230			/* pick active cpu from the cpumask of device numa node. */
   231			nodeid = dev_to_node(nd_pmu->dev);
   232			cpumask = cpumask_of_node(nodeid);
   233			nd_pmu->cpu = cpumask_any(cpumask);
   234		}
   235	
   236		rc = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/nvdimm:online",
   237					     nvdimm_pmu_cpu_online, nvdimm_pmu_cpu_offline);
   238	
   239		if (rc < 0)
   240			return rc;
   241	
   242		nd_pmu->cpuhp_state = rc;
   243	
   244		/* Register the pmu instance for cpu hotplug */
   245		rc = cpuhp_state_add_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
   246		if (rc) {
   247			cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
   248			return rc;
   249		}
   250	
   251		/* Create cpumask attribute group */
   252		rc = create_cpumask_attr_group(nd_pmu);
   253		if (rc) {
   254			cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
   255			cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
   256			return rc;
   257		}
   258	
   259		return 0;
   260	}
   261	
   262	static void nvdimm_pmu_free_hotplug_memory(struct nvdimm_pmu *nd_pmu)
   263	{
   264		cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
   265		cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
   266	
   267		if (nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR])
   268			kfree(nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR]->attrs);
   269		kfree(nd_pmu->pmu.attr_groups[NVDIMM_PMU_CPUMASK_ATTR]);
   270	}
   271	
   272	int register_nvdimm_pmu(struct nvdimm_pmu *nd_pmu, struct platform_device *pdev)
   273	{
   274		int rc;
   275	
   276		if (!nd_pmu || !pdev)
   277			return -EINVAL;
   278	
   279		/* event functions like add/del/read/event_init and pmu name should not be NULL */
   280		if (WARN_ON_ONCE(!(nd_pmu->pmu.event_init && nd_pmu->pmu.add &&
   281				   nd_pmu->pmu.del && nd_pmu->pmu.read && nd_pmu->pmu.name)))
   282			return -EINVAL;
   283	
   284		nd_pmu->pmu.attr_groups = kzalloc((NVDIMM_PMU_NULL_ATTR + 1) *
   285						  sizeof(struct attribute_group *), GFP_KERNEL);
   286		if (!nd_pmu->pmu.attr_groups)
   287			return -ENOMEM;
   288	
   289		/*
   290		 * Add platform_device->dev pointer to nvdimm_pmu to access
   291		 * device data in events functions.
   292		 */
   293		nd_pmu->dev = &pdev->dev;
   294	
   295		/* Fill attribute groups for the nvdimm pmu device */
   296		nd_pmu->pmu.attr_groups[NVDIMM_PMU_FORMAT_ATTR] = &nvdimm_pmu_format_group;
   297		nd_pmu->pmu.attr_groups[NVDIMM_PMU_EVENT_ATTR] = &nvdimm_pmu_events_group;
   298		nd_pmu->pmu.attr_groups[NVDIMM_PMU_NULL_ATTR] = NULL;
   299	
   300		/* Fill attribute group for cpumask */
   301		rc = nvdimm_pmu_cpu_hotplug_init(nd_pmu);
   302		if (rc) {
   303			pr_info("cpu hotplug feature failed for device: %s\n", nd_pmu->pmu.name);
   304			kfree(nd_pmu->pmu.attr_groups);
   305			return rc;
   306		}
   307	
 > 308		rc = perf_pmu_register(&nd_pmu->pmu, nd_pmu->pmu.name, -1);
   309		if (rc) {
   310			kfree(nd_pmu->pmu.attr_groups);
   311			nvdimm_pmu_free_hotplug_memory(nd_pmu);
   312			return rc;
   313		}
   314	
   315		pr_info("%s NVDIMM performance monitor support registered\n",
   316			nd_pmu->pmu.name);
   317	
   318		return 0;
   319	}
   320	EXPORT_SYMBOL_GPL(register_nvdimm_pmu);
   321	
   322	void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu)
   323	{
 > 324		perf_pmu_unregister(&nd_pmu->pmu);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
