Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C444D6AE;
	Thu,  8 Jan 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879352; cv=none; b=FPNka0AjKwjQ2OAlPVQudkXbxg0Ry3o4exCcchTFwQTUryicPzduR2INADBnsdA1TLNQkg4Xoc4DgiidZqazyTWibPtWx8DqodCE3QDGfUP6LNyjkTEi4lm8ZwyYeXP1UYN2PVKys8Wz/TO29vayX4F+C7zEc1gfgC8xHC1Dj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879352; c=relaxed/simple;
	bh=70SQqishTa2fSY5wNFQQeOlxPByiZHkeRIhNM6CRDTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CzNAI231qCfxyLwn+8+oOo/ewQzFbCv0D9Ct4JcErO39xCGPq9z26SYDmL2C8gVb5Zw2uskWDC5nU7N93IcR8YNP7pO/lbtFpRGpZfVVh6jodLwmQPlP8L8kit4Zy+sU/FKtfi2B6yBSkr/TrZjmuFDPU4sS+aah7bhCZ5sEs/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azjMxhr9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azjMxhr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767879349; x=1799415349;
  h=date:from:to:cc:subject:message-id;
  bh=70SQqishTa2fSY5wNFQQeOlxPByiZHkeRIhNM6CRDTg=;
  b=azjMxhr914pD5VZLEkXM38b34jPmV9WoRpiAOTNRzHqQVoLgpeHPS2LN
   OayYAluqJ3NetVpXBtOCjVwhMnKB3qxUDau2t+UOM4MIl63z0wthywLK8
   wQa0JuJw/PJGi1ufSA7n+3+5vJGb4Oeh+77lkvDenLlQgGZZi1mDmxV8c
   UZKkqWmhAhB2Pd/HBzUEu7gRGwfZxG4q6ejZtPcl0xNKd+l8EO67uKylT
   LVw7PR/yEzXAxYBjenuXkuBOi4oUGUH3py/W4tR6KnvO4YfcC1FDYSTj3
   kARjuQ9qGrzTM4LCD9QXAHek2fEQb7E8DP7tkSKbd8fs11AaobTawPgd2
   A==;
X-CSE-ConnectionGUID: tUboZUGkSkSkIR7Qav8OnQ==
X-CSE-MsgGUID: sgCLfrsZTYefycOpIx/tPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86672274"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="86672274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 05:35:48 -0800
X-CSE-ConnectionGUID: HzvllTziQAi4Znw011lJVQ==
X-CSE-MsgGUID: 5jR9m2pMSIGRODdJyJDTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="204073183"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2026 05:35:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdqAw-000000004ku-3taH;
	Thu, 08 Jan 2026 13:35:42 +0000
Date: Thu, 08 Jan 2026 21:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v6 1/9]
 drivers/base/node.c:1166:2: error: use of undeclared identifier
 'private_nodes'
Message-ID: <202601082100.Wi88PMvy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v6
head:   75ba13ddb1f86035a0a20a211670b7a2dceb852c
commit: fd93f242d5311a329afa0689b3e1d0e2d1e71560 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: x86_64-buildonly-randconfig-004-20260108 (https://download.01.org/0day-ci/archive/20260108/202601082100.Wi88PMvy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082100.Wi88PMvy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082100.Wi88PMvy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/node.c:1166:2: error: use of undeclared identifier 'private_nodes'
    1166 |         private_nodes = kzalloc(sizeof(enum private_memtype) * MAX_NUMNODES,
         |         ^
   drivers/base/node.c:1168:7: error: use of undeclared identifier 'private_nodes'
    1168 |         if (!private_nodes)
         |              ^
>> drivers/base/node.c:1173:19: error: use of undeclared identifier 'private_node_ops_list'
    1173 |                 INIT_LIST_HEAD(&private_node_ops_list[i]);
         |                                 ^
>> drivers/base/node.c:1174:2: error: use of undeclared identifier 'private_node_ops_initialized'
    1174 |         private_node_ops_initialized = true;
         |         ^
   4 errors generated.


vim +/private_nodes +1166 drivers/base/node.c

  1144	
  1145	void __init node_dev_init(void)
  1146	{
  1147		int ret, i;
  1148	
  1149	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attr) != NR_NODE_STATES);
  1150	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attrs)-1 != NR_NODE_STATES);
  1151	
  1152		ret = subsys_system_register(&node_subsys, cpu_root_attr_groups);
  1153		if (ret)
  1154			panic("%s() failed to register subsystem: %d\n", __func__, ret);
  1155	
  1156		/*
  1157		 * Create all node devices, which will properly link the node
  1158		 * to already created cpu devices.
  1159		 */
  1160		for_each_online_node(i) {
  1161			ret =  register_node(i);
  1162			if (ret)
  1163				panic("%s() failed to add node: %d\n", __func__, ret);
  1164		}
  1165	
> 1166		private_nodes = kzalloc(sizeof(enum private_memtype) * MAX_NUMNODES,
  1167					GFP_KERNEL);
  1168		if (!private_nodes)
  1169			pr_warn("Failed to allocate private_nodes, private node support disabled\n");
  1170	
  1171		/* Initialize private node ops lists */
  1172		for (i = 0; i < MAX_NUMNODES; i++)
> 1173			INIT_LIST_HEAD(&private_node_ops_list[i]);
> 1174		private_node_ops_initialized = true;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
