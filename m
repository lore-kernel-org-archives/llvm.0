Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274D36AF5;
	Thu, 21 Dec 2023 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaKACKTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703161973; x=1734697973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UKWSNvaeX9YyAeJO1TUICN+UvSGWYa7u9Gg2nekm5/8=;
  b=YaKACKTqu6rFNKJ/oIrwKJOTug3a28gW66u0HDvrkRr3i8Z68rpNbQMQ
   hL+CFE6SR4rNm4fB71NI56x9x7iv8Kpn77fyGWXQWS4y9tUhfajfPuPFH
   v58obz/auddbWqiKvd2oF40qPfB/HzMjHA2TOWvDi/5cXFn/aEr0xDGA6
   /u/DGxl22IRt6yJ+P7dpLmnfx/oJbYubl2rhscQv77+k/bsac2aXZ8VHV
   w2v8yEfRz6adN3W2qOq2OkTo7gF/48b0v+UDw9vx3M4MITDpVjsudZ1zW
   DABI+44sazJztgoEkAUQn0dE5C2WWMdTgMYhOBMvXCQESDGks4maizV+s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2817864"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2817864"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 04:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1023844491"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1023844491"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Dec 2023 04:32:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGIEK-0008K5-2G;
	Thu, 21 Dec 2023 12:32:48 +0000
Date: Thu, 21 Dec 2023 20:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 60/110] drivers/acpi/pptt.c:411:
 warning: Function parameter or member 'acpi_cpu_id' not described in
 'acpi_pptt_get_cpus_from_container'
Message-ID: <202312212056.bpbZJwqK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: 3c920715e3e3bb5cd28b697db9103e482359861a [60/110] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
config: arm64-randconfig-002-20231221 (https://download.01.org/0day-ci/archive/20231221/202312212056.bpbZJwqK-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7022a24771c8404f847abb226735a3ae21794426)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312212056.bpbZJwqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312212056.bpbZJwqK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/pptt.c:342: warning: Function parameter or member 'callback' not described in 'acpi_pptt_for_each_container'
   drivers/acpi/pptt.c:342: warning: Function parameter or member 'arg' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:411: warning: Function parameter or member 'acpi_cpu_id' not described in 'acpi_pptt_get_cpus_from_container'
>> drivers/acpi/pptt.c:411: warning: Function parameter or member 'cpus' not described in 'acpi_pptt_get_cpus_from_container'


vim +411 drivers/acpi/pptt.c

   329	
   330	/**
   331	 * acpi_pptt_for_each_container() - Iterate over all processor containers
   332	 *
   333	 * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
   334	 * Container, they may exist purely to describe a Private resource. CPUs
   335	 * have to be leaves, so a Processor Container is a non-leaf that has the
   336	 * 'ACPI Processor ID valid' flag set.
   337	 *
   338	 * Return: 0 for a complete walk, or the first non-zero value from the callback
   339	 *         that stopped the walk.
   340	 */
   341	int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
 > 342	{
   343		struct acpi_pptt_processor *cpu_node;
   344		struct acpi_table_header *table_hdr;
   345		struct acpi_subtable_header *entry;
   346		bool leaf_flag, has_leaf_flag = false;
   347		unsigned long table_end;
   348		acpi_status status;
   349		u32 proc_sz;
   350		int ret = 0;
   351	
   352		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   353		if (ACPI_FAILURE(status))
   354			return 0;
   355	
   356		if (table_hdr->revision > 1)
   357			has_leaf_flag = true;
   358	
   359		table_end = (unsigned long)table_hdr + table_hdr->length;
   360		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   361				     sizeof(struct acpi_table_pptt));
   362		proc_sz = sizeof(struct acpi_pptt_processor);
   363		while ((unsigned long)entry + proc_sz < table_end) {
   364			cpu_node = (struct acpi_pptt_processor *)entry;
   365			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   366			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   367			{
   368				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   369				if ((has_leaf_flag && !leaf_flag) ||
   370				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   371				{
   372					ret = callback(cpu_node, arg);
   373					if (ret)
   374						break;
   375				}
   376			}
   377			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   378					     entry->length);
   379		}
   380	
   381		acpi_put_table(table_hdr);
   382	
   383		return ret;
   384	}
   385	
   386	struct __cpus_from_container_arg {
   387		u32 acpi_cpu_id;
   388		cpumask_t *cpus;
   389	};
   390	
   391	static int __cpus_from_container(struct acpi_pptt_processor *container, void *arg)
   392	{
   393		struct __cpus_from_container_arg *params = arg;
   394	
   395		if (container->acpi_processor_id == params->acpi_cpu_id)
   396			acpi_pptt_get_child_cpus(container, params->cpus);
   397	
   398		return 0;
   399	}
   400	
   401	/**
   402	 * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
   403	 * 					 processor containers
   404	 *
   405	 * Find the specified Processor Container, and fill cpus with all the cpus
   406	 * below it.
   407	 *
   408	 * Return: 0 for a complete walk, or an error if the mask is incomplete.
   409	 */
   410	int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
 > 411	{
   412		struct __cpus_from_container_arg params;
   413	
   414		params.acpi_cpu_id = acpi_cpu_id;
   415		params.cpus = cpus;
   416	
   417		cpumask_clear(cpus);
   418		return acpi_pptt_for_each_container(&__cpus_from_container, &params);
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
