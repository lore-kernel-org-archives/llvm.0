Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78E33469D;
	Thu, 16 Oct 2025 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760636082; cv=none; b=NAXhSGbWQIMH6MInKZydBUGv6kWSdvR80QoKM1HskfkJ74x+/F8BYSJukCX2WkXBtwZCwMEzsvHRJKJT5oAAVDmfGPvq40rqsVJRJOI56Z1LqqwLnmsvM8GgFSwMVM0bXuQ1wcCgAarbsuZOnRzfK7M+CjwCrMGaktFkqsFm9ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760636082; c=relaxed/simple;
	bh=puWwUgbIkmSUIGQvlruSbfGxUgaFSKFb5ce0Qf3M8mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su0VmPkUhBPqSu5V3YoegXOcVv0bMcy5eu2lvl2tSbB8UoiHmHv0F30jWUYbIWzcYdzeMjq2gj8KJUkAuRPOOB87T2j6JYYfEZp+ahl8nHzWjDJTOdCt7IN4LqDavmBgqdzUnwb+rN2g6AI0YdQMGt/SOYQmMs6C4YegnHFFG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXs8FEXa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXs8FEXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760636081; x=1792172081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=puWwUgbIkmSUIGQvlruSbfGxUgaFSKFb5ce0Qf3M8mg=;
  b=CXs8FEXaTgT/RZzdh/B26bPSqC1E7Ae4wkFDHTQnhVjuIGEFWKf9KDK1
   X995/INUsvIoxSuoWStvITbqHRGGG4Q3VOReP0FxB/FuftfoVdmWQr8QD
   CEZxs5U0fwxrj9flFvbqSAf5WmRd0pWRHg3K8cy/oYNCNmcDnt2uczTvp
   V8jf8id68pqE/oz8qlC5OG8hlnaict71czYt7fyd1h61obx38+Ego/1lX
   XjrZf3R+MjqirrmhrFjBuogbcmiOJpxTIOUHzuPtq/wFa8QvJPA71USGF
   uki7TLMNj80aQVrgk2skhgbAk0gMuJnad0CNZGzhRDCDJOZMPitHH+19V
   w==;
X-CSE-ConnectionGUID: Lv88p4MYQwatMeiD/vNnkQ==
X-CSE-MsgGUID: QGOCHw83TY6tzdSNbdtkqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74280786"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="74280786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 10:34:41 -0700
X-CSE-ConnectionGUID: s3+tVlIHTlehEX4Abro32Q==
X-CSE-MsgGUID: w9YePRj6S0KtyF4lgOb/Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186783542"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2025 10:34:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Rs4-00056B-1I;
	Thu, 16 Oct 2025 17:34:36 +0000
Date: Fri, 17 Oct 2025 01:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 04/10] net: Convert proto_ops connect() callbacks to
 use sockaddr_unspec
Message-ID: <202510170116.jFQJJsY7-lkp@intel.com>
References: <20251014224334.2344521-4-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014224334.2344521-4-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20251016]
[cannot apply to bluetooth/master bpf/master bpf-next/net bpf-next/master linus/master v6.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/net-Add-struct-sockaddr_unspec-for-sockaddr-of-unknown-length/20251015-064816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014224334.2344521-4-kees%40kernel.org
patch subject: [PATCH v2 04/10] net: Convert proto_ops connect() callbacks to use sockaddr_unspec
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251017/202510170116.jFQJJsY7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170116.jFQJJsY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170116.jFQJJsY7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/qmi/qmi_sample_client.c:471:41: error: incompatible pointer types passing 'struct sockaddr *' to parameter of type 'struct sockaddr_unspec *' [-Werror,-Wincompatible-pointer-types]
     471 |         ret = kernel_connect(sample->qmi.sock, (struct sockaddr *)sq,
         |                                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/net.h:351:65: note: passing argument to parameter 'addr' here
     351 | int kernel_connect(struct socket *sock, struct sockaddr_unspec *addr, int addrlen,
         |                                                                 ^
   1 error generated.


vim +471 samples/qmi/qmi_sample_client.c

842891be96bd2b9 Bjorn Andersson 2017-06-26  452  
842891be96bd2b9 Bjorn Andersson 2017-06-26  453  static int qmi_sample_probe(struct platform_device *pdev)
842891be96bd2b9 Bjorn Andersson 2017-06-26  454  {
842891be96bd2b9 Bjorn Andersson 2017-06-26  455  	struct sockaddr_qrtr *sq;
842891be96bd2b9 Bjorn Andersson 2017-06-26  456  	struct qmi_sample *sample;
842891be96bd2b9 Bjorn Andersson 2017-06-26  457  	char path[20];
842891be96bd2b9 Bjorn Andersson 2017-06-26  458  	int ret;
842891be96bd2b9 Bjorn Andersson 2017-06-26  459  
842891be96bd2b9 Bjorn Andersson 2017-06-26  460  	sample = devm_kzalloc(&pdev->dev, sizeof(*sample), GFP_KERNEL);
842891be96bd2b9 Bjorn Andersson 2017-06-26  461  	if (!sample)
842891be96bd2b9 Bjorn Andersson 2017-06-26  462  		return -ENOMEM;
842891be96bd2b9 Bjorn Andersson 2017-06-26  463  
842891be96bd2b9 Bjorn Andersson 2017-06-26  464  	ret = qmi_handle_init(&sample->qmi, TEST_DATA_REQ_MAX_MSG_LEN_V01,
842891be96bd2b9 Bjorn Andersson 2017-06-26  465  			      NULL,
842891be96bd2b9 Bjorn Andersson 2017-06-26  466  			      qmi_sample_handlers);
842891be96bd2b9 Bjorn Andersson 2017-06-26  467  	if (ret < 0)
842891be96bd2b9 Bjorn Andersson 2017-06-26  468  		return ret;
842891be96bd2b9 Bjorn Andersson 2017-06-26  469  
842891be96bd2b9 Bjorn Andersson 2017-06-26  470  	sq = dev_get_platdata(&pdev->dev);
842891be96bd2b9 Bjorn Andersson 2017-06-26 @471  	ret = kernel_connect(sample->qmi.sock, (struct sockaddr *)sq,
842891be96bd2b9 Bjorn Andersson 2017-06-26  472  			     sizeof(*sq), 0);
842891be96bd2b9 Bjorn Andersson 2017-06-26  473  	if (ret < 0) {
842891be96bd2b9 Bjorn Andersson 2017-06-26  474  		pr_err("failed to connect to remote service port\n");
842891be96bd2b9 Bjorn Andersson 2017-06-26  475  		goto err_release_qmi_handle;
842891be96bd2b9 Bjorn Andersson 2017-06-26  476  	}
842891be96bd2b9 Bjorn Andersson 2017-06-26  477  
842891be96bd2b9 Bjorn Andersson 2017-06-26  478  	snprintf(path, sizeof(path), "%d:%d", sq->sq_node, sq->sq_port);
842891be96bd2b9 Bjorn Andersson 2017-06-26  479  
842891be96bd2b9 Bjorn Andersson 2017-06-26  480  	sample->de_dir = debugfs_create_dir(path, qmi_debug_dir);
842891be96bd2b9 Bjorn Andersson 2017-06-26  481  	if (IS_ERR(sample->de_dir)) {
842891be96bd2b9 Bjorn Andersson 2017-06-26  482  		ret = PTR_ERR(sample->de_dir);
842891be96bd2b9 Bjorn Andersson 2017-06-26  483  		goto err_release_qmi_handle;
842891be96bd2b9 Bjorn Andersson 2017-06-26  484  	}
842891be96bd2b9 Bjorn Andersson 2017-06-26  485  
842891be96bd2b9 Bjorn Andersson 2017-06-26  486  	sample->de_data = debugfs_create_file("data", 0600, sample->de_dir,
842891be96bd2b9 Bjorn Andersson 2017-06-26  487  					      sample, &data_fops);
842891be96bd2b9 Bjorn Andersson 2017-06-26  488  	if (IS_ERR(sample->de_data)) {
842891be96bd2b9 Bjorn Andersson 2017-06-26  489  		ret = PTR_ERR(sample->de_data);
842891be96bd2b9 Bjorn Andersson 2017-06-26  490  		goto err_remove_de_dir;
842891be96bd2b9 Bjorn Andersson 2017-06-26  491  	}
842891be96bd2b9 Bjorn Andersson 2017-06-26  492  
842891be96bd2b9 Bjorn Andersson 2017-06-26  493  	sample->de_ping = debugfs_create_file("ping", 0600, sample->de_dir,
842891be96bd2b9 Bjorn Andersson 2017-06-26  494  					      sample, &ping_fops);
842891be96bd2b9 Bjorn Andersson 2017-06-26  495  	if (IS_ERR(sample->de_ping)) {
842891be96bd2b9 Bjorn Andersson 2017-06-26  496  		ret = PTR_ERR(sample->de_ping);
842891be96bd2b9 Bjorn Andersson 2017-06-26  497  		goto err_remove_de_data;
842891be96bd2b9 Bjorn Andersson 2017-06-26  498  	}
842891be96bd2b9 Bjorn Andersson 2017-06-26  499  
842891be96bd2b9 Bjorn Andersson 2017-06-26  500  	platform_set_drvdata(pdev, sample);
842891be96bd2b9 Bjorn Andersson 2017-06-26  501  
842891be96bd2b9 Bjorn Andersson 2017-06-26  502  	return 0;
842891be96bd2b9 Bjorn Andersson 2017-06-26  503  
842891be96bd2b9 Bjorn Andersson 2017-06-26  504  err_remove_de_data:
842891be96bd2b9 Bjorn Andersson 2017-06-26  505  	debugfs_remove(sample->de_data);
842891be96bd2b9 Bjorn Andersson 2017-06-26  506  err_remove_de_dir:
842891be96bd2b9 Bjorn Andersson 2017-06-26  507  	debugfs_remove(sample->de_dir);
842891be96bd2b9 Bjorn Andersson 2017-06-26  508  err_release_qmi_handle:
842891be96bd2b9 Bjorn Andersson 2017-06-26  509  	qmi_handle_release(&sample->qmi);
842891be96bd2b9 Bjorn Andersson 2017-06-26  510  
842891be96bd2b9 Bjorn Andersson 2017-06-26  511  	return ret;
842891be96bd2b9 Bjorn Andersson 2017-06-26  512  }
842891be96bd2b9 Bjorn Andersson 2017-06-26  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
