Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F3EEC3;
	Fri, 25 Aug 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692941159; x=1724477159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mACJrd0RyK56/7LkRBQnNM1MQpvl5t6nmgNZnj7Z9Sc=;
  b=Wr+S9eZaG0zFyRDLGOTeRtoz2KwOlr4ONGmwPAwZ8F0AOBfKJ+VRro/j
   3Rsg1xZd60i4Niub6sIPfyMynKpNuSxsU+lFV+z6FWIiAAsHI2EhFYQTL
   gCN5leRTPdayv9ySIwUtwBlgxWq3qt7nd9mFFj/JfbOjPu71bB3xejoBZ
   fafqdBaYxYD5xF9MyFmvtjFiUnNjzRmBTb6vz6YZ8c7Gl9nPMlU2t44RO
   MKAuiFgYiStxKad+rBdA7jzXeQHqccPzJe/B6vdSP19fGIqfdEUT9L5UP
   G7blmqRzroMjGlG6DV4jySzLs3oaIdszkdkZv6vAkzxsjn4wQ09JPRRvP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374609860"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374609860"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 22:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851819749"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="851819749"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2023 22:25:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZPKV-0003Ew-2a;
	Fri, 25 Aug 2023 05:25:55 +0000
Date: Fri, 25 Aug 2023 13:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.5/isp/v2 9/23]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:517:17: warning: implicit
 truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1
Message-ID: <202308251328.U6s4pgBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/isp/v2
head:   f5e693f69d0571ab6dbe2e178244e1a319261739
commit: 544fc7b66b9ec9f5ec040c51d585e40e6d01244b [9/23] staging: vc04_services: Add new vc-sm-cma driver
config: arm64-randconfig-r031-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251328.U6s4pgBg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251328.U6s4pgBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251328.U6s4pgBg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:517:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     517 |         buffer->in_use = 1;
         |                        ^ ~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:416:1: warning: no previous prototype for function 'vc_sm_cma_import_dmabuf_internal' [-Wmissing-prototypes]
     416 | vc_sm_cma_import_dmabuf_internal(struct sm_state_t *state,
         | ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     415 | int
         | ^
         | static 
   2 warnings generated.
--
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     283 |         default:
         |         ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: note: insert 'break;' to avoid fall-through
     283 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +/int +517 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c

   413	
   414	/* Import a dma_buf to be shared with VC. */
   415	int
 > 416	vc_sm_cma_import_dmabuf_internal(struct sm_state_t *state,
   417					 struct dma_buf *dma_buf,
   418					 int fd,
   419					 struct dma_buf **imported_buf)
   420	{
   421		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
   422		struct vc_sm_buffer *buffer = NULL;
   423		struct vc_sm_import import = { };
   424		struct vc_sm_import_result result = { };
   425		struct dma_buf_attachment *attach = NULL;
   426		struct sg_table *sgt = NULL;
   427		dma_addr_t dma_addr;
   428		int ret = 0;
   429		int status;
   430	
   431		/* Setup our allocation parameters */
   432		pr_debug("%s: importing dma_buf %p/fd %d\n", __func__, dma_buf, fd);
   433	
   434		if (fd < 0)
   435			get_dma_buf(dma_buf);
   436		else
   437			dma_buf = dma_buf_get(fd);
   438	
   439		if (!dma_buf)
   440			return -EINVAL;
   441	
   442		attach = dma_buf_attach(dma_buf, &sm_state->pdev->dev);
   443		if (IS_ERR(attach)) {
   444			ret = PTR_ERR(attach);
   445			goto error;
   446		}
   447	
   448		sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
   449		if (IS_ERR(sgt)) {
   450			ret = PTR_ERR(sgt);
   451			goto error;
   452		}
   453	
   454		/* Verify that the address block is contiguous */
   455		if (sgt->nents != 1) {
   456			ret = -ENOMEM;
   457			goto error;
   458		}
   459	
   460		/* Allocate local buffer to track this allocation. */
   461		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   462		if (!buffer) {
   463			ret = -ENOMEM;
   464			goto error;
   465		}
   466	
   467		import.type = VC_SM_ALLOC_NON_CACHED;
   468		dma_addr = sg_dma_address(sgt->sgl);
   469		import.addr = (u32)dma_addr;
   470		if ((import.addr & 0xC0000000) != 0xC0000000) {
   471			pr_err("%s: Expecting an uncached alias for dma_addr %pad\n",
   472			       __func__, &dma_addr);
   473			import.addr |= 0xC0000000;
   474		}
   475		import.size = sg_dma_len(sgt->sgl);
   476		import.allocator = current->tgid;
   477		import.kernel_id = get_kernel_id(buffer);
   478	
   479		memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
   480		       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
   481	
   482		pr_debug("[%s]: attempt to import \"%s\" data - type %u, addr %pad, size %u.\n",
   483			 __func__, import.name, import.type, &dma_addr, import.size);
   484	
   485		/* Allocate the videocore buffer. */
   486		status = vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
   487					       &sm_state->int_trans_id);
   488		if (status == -EINTR) {
   489			pr_debug("[%s]: requesting import memory action restart (trans_id: %u)\n",
   490				 __func__, sm_state->int_trans_id);
   491			ret = -ERESTARTSYS;
   492			sm_state->restart_sys = -EINTR;
   493			sm_state->int_action = VC_SM_MSG_TYPE_IMPORT;
   494			goto error;
   495		} else if (status || !result.res_handle) {
   496			pr_debug("[%s]: failed to import memory on videocore (status: %u, trans_id: %u)\n",
   497				 __func__, status, sm_state->int_trans_id);
   498			ret = -ENOMEM;
   499			goto error;
   500		}
   501	
   502		mutex_init(&buffer->lock);
   503		INIT_LIST_HEAD(&buffer->attachments);
   504		memcpy(buffer->name, import.name,
   505		       min(sizeof(buffer->name), sizeof(import.name) - 1));
   506	
   507		/* Keep track of the buffer we created. */
   508		buffer->vc_handle = result.res_handle;
   509		buffer->size = import.size;
   510		buffer->vpu_state = VPU_MAPPED;
   511	
   512		buffer->imported_dma_buf = dma_buf;
   513	
   514		buffer->attach = attach;
   515		buffer->sgt = sgt;
   516		buffer->dma_addr = dma_addr;
 > 517		buffer->in_use = 1;
   518		buffer->kernel_id = import.kernel_id;
   519	
   520		/*
   521		 * We're done - we need to export a new dmabuf chaining through most
   522		 * functions, but enabling us to release our own internal references
   523		 * here.
   524		 */
   525		exp_info.ops = &dma_buf_import_ops;
   526		exp_info.size = import.size;
   527		exp_info.flags = O_RDWR;
   528		exp_info.priv = buffer;
   529	
   530		buffer->dma_buf = dma_buf_export(&exp_info);
   531		if (IS_ERR(buffer->dma_buf)) {
   532			ret = PTR_ERR(buffer->dma_buf);
   533			goto error;
   534		}
   535	
   536		vc_sm_add_resource(buffer);
   537	
   538		*imported_buf = buffer->dma_buf;
   539	
   540		return 0;
   541	
   542	error:
   543		if (result.res_handle) {
   544			struct vc_sm_free_t free = { result.res_handle, 0 };
   545	
   546			vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
   547					    &sm_state->int_trans_id);
   548		}
   549		free_kernel_id(import.kernel_id);
   550		kfree(buffer);
   551		if (sgt)
   552			dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
   553		if (attach)
   554			dma_buf_detach(dma_buf, attach);
   555		dma_buf_put(dma_buf);
   556		return ret;
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
