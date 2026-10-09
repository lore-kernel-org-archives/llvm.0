Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F93349CF3;
	Fri,  9 Oct 2026 04:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520774; cv=none; b=ny1Cx+2R8RTOdAMm2XbaEoJLtI4EVDjO7KFAdmj54Xv85AySKgn0OVtD7fZ3GVuypaZ8baBLZPl5gBsQaCPVLXNkmxcqziSUbrkslmFWabJgmqSNccJeQ9jPQj+4Ka1QGuqteFiJuhht4TO9EOzlsxHVagJqKuC94U5WNy0BeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520774; c=relaxed/simple;
	bh=K6UeLRRubLw3BxamDg96ud/YhhdzPaLsgiNg2s+fPvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dtz5IAOWNq64glOr6e6YWhYT3d2AcxFI0EZUIvZgR7tssddpGfJ76sJLhGgHTXvM6591++E3YrnZtWWF+V4OFQAO+4f+8/oxEiCYHlo+pCo1SdEkLqcSVsGu6FHH0Yt17bqH/+v6Z+LYnejtsD9ULWC/V1OT8OsGdX1zi11ptsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCgkPhzN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCgkPhzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791520773; x=1823056773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6UeLRRubLw3BxamDg96ud/YhhdzPaLsgiNg2s+fPvo=;
  b=NCgkPhzN/J/0lDvA1FCPon8mBtB8M7JdpdyP3oT5uWPcx52UoJMa+s1j
   oTM3vP5nXRS6ImKBe2qQi2rRblugAvmrlNItfh/YafxCQYIlEICncvF8F
   2fg7WCdJKmIEuTW4JleA3cccL0jGHpqgrychqNYAFxdGwBzZGaaJx+Gr+
   UtRTCOk0VFSJ9IFp/vHmVmKRJRRKYYcvY53fW61QkSzMbXOgW3DLJDsvv
   DjjBCZkeFzHjvk8xPLrZyxsr2wMi4mhv1xtx5piFY59fBo/svvID7gLH+
   YMEGgGxBskpkeWRmuUcR2+HYAWjqOQWhkGERv/LxhYh8zLOFXdRybDxzV
   A==;
X-CSE-ConnectionGUID: 9iUwOJjmQZmVhaxCd4MMFA==
X-CSE-MsgGUID: LX0lRePbTBS2YZ6liKgNuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="410663"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="410663"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 21:39:32 -0700
X-CSE-ConnectionGUID: ygALq8CwTfuKFLIrTLo6lw==
X-CSE-MsgGUID: XYGE0EVjQ6C1XN9SrPGzNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="1958755"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 08 Oct 2026 21:39:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF2OF-000000005Jg-2Uir;
	Fri, 09 Oct 2026 04:39:27 +0000
Date: Fri, 09 Oct 2026 12:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 78/142]
 drivers/spi/spi-zx.c:426:105: warning: cast to smaller integer type 'unsigned
 int' from 'struct zx_qspi *'
Message-ID: <202610091234.Y0hfXvHu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 67ada9eae8a8fddee5c1bf5b8ea134c1fe873d9b [78/142] QSPI DMA somewhat working
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261009/202610091234.Y0hfXvHu-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091234.Y0hfXvHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091234.Y0hfXvHu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zx.c:426:105: warning: cast to smaller integer type 'unsigned int' from 'struct zx_qspi *' [-Wpointer-to-int-cast]
     426 |                 dev_dbg(dev, "Attempting DMA %x %s qspi 0x%08x...\n", ctrl0, ctrl0 & ZX_QSPI_TX_DMA_EN ? "tx" : "rx", (unsigned int)qspi);
         |                                                                                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/spi/spi-zx.c:615:17: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     615 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
         |         ~~~~~~~~~~~~~~ ^~~~~~~~~~~
   2 warnings generated.


vim +426 drivers/spi/spi-zx.c

   341	
   342	static int zx_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
   343	{
   344		struct zx_qspi *qspi = spi_controller_get_devdata(mem->spi->controller);
   345		u32 ctrl0, ctrl1 = 0, ctrl2 = 0, txstatus;
   346		struct device *dev = &qspi->ctrl->dev;
   347		dma_cookie_t cookie;
   348		int ret = 0;
   349	
   350		dev_dbg(dev, "zx_qspi_exec_op cmd:%#x buswidth:%d.%d.%d.%d addr:%#llx nbytes:%#x\n",
   351			op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
   352			op->dummy.buswidth, op->data.buswidth,
   353			op->addr.val, op->data.nbytes);
   354	
   355		ctrl0 = readl_relaxed(qspi->io_base + ZX_QSPI_CTRL0_REG);
   356		dev_dbg(dev, "ZX_QSPI_CTRL0_REG = 0x%08x\n", ctrl0);
   357		ctrl0 &= ~(ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN);
   358		ctrl0 |= (ZX_QSPI_RXFIFO_CLR | ZX_QSPI_TXFIFO_CLR);
   359		/* What are these for? I don't know, the ZTE driver sets them. Removing them here makes it
   360		 * possible to operate with a smaller burst size but presumably comes at a performance cost.
   361		 * In simple benchmarking I have not found an impact though.
   362		 */
   363		ctrl0 |= ZX_QSPI_TXFIFO_THRES | ZX_QSPI_RXFIFO_THRES;
   364	
   365		if (op->addr.nbytes && op->addr.buswidth) {
   366			ctrl1 |= ZX_QSPI_ADDR_TX_EN;
   367			switch (op->addr.buswidth * op->addr.nbytes) {
   368				case 1: ctrl2 |= (ADDR_BYTE_WIDTH_8 << ZX_QSPI_ADDR_BYTE_NUM); break;
   369				case 2: ctrl2 |= (ADDR_BYTE_WIDTH_16 << ZX_QSPI_ADDR_BYTE_NUM); break;
   370				case 3: ctrl2 |= (ADDR_BYTE_WIDTH_24 << ZX_QSPI_ADDR_BYTE_NUM); break;
   371				case 4: ctrl2 |= (ADDR_BYTE_WIDTH_32 << ZX_QSPI_ADDR_BYTE_NUM); break;
   372				default:
   373					dev_err(dev, "Unexpected addr.buswidth %u\n",
   374						op->addr.buswidth * op->addr.nbytes);	
   375					return -EIO;
   376			}	
   377		}
   378	
   379		ctrl0 |= zx_qspi_setup_dma(qspi, op);
   380	
   381		/* dummy config */
   382		if (op->dummy.nbytes && op->dummy.buswidth) {
   383			ctrl1 |= ZX_QSPI_DUMMY_TX_EN;
   384			ctrl2 |= (0x1 << ZX_QSPI_DUMMY_BYTE_NUM);
   385		}
   386	
   387		/* data config */
   388		if (op->data.nbytes) {
   389			if (op->data.dir == SPI_MEM_DATA_IN) {
   390				ctrl1 |= ZX_QSPI_READ_DATA_EN;
   391			} else {
   392				ctrl1 |= ZX_QSPI_WRITE_DATA_EN;
   393			}
   394	
   395			if (op->data.buswidth == 0x4) {
   396				ctrl2 |= ZX_QSPI_DATA_MULTI_LINE_EN | ZX_QSPI_TRANS_MOD;
   397			} else if (op->data.buswidth == 0x2) {
   398				ctrl2 |= ZX_QSPI_DATA_MULTI_LINE_EN;
   399			}
   400		}
   401	
   402		writel_relaxed(ctrl0, qspi->io_base + ZX_QSPI_CTRL0_REG);
   403		writel_relaxed(ctrl1, qspi->io_base + ZX_QSPI_CTRL1_REG);
   404		writel_relaxed(ctrl2, qspi->io_base + ZX_QSPI_CTRL2_REG);
   405	
   406		/* clear int */
   407		writel_relaxed(ZX_QSPI_INT_ALL_MASK, qspi->io_base + ZX_QSPI_INT_SW_CLR_REG);
   408	
   409		/* data len */
   410		if (op->data.nbytes) {
   411			writel_relaxed(op->data.nbytes - 1, qspi->io_base + ZX_QSPI_BYTE_NUM_REG);
   412		}
   413	
   414		/* addr */
   415		if (op->addr.nbytes && op->addr.buswidth) {
   416			writel_relaxed(op->addr.val, qspi->io_base + ZX_QSPI_ADDR_REG);
   417		}
   418	
   419		/* cmd */
   420		writel_relaxed(op->cmd.opcode, qspi->io_base + ZX_QSPI_INS_REG);
   421	
   422		/* spifc start */
   423		writel_relaxed(ZX_QSPI_START, qspi->io_base + ZX_QSPI_START_REG);
   424	
   425		if (op->data.nbytes && ctrl0 & (ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN)) {
 > 426			dev_dbg(dev, "Attempting DMA %x %s qspi 0x%08x...\n", ctrl0, ctrl0 & ZX_QSPI_TX_DMA_EN ? "tx" : "rx", (unsigned int)qspi);
   427			// qspi->dma_desc->callback = zx_qspi_dma_callback;
   428			qspi->dma_desc->callback_result = zx_qspi_callback_result;
   429			qspi->dma_desc->callback_param = qspi;
   430			cookie = dmaengine_submit(qspi->dma_desc);
   431			ret = dma_submit_error(cookie);
   432			if (ret) {
   433				/* FIXME: Does this kind of fallback to PIO work? How do I provoke it to
   434				 * test it?
   435				 */
   436				dev_err(dev, "dmaengine_submit = %d, falling back to PIO\n", ret);
   437				ctrl0 &= ~(ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN);
   438				writel_relaxed(ctrl0, qspi->io_base + ZX_QSPI_CTRL0_REG);
   439			} else {
   440				dma_async_issue_pending(qspi->cur_dma_ch);
   441	
   442				if (!wait_for_completion_io_timeout(&qspi->dma_completion,
   443						 msecs_to_jiffies(2000))) {
   444					dev_err(dev, "DMA timed out\n");
   445					spi_controller_dma_unmap_mem_op_data(qspi->ctrl, op, &qspi->sgt);
   446					return -EIO;
   447				}
   448			}
   449			qspi->dma_desc = NULL;
   450	
   451			spi_controller_dma_unmap_mem_op_data(qspi->ctrl, op, &qspi->sgt);
   452			writel_relaxed(ctrl0 & ~(ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN), qspi->io_base + ZX_QSPI_CTRL0_REG);
   453		}
   454	
   455		if (op->data.nbytes && !(ctrl0 & (ZX_QSPI_TX_DMA_EN | ZX_QSPI_RX_DMA_EN))) {
   456			ret = zx_qspi_tx(qspi, op);
   457			if (ret) 
   458			{
   459				pr_err("zx_qspi_tx error %d.\n", ret);
   460				return ret;	
   461			}
   462		}
   463	
   464		/* With DMA the result is ready by the time we receive the DMA complete callback. With PIO,
   465		 * the highest wait time I have seen was 1 us.
   466		 */
   467		ret = readl_relaxed_poll_timeout_atomic(qspi->io_base + ZX_QSPI_INT_RAW_REG,
   468							txstatus, txstatus & ZX_QSPI_INT_CMD_END, 1,
   469							1000);
   470		if (ret) {
   471			dev_err(dev, "Wait for transfer end failed: %u.\n", ret);
   472			return ret;
   473		}
   474	
   475		if (txstatus & ZX_QSPI_INT_FMT_ERR) {
   476			dev_err(dev, "SPI controller reported an error, status 0x%08x\n", txstatus);
   477			return -EIO;
   478		}
   479		if (txstatus & ZX_QSPI_INT_CMD_END) {
   480			return 0;
   481		}
   482		dev_err(dev, "Unexpected status 0x%08x\n", txstatus);
   483		return -EIO;
   484	}
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
