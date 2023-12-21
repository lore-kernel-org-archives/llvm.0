Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F346182A8;
	Thu, 21 Dec 2023 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMZCPsd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703147255; x=1734683255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LnKeA/BuSS/pKJZaGpMd53u/miG+yCkCOwqlzXAiY54=;
  b=PMZCPsd9KP23P6uaf/JhQWTFl9ZJIpg8pOw5ls2Gs78F/4pWFSmexdp5
   QXuaNvewP4rW4//bi8e5j0wfneGbTm+qe0Q4BXrK4IXdQ9uN9j0Tt2873
   xj/kaJTlbTSgor2/55igoVH5TO0qoQ1HSAyDA2ZzxVcyEaJ6E4kv9rl9y
   bhDpnsekpk6XdLKz70+IiHyGKFYN+0jy8eX0Hr4+2F/pNlzygUQf9PY/C
   NYyyYaJEGB7MnNW39T9NPKVMtn8rNcbJav3+475C93R8rWQSRv2Ecb3T5
   BdQ5bpDpnK8muBBL4cVmeeuVvk6JDzOkkKv6AveipE7QNkfciybtAZf8r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="376091170"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="376091170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 00:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="24884968"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2023 00:27:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGEOw-00088H-0m;
	Thu, 21 Dec 2023 08:27:30 +0000
Date: Thu, 21 Dec 2023 16:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 58/110] drivers/acpi/pptt.c:309:5:
 warning: no previous prototype for function 'acpi_pptt_for_each_container'
Message-ID: <202312211655.5hAnJ6kM-lkp@intel.com>
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
commit: 140a693dd7a214179f67cb3dcf36f8fd9467e5e6 [58/110] ACPI / PPTT: Provide a helper to walk processor containers
config: arm64-randconfig-002-20231221 (https://download.01.org/0day-ci/archive/20231221/202312211655.5hAnJ6kM-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7022a24771c8404f847abb226735a3ae21794426)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312211655.5hAnJ6kM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312211655.5hAnJ6kM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/pptt.c:309:5: warning: no previous prototype for function 'acpi_pptt_for_each_container' [-Wmissing-prototypes]
     309 | int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
         |     ^
   drivers/acpi/pptt.c:309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     309 | int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
         | ^
         | static 
   1 warning generated.
--
>> drivers/acpi/pptt.c:310: warning: Function parameter or member 'callback' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:310: warning: Function parameter or member 'arg' not described in 'acpi_pptt_for_each_container'


vim +/acpi_pptt_for_each_container +309 drivers/acpi/pptt.c

   297	
   298	/**
   299	 * acpi_pptt_for_each_container() - Iterate over all processor containers
   300	 *
   301	 * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
   302	 * Container, they may exist purely to describe a Private resource. CPUs
   303	 * have to be leaves, so a Processor Container is a non-leaf that has the
   304	 * 'ACPI Processor ID valid' flag set.
   305	 *
   306	 * Return: 0 for a complete walk, or the first non-zero value from the callback
   307	 *         that stopped the walk.
   308	 */
 > 309	int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
 > 310	{
   311		struct acpi_pptt_processor *cpu_node;
   312		struct acpi_table_header *table_hdr;
   313		struct acpi_subtable_header *entry;
   314		bool leaf_flag, has_leaf_flag = false;
   315		unsigned long table_end;
   316		acpi_status status;
   317		u32 proc_sz;
   318		int ret = 0;
   319	
   320		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   321		if (ACPI_FAILURE(status))
   322			return 0;
   323	
   324		if (table_hdr->revision > 1)
   325			has_leaf_flag = true;
   326	
   327		table_end = (unsigned long)table_hdr + table_hdr->length;
   328		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   329				     sizeof(struct acpi_table_pptt));
   330		proc_sz = sizeof(struct acpi_pptt_processor);
   331		while ((unsigned long)entry + proc_sz < table_end) {
   332			cpu_node = (struct acpi_pptt_processor *)entry;
   333			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   334			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   335			{
   336				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   337				if ((has_leaf_flag && !leaf_flag) ||
   338				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   339				{
   340					ret = callback(cpu_node, arg);
   341					if (ret)
   342						break;
   343				}
   344			}
   345			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   346					     entry->length);
   347		}
   348	
   349		acpi_put_table(table_hdr);
   350	
   351		return ret;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
