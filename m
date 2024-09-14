Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8A1CEABF;
	Sat, 14 Sep 2024 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726306557; cv=none; b=me57khLHNXbEZUHLCjcg2mGy+JNW14H/vuq8UlqrIx926sgg04Avb69+U1erqL9iCF+83L7c1Ksf/D8GumteCVD60mOLiEwgaT7FhswEzzvruNhTCBCvSiPPzG7GFICOjeG9+5Ev2F0sXJzVJdQQBTIGqFNcNi0YBRUJZtHrseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726306557; c=relaxed/simple;
	bh=OZLoe+sMypLEuAzHqbpXn7+8iacjT0TSvfUND/za1Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CmR/n6/xsnP8OKHS8VUNJUna+H1/B4lE6MIcR2lH030Ma+eCneYHMwsPoOLOawtC+EcE50GQyvU4KmOPK8nb1xCjiCFUmrzyHtyHnVDt3EgcxQX+7d8UF+FBA/7RGooA3rSbTEw1VHsTh1fsyOeRaYG8t9VAKoI7PiFJ2zPUVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI7ZS4Ab; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI7ZS4Ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726306555; x=1757842555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZLoe+sMypLEuAzHqbpXn7+8iacjT0TSvfUND/za1Cs=;
  b=AI7ZS4AbKHVFwrOA2kEcSvSviFoGIckMxsb3QiBeSlGb/kXB+/GK/Odd
   seq+iXMcWoE4tXEz2CmnOsiHzn51XL44Ycbm0KCmjokXwPeRtUstclQ+F
   BysAnXJxAgl3Xj7LPxrzi4TLER1AIiDVTeFOkyO7iqSrZIqfvjm02rfMT
   qQ9LYltgsF5LXn97zqiHzx2BK5B0R7oHdBJacvUc92rPXsFsi+FQL4762
   9lZ/HXSedBWBNAgfOUpvN9LnpkTCt+Hl6mjpUkWDJTUXnGiIRvmAqhhvn
   a1N1f9M1g7XB/vq9+YS7gS994J1h9WQ5T5mbfBB6QBqPhZhLHKWLfMdbi
   g==;
X-CSE-ConnectionGUID: /Jqsb6fwRnqzOd808tajzQ==
X-CSE-MsgGUID: hBdS/LDkS0SxTdncJOwFVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36342275"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="36342275"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 02:35:55 -0700
X-CSE-ConnectionGUID: OVLdpQ6wR0CFtSYT5tZDkA==
X-CSE-MsgGUID: 3tRXaDb1TpOOW81DmIP5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68450992"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2024 02:35:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spPC2-0007aq-32;
	Sat, 14 Sep 2024 09:35:50 +0000
Date: Sat, 14 Sep 2024 17:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 31/45]
 drivers/platform/chrome/chromeos_of_hw_prober.c:102:27: error: use of
 undeclared identifier '__free_kfree'; did you mean '__free_pages'?
Message-ID: <202409141714.eGNqxwW6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783
commit: 2356afb129312b111cc39b588356445f3b598c63 [31/45] platform/chrome: of_hw_prober: Support SKU ID based component selection
config: i386-randconfig-006-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141714.eGNqxwW6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141714.eGNqxwW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141714.eGNqxwW6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:27: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                                  ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:150:1: note: expanded from here
     150 | __free_kfree
         | ^
   include/linux/gfp.h:371:13: note: '__free_pages' declared here
     371 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:27: error: 'cleanup' function '__free_pages' must take 1 parameter
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                                  ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:150:1: note: expanded from here
     150 | __free_kfree
         | ^
>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:43: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                                                  ^
>> drivers/platform/chrome/chromeos_of_hw_prober.c:102:23: error: incompatible integer to pointer conversion initializing 'struct of_changeset *' with an expression of type 'int' [-Wint-conversion]
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                              ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +102 drivers/platform/chrome/chromeos_of_hw_prober.c

    57	
    58	/*
    59	 * chromeos_sku_component_selector - Selectively enable a component based on SKU ID
    60	 *
    61	 * Based on the list of component options and SKU ID read back from the device
    62	 * tree, enable the matching component. Also update the OF graph if it exists,
    63	 * so that the enabled component's remote endpoint correctly points to it. This
    64	 * assumes a single local endpoint, which should be the case for panels and
    65	 * camera sensors.
    66	 */
    67	static int chromeos_sku_component_selector(struct device *dev, const void *data)
    68	{
    69		const struct chromeos_sku_component_data *pdata = data;
    70		const char *compatible;
    71		void *ptr __always_unused;
    72		int ret;
    73		u32 sku_id = 0;
    74	
    75		if (!data)
    76			return dev_err_probe(dev, -EINVAL, "No data given\n");
    77	
    78		ret = chromeos_get_coreboot_sku_id(dev, &sku_id);
    79		if (ret)
    80			return ret;
    81	
    82		compatible = NULL;
    83		for (unsigned int i = 0; i < pdata->num_options; i++)
    84			if ((sku_id & pdata->options[i].sku_id_mask) == pdata->options[i].sku_id_val) {
    85				compatible = pdata->options->compatible;
    86				break;
    87			}
    88	
    89		if (!compatible)
    90			return dev_err_probe(dev, -EINVAL, "Unknown SKU ID: 0x%x\n", sku_id);
    91	
    92		struct device_node *node __free(device_node) = of_find_compatible_node(NULL, NULL, compatible);
    93		if (!node)
    94			return dev_err_probe(dev, -ENODEV, "Cannot find matching device node\n");
    95	
    96		/* device node not marked as fail; don't mess with the device tree */
    97		if (!of_device_is_fail(node))
    98			return 0;
    99	
   100		dev_info(dev, "Enabling %pOF for SKU 0x%x\n", node, sku_id);
   101	
 > 102		struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
   103		if (!ocs)
   104			return -ENOMEM;
   105	
   106		/* Create changeset to apply DT changes atomically */
   107		of_changeset_init(ocs);
   108	
   109		if (of_graph_is_present(node)) {
   110			ret = -EINVAL;
   111	
   112			/* This currently assumes a single port on the component. */
   113			struct device_node *endpoint __free(device_node) = of_graph_get_next_endpoint(node, NULL);
   114			if (!endpoint) {
   115				dev_err(dev, "No endpoint found for %pOF\n", node);
   116				goto err_destroy_ocs;
   117			}
   118	
   119			struct device_node *remote __free(device_node) = of_graph_get_remote_endpoint(endpoint);
   120			if (!remote) {
   121				dev_err(dev, "No remote endpoint node found for %pOF\n", endpoint);
   122				goto err_destroy_ocs;
   123			}
   124	
   125			ret = of_changeset_update_prop_u32(ocs, node, "remote-endpoint", endpoint->phandle);
   126			if (ret)
   127				goto err_destroy_ocs;
   128		}
   129	
   130		ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
   131		if (ret)
   132			goto err_destroy_ocs;
   133		ret = of_changeset_apply(ocs);
   134		if (ret)
   135			goto err_destroy_ocs;
   136	
   137		/*
   138		 * ocs is intentionally kept around as it needs to
   139		 * exist as long as the change is applied.
   140		 */
   141		ptr = no_free_ptr(ocs);
   142	
   143		return 0;
   144	
   145	err_destroy_ocs:
   146		of_changeset_destroy(ocs);
   147		return ret;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
