Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC8763EA;
	Sun,  3 Mar 2024 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709486160; cv=none; b=DfPYNSat48rI9ao6SsBT4qPxS+6J/Oc+3maMSCKTA+jTeDm+t5IelLGmaPivtVz4EpD02gG+Wy1GRAkdz0w8vGvKcdAY8UwA5l7pKFo70yGK/Mr/5Y9W+qPBzHqq8E7xYj+E0zLly1sVQ5BoCLMFjirvusSeVWO+Ef6/Xo5h7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709486160; c=relaxed/simple;
	bh=wcrkksnJhphjSleCscQTz5I1VrWH4OS8oPm2c3B9oec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNIX+kWiOMbNE9xk/1yRKWjIFyAl7WbvhpbySSkqpJDTS0LYKEyv+eo1ZL9bH3KTvb+Ma4jnF+0AkcHf2Z0j7qAhjhT5qBkIO0ZXVbBLtYasqMk1CMhBqFK8mQY9zOxOxSxbgzDD6PdiuCHsLuoiAZEdkbZYejff+ytwa7+WH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWBsJA+1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWBsJA+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709486159; x=1741022159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcrkksnJhphjSleCscQTz5I1VrWH4OS8oPm2c3B9oec=;
  b=BWBsJA+1ydvphIQh57JqNoGH+zqV+1Y22UJA6T6yBQHRrlobwKmk4Z29
   MxtsIu7bykMA9A2H79wRASFY43j2WBqIKsUy+oMEM4XduTEDMtPmfof4I
   klR9AJxaw+PKe3b+IZzE5yxbPDEHI4K3q/LxW75CVCemOh4eaw3bIYm2U
   hjoz6YccKwiGmArrDGq4ASBvDStkgkh3ndFETB2F7X0flPmIO7tBtn8DI
   AUKneibwRBlqtey3GaSq57XJM8jcHkGuIZouV5aX7Zl6bDGq2UWpWeO6Q
   xRa05dIjDPBQ9d8Lk9Fb86NF+kdi131FGrvmrhPjz0y+YYuyREZT1q2U8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15409221"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="15409221"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 09:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8948483"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Mar 2024 09:15:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgpRJ-0001yQ-33;
	Sun, 03 Mar 2024 17:15:53 +0000
Date: Mon, 4 Mar 2024 01:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 503/860]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:411:10: error: call to undeclared
 function 'FIELD_GET'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202403040101.CT1IfmrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 70ce4da368ab0a329a7efb7c108b3cf889727403 [503/860] drm: xlnx: Add HDCP2X TX support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040101.CT1IfmrQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040101.CT1IfmrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040101.CT1IfmrQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:117:22: warning: variable 'srm_version' set but not used [-Wunused-but-set-variable]
     117 |         u16 num_of_devices, srm_version;
         |                             ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:411:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     411 |         return (FIELD_GET(XHDCP2X_TX_RXCAPS_MASK, rxcaps[0]) & HDCP_2_2_RX_CAPS_VERSION_VAL);
         |                 ^
   1 warning and 1 error generated.
--
>> drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c:33:13: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |         reg_read = FIELD_GET(XHDCP2X_RNG_MASK_16, reg_read);
         |                    ^
   1 error generated.
--
>> drivers/staging/xilinx_hdcp/xlnx_hdcp2x_cipher.c:54:13: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      54 |         reg_read = FIELD_GET(XHDCP2X_CIPHER_MASK_16, reg_read);
         |                    ^
   1 error generated.


vim +/FIELD_GET +411 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c

   401	
   402	bool xlnx_hdcp2x_downstream_capbility(struct xlnx_hdcp2x_config *xhdcp2x_tx)
   403	{
   404		u8 rxcaps[HDCP_2_2_RXCAPS_LEN] = {0};
   405	
   406		xhdcp2x_tx->handlers.rd_handler(xhdcp2x_tx->interface_ref,
   407						HDCP2X_TX_HDCPPORT_RX_CAPS_OFFSET,
   408						(void *)rxcaps,
   409						HDCP_2_2_RXCAPS_LEN);
   410	
 > 411		return (FIELD_GET(XHDCP2X_TX_RXCAPS_MASK, rxcaps[0]) & HDCP_2_2_RX_CAPS_VERSION_VAL);
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
