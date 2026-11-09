Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192326;
	b=qWWlDYPAZGbkGpwALcVvHUEQjyhpOy9e3+VaVKVIeI8GZgMMbJDuS5vEOz+qLkeBhNF5
	 LD+ksZCQVPxvLYjNXukKkJSlKFJiaMhtQV3kaM+KfSQGdGOeSOhIaRS1CArF+9BG/W5AX
	 dbT6hYqXbT7NdqhGHEufRQ8E3b5VcOx2c/CNEyKK1JPt7CdTiG3bmHh3YokgA8DusFeVZ
	 sjov1VHbglOoSb0wUkyasg3RORQVdsiymHnMQftQcCZLmf0pvPx87E5oN4J6qJ3bU69xj
	 PLL0X/HqzqNXUJl3lSLOBzIdfLST1gZ6DTW5h7B++DmyWVKAxbwmiTu05b7CLbdguLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192326;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wCb3F5LiODMTOSrF3FIRBUPC0bf6Lf6ZySJ1sxwlyHc=;
	b=4tu4hwC7jYGmp7R1W3V75ZC9/O+7ov1GqnILPkwzrTjSH+XsJNbgcZgOax9/jVtcrngG
	 ljAvBlcZvJj73ND6vq9LbwAcJhB5jqMF632ayPzZl8kf7w+hsUgEEmXbp5jsBetzj7A3m
	 qxSHTR7QD3HiAPMs9OorsEXoarfJm9fV9FKlkNZ+lg5149LsjlsbDWfBo3I+dkxPNagHI
	 C6YeHhay1nbBagztzCn6hlGTbocZYB2Zt7ESpqR0EhT+W2iR4fOMdmk7sr/aCLJpPS9NP
	 yX1FJz7ma6M0czp+uoiTbydVMaeEwREDeYhQdxeZ5lYyI+ARTuZvSBLRyMcMWLa3Rqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dczqXAa7;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F65E606A323;
	Mon,  9 Nov 2026 02:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F65E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dczqXAa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794192323; x=1825728323;
  h=date:from:to:cc:subject:message-id;
  bh=pNElJyh0PkX6sNfmfGe7Xb+nm9m+IFA26nLzbK2mYrc=;
  b=dczqXAa7VagZwRzMeMjjfZNSYHT6k8Zm6Y2XsyAATAOPQ4HASGJddmV2
   Ws0osHauxn6sBuHaojq7FcsRHHXlfU91Zm5X3wJldRTWYEi8N0jPmHUpT
   gDaxktHagt6R6RwTVnqhyMgSuMIXXv5e9PjGEVe+hJVp+5hfsN4b9jAXi
   AFXDyD5+fjUMVfg8CkaGfBRRp9r2xDHgeySZFZUukZXsynIi8WSPU2G6X
   kZmregBMmONvdckJBZaIEx/Rwkt0fMslduB2R5VmxdXZL1cAmh5ghFN1S
   8xvUPkmJoCGtCk78JvGAAwa/V5NZLQtlZkU4K0ULe2F1ls73NNbIRCiyA
   w==;
X-CSE-ConnectionGUID: mk1a+KbhQjWJwSiEsRDhGw==
X-CSE-MsgGUID: 8JUj42XPQ1+F1Saa4K37HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2793298"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2793298"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 18:45:23 -0800
X-CSE-ConnectionGUID: 2EUyF0oURu6vxA2yJEtI/A==
X-CSE-MsgGUID: FtTpBUUVRcK0DrAqcvMoVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7582059"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2026 18:45:21 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQFNn-00000000tjX-09hS;
	Mon, 09 Nov 2026 02:45:19 +0000
Date: Mon, 09 Nov 2026 10:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 70/98]
 drivers/hwtracing/gtrace/gtrace-core.c:590:10: error: call to undeclared
 function 'kzalloc_obj'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611091046.iK8clx7f-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: 3889440d4d89d7eed212c92d6b46a87676fac5a9 [70/98] gtrace: Add functions to create/destroy a trace component path
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611091046.iK8clx7f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091046.iK8clx7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091046.iK8clx7f-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/gtrace/gtrace-core.c:9:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/hwtracing/gtrace/gtrace-core.c:372:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     372 |         kfree(cpriv);
         |         ^
   drivers/hwtracing/gtrace/gtrace-core.c:416:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     416 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |                 ^
   drivers/hwtracing/gtrace/gtrace-core.c:416:8: error: incompatible integer to pointer conversion assigning to 'struct gtrace_comp_priv *' from 'int' [-Wint-conversion]
     416 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:426:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |                 kfree(cpriv);
         |                 ^
>> drivers/hwtracing/gtrace/gtrace-core.c:590:10: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     590 |                 node = kzalloc_obj(*node);
         |                        ^
>> drivers/hwtracing/gtrace/gtrace-core.c:590:8: error: incompatible integer to pointer conversion assigning to 'struct gtrace_path_node *' from 'int' [-Wint-conversion]
     590 |                 node = kzalloc_obj(*node);
         |                      ^ ~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:610:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     610 |                 kfree(node);
         |                 ^
   drivers/hwtracing/gtrace/gtrace-core.c:627:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     627 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |                ^
>> drivers/hwtracing/gtrace/gtrace-core.c:627:7: error: incompatible integer to pointer conversion assigning to 'struct gtrace_path *' from 'int' [-Wint-conversion]
     627 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:661:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     661 |         kfree(path);
         |         ^
   drivers/hwtracing/gtrace/gtrace-core.c:671:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     671 |         kfree(path);
         |         ^
   1 warning and 11 errors generated.


vim +/kzalloc_obj +590 drivers/hwtracing/gtrace/gtrace-core.c

   374	
   375	struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
   376							   const char *name,
   377							   struct gtrace_platform_data *pdata)
   378	{
   379		struct gtrace_connection *conn;
   380		struct gtrace_component *comp;
   381		struct gtrace_comp_priv *cpriv;
   382		int i, ret = 0;
   383	
   384		if (!id || id->type >= GTRACE_COMPONENT_TYPE_MAX) {
   385			ret = -EINVAL;
   386			goto err_out;
   387		}
   388	
   389		if (!pdata || !pdata->dev) {
   390			ret = -EINVAL;
   391			goto err_out;
   392		}
   393	
   394		for (i = 0; i < pdata->nr_inconns; i++) {
   395			if (pdata->inconns[i]) {
   396				ret = -EINVAL;
   397				goto err_out;
   398			}
   399		}
   400	
   401		for (i = 0; i < pdata->nr_outconns; i++) {
   402			conn = pdata->outconns[i];
   403			if (!conn || conn->src_port < 0 || conn->src_comp ||
   404			    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
   405			    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
   406				ret = -EINVAL;
   407				goto err_out;
   408			}
   409		}
   410	
   411		if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
   412			ret = -EINVAL;
   413			goto err_out;
   414		}
   415	
 > 416		cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
   417		if (!cpriv) {
   418			ret = -ENOMEM;
   419			goto err_out;
   420		}
   421		comp = &cpriv->comp;
   422		comp->pdata = pdata;
   423		comp->id = *id;
   424		ret = gtrace_alloc_type_idx(comp);
   425		if (ret) {
   426			kfree(cpriv);
   427			goto err_out;
   428		}
   429	
   430		comp->dev.parent = pdata->dev;
   431		comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
   432		comp->dev.release = gtrace_component_release;
   433		comp->dev.bus = &gtrace_bustype;
   434		comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
   435		dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", cpriv->type_idx);
   436	
   437		mutex_lock(&gtrace_mutex);
   438	
   439		ret = device_register(&comp->dev);
   440		if (ret) {
   441			put_device(&comp->dev);
   442			goto err_out_unlock;
   443		}
   444	
   445		for (i = 0; i < pdata->nr_outconns; i++) {
   446			conn = pdata->outconns[i];
   447			conn->src_comp = comp;
   448		}
   449	
   450		ret = gtrace_setup_inconns_from_outconns(comp);
   451		if (ret < 0) {
   452			device_unregister(&comp->dev);
   453			goto err_out_unlock;
   454		}
   455	
   456		if (comp->pdata->bound_cpu >= 0) {
   457			gtrace_get_component(comp);
   458			per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
   459		}
   460	
   461		mutex_unlock(&gtrace_mutex);
   462	
   463		return comp;
   464	
   465	err_out_unlock:
   466		mutex_unlock(&gtrace_mutex);
   467	err_out:
   468		return ERR_PTR(ret);
   469	}
   470	EXPORT_SYMBOL_GPL(gtrace_register_component);
   471	
   472	void gtrace_unregister_component(struct gtrace_component *comp)
   473	{
   474		struct gtrace_component *c;
   475	
   476		mutex_lock(&gtrace_mutex);
   477	
   478		if (comp->pdata->bound_cpu >= 0) {
   479			c = per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu);
   480			per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = NULL;
   481			gtrace_put_component(c);
   482		}
   483	
   484		gtrace_cleanup_inconns_from_outconns(comp);
   485		device_unregister(&comp->dev);
   486	
   487		mutex_unlock(&gtrace_mutex);
   488	}
   489	EXPORT_SYMBOL_GPL(gtrace_unregister_component);
   490	
   491	struct gtrace_path_node {
   492		struct list_head		head;
   493		struct gtrace_component		*comp;
   494		struct gtrace_connection	*conn;
   495	};
   496	
   497	struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
   498	{
   499		struct gtrace_path_node *node;
   500	
   501		node = list_first_entry(&path->comp_list, struct gtrace_path_node, head);
   502		return node->comp;
   503	}
   504	EXPORT_SYMBOL_GPL(gtrace_path_source);
   505	
   506	struct gtrace_component *gtrace_path_sink(struct gtrace_path *path)
   507	{
   508		struct gtrace_path_node *node;
   509	
   510		node = list_last_entry(&path->comp_list, struct gtrace_path_node, head);
   511		return node->comp;
   512	}
   513	EXPORT_SYMBOL_GPL(gtrace_path_sink);
   514	
   515	static int gtrace_assign_trace_id(struct gtrace_path *path)
   516	{
   517		const struct gtrace_driver *gtdrv;
   518		struct gtrace_component *comp;
   519		struct gtrace_path_node *node;
   520		int trace_id;
   521	
   522		list_for_each_entry(node, &path->comp_list, head) {
   523			comp = node->comp;
   524			gtdrv = to_gtrace_driver(comp->dev.driver);
   525	
   526			if (!gtdrv || !gtdrv->get_trace_id)
   527				continue;
   528	
   529			trace_id = gtdrv->get_trace_id(comp, path->mode);
   530			if (trace_id > 0) {
   531				path->trace_id = trace_id;
   532				return 0;
   533			} else if (trace_id < 0) {
   534				return trace_id;
   535			}
   536		}
   537	
   538		return 0;
   539	}
   540	
   541	static void gtrace_unassign_trace_id(struct gtrace_path *path)
   542	{
   543		const struct gtrace_driver *gtdrv;
   544		struct gtrace_component *comp;
   545		struct gtrace_path_node *node;
   546	
   547		list_for_each_entry(node, &path->comp_list, head) {
   548			comp = node->comp;
   549			gtdrv = to_gtrace_driver(comp->dev.driver);
   550	
   551			if (!gtdrv || !gtdrv->put_trace_id)
   552				continue;
   553	
   554			gtdrv->put_trace_id(comp, path->mode, path->trace_id);
   555		}
   556	}
   557	
   558	static bool gtrace_path_ready(struct gtrace_path *path)
   559	{
   560		struct gtrace_comp_priv *cpriv;
   561		struct gtrace_path_node *node;
   562	
   563		list_for_each_entry(node, &path->comp_list, head) {
   564			cpriv = to_gtrace_comp_priv(node->comp);
   565			if (!cpriv->ready)
   566				return false;
   567		}
   568	
   569		return true;
   570	}
   571	
   572	struct build_path_walk_priv {
   573		struct gtrace_path		*path;
   574		struct gtrace_component		*sink;
   575	};
   576	
   577	static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
   578				      struct gtrace_connection *stop_conn,
   579				      void *priv)
   580	{
   581		struct build_path_walk_priv *ppriv = priv;
   582		struct gtrace_path *path = ppriv->path;
   583		struct gtrace_path_node *node;
   584	
   585		if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
   586		    (ppriv->sink && ppriv->sink == comp))
   587			*stop = true;
   588	
   589		if (*stop) {
 > 590			node = kzalloc_obj(*node);
   591			if (!node)
   592				return -ENOMEM;
   593			INIT_LIST_HEAD(&node->head);
   594			gtrace_get_component(comp);
   595			node->comp = comp;
   596			node->conn = stop_conn;
   597			list_add(&node->head, &path->comp_list);
   598		}
   599	
   600		return 0;
   601	}
   602	
   603	static void gtrace_release_path_nodes(struct gtrace_path *path)
   604	{
   605		struct gtrace_path_node *node, *node1;
   606	
   607		list_for_each_entry_safe(node, node1, &path->comp_list, head) {
   608			list_del(&node->head);
   609			gtrace_put_component(node->comp);
   610			kfree(node);
   611		}
   612	}
   613	
   614	struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
   615					       struct gtrace_component *sink,
   616					       enum gtrace_component_mode mode)
   617	{
   618		struct build_path_walk_priv priv;
   619		struct gtrace_path *path;
   620		int ret = 0;
   621	
   622		if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
   623			ret = -EINVAL;
   624			goto err_out;
   625		}
   626	
 > 627		path = kzalloc(sizeof(*path), GFP_KERNEL);
   628		if (!path) {
   629			ret = -ENOMEM;
   630			goto err_out;
   631		}
   632		INIT_LIST_HEAD(&path->comp_list);
   633		path->mode = mode;
   634		path->trace_id = GTRACE_INVALID_TRACE_ID;
   635	
   636		priv.path = path;
   637		priv.sink = sink;
   638		ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
   639		if (ret < 0)
   640			goto err_release_path_nodes;
   641	
   642		/* Before proceeding, check that a valid path was built. */
   643		if (list_empty(&path->comp_list)) {
   644			ret = -ENODEV;
   645			goto err_release_path_nodes;
   646		}
   647	
   648		if (!gtrace_path_ready(path)) {
   649			ret = -EOPNOTSUPP;
   650			goto err_release_path_nodes;
   651		}
   652	
   653		ret = gtrace_assign_trace_id(path);
   654		if (ret < 0)
   655			goto err_release_path_nodes;
   656	
   657		return path;
   658	
   659	err_release_path_nodes:
   660		gtrace_release_path_nodes(path);
   661		kfree(path);
   662	err_out:
   663		return ERR_PTR(ret);
   664	}
   665	EXPORT_SYMBOL_GPL(gtrace_create_path);
   666	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
