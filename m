Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE920DD51;
	Sat,  4 Jul 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783163146; cv=none; b=ezih8vvC+JVdvcjAJ4Sgk+VgygHhugTWlKYxIFSwmWcpUHxsJH8CLO37EpdNQvoAGoMbuXbclAfXQpdySEhvOU4X6mXBq3H3+yGq3eBMX3VZjszwwbrGot0CAFogUNUd8q9QDeTmqv75CaZ/NluXAsXxM5ISPJhmqjSueTIbpDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783163146; c=relaxed/simple;
	bh=Qvakh3eFdiYUr6uFSZ60TZlggQth34es1Wdyp0F+AiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I8MUnFEnqjU1qJ3h4z4TWipM4v5DkfLIdYeWUzKJYcLaF665jRVpAxdgggRedp8mCgu9dY0ZyfCd0sa2/YPpvrNtg3z37ZuwFUK77UbHY1YW7fqbDRImbwmVau3RuB6SjNnBeDosCypNjd1HQPZ3nM7NZbL9eUoL/oszYqPDxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP2w0CJi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP2w0CJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783163144; x=1814699144;
  h=date:from:to:cc:subject:message-id;
  bh=Qvakh3eFdiYUr6uFSZ60TZlggQth34es1Wdyp0F+AiM=;
  b=LP2w0CJiBXG92G+NNmqLNt40PYGf4SBhxwI4xOCq8nqfA0kZn72BiWKn
   MQWyMXgQsqcAcy45Hrka/VtuN/yHIQCqKRX2mkaLtwrrb3Gf8N13Oyf4m
   bkwB1ZI+YT2Vrj5jDmnhumSU+gBN5K3TzC9zvKLmu1o0UjOLPQv53TonB
   /1vsrJf6rUgjepNsiFmIk7+ts00F0D3KI8+cGIbjT7XetRH0h9w/HJPCV
   XZ/F2kHnIvbGRsvcd4oCJ9kWXeAVjr8nWneH9ZYYUulsiEsrDAzOKzfae
   M6YpjgSATHdHBRb6HYP36aGAEQ9fl115njBxtnuJ1reAhEFzOsOKI9iRl
   w==;
X-CSE-ConnectionGUID: yR8HrxyzTHehuWJf55w6XA==
X-CSE-MsgGUID: LHe2cpE3T9KiTP5wamoh/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87560128"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87560128"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 04:05:43 -0700
X-CSE-ConnectionGUID: I6+gtwRwQL2LCUQClqCF0Q==
X-CSE-MsgGUID: 2xi0s8M+SLOLf3Nv07Q/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="258185157"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2026 04:05:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfyBg-00000000D11-1BVW;
	Sat, 04 Jul 2026 11:05:33 +0000
Date: Sat, 04 Jul 2026 19:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 120/121]
 drivers/media/platform/qcom/camss/camss-icp.c:151:15: warning: format
 specifies type 'unsigned long long' but the argument has type
 'resource_size_t' (aka 'unsigned int')
Message-ID: <202607041822.fXGqM145-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Bryan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: 782e70f1ad20204721b37ade4a33837e76ac3b86 [120/121] media: qcom: camss: Switch on ICP and BPS as make options
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260704/202607041822.fXGqM145-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041822.fXGqM145-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041822.fXGqM145-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/camss/camss-icp.c:26:
   In file included from drivers/media/platform/qcom/camss/camss-icp.h:14:
   drivers/media/platform/qcom/camss/camss-icp-hfi.h:479:36: warning: declaration of 'struct icp_device' will not be visible outside of this function [-Wvisibility]
     479 | int icp_hfi_set_ubwc_config(struct icp_device *icp, u32 dev_type,
         |                                    ^
   drivers/media/platform/qcom/camss/camss-icp-hfi.h:480:15: warning: declaration of 'struct icp_ubwc_cfg' will not be visible outside of this function [-Wvisibility]
     480 |                             struct icp_ubwc_cfg *cfg);
         |                                    ^
>> drivers/media/platform/qcom/camss/camss-icp.c:151:15: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     150 |         dev_dbg(icp->dev, "FW memory: phys=0x%pa size=%llu\n",
         |                                                       ~~~~
         |                                                       %u
     151 |                 &res.start, resource_size(&res));
         |                             ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c:224:6: warning: no previous prototype for function 'icp_dump_gp_regs' [-Wmissing-prototypes]
     224 | void icp_dump_gp_regs(struct camss_icp *icp, const char *label)
         |      ^
   drivers/media/platform/qcom/camss/camss-icp.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | void icp_dump_gp_regs(struct camss_icp *icp, const char *label)
         | ^
         | static 
   drivers/media/platform/qcom/camss/camss-icp.c:243:17: warning: unused variable 'dev' [-Wunused-variable]
     243 |         struct device *dev = hfi->dev;
         |                        ^~~
   drivers/media/platform/qcom/camss/camss-icp.c:240:6: warning: no previous prototype for function 'icp_hfi_latch_regs' [-Wmissing-prototypes]
     240 | void icp_hfi_latch_regs(struct camss_icp *icp)
         |      ^
   drivers/media/platform/qcom/camss/camss-icp.c:240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     240 | void icp_hfi_latch_regs(struct camss_icp *icp)
         | ^
         | static 
   drivers/media/platform/qcom/camss/camss-icp.c:578:15: error: initializing 'const char **const' with an expression of type 'const char *const[20]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     578 |         .clk_names = x1e80100_clk_names,
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c:580:15: error: initializing 'const char **const' with an expression of type 'const char *const[4]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     580 |         .noc_names = x1e80100_noc_names,
         |                      ^~~~~~~~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +151 drivers/media/platform/qcom/camss/camss-icp.c

63514548c205d2 Bryan O'Donoghue 2026-07-03  121  
63514548c205d2 Bryan O'Donoghue 2026-07-03  122  /* Load firmware */
63514548c205d2 Bryan O'Donoghue 2026-07-03  123  static int icp_load_firmware(struct camss_icp *icp)
63514548c205d2 Bryan O'Donoghue 2026-07-03  124  {
63514548c205d2 Bryan O'Donoghue 2026-07-03  125  	const struct camss_icp_resources *icp_res = icp->icp_res;
63514548c205d2 Bryan O'Donoghue 2026-07-03  126  	const struct firmware *fw;
63514548c205d2 Bryan O'Donoghue 2026-07-03  127  	struct device_node *node;
63514548c205d2 Bryan O'Donoghue 2026-07-03  128  	struct resource res;
63514548c205d2 Bryan O'Donoghue 2026-07-03  129  	const char *fw_name;
63514548c205d2 Bryan O'Donoghue 2026-07-03  130  	char fw_path[64];
63514548c205d2 Bryan O'Donoghue 2026-07-03  131  	void *vaddr;
63514548c205d2 Bryan O'Donoghue 2026-07-03  132  	ssize_t fw_size;
63514548c205d2 Bryan O'Donoghue 2026-07-03  133  	int ret;
63514548c205d2 Bryan O'Donoghue 2026-07-03  134  
63514548c205d2 Bryan O'Donoghue 2026-07-03  135  	ret = of_property_read_string(icp->dev->of_node, "firmware-name", &fw_name);
63514548c205d2 Bryan O'Donoghue 2026-07-03  136  	if (ret)
63514548c205d2 Bryan O'Donoghue 2026-07-03  137  		return ret;
63514548c205d2 Bryan O'Donoghue 2026-07-03  138  
63514548c205d2 Bryan O'Donoghue 2026-07-03  139  	snprintf(fw_path, sizeof(fw_path), "%s.mdt", fw_name);
63514548c205d2 Bryan O'Donoghue 2026-07-03  140  
63514548c205d2 Bryan O'Donoghue 2026-07-03  141  	node = of_parse_phandle(icp->dev->of_node, "memory-region", 0);
63514548c205d2 Bryan O'Donoghue 2026-07-03  142  	if (!node)
63514548c205d2 Bryan O'Donoghue 2026-07-03  143  		return -ENODEV;
63514548c205d2 Bryan O'Donoghue 2026-07-03  144  
63514548c205d2 Bryan O'Donoghue 2026-07-03  145  	ret = of_address_to_resource(node, 0, &res);
63514548c205d2 Bryan O'Donoghue 2026-07-03  146  	of_node_put(node);
63514548c205d2 Bryan O'Donoghue 2026-07-03  147  	if (ret)
63514548c205d2 Bryan O'Donoghue 2026-07-03  148  		return ret;
63514548c205d2 Bryan O'Donoghue 2026-07-03  149  
63514548c205d2 Bryan O'Donoghue 2026-07-03  150  	dev_dbg(icp->dev, "FW memory: phys=0x%pa size=%llu\n",
63514548c205d2 Bryan O'Donoghue 2026-07-03 @151  		&res.start, resource_size(&res));
63514548c205d2 Bryan O'Donoghue 2026-07-03  152  
63514548c205d2 Bryan O'Donoghue 2026-07-03  153  	ret = firmware_request_nowarn(&fw, fw_path, icp->dev);
63514548c205d2 Bryan O'Donoghue 2026-07-03  154  	if (ret)
63514548c205d2 Bryan O'Donoghue 2026-07-03  155  		return ret;
63514548c205d2 Bryan O'Donoghue 2026-07-03  156  
63514548c205d2 Bryan O'Donoghue 2026-07-03  157  	fw_size = qcom_mdt_get_size(fw);
63514548c205d2 Bryan O'Donoghue 2026-07-03  158  	if (fw_size < 0 || (size_t)fw_size > resource_size(&res)) {
63514548c205d2 Bryan O'Donoghue 2026-07-03  159  		release_firmware(fw);
63514548c205d2 Bryan O'Donoghue 2026-07-03  160  		return -EINVAL;
63514548c205d2 Bryan O'Donoghue 2026-07-03  161  	}
63514548c205d2 Bryan O'Donoghue 2026-07-03  162  
63514548c205d2 Bryan O'Donoghue 2026-07-03  163  	vaddr = ioremap_wc(res.start, resource_size(&res));
63514548c205d2 Bryan O'Donoghue 2026-07-03  164  	if (!vaddr) {
63514548c205d2 Bryan O'Donoghue 2026-07-03  165  		release_firmware(fw);
63514548c205d2 Bryan O'Donoghue 2026-07-03  166  		return -ENOMEM;
63514548c205d2 Bryan O'Donoghue 2026-07-03  167  	}
63514548c205d2 Bryan O'Donoghue 2026-07-03  168  
63514548c205d2 Bryan O'Donoghue 2026-07-03  169  	ret = qcom_mdt_load(icp->dev, fw, fw_path, icp_res->pas_id, vaddr,
63514548c205d2 Bryan O'Donoghue 2026-07-03  170  			    res.start, resource_size(&res), NULL);
63514548c205d2 Bryan O'Donoghue 2026-07-03  171  	iounmap(vaddr);
63514548c205d2 Bryan O'Donoghue 2026-07-03  172  	release_firmware(fw);
63514548c205d2 Bryan O'Donoghue 2026-07-03  173  
63514548c205d2 Bryan O'Donoghue 2026-07-03  174  	if (ret == 0) {
63514548c205d2 Bryan O'Donoghue 2026-07-03  175  		dev_dbg(icp->dev, "Firmware loaded: %s (%zd bytes)\n", fw_path, fw_size);
63514548c205d2 Bryan O'Donoghue 2026-07-03  176  		icp->fw_phys = res.start;
63514548c205d2 Bryan O'Donoghue 2026-07-03  177  		icp->fw_size = fw_size;
63514548c205d2 Bryan O'Donoghue 2026-07-03  178  	}
63514548c205d2 Bryan O'Donoghue 2026-07-03  179  
63514548c205d2 Bryan O'Donoghue 2026-07-03  180  	return ret;
63514548c205d2 Bryan O'Donoghue 2026-07-03  181  }
63514548c205d2 Bryan O'Donoghue 2026-07-03  182  

:::::: The code at line 151 was first introduced by commit
:::::: 63514548c205d2605589a9789c27343506074acd media: qcom: camss: qcom-icp: Add minimal ICP driver with HFI infrastrucutre

:::::: TO: Bryan O'Donoghue <bod@kernel.org>
:::::: CC: Bryan O'Donoghue <bod@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
