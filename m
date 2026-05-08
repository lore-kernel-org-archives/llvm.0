Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E974379EF0;
	Fri,  8 May 2026 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778223861; cv=none; b=AdrloGuBdFC8mgnIRfVX0a0jxv4GpzIC3W79+kVOi6qj3yhgG3MtullIYxAdLnw0ThOTRB100wWyqyfdMmi8ypjWIZ1yKKbv71KhvPU4KViOdXmSlYPo6KxCaWQPHR4Kaa5Colt4CI+ue1Ntr7+cCbqx+/QAqdOSABZkjvXnQKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778223861; c=relaxed/simple;
	bh=Vb2vub8qQRhaOHaarJp9giDxsrpqj7wpQ7Nwr6IYhWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UlRd555mijPjtmejVZnRJpn0FvQARlZ6Nu/m0IWZrPoAf2EwNz1kiHFIrpMpOsnAkU+qPoAP9WwD4Jgl6krPKuVEO/Nv85ofgHTPBIvxls7HSykGOdJk2dr+PgK2nQFy3RgHQKmHuJSSNPewtet29Y+tayJ//s3Dsi8povWO1Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzQVhBRV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzQVhBRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778223858; x=1809759858;
  h=date:from:to:cc:subject:message-id;
  bh=Vb2vub8qQRhaOHaarJp9giDxsrpqj7wpQ7Nwr6IYhWY=;
  b=QzQVhBRVW3kbSuOfC3L46cTYFWyDipOA3w14x+//eKK+tB12HCHHPWen
   oX4vJMm0zt5MyUZzrizhkqUNBUPvcZUlS7KpD97Qme51q+Mj9A9L1EEnC
   z0GDQTHwLFrR0TBpZV/UYSa41uYfznfdoQ1bZa5hkF+Osg4dMjFecBKhZ
   XQHJtW8tJolvaEM/8LywXZWZkbHY/ezK5aTa9O8Og2jbs06MLlGWzSo+N
   gPLCVBpmVxNoLKqaLEmasuFDG3GrUufHvoswf17aCFXfioytQA0Bzdkfk
   QKbyphhmlGIJA7THkNiBqUbrFvB2khS8e6CrGJWHV/N2+eP9c33xxHLVb
   g==;
X-CSE-ConnectionGUID: PHsoQFotSY6xV888EmuBVw==
X-CSE-MsgGUID: b7xfWI2HSNuay/jU1JE8fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79124817"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79124817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:04:13 -0700
X-CSE-ConnectionGUID: joaplboZSZmti4z07D3UcA==
X-CSE-MsgGUID: TWFqElUVQV2IisQyoqxCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="233641076"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2026 00:04:12 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLFFp-000000000ox-228K;
	Fri, 08 May 2026 07:04:09 +0000
Date: Fri, 08 May 2026 15:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>
Subject: [frank-li:imx/firmware-ele 5/5]
 drivers/firmware/imx/se_ctrl.c:673:16: warning: result of comparison of
 constant 18446744073709551608 with expression of type '__u32' (aka 'unsigned
 int') is always false
Message-ID: <202605081441.lIHK75ug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/firmware-ele
head:   890e531b38f8965c64b2508cf25c78031d6f31a6
commit: 890e531b38f8965c64b2508cf25c78031d6f31a6 [5/5] firmware: drivers: imx: adds miscdev
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605081441.lIHK75ug-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081441.lIHK75ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081441.lIHK75ug-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/se_ctrl.c:673:16: warning: result of comparison of constant 18446744073709551608 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     673 |         if (io.length > SIZE_MAX - 7) {
         |             ~~~~~~~~~ ^ ~~~~~~~~~~~~
   1 warning generated.


vim +673 drivers/firmware/imx/se_ctrl.c

   639	
   640	/*
   641	 * Copy a buffer of data to/from the user and return the address to use in
   642	 * messages
   643	 */
   644	static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
   645						void __user *uarg)
   646	{
   647		struct se_shared_mem *shared_mem = NULL;
   648		struct se_ioctl_setup_iobuf io = {0};
   649		size_t aligned_len;
   650		int err = 0;
   651		u32 pos;
   652	
   653		if (copy_from_user(&io, uarg, sizeof(io))) {
   654			dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
   655				dev_ctx->devname);
   656			return -EFAULT;
   657		}
   658	
   659		dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
   660			io.user_buf, io.length, io.flags);
   661	
   662		if (io.length == 0 || !io.user_buf) {
   663			/*
   664			 * Accept NULL pointers since some buffers are optional
   665			 * in FW commands. In this case we should return 0 as
   666			 * pointer to be embedded into the message.
   667			 * Skip all data copy part of code below.
   668			 */
   669			io.ele_addr = 0;
   670			goto copy;
   671		}
   672	
 > 673		if (io.length > SIZE_MAX - 7) {
   674			dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
   675				dev_ctx->devname);
   676			return -EINVAL;
   677		}
   678		aligned_len = round_up((size_t)io.length, 8);
   679	
   680		/* No specific requirement for this buffer. */
   681		shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
   682	
   683		/* Check there is enough space in the shared memory. */
   684		dev_dbg(dev_ctx->priv->dev, "%s: req_size = %zd, max_size= %d, curr_pos = %d",
   685			dev_ctx->devname, aligned_len, shared_mem->size,
   686			shared_mem->pos);
   687	
   688		if (shared_mem->size < shared_mem->pos ||
   689		    aligned_len > (shared_mem->size - shared_mem->pos)) {
   690			dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
   691				dev_ctx->devname);
   692			return -ENOMEM;
   693		}
   694	
   695		/* Allocate space in shared memory. 8 bytes aligned. */
   696		pos = shared_mem->pos;
   697		shared_mem->pos += aligned_len;
   698		io.ele_addr = (u64)shared_mem->dma_addr + pos;
   699	
   700		memset(shared_mem->ptr + pos, 0, io.length);
   701		if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
   702		    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
   703			/*
   704			 * buffer is input:
   705			 * copy data from user space to this allocated buffer.
   706			 */
   707			if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
   708				dev_err(dev_ctx->priv->dev,
   709					"%s: Failed copy data to shared memory.",
   710					dev_ctx->devname);
   711				return -EFAULT;
   712			}
   713		}
   714	
   715		err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
   716		if (err < 0)
   717			dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
   718				dev_ctx->devname);
   719	
   720	copy:
   721		/* Provide the EdgeLock Enclave address to user space only if success.*/
   722		if (copy_to_user(uarg, &io, sizeof(io))) {
   723			dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
   724				dev_ctx->devname);
   725			err = -EFAULT;
   726		}
   727	
   728		return err;
   729	}
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
