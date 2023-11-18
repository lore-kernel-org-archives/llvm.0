Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3610A07;
	Sat, 18 Nov 2023 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZS4UUQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700320357; x=1731856357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5B2Xxvs6DDT8AhafnhBmojnHSguxFUePA5GQi/wh8Ng=;
  b=gZS4UUQyOVkn5keAaC5zkBKn6kGWz6XTaZDeFhi4pNAN3d7XBVapPu6Y
   SqLZ1G7O43duvRp6/xnzQkJvVFXFNqBWb5YiAKYDi3lN1hrQjO5Zznmnw
   5x11FDRf5YMwwcOiriSeRFhlpvXSup9g7//uEjLPo2LC/9mt4M1sJ87ZC
   393oPZWpE4YyUJT63rGtaVsVMYAlnufj21XLzaYxWhF0amwcm1kPBqoiG
   9sWvngvUNozIev5kXhhpxeRZfUNfQMDNQaYTMZpemnmjZpKfrJPPwjCKi
   BBo5K9k5qxbl+qcqu8+6ByPeYT6FHML2Z8I0F+/BGgHiWikMKGNFAx4BG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="394281690"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="394281690"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 07:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="14179906"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2023 07:12:35 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Mze-00040B-2d;
	Sat, 18 Nov 2023 15:12:29 +0000
Date: Sat, 18 Nov 2023 23:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/21 8/10]
 drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:3: error: call to
 undeclared function 'xdp_do_flush_map'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202311182318.8vcqyUX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/21
head:   17e2d4276ad07f26ea53c62f51094d0b388aabfb
commit: 182d94b17320b2a4dd20c84605816a1645a85290 [8/10] idpf: add support for XDP_REDIRECT
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311182318.8vcqyUX2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311182318.8vcqyUX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182318.8vcqyUX2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:27:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:3: error: call to undeclared function 'xdp_do_flush_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xdp_do_flush_map();
                   ^
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:3: note: did you mean 'xdp_do_flush'?
   include/linux/filter.h:1026:6: note: 'xdp_do_flush' declared here
   void xdp_do_flush(void);
        ^
   1 error generated.
--
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:27:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:3: error: call to undeclared function 'xdp_do_flush_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xdp_do_flush_map();
                   ^
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:3: note: did you mean 'xdp_do_flush'?
   include/linux/filter.h:1026:6: note: 'xdp_do_flush' declared here
   void xdp_do_flush(void);
        ^
   drivers/net/ethernet/intel/idpf/idpf_main.c:162:39: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
                                                ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.


vim +/xdp_do_flush_map +1103 drivers/net/ethernet/intel/idpf/idpf_txrx.h

  1090	
  1091	/**
  1092	 * idpf_finalize_xdp_rx - Bump XDP Tx tail and/or flush redirect map
  1093	 * @xdpq: XDP Tx queue
  1094	 * @xdp_act: Logical OR of flags of XDP actions that require finalization
  1095	 *
  1096	 * This function bumps XDP Tx tail and/or flush redirect map, and
  1097	 * should be called when a batch of packets has been processed in the
  1098	 * napi loop.
  1099	 */
  1100	static inline void idpf_finalize_xdp_rx(struct idpf_queue *xdpq, u32 xdp_act)
  1101	{
  1102		if (xdp_act & IDPF_XDP_ACT_FINALIZE_REDIR)
> 1103			xdp_do_flush_map();
  1104		if (xdp_act & IDPF_XDP_ACT_FINALIZE_TX) {
  1105			idpf_set_rs_bit(xdpq);
  1106			idpf_xdpq_update_tail(xdpq);
  1107		}
  1108	}
  1109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
