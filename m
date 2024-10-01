Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4763C;
	Tue,  1 Oct 2024 01:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727745770; cv=none; b=oPsXIUdqS+vjaMC1sQhNNgDY4C19+HXjrnEyT7o5ryXDXXOJPjo7R/zPdXp1Rs5r2A8ncE1YZ58i9aMLeAcktfkVWdkWn/K8ai+RnJm+SVNd0espsVF6UA5OA7uw8Qz7+FzSKMq49kzy8S0fP08jCjM8r6WbZJycwlFII9Ob17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727745770; c=relaxed/simple;
	bh=AKIg4VoRpA4jYK8/KnU3MlGxI+4XGWbmqThiign0pgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktaUiyZeqtZx5AN+F6Wu48SpWQKRtVXXcQXo0AZo90tAHeK4qZmw2VcThmvv7TlksnRtJFHj9gNA21TI3ItMcBnvd3n/nSkyxXoaissAmrMtz2MS/3pNqZdWjpKmiw2N/wsij+TF4ga0HQ020hhLYKtxZu8IQ2oqK6Bs5/1+wgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRu+P6sx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRu+P6sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727745768; x=1759281768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKIg4VoRpA4jYK8/KnU3MlGxI+4XGWbmqThiign0pgM=;
  b=QRu+P6sxmOFS9dHU0I0AA/HIZ2RUFVYur3720IVD5o5O/D1COSyD0l+l
   pOcbqJ1oG4N8IM0/2yquVdY57yt+7q9QlVpFxhRDGGMfuqqVM0ZjFKmXB
   klMakVsxGOQzBWmrP3OpqByPnRaLhUMFUpMban02Lrt5NhffO0sbnsrE/
   7Q/LSW+5h5KwcURwjPJOVLHKzy8YjcQvOvJY4wR2nrdnvzFRl5pVcdv6s
   He39jHMXzZwm12wi4ipIYUB2srxALZL8br4cCWoWFdkIvbwuCVqqSKYOW
   zCSSWb8EZZ9UU6jDIo/mYszxvgayrnCim34n+dSYO0TLzbbkxOmn5qv4+
   w==;
X-CSE-ConnectionGUID: PA/swhdUSg++z4n2Bv7Nzw==
X-CSE-MsgGUID: xZBNBycCS5mPYn84SIv92g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26984747"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26984747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 18:22:48 -0700
X-CSE-ConnectionGUID: jjQTeaayTcSexKUPHK95YA==
X-CSE-MsgGUID: gtnQmT6RSluQ3px9xdBz2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="96829214"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 18:22:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svRbA-000Q77-0M;
	Tue, 01 Oct 2024 01:22:44 +0000
Date: Tue, 1 Oct 2024 09:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Fomichev <a.fomichev@yadro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-ntb@googlegroups.com, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>
Subject: [jonmason-ntb:ntb-perf-latency 2/5]
 drivers/ntb/test/ntb_perf.c:1185:14: error: call to undeclared function
 'get_random_int'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202410010927.2eG6VtDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonmason/ntb ntb-perf-latency
head:   259175ed1ca5c7b82c8948657de24b15b99162d0
commit: 1361021161161af720f27081dc7cbda6e3c6f6d0 [2/5] ntb_perf: extend with poll latency measurement
config: arm-randconfig-003-20241001 (https://download.01.org/0day-ci/archive/20241001/202410010927.2eG6VtDI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010927.2eG6VtDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010927.2eG6VtDI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ntb/test/ntb_perf.c:1185:14: error: call to undeclared function 'get_random_int'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1185 |                         *bp = (u8)get_random_int();
         |                                   ^
   1 error generated.


vim +/get_random_int +1185 drivers/ntb/test/ntb_perf.c

  1166	
  1167	static int perf_init_pl(struct perf_poll_lat_data *pldata)
  1168	{
  1169		struct perf_ctx *perf = pldata->perf;
  1170		struct perf_peer *peer = perf->test_peer;
  1171		u8 *bp;
  1172	
  1173		pldata->src = kmalloc_node(peer->outbuf_size, GFP_KERNEL,
  1174					 dev_to_node(&perf->ntb->dev));
  1175		if (!pldata->src)
  1176			return -ENOMEM;
  1177	
  1178		/*
  1179		 * Prepare random data to send, guaranteed exclusion of 0x00 (unreceived)
  1180		 * and 0xFF (stop_word)
  1181		 */
  1182		get_random_bytes(pldata->src, peer->outbuf_size);
  1183		for (bp = pldata->src; bp < (u8 *) pldata->src + peer->outbuf_size; bp++)
  1184			while (*bp == 0 || *bp == stop_word)
> 1185				*bp = (u8)get_random_int();
  1186	
  1187		memset(peer->inbuf, 0, peer->inbuf_size);
  1188	
  1189		return 0;
  1190	}
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
