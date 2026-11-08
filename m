Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131077;
	b=5SLkn3ve2z1H6jaH75Yv+sWxjZdcGQiZ3PCG2fjbAzYhQFPZP+3pPRGprpVDSsi38Dcc
	 q9Ifi6XhEhWuEuZ5oh9KDWRwadnOF+eiQQWF8tvlU/WveqCnTsMC+V8kCFFMlCdKPFeuv
	 3Bmt5686ZBSK+74tcxAih86e4JUEjSMEu4dj5DqtcfzkR4RUk8hh1bdcRHhy9ZTrCRDze
	 ywuMEnBUOqYLngEo1wAQxbtOouy8EcRP11tP9MpbRSBo0srQK9fbO9J4mrbreHPfX7izc
	 TMlAGjvX74T0gY9o5nV3e9EYnue9Z1hvvc3k1JOx5LyXUV0uby5OAwoMemrotNNkQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131077;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8xdc6oFhA3D6PNzPHjgEKoYSX6lIzir2R2AtjueD8oo=;
	b=ixhdBzY3pO0oAWfH6mmqicN5r22pJbYJFtrel+W8tRkdeClkJB9aZwEnPgADOnIgySfn
	 b02TE2qfVMJL3Z4KCx/hglC9MEvY1hSSE9d5ALzJDj9E3S1zxrcOux8CAWQqbMtHQDztd
	 i3uVS3NCnWGcyalhkC6tVfAf17aBkW1saIehuEHSYw4e3pLkaZBDLWqR5w4T2dJ3M5H0y
	 GHCb8EjmBkCJ5KA3A6I5beqLq4fxS8ttNryVOTqeNDY0yS5RyNpzsr5R/tCbFEVp3A1v9
	 mJ/u5+RGc7SFlqbkQ3n/VDKqtIQZ/eMcC94nBGRIqN7W1gyvf2Er8JA4t9PaTMVwr+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFoBVL68;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89549606A320;
	Sun,  8 Nov 2026 09:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89549606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFoBVL68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794131077; x=1825667077;
  h=date:from:to:cc:subject:message-id;
  bh=sxnmt8PKm22ww+XbISLmzV+R9ssPricG1nEZcy/LEvw=;
  b=lFoBVL68FaQh0qEYJZsLQW12bEGmtbyRX/mN2dFjJIobBYCWkg4/SrXg
   0fWPVNoSflLCqK4H+yNYMnFVCU5Xbm2rCN1XEnCqxo1dOQxUG09KdV5LD
   oPM7UU+KyqIxpvVJufmfMEcRDytzsJXlV4x8ihZqWwyvXgPMwMVn6pGSD
   tiCzOCDQZxH5hOa4hhO4HtZapZgfHtUvWxYXWi1mF+RICOdhJTJ6HJ7cS
   r1Zt9UpyU4RIWTt/Fbw+2uKtdUkbJeqoBzBi3cwAILAPS88B13bj/UDm+
   Q0mWN03PaZsTEndvKdQlzj7CZEqhpUtN00OR7rlhvNjD/fRvIG2DsAVDW
   Q==;
X-CSE-ConnectionGUID: ipcJq1GpQUqtWOe4vyR6jQ==
X-CSE-MsgGUID: VOwWBCRkQSiSEBzNYWwtxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2986004"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2986004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 01:44:36 -0800
X-CSE-ConnectionGUID: jwfsbA3/SlulxZnpxAEb8g==
X-CSE-MsgGUID: 7qaTJAtmSn6hZdHSRu4eJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="8070937"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Nov 2026 01:44:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPzRv-00000000sj5-3xLT;
	Sun, 08 Nov 2026 09:44:31 +0000
Date: Sun, 08 Nov 2026 17:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 68/80]
 drivers/hwtracing/gtrace/gtrace-core.c:315:2: error: call to undeclared
 function 'kfree'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611081715.20y4yygC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   f98be19c4d4f657fa0ed2a17aa8ef5ece29fe8dc
commit: 568f8d89f93a9f46e7bb83c0e41d30d46429df68 [68/80] hwtracing: gtrace: Initial implementation of gtrace framework
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081715.20y4yygC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081715.20y4yygC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081715.20y4yygC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/gtrace/gtrace-core.c:9:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/hwtracing/gtrace/gtrace-core.c:315:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     315 |         kfree(cpriv);
         |         ^
>> drivers/hwtracing/gtrace/gtrace-core.c:359:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |                 ^
>> drivers/hwtracing/gtrace/gtrace-core.c:359:8: error: incompatible integer to pointer conversion assigning to 'struct gtrace_comp_priv *' from 'int' [-Wint-conversion]
     359 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:369:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     369 |                 kfree(cpriv);
         |                 ^
   1 warning and 4 errors generated.


vim +/kfree +315 drivers/hwtracing/gtrace/gtrace-core.c

   307	
   308	static void gtrace_component_release(struct device *dev)
   309	{
   310		struct gtrace_component *comp = to_gtrace_component(dev);
   311		struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
   312	
   313		fwnode_handle_put(comp->dev.fwnode);
   314		gtrace_free_type_idx(comp);
 > 315		kfree(cpriv);
   316	}
   317	
   318	struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
   319							   const char *name,
   320							   struct gtrace_platform_data *pdata)
   321	{
   322		struct gtrace_connection *conn;
   323		struct gtrace_component *comp;
   324		struct gtrace_comp_priv *cpriv;
   325		int i, ret = 0;
   326	
   327		if (!id || id->type >= GTRACE_COMPONENT_TYPE_MAX) {
   328			ret = -EINVAL;
   329			goto err_out;
   330		}
   331	
   332		if (!pdata || !pdata->dev) {
   333			ret = -EINVAL;
   334			goto err_out;
   335		}
   336	
   337		for (i = 0; i < pdata->nr_inconns; i++) {
   338			if (pdata->inconns[i]) {
   339				ret = -EINVAL;
   340				goto err_out;
   341			}
   342		}
   343	
   344		for (i = 0; i < pdata->nr_outconns; i++) {
   345			conn = pdata->outconns[i];
   346			if (!conn || conn->src_port < 0 || conn->src_comp ||
   347			    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
   348			    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
   349				ret = -EINVAL;
   350				goto err_out;
   351			}
   352		}
   353	
   354		if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
   355			ret = -EINVAL;
   356			goto err_out;
   357		}
   358	
 > 359		cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
   360		if (!cpriv) {
   361			ret = -ENOMEM;
   362			goto err_out;
   363		}
   364		comp = &cpriv->comp;
   365		comp->pdata = pdata;
   366		comp->id = *id;
   367		ret = gtrace_alloc_type_idx(comp);
   368		if (ret) {
   369			kfree(cpriv);
   370			goto err_out;
   371		}
   372	
   373		comp->dev.parent = pdata->dev;
   374		comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
   375		comp->dev.release = gtrace_component_release;
   376		comp->dev.bus = &gtrace_bustype;
   377		comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
   378		dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", cpriv->type_idx);
   379	
   380		mutex_lock(&gtrace_mutex);
   381	
   382		ret = device_register(&comp->dev);
   383		if (ret) {
   384			put_device(&comp->dev);
   385			goto err_out_unlock;
   386		}
   387	
   388		for (i = 0; i < pdata->nr_outconns; i++) {
   389			conn = pdata->outconns[i];
   390			conn->src_comp = comp;
   391		}
   392	
   393		ret = gtrace_setup_inconns_from_outconns(comp);
   394		if (ret < 0) {
   395			device_unregister(&comp->dev);
   396			goto err_out_unlock;
   397		}
   398	
   399		if (comp->pdata->bound_cpu >= 0) {
   400			gtrace_get_component(comp);
   401			per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
   402		}
   403	
   404		mutex_unlock(&gtrace_mutex);
   405	
   406		return comp;
   407	
   408	err_out_unlock:
   409		mutex_unlock(&gtrace_mutex);
   410	err_out:
   411		return ERR_PTR(ret);
   412	}
   413	EXPORT_SYMBOL_GPL(gtrace_register_component);
   414	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
