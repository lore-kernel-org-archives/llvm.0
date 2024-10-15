Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8141FDF9F;
	Tue, 15 Oct 2024 21:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028334; cv=none; b=hFz0gCJcM336UPA/dG2pEW8kdmTlk/sRzG1zP2TY693dV3gVGXhDOwfiKKNQbYOv5gklHNHCy0iEcoO6P93hPPq9MzCTjSzC9ZwhTVHJhk3zEIe9yFOb7K5nh3MpeDORXec4iXNP9f0yq+hVYzhhYS3MS/m7GYIWS9MyXrF6qBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028334; c=relaxed/simple;
	bh=upSAwv8V2SWbQWWWH/qg0f9Hf2B/D0MvKJy10z5anNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EumQzdEMQwj8y9bjO8tfxm6Gdg80XoaralQehhStFh3bFlzxoHnTPGeyZyHWnTwuNqk/tVHPe/xm3ZDP78HCUqlfAcMR8/vYFTTgO2Fhdx3vqhBabRQbVGSGKBn8P8nGe6hahr4Ori/5ehPvAbgORXR+Eq0uwcqHBiY7GGGlzXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6U4yDlI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6U4yDlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729028333; x=1760564333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=upSAwv8V2SWbQWWWH/qg0f9Hf2B/D0MvKJy10z5anNg=;
  b=L6U4yDlINFSXX3lVxmULgRWgj7uZuxrUHM5K3KPsM6Wijrl6gusKrJyX
   lYciMi29LByW0MIi1wqOmPrtgW7VSaRpQMoU8v1k+kUq2VwW3+Mma7Vo+
   LwEv1v7M9MIVKtQW7WieOcMQWziurMaH24e9/kJdBKLgg1X+3whPm5TEP
   Pb7fLxqANxe/tE80/vEIWhitJmjYPUBzZLy6gtWln/q4lIuiojHDYiCgM
   KEuuFUwL/NFZT31QJe1ksByu5Ad/cmUR0vNbq08opFLJX14a0vBGEp5Ky
   LdR5DOx8djCGSle7EzIM/VDCcwtJWvksfUsTjtvEonN3Za4gKp8YWKm8c
   g==;
X-CSE-ConnectionGUID: svInU1QkTuCLqLcinPLRHg==
X-CSE-MsgGUID: ngHyJHSPT8+E5LAjZ1veGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45926959"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45926959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 14:38:52 -0700
X-CSE-ConnectionGUID: x66HpaXrTxKNAfuEcGEyDg==
X-CSE-MsgGUID: I6JyoPSNRPGnUbEPxFAdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77647449"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2024 14:38:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0pFh-000Jxj-1e;
	Tue, 15 Oct 2024 21:38:49 +0000
Date: Wed, 16 Oct 2024 05:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v11 11/14] iavf: refactor
 iavf_clean_rx_irq to support legacy and flex descriptors
Message-ID: <202410160511.XfTdTwCG-lkp@intel.com>
References: <20241013154415.20262-12-mateusz.polchlopek@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013154415.20262-12-mateusz.polchlopek@intel.com>

Hi Mateusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a77c49f53be0af1efad5b4541a9a145505c81800]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Polchlopek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20241014-174710
base:   a77c49f53be0af1efad5b4541a9a145505c81800
patch link:    https://lore.kernel.org/r/20241013154415.20262-12-mateusz.polchlopek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v11 11/14] iavf: refactor iavf_clean_rx_irq to support legacy and flex descriptors
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241016/202410160511.XfTdTwCG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160511.XfTdTwCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160511.XfTdTwCG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/iavf/iavf_txrx.c:963:10: warning: variable 'csum_bits' is uninitialized when used here [-Wuninitialized]
     963 |                 return csum_bits;
         |                        ^~~~~~~~~
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:960:2: note: variable 'csum_bits' is declared here
     960 |         struct libeth_rx_csum csum_bits;
         |         ^
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:993:10: warning: variable 'csum_bits' is uninitialized when used here [-Wuninitialized]
     993 |                 return csum_bits;
         |                        ^~~~~~~~~
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:990:2: note: variable 'csum_bits' is declared here
     990 |         struct libeth_rx_csum csum_bits;
         |         ^
   2 warnings generated.


vim +/csum_bits +963 drivers/net/ethernet/intel/iavf/iavf_txrx.c

   944	
   945	/**
   946	 * iavf_legacy_rx_csum - Indicate in skb if hw indicated a good checksum
   947	 * @vsi: the VSI we care about
   948	 * @qw1: quad word 1
   949	 * @decoded_pt: decoded packet type
   950	 *
   951	 * This function only operates on the VIRTCHNL_RXDID_1_32B_BASE legacy 32byte
   952	 * descriptor writeback format.
   953	 *
   954	 * Return: decoded checksum bits.
   955	 **/
   956	static struct libeth_rx_csum
   957	iavf_legacy_rx_csum(const struct iavf_vsi *vsi, u64 qw1,
   958			    const struct libeth_rx_pt decoded_pt)
   959	{
   960		struct libeth_rx_csum csum_bits;
   961	
   962		if (!libeth_rx_pt_has_checksum(vsi->netdev, decoded_pt))
 > 963			return csum_bits;
   964	
   965		csum_bits.ipe = FIELD_GET(IAVF_RXD_LEGACY_IPE_M, qw1);
   966		csum_bits.eipe = FIELD_GET(IAVF_RXD_LEGACY_EIPE_M, qw1);
   967		csum_bits.l4e = FIELD_GET(IAVF_RXD_LEGACY_L4E_M, qw1);
   968		csum_bits.pprs = FIELD_GET(IAVF_RXD_LEGACY_PPRS_M, qw1);
   969		csum_bits.l3l4p = FIELD_GET(IAVF_RXD_LEGACY_L3L4P_M, qw1);
   970		csum_bits.ipv6exadd = FIELD_GET(IAVF_RXD_LEGACY_IPV6EXADD_M, qw1);
   971	
   972		return csum_bits;
   973	}
   974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
