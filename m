Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E1E28DB46;
	Sat, 28 Mar 2026 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774731724; cv=none; b=a5TeYmVtrtf6yOcDsbgRYs/aCDjnalDPhOYw6qecmyJ1gMNqluG2Qliy6feQryUa6VdKkaw7RzRNNMQVXX5QuRZovnJ0S8+7czl21Z6Wjv6sInkKweYwTTpO5BkZO2AJDsnsltnnPpJ06lD5LyFHQFK6xOSoEINyA3b2jNEEBec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774731724; c=relaxed/simple;
	bh=3T6ln19B3QTWADMNWNJP3YA3rSvxbxarUP9Ato9B9a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCP7SPsCK7l/W/WWpqlmJg+otpD18KwmvCyzPG2t4brcdYPd3L7s/HekKANO6IcX5PI+xFlX9SAzLnYBPFSOMkEfo79MInpuUH5xTuK4OcngTHLffFiUj5H8Qq1qa+i83AqfelBhMGZkkqeeXRIqIZEMw+fKYuQP2MFaF1Lf04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJbetxKG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJbetxKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774731721; x=1806267721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3T6ln19B3QTWADMNWNJP3YA3rSvxbxarUP9Ato9B9a8=;
  b=bJbetxKGz5lIv3AzSSxSbIvBKKVrH2h7iPXGH+nRib+b+cgPH0xIBPLu
   dhFLrIJ4/6MJ1Wts7VWIE14Qeb32/0r/ZKYSl40qomW7O62qutAOCO70q
   ZAsOqy9O0Ip4uaNgER8wCcKSYRJbu8T+XwpZg4mTHAHPDIWEpJBVSKNyx
   +rcp+0GEQR4O0/HV/zt3CigsyXye232uoW2mXws7CgaahgDU6Z38kJout
   K1A1mek3cxHdHxRGCAfZdH4vsJ0SmlIh/me8iMIHiENx4Bvvkl4XIN0JQ
   tbhHgC76ai/Z2Qb4TRlRZdUNk8SUZodieEHh+tszksIYhgZr98SxfgYeH
   w==;
X-CSE-ConnectionGUID: EYMMqigJRA2vX5O2qhkXQQ==
X-CSE-MsgGUID: h6EBGUiZSYy7OpTd18+k2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98386302"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="98386302"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 14:02:01 -0700
X-CSE-ConnectionGUID: u6H3sVA9QQi87kE3dGjf+w==
X-CSE-MsgGUID: hfIzUsaPQuKZ7QaTh1369g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="248871777"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2026 14:02:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6an7-00000000Blp-39UE;
	Sat, 28 Mar 2026 21:01:57 +0000
Date: Sun, 29 Mar 2026 05:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] net: ethernet: ti: am65-cpsw-nuss: Enable batch
 processing for TX / TX CMPL
Message-ID: <202603290408.efqYwGwb-lkp@intel.com>
References: <20260325123850.638748-7-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325123850.638748-7-s-vadapalli@ti.com>

Hi Siddharth,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapalli/soc-ti-k3-ringacc-Add-helper-to-get-realtime-count-of-free-elements/20260326-120018
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260325123850.638748-7-s-vadapalli%40ti.com
patch subject: [RFC PATCH 6/6] net: ethernet: ti: am65-cpsw-nuss: Enable batch processing for TX / TX CMPL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260329/202603290408.efqYwGwb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290408.efqYwGwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290408.efqYwGwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/am65-cpsw-nuss.c:900:9: warning: cast to smaller integer type 'enum am65_cpsw_tx_buf_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
     900 |         return (enum am65_cpsw_tx_buf_type)k3_cppi_desc_pool_desc_info(tx_chn->desc_pool,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     901 |                                                                        desc_idx);
         |                                                                        ~~~~~~~~~
>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:1705:6: warning: variable 'res' set but not used [-Wunused-but-set-variable]
    1705 |         int res, num_tx;
         |             ^
   2 warnings generated.


vim +/res +1705 drivers/net/ethernet/ti/am65-cpsw-nuss.c

  1698	
  1699	static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
  1700						   int chn, unsigned int budget, bool *tdown)
  1701	{
  1702		bool single_port = AM65_CPSW_IS_CPSW2G(common);
  1703		struct am65_cpsw_tx_chn *tx_chn;
  1704		u32 batch_size = 0;
> 1705		int res, num_tx;
  1706	
  1707		tx_chn = &common->tx_chns[chn];
  1708	
  1709		if (!single_port)
  1710			spin_lock(&tx_chn->lock);
  1711	
  1712		res = k3_udma_glue_pop_tx_chn_batch(tx_chn->tx_chn, tx_chn->cmpl_desc_dma_array,
  1713						    &batch_size, AM65_CPSW_TX_BATCH_SIZE);
  1714		if (!batch_size) {
  1715			if (!single_port)
  1716				spin_unlock(&tx_chn->lock);
  1717			return 0;
  1718		}
  1719	
  1720		num_tx = am65_cpsw_nuss_tx_cmpl_free_batch(common, chn, batch_size, budget, tdown);
  1721	
  1722		if (!single_port)
  1723			spin_unlock(&tx_chn->lock);
  1724	
  1725		return num_tx;
  1726	}
  1727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
