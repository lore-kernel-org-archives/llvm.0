Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927637F737;
	Wed, 14 Jan 2026 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380633; cv=none; b=bvHd+W11FMuC8HcG7SqOMN0A/Sxpx0zyAuIEaW9Ps6nJO3wTK+7YjvKEFUkEWwvt0fmaLYqHGBwGvQaPRcejFB1oLnZzwsfcLTppAH6jear+yxUYcDZ2IIORnhnMpEf+JTK1eg5MP563XadZH0vuP9CeZcqdpbN8Kjgs/Xgti/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380633; c=relaxed/simple;
	bh=9WrC7PoW1tnMSWaGp+a6OzL1P5H5ocgF70PzqOotMyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ywtp+IhFZqkXaNgNGzlGqXwmQmztFIQoLvf7e3/Sr4lHwtE9VqAtTvSRuSZyjpiSBxn5uFSYWfpE2b7iJESM1vjYISYM5sBAFQkqpi3Pa8zXmVs2WXhLaMOC02vQADKGW6eRpvDpn+L18D97UkuoVfntpVhRflBnlMFZ1dWjCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpmtMO+q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpmtMO+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768380630; x=1799916630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9WrC7PoW1tnMSWaGp+a6OzL1P5H5ocgF70PzqOotMyc=;
  b=TpmtMO+qG5wVCVhdUL98HY+a+e8ntoif8/oWzDV/uSdsjZe0sOvE/PKT
   PMvFTHtyeqHEt1Rx34l8b02rD6Gj0vUArVSXp1DWKIqiHZzhP3RWtLr1V
   EegI4yQS/9oXMvl8vCknFg18ZY3lw7awqExCytiLgfy5Ng9KT71JV+SU7
   vkX1lLpfzsL838FYFmaLNJp6yi8to4Kvv4TNlBc45jBbethmFk2D0Pe8K
   Y4An/HyRltVTQeyRztmFstWfQD7JjvDMfKyAh2SGBZiciDDVuJ8H/0IpR
   q/h2Jrqx6HyjGYhdaULWSS/tNGjn7IELHVOu+ZIgTr+EgtQE9QDu8ezle
   Q==;
X-CSE-ConnectionGUID: KSQRpBqPSke/XVGLYQmrRg==
X-CSE-MsgGUID: UVEW1CMfQ4uf1GB+gU4xuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69583990"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69583990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:50:28 -0800
X-CSE-ConnectionGUID: 51X8b6BBSdGy+ZLZ30sGMQ==
X-CSE-MsgGUID: 377IeQY0TY2w52nrrvyDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204514346"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jan 2026 00:50:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfwa8-00000000G6C-3x4A;
	Wed, 14 Jan 2026 08:50:24 +0000
Date: Wed, 14 Jan 2026 16:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh
 helpers
Message-ID: <202601141622.CAk5SXFi-lkp@intel.com>
References: <20260108080332.2341725-2-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080332.2341725-2-allen.lkml@gmail.com>

Hi Allen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on shawnguo/for-next sunxi/sunxi/for-next soc/for-next linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen-Pais/dmaengine-introduce-dmaengine_bh_wq-and-bh-helpers/20260108-164201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260108080332.2341725-2-allen.lkml%40gmail.com
patch subject: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh helpers
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260114/202601141622.CAk5SXFi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141622.CAk5SXFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141622.CAk5SXFi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma/hsu/hsu.c:22:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/dma/hsu/hsu.c:503:29: error: no member named 'task' in 'struct virt_dma_chan'
     503 |                 tasklet_kill(&hsuc->vchan.task);
         |                               ~~~~~~~~~~~ ^
   1 warning and 1 error generated.


vim +503 drivers/dma/hsu/hsu.c

2b49e0c56741fc Andy Shevchenko 2015-02-23  492  
2b49e0c56741fc Andy Shevchenko 2015-02-23  493  int hsu_dma_remove(struct hsu_dma_chip *chip)
2b49e0c56741fc Andy Shevchenko 2015-02-23  494  {
2b49e0c56741fc Andy Shevchenko 2015-02-23  495  	struct hsu_dma *hsu = chip->hsu;
2b49e0c56741fc Andy Shevchenko 2015-02-23  496  	unsigned short i;
2b49e0c56741fc Andy Shevchenko 2015-02-23  497  
2b49e0c56741fc Andy Shevchenko 2015-02-23  498  	dma_async_device_unregister(&hsu->dma);
2b49e0c56741fc Andy Shevchenko 2015-02-23  499  
4c97ad993d7639 Heikki Krogerus 2015-10-13  500  	for (i = 0; i < hsu->nr_channels; i++) {
2b49e0c56741fc Andy Shevchenko 2015-02-23  501  		struct hsu_dma_chan *hsuc = &hsu->chan[i];
2b49e0c56741fc Andy Shevchenko 2015-02-23  502  
2b49e0c56741fc Andy Shevchenko 2015-02-23 @503  		tasklet_kill(&hsuc->vchan.task);
2b49e0c56741fc Andy Shevchenko 2015-02-23  504  	}
2b49e0c56741fc Andy Shevchenko 2015-02-23  505  
2b49e0c56741fc Andy Shevchenko 2015-02-23  506  	return 0;
2b49e0c56741fc Andy Shevchenko 2015-02-23  507  }
2b49e0c56741fc Andy Shevchenko 2015-02-23  508  EXPORT_SYMBOL_GPL(hsu_dma_remove);
2b49e0c56741fc Andy Shevchenko 2015-02-23  509  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
