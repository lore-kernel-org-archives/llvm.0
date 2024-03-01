Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522C524B7;
	Fri,  1 Mar 2024 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709272263; cv=none; b=E9Iyp/VSbO08+epEtIo5H4tGJ9jnlsT2akhXjietECjOhSlUIEzZI5m90lyW3EVdXiv67Mi24+UwTRecMLko7PWOtoGXVfepSX7xz+mo7xDE7zOsoaT9FY3sSyvD7gsAiyLGNnlFFZzyZ4ShrW2lzyQvygIQ276oYNP8XNFzJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709272263; c=relaxed/simple;
	bh=VB58vkq9zvpJkKBEkB+cYQb4AmHKD9ZCvhSeJfqXTKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qACTSdL+Gf7arEwoOxuMNHUPm47Vh03eM3LlcFMqeVl80tMhunj5wYBULFd2TLQA5a2BhMGjcF92GLjcmoOz74/LztD0McjjDG7SR5uiHJiFtiCm9985ofJJpDgchiI3D+4au5gavyKHVNknFhQ6jPMuGWHQGp21+2y3sX+zOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTZuK8NP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTZuK8NP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709272261; x=1740808261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VB58vkq9zvpJkKBEkB+cYQb4AmHKD9ZCvhSeJfqXTKI=;
  b=UTZuK8NPG97knw/279SsP8FjKCGywTRgrejRPYEYvoewREBuR2nmd8kH
   Hy5JCHjFvz0W34bk7319vpWmZopRkhooD8ECmslV1/d3Bam05kzouYdtM
   h/pn4IFvlf2fytaT2kLM8quhAHs9TynPgGSYUUc38dNHcuuEzc7BuR9DG
   9jTxwTcfkdxFTwBG0sMxjtOaVWIDHT8iSUFSCnHFYMPdClsOlNcdEzFkA
   JT30jtbeYMZKul2h05I6CDADloNBDwY9kEXAmrQgPbikfELkTDKio7zzy
   aZ11AijX7o3BRoirm9Ved/LhAT2tsDSrJ96JLnJjUKI3lHhd+tqLvWQQx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3647632"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3647632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 21:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8328488"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Feb 2024 21:50:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfvnN-000DZl-0I;
	Fri, 01 Mar 2024 05:50:57 +0000
Date: Fri, 1 Mar 2024 13:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:for_each_port-2024-02-29 19/30]
 drivers/gpu/drm/omapdrm/dss/dpi.c:712:7: error: implicit declaration of
 function 'of_graph_get_next_port_endpoint' is invalid in C99
Message-ID: <202403011335.MZjfmAiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux for_each_port-2024-02-29
head:   b441fa290a8cd6c124fc8685ad471e4303c3234c
commit: db4932c907a83220e0d03ca92b5d587655b5b726 [19/30] gpu: drm: omapdrm: use new of_graph endpoint functions
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240301/202403011335.MZjfmAiU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011335.MZjfmAiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011335.MZjfmAiU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/dpi.c:712:7: error: implicit declaration of function 'of_graph_get_next_port_endpoint' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ep = of_graph_get_next_port_endpoint(port, NULL);
                ^
   drivers/gpu/drm/omapdrm/dss/dpi.c:712:7: note: did you mean 'fwnode_graph_get_next_endpoint'?
   include/linux/property.h:454:23: note: 'fwnode_graph_get_next_endpoint' declared here
   struct fwnode_handle *fwnode_graph_get_next_endpoint(
                         ^
   drivers/gpu/drm/omapdrm/dss/dpi.c:712:5: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
           ep = of_graph_get_next_port_endpoint(port, NULL);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/of_graph_get_next_port_endpoint +712 drivers/gpu/drm/omapdrm/dss/dpi.c

   699	
   700	int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
   701			  struct device_node *port, enum dss_model dss_model)
   702	{
   703		struct dpi_data *dpi;
   704		struct device_node *ep;
   705		u32 datalines;
   706		int r;
   707	
   708		dpi = devm_kzalloc(&pdev->dev, sizeof(*dpi), GFP_KERNEL);
   709		if (!dpi)
   710			return -ENOMEM;
   711	
 > 712		ep = of_graph_get_next_port_endpoint(port, NULL);
   713		if (!ep)
   714			return 0;
   715	
   716		r = of_property_read_u32(ep, "data-lines", &datalines);
   717		of_node_put(ep);
   718		if (r) {
   719			DSSERR("failed to parse datalines\n");
   720			return r;
   721		}
   722	
   723		dpi->data_lines = datalines;
   724	
   725		dpi->pdev = pdev;
   726		dpi->dss_model = dss_model;
   727		dpi->dss = dss;
   728		port->data = dpi;
   729	
   730		r = dpi_init_regulator(dpi);
   731		if (r)
   732			return r;
   733	
   734		return dpi_init_output_port(dpi, port);
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
