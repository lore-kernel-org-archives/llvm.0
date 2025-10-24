Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D5286415;
	Fri, 24 Oct 2025 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761287756; cv=none; b=AIF9j3AcCfXxEoxkjeeVYhAdvc/ct8vwRmfbYDWA1ron59xrfQz8UZNjPNjJhPHkjCufYHBuBLi5zC4Hl0g/YqVYdQWSrJBW/MGnI3Jb+kiwi30G2wiz/2Q5VXuDEywMyv/oUicHIQw4DLAjds7TXeZWi2r4Aveuyds1isRSwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761287756; c=relaxed/simple;
	bh=J+iJalW0kzN/nfzsNOCJer6RfSWLfG/6CHC6QJCKrB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0UXCMd84aC0hHLq4hoGClyuJZBkbW6gbQ7eR5ODysqEJMOCm/GBFv5MMNjEMA80d+qZAOZ9tFODEj9nNVyyBq4nySCPYw6plgOp7KN0KgjeCjJi22ci282+BCyBXj8NntmWq5cFt4IEyJsA1U/0n+ll2V4tM7r9E+DLjcIJ8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi91VdMU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi91VdMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761287755; x=1792823755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+iJalW0kzN/nfzsNOCJer6RfSWLfG/6CHC6QJCKrB8=;
  b=Hi91VdMUpScfJuvPV3Rz/VOSTxyK0X0VUZAu9FQHW98PWeCuAtJx59sm
   PCpP5dW0/AwkN1xJnvwVbnlR/rv4r8eWQ73z5O8hZoOtE3gBQb+MuYTnP
   q6JQ0CSyXGww9ZaQpQSG7fkDhaNbxzf8bXj57hX/FNpzM9YuLhtdeUgdg
   eT4Efy+ana6lNRowQBj0NnJ6par448NyGujaI1JUaqaTAquF2qaMoekCU
   TqByq6Vf/wHn1HCzJ6i7EwNaIMA4vQpUz1tOh6JSVtyMyTW0T/0gmwrK+
   dwQgT3m/jfE6OhpbHnaSXfeGB0lECA5AW95r0/HdYHvcR2pPuZAdrTojx
   Q==;
X-CSE-ConnectionGUID: Ox8Nx1r6T3Khzp5gJrO8/w==
X-CSE-MsgGUID: uxNYY8JMSaCKxqhVspVncg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74812007"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74812007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:35:52 -0700
X-CSE-ConnectionGUID: xF9zatYySXO7rRMOEyAv4w==
X-CSE-MsgGUID: pGI9rTlGTFWS974ZsVLKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184733867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2025 23:35:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCBOq-000EFV-3A;
	Fri, 24 Oct 2025 06:35:45 +0000
Date: Fri, 24 Oct 2025 14:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/25] dmaengine: dw-edma: Add
 dw_edma_find_by_child() helper
Message-ID: <202510241429.obf0x5E0-lkp@intel.com>
References: <20251023071916.901355-18-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023071916.901355-18-den@valinux.co.jp>

Hi Koichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on jonmason-ntb/ntb-next]
[also build test WARNING on vkoul-dmaengine/next pci/next pci/for-linus linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251023-153325
base:   https://github.com/jonmason/ntb ntb-next
patch link:    https://lore.kernel.org/r/20251023071916.901355-18-den%40valinux.co.jp
patch subject: [RFC PATCH 17/25] dmaengine: dw-edma: Add dw_edma_find_by_child() helper
config: i386-buildonly-randconfig-003-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241429.obf0x5E0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241429.obf0x5E0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241429.obf0x5E0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/dwc/pcie-designware-ep.c:17:
   In file included from drivers/pci/controller/dwc/pcie-designware.h:18:
>> include/linux/dma/edma.h:145:17: warning: no previous prototype for function 'dw_edma_find_by_child' [-Wmissing-prototypes]
     145 | struct dw_edma *dw_edma_find_by_child(struct device *child)
         |                 ^
   include/linux/dma/edma.h:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | struct dw_edma *dw_edma_find_by_child(struct device *child)
         | ^
         | static 
   1 warning generated.


vim +/dw_edma_find_by_child +145 include/linux/dma/edma.h

   140	
   141	static inline void dw_edma_unregister_selfirq(struct dw_edma *dw,
   142						      dw_edma_selfirq_fn fn, void *data)
   143	{
   144	}
 > 145	struct dw_edma *dw_edma_find_by_child(struct device *child)
   146	{
   147		return NULL;
   148	}
   149	#endif /* CONFIG_DW_EDMA */
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
