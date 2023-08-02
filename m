Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130310E2;
	Wed,  2 Aug 2023 03:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690948332; x=1722484332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oG+mnJCH1tsDQQDsYxdeXnIOUvFbdC4npmVAGyd7baY=;
  b=cvRTL6tTnH+Low2w2AwDOlEr2BF5Bf1VROGXnNz3BjAqhVty3cFWkcWM
   CpxVZV0qVssbjiFZQFDUAiKIVyTLs+eRweC+JqY1LU30i+1pK4iJkpL8+
   RiGh8jS6R732PXAK2ltMvH140NnRDfpJNn8AbSZyDnuLpF0T5E/eNV/5z
   DBcl1EAxzB3iLvnWj9SW5I8FXdaMIRTcNmeZ96WTiwfrllgqp0NFLRrnr
   5GzekW//ZDOlnOW8YPdSAyO5Bp++QRTm3xwDlYNdWwBR6H3mMAXlogIfR
   7tN/Vgk34zJYOL8v1mYwIaoaKaK00e/Q9uxaIXc3PAoOhKSA6xYJ9fXYJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433312652"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="433312652"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 20:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852721899"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="852721899"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Aug 2023 20:52:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR2u5-0000pT-1B;
	Wed, 02 Aug 2023 03:52:05 +0000
Date: Wed, 2 Aug 2023 11:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.4/isp/v2 32/47]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:518:17: warning: implicit
 truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1
Message-ID: <202308021107.kJpzuO6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.4/isp/v2
head:   fa6e05c138b9be3efb409e6a5a913ac9ad342a8d
commit: e4f0aebd1ac235c8960d3c23c34d5ddd775ed46a [32/47] staging: vc04_services: Add new vc-sm-cma driver
config: s390-randconfig-r015-20230801 (https://download.01.org/0day-ci/archive/20230802/202308021107.kJpzuO6a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021107.kJpzuO6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021107.kJpzuO6a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:518:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     518 |         buffer->in_use = 1;
         |                        ^ ~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:417:1: warning: no previous prototype for function 'vc_sm_cma_import_dmabuf_internal' [-Wmissing-prototypes]
     417 | vc_sm_cma_import_dmabuf_internal(struct sm_state_t *state,
         | ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     416 | int
         | ^
         | static 
   14 warnings generated.
--
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     283 |         default:
         |         ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:283:2: note: insert 'break;' to avoid fall-through
     283 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +/int +518 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c

   414	
   415	/* Import a dma_buf to be shared with VC. */
   416	int
 > 417	vc_sm_cma_import_dmabuf_internal(struct sm_state_t *state,
   418					 struct dma_buf *dma_buf,
   419					 int fd,
   420					 struct dma_buf **imported_buf)
   421	{
   422		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
   423		struct vc_sm_buffer *buffer = NULL;
   424		struct vc_sm_import import = { };
   425		struct vc_sm_import_result result = { };
   426		struct dma_buf_attachment *attach = NULL;
   427		struct sg_table *sgt = NULL;
   428		dma_addr_t dma_addr;
   429		int ret = 0;
   430		int status;
   431	
   432		/* Setup our allocation parameters */
   433		pr_debug("%s: importing dma_buf %p/fd %d\n", __func__, dma_buf, fd);
   434	
   435		if (fd < 0)
   436			get_dma_buf(dma_buf);
   437		else
   438			dma_buf = dma_buf_get(fd);
   439	
   440		if (!dma_buf)
   441			return -EINVAL;
   442	
   443		attach = dma_buf_attach(dma_buf, &sm_state->pdev->dev);
   444		if (IS_ERR(attach)) {
   445			ret = PTR_ERR(attach);
   446			goto error;
   447		}
   448	
   449		sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
   450		if (IS_ERR(sgt)) {
   451			ret = PTR_ERR(sgt);
   452			goto error;
   453		}
   454	
   455		/* Verify that the address block is contiguous */
   456		if (sgt->nents != 1) {
   457			ret = -ENOMEM;
   458			goto error;
   459		}
   460	
   461		/* Allocate local buffer to track this allocation. */
   462		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   463		if (!buffer) {
   464			ret = -ENOMEM;
   465			goto error;
   466		}
   467	
   468		import.type = VC_SM_ALLOC_NON_CACHED;
   469		dma_addr = sg_dma_address(sgt->sgl);
   470		import.addr = (u32)dma_addr;
   471		if ((import.addr & 0xC0000000) != 0xC0000000) {
   472			pr_err("%s: Expecting an uncached alias for dma_addr %pad\n",
   473			       __func__, &dma_addr);
   474			import.addr |= 0xC0000000;
   475		}
   476		import.size = sg_dma_len(sgt->sgl);
   477		import.allocator = current->tgid;
   478		import.kernel_id = get_kernel_id(buffer);
   479	
   480		memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
   481		       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
   482	
   483		pr_debug("[%s]: attempt to import \"%s\" data - type %u, addr %pad, size %u.\n",
   484			 __func__, import.name, import.type, &dma_addr, import.size);
   485	
   486		/* Allocate the videocore buffer. */
   487		status = vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
   488					       &sm_state->int_trans_id);
   489		if (status == -EINTR) {
   490			pr_debug("[%s]: requesting import memory action restart (trans_id: %u)\n",
   491				 __func__, sm_state->int_trans_id);
   492			ret = -ERESTARTSYS;
   493			sm_state->restart_sys = -EINTR;
   494			sm_state->int_action = VC_SM_MSG_TYPE_IMPORT;
   495			goto error;
   496		} else if (status || !result.res_handle) {
   497			pr_debug("[%s]: failed to import memory on videocore (status: %u, trans_id: %u)\n",
   498				 __func__, status, sm_state->int_trans_id);
   499			ret = -ENOMEM;
   500			goto error;
   501		}
   502	
   503		mutex_init(&buffer->lock);
   504		INIT_LIST_HEAD(&buffer->attachments);
   505		memcpy(buffer->name, import.name,
   506		       min(sizeof(buffer->name), sizeof(import.name) - 1));
   507	
   508		/* Keep track of the buffer we created. */
   509		buffer->vc_handle = result.res_handle;
   510		buffer->size = import.size;
   511		buffer->vpu_state = VPU_MAPPED;
   512	
   513		buffer->imported_dma_buf = dma_buf;
   514	
   515		buffer->attach = attach;
   516		buffer->sgt = sgt;
   517		buffer->dma_addr = dma_addr;
 > 518		buffer->in_use = 1;
   519		buffer->kernel_id = import.kernel_id;
   520	
   521		/*
   522		 * We're done - we need to export a new dmabuf chaining through most
   523		 * functions, but enabling us to release our own internal references
   524		 * here.
   525		 */
   526		exp_info.ops = &dma_buf_import_ops;
   527		exp_info.size = import.size;
   528		exp_info.flags = O_RDWR;
   529		exp_info.priv = buffer;
   530	
   531		buffer->dma_buf = dma_buf_export(&exp_info);
   532		if (IS_ERR(buffer->dma_buf)) {
   533			ret = PTR_ERR(buffer->dma_buf);
   534			goto error;
   535		}
   536	
   537		vc_sm_add_resource(buffer);
   538	
   539		*imported_buf = buffer->dma_buf;
   540	
   541		return 0;
   542	
   543	error:
   544		if (result.res_handle) {
   545			struct vc_sm_free_t free = { result.res_handle, 0 };
   546	
   547			vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
   548					    &sm_state->int_trans_id);
   549		}
   550		free_kernel_id(import.kernel_id);
   551		kfree(buffer);
   552		if (sgt)
   553			dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
   554		if (attach)
   555			dma_buf_detach(dma_buf, attach);
   556		dma_buf_put(dma_buf);
   557		return ret;
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
