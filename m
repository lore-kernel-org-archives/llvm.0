Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403181CAAD;
	Fri, 24 Nov 2023 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWNZeD7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836810; x=1732372810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aSE9l0adT9kOBo8b+VTaqFQIDUT1wsnMQIkcDX4KS/Q=;
  b=GWNZeD7H3zaVspRKjXbIRnZZ3yyhsThMCn898CHup+GFG+Bn+DOeNeHD
   dfDCHSndbaMrFEhyLUPDUIIe7WV08SmwFnpyGEwpaQYpf5uDAvNwxCWcG
   DkVzooemLXma19D3dyea4mXEs/lSlMiPok/Jic4fuxxmAXGHJjAX/v+Jb
   6juovsHsz6NtqNJObdjux9UjsLZSkxXjitMSyY284jFudQ4Vo6PpAGbmL
   TvF4Myd5iqpnGPwCNqsGdKFUDsgmu4pRDNli575BFd09iUuGjJiG8e4Qe
   nsgSJ9b4F4WEiGJ0icGxTUlfT9ybxYBG1+N6NQx+/hna0bFz7HqJ2UTOF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11110362"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="11110362"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911464613"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911464613"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 06:40:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLi-0002tm-24;
	Fri, 24 Nov 2023 14:40:06 +0000
Date: Fri, 24 Nov 2023 22:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.kishore.manne@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] drivers: fpga: Add user-key encrypted FPGA Image
 loading support
Message-ID: <202311241635.UbGsWTG6-lkp@intel.com>
References: <20231122054404.3764288-3-nava.kishore.manne@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122054404.3764288-3-nava.kishore.manne@amd.com>

Hi Nava,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/drivers-fpga-Add-user-key-encrypted-FPGA-Image-loading-support/20231122-151844
base:   linus/master
patch link:    https://lore.kernel.org/r/20231122054404.3764288-3-nava.kishore.manne%40amd.com
patch subject: [RFC PATCH 2/3] drivers: fpga: Add user-key encrypted FPGA Image loading support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231124/202311241635.UbGsWTG6-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241635.UbGsWTG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241635.UbGsWTG6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/fpga-mgr.c:588: warning: Function parameter or member 'fw' not described in 'fpga_mgr_get_aes_key'


vim +588 drivers/fpga/fpga-mgr.c

   570	
   571	/**
   572	 * fpga_mgr_get_aes_key - request aes key form the firmware class
   573	 * @mgr:        fpga manager
   574	 * @info:       fpga image specific information
   575	 * @image_name: name of image file on the aes key firmware search path
   576	 *
   577	 *
   578	 * Request an aes key image using the firmware class, then Step the low level
   579	 * fpga manager through the device-specific steps. Update the state before each
   580	 * step to provide info on what step failed if there is a failure.
   581	 *
   582	 * Return: 0 on success, negative error code otherwise.
   583	 */
   584	static int fpga_mgr_get_aes_key(struct fpga_manager *mgr,
   585					struct fpga_image_info *info,
   586					const char *image_name,
   587					const struct firmware *fw)
 > 588	{
   589		struct device *dev = &mgr->dev;
   590		int ret;
   591	
   592		dev_info(dev, "Get Aes-key: %s to %s\n", image_name, mgr->name);
   593	
   594		mgr->state = FPGA_MGR_STATE_FIRMWARE_REQ;
   595	
   596		ret = request_firmware(&fw, image_name, dev);
   597		if (ret) {
   598			mgr->state = FPGA_MGR_STATE_FIRMWARE_REQ_ERR;
   599			dev_err(dev, "Error requesting firmware %s\n", image_name);
   600			return ret;
   601		}
   602	
   603		ret = fpga_mgr_parse_aes_key(mgr, info, fw->data, fw->size);
   604	
   605		return ret;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
