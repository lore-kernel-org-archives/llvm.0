Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A9192B8C;
	Fri,  3 Jan 2025 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735929656; cv=none; b=GZexlBPf+/nH6nS5TcPkw3segNpzs7P6FF1SIoZwvt/JBhpUlcDHUZkuC2zAOQylaUIPthWmAgnUuCggpZwhaqZvdjaGX3E4pQ3HnRW8yqMn+hxMrRZXXmv0Q/nxvX4ygmn1t2yIDoKv1gd0DfuMinFqVLkUGkKCNvLskjWvuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735929656; c=relaxed/simple;
	bh=BVc0JKY4cE6r1nItGxo0Kl650aLdtGYcmHCOP+Ji7T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJRolEU6SXmorJG87Ag/MuR9L4vqh4iZ9HU7x0lsnJbKqUpmfb/NhK3kmc9Fcodmd0sP+z5Jp7qJalhUE2dgSO3eXWivZ5KG6Cghl2+0K08vueOlvOtZtCVnemaSPv8UiWK/qvxt/4y077uSJnW7BqovwzQ9PB7veJ35BEYr9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSfh5VcZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSfh5VcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735929655; x=1767465655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BVc0JKY4cE6r1nItGxo0Kl650aLdtGYcmHCOP+Ji7T0=;
  b=hSfh5VcZwLZm4mxqFKwe1zqU9C8dLUEgwyF37kDf58+iCkjgQJYB2cOR
   FO3Qzm5RPa7dCv1lMjcXjtUUk4nC0vEFuLUVTTx/Drg6gYuXVQTz3/7vl
   nZk2q/HPd2xy2AfBMF2jskSlfKMI4OJpM7kJA0A28zSlEmCew5EtC/onz
   TkxG48TPUH4JsnTD4Mxkhrsz9vKeRRJxN5mYi1fqbBXnKKlmDmhW2pHmR
   d/hN4sQRcbTK4P6ZqNCggwCa2BxNHPBHyPRozSSkO1kjyF8a6ko0WlHkt
   Wy2QKQfZos62WsBFgwRkDwd2hxzbMJtWYXhUAy7FmX3NFPMbqjv4WmYXT
   w==;
X-CSE-ConnectionGUID: JhKdcHyESBCeSqRtTCiqJQ==
X-CSE-MsgGUID: oI6AflQfQk2zg+noQzIFkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46760652"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46760652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 10:40:54 -0800
X-CSE-ConnectionGUID: 5RbJf0dHTjq5bGKgWZZuUg==
X-CSE-MsgGUID: B/WlrhKYS42qhWtpnIMTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132773533"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2025 10:40:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTmbL-000AB9-0P;
	Fri, 03 Jan 2025 18:40:51 +0000
Date: Sat, 4 Jan 2025 02:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 5/5] EDAC: Versal NET: Add support for error
 notification
Message-ID: <202501040222.yL3MsF86-lkp@intel.com>
References: <20250102174434.17677-6-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102174434.17677-6-shubhrajyoti.datta@amd.com>

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/cdx-export-the-symbols/20250103-014735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20250102174434.17677-6-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v4 5/5] EDAC: Versal NET: Add support for error notification
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250104/202501040222.yL3MsF86-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040222.yL3MsF86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040222.yL3MsF86-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/versalnet_rpmsg_edac.c:628: warning: Function parameter or struct member 'priv' not described in 'handle_error'
>> drivers/edac/versalnet_rpmsg_edac.c:628: warning: Excess function parameter 'mci' description in 'handle_error'


vim +628 drivers/edac/versalnet_rpmsg_edac.c

   618	
   619	/**
   620	 * handle_error - Handle Correctable and Uncorrectable errors.
   621	 * @mci:	EDAC memory controller instance.
   622	 * @stat:	ECC status structure.
   623	 * @controller:	Controller number of the DDRMC5
   624	 *
   625	 * Handles ECC correctable and uncorrectable errors.
   626	 */
   627	static void handle_error(struct edac_priv  *priv, struct ecc_status *stat, int controller)
 > 628	{
   629		struct mem_ctl_info *mci = priv->mci;
   630		union ecc_error_info pinf;
   631		unsigned long pa;
   632		phys_addr_t pfn;
   633		int err;
   634	
   635		if (stat->error_type == DDRMC5_ERR_TYPE_CE) {
   636			priv->ce_cnt++;
   637			pinf = stat->ceinfo[stat->channel];
   638			snprintf(priv->message, DDRMC5_EDAC_MSG_SIZE,
   639				 "Error type:%s Addr at %lx\n",
   640				 "CE", convert_to_physical(priv, pinf, controller));
   641	
   642			edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
   643					     1, 0, 0, 0, 0, 0, -1,
   644					     priv->message, "");
   645		}
   646	
   647		if (stat->error_type == DDRMC5_ERR_TYPE_UE) {
   648			priv->ue_cnt++;
   649			pinf = stat->ueinfo[stat->channel];
   650			snprintf(priv->message, DDRMC5_EDAC_MSG_SIZE,
   651				 "Error type:%s Addr at %lx\n",
   652				 "UE", convert_to_physical(priv, pinf, controller));
   653	
   654			edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
   655					     1, 0, 0, 0, 0, 0, -1,
   656					     priv->message, "");
   657			pa = convert_to_physical(priv, pinf, controller);
   658			pfn = PHYS_PFN(pa);
   659	
   660			if (IS_ENABLED(CONFIG_MEMORY_FAILURE)) {
   661				err = memory_failure(pfn, MF_ACTION_REQUIRED);
   662				if (err)
   663					edac_dbg(2, "In fail of memory_failure %d\n", err);
   664				else
   665					edac_dbg(2, "Page at PA 0x%lx is hardware poisoned\n", pa);
   666			}
   667		}
   668	
   669		memset(stat, 0, sizeof(*stat));
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
