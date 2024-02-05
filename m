Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE28BFA;
	Mon,  5 Feb 2024 00:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707094381; cv=none; b=JB6XueCeSwpDD4vDU+5N2cGz08b2EZ9a9z02TQopUP4KxeKDMoqb52cxFGDVrHoGGbSyOjLx+6E/Z0GgYxOqIuSA7Q7fm1QPQqY89OML6TDMP1IL0O3iIOUBympSejEEljF9G6RT0vpWAAUF1eQzc5KNX6Qerb+bVRwwpelDMOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707094381; c=relaxed/simple;
	bh=HNdULl8FSrGuHnH6ri6xeKr3q7bWUCTU7+7ASvUWx4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktmyQk00F4/xnji3RQLbVaHE52Qzf3D2NMlQgxdxY5xry3dAT/tKXYQOCkppM9GAiOVt5SkMTskSBm/GW5TGwLJV7rASh1Irgj4+fV/ay+/BpqiuTaH6aJ/8/wTreVbeuR8P3yp+xhVTPYo0leyGPEfX9BY6J1EnwH/geywmbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYMKXXAu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYMKXXAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707094380; x=1738630380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNdULl8FSrGuHnH6ri6xeKr3q7bWUCTU7+7ASvUWx4Y=;
  b=FYMKXXAuGXjHkvaHICmtoxlISW5W+I6LdA9/ysih0xAB07fhx3253KBH
   UzeaoNDsMnioLPxyBWXOGjVQymxCtnVdMBPuqOTk65nUrYnMTgpqD7gvi
   OkCshj+jyKl40ojEBxRFm6V/YFaMpUJTUJnPKen9T82+SnW4zVoMCERT6
   9565v2+6spmqicSJwsB7l0htzanWKoOpvcdFxputXhBKlZsC5KSxU5PHd
   reH6U42t0fJcnoAwdt5xSez+qlvxXEJyZX3w3ePZs3fLP4KZ7+Snnrm/6
   Y5j7pJ2inm936xH4gr66xmrZWplhJ36QkuXjjC6yGLKFRac/j/qnTo3IN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11522729"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11522729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 16:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="865487"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2024 16:52:55 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnEC-00003Q-2x;
	Mon, 05 Feb 2024 00:52:52 +0000
Date: Mon, 5 Feb 2024 08:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 02/12] bcm2835-dma: Add proper 40-bit DMA support
Message-ID: <202402050701.GXVPwpd1-lkp@intel.com>
References: <eeb94204c30c2182f5ffd3ec083c04399ecdee32.1706948717.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb94204c30c2182f5ffd3ec083c04399ecdee32.1706948717.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.8-rc3 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/bcm2835-dma-Add-support-for-per-channel-flags/20240204-150430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/eeb94204c30c2182f5ffd3ec083c04399ecdee32.1706948717.git.andrea.porta%40suse.com
patch subject: [PATCH 02/12] bcm2835-dma: Add proper 40-bit DMA support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240205/202402050701.GXVPwpd1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050701.GXVPwpd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050701.GXVPwpd1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/bcm2835-dma.c:1175:5: warning: no previous prototype for function 'bcm2711_dma40_memcpy_init' [-Wmissing-prototypes]
   int bcm2711_dma40_memcpy_init(void)
       ^
   drivers/dma/bcm2835-dma.c:1175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bcm2711_dma40_memcpy_init(void)
   ^
   static 
>> drivers/dma/bcm2835-dma.c:1190:6: warning: no previous prototype for function 'bcm2711_dma40_memcpy' [-Wmissing-prototypes]
   void bcm2711_dma40_memcpy(dma_addr_t dst, dma_addr_t src, size_t size)
        ^
   drivers/dma/bcm2835-dma.c:1190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void bcm2711_dma40_memcpy(dma_addr_t dst, dma_addr_t src, size_t size)
   ^
   static 
   2 warnings generated.
--
>> drivers/dma/bcm2835-dma.c:57: warning: Function parameter or struct member 'cfg_data' not described in 'bcm2835_dmadev'


vim +/bcm2711_dma40_memcpy_init +1175 drivers/dma/bcm2835-dma.c

  1174	
> 1175	int bcm2711_dma40_memcpy_init(void)
  1176	{
  1177		if (!memcpy_parent)
  1178			return -EPROBE_DEFER;
  1179	
  1180		if (!memcpy_chan)
  1181			return -EINVAL;
  1182	
  1183		if (!memcpy_scb)
  1184			return -ENOMEM;
  1185	
  1186		return 0;
  1187	}
  1188	EXPORT_SYMBOL(bcm2711_dma40_memcpy_init);
  1189	
> 1190	void bcm2711_dma40_memcpy(dma_addr_t dst, dma_addr_t src, size_t size)
  1191	{
  1192		struct bcm2711_dma40_scb *scb = memcpy_scb;
  1193		unsigned long flags;
  1194	
  1195		if (!scb) {
  1196			pr_err("%s not initialised!\n", __func__);
  1197			return;
  1198		}
  1199	
  1200		spin_lock_irqsave(&memcpy_lock, flags);
  1201	
  1202		scb->ti = 0;
  1203		scb->src = lower_32_bits(src);
  1204		scb->srci = upper_32_bits(src) | BCM2711_DMA40_MEMCPY_XFER_INFO;
  1205		scb->dst = lower_32_bits(dst);
  1206		scb->dsti = upper_32_bits(dst) | BCM2711_DMA40_MEMCPY_XFER_INFO;
  1207		scb->len = size;
  1208		scb->next_cb = 0;
  1209	
  1210		writel((u32)(memcpy_scb_dma >> 5), memcpy_chan + BCM2711_DMA40_CB);
  1211		writel(BCM2711_DMA40_MEMCPY_FLAGS + BCM2711_DMA40_ACTIVE,
  1212		       memcpy_chan + BCM2711_DMA40_CS);
  1213	
  1214		/* Poll for completion */
  1215		while (!(readl(memcpy_chan + BCM2711_DMA40_CS) & BCM2711_DMA40_END))
  1216			cpu_relax();
  1217	
  1218		writel(BCM2711_DMA40_END, memcpy_chan + BCM2711_DMA40_CS);
  1219	
  1220		spin_unlock_irqrestore(&memcpy_lock, flags);
  1221	}
  1222	EXPORT_SYMBOL(bcm2711_dma40_memcpy);
  1223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
