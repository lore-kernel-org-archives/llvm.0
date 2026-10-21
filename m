Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623806;
	b=rYAcxPOpIAZeR1oGH220jdvKXWtlaQ3xL9cx5pHJ5wSDBfOGMpmOd4ffnnRBWkMc4BuW
	 T6SN/5gEFB5NuNiOByW8ZUFh8p6EMQWfzrwKPULVIl+2kodqsOEg+kVjmFs4kEkJctcFf
	 YkshQb8tL3+4gU/kkxAgkMEPF0rUJ3F5WMd+ezb7O+QSUpAQXhzd1FFn+4XZ3bazp/KDq
	 yjeNVmvtgN/sTqvdE2lXhZRKLoryCbeKgJGmZvtF4FbtFJB505wrH/QxEupcFxCEJYzV5
	 /Bn7pwwn7kkAdvWTu0/htL3In5fkFPYx9YoeDfBUh9eqPQK/LSTwZhMiwX/oQj+mFTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623806;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eOjeL8fDvnL38NhKEDKA5hOduns0s5gslJmzUqSOluQ=;
	b=H652DbfYGtX5JLdd1R2MyyCxJ/QJ/Ab/5jgiybo5/K2YFaDcyjd6HJHSpD6rz/z5/Pdu
	 2fa+8hJOxn/ysjQ8fRb+eaTghWlHVdVv69IMIL2PZ+pm1ZLIzQKwsxAhY9qlK5omQWTCU
	 CEJNjUqA+DfIXN5gNmSOsPJStXXqsu8cIuUgq+NMJDieWMiJbUqj/4vjgsRzx/ONvKM1f
	 5wc/YH5RqPQHUUwQIolF+r9Ku2laMhAz5KdyraFz+6vjXSu2ofZz0SnIw4QQdIIWx8cjr
	 wVPOwtQxZriWjsae6M1ZpuLOkf55SGtIXG7UT/lHDYhtREBK1M62busi0tH9qUIuUKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2J4zkBX;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6701606A319;
	Wed, 21 Oct 2026 23:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6701606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2J4zkBX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792623806; x=1824159806;
  h=date:from:to:cc:subject:message-id;
  bh=m0fIrCZi5qVSfG0oU2eQe/y4lCyqaeU3w/LrcjacDKA=;
  b=n2J4zkBXG7sUxM+8Zw8pdn4Ffy+QMa9Z7GAmKI7//NGSymDNGzKkvgqG
   otCgiAO+f0frmfQcjgOGZ6koFLR4zJ09GmvABwan8Wc2nEks9n68EWzvJ
   /NAV3ZmFLp2SNHv4/HgxQOxhfbK9lo9rsd4FDZLvBPDzLarYJwDVCeH/P
   ihIdj5rXdwsY1OQkcL/RkzrlAc5ZLmDvYHHZDR0NEuP2t7gwfZp+hBZk0
   6tk5AtilLHLj5dinhf8Rql9NeLE7gQv/lasjDB3tdP4IXC/fkrlcFq0la
   2/yuMKCq8kqCTTEAblT68A7gEkBdvSSF6weDTmUUWDoXUMAThDn4eGylv
   A==;
X-CSE-ConnectionGUID: RvKqPORWR9qs8GJDtuQ2IQ==
X-CSE-MsgGUID: K0PD+MxzQaaXsYdEyQlgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1366526"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1366526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 16:03:25 -0700
X-CSE-ConnectionGUID: BC2AMomlQ2OTiZzLYJ63JQ==
X-CSE-MsgGUID: RvpsKD9jSEWXGDhVydpasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3273666"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2026 16:03:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJfL7-00000000QBS-0Xtz;
	Wed, 21 Oct 2026 23:03:21 +0000
Date: Thu, 22 Oct 2026 07:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:tdisp_phase1 27/36]
 drivers/virt/coco/tdx-host/tdx-host.c:221:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202610220625.gi2GBN5M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/intel/tdx.git tdisp_phase1
head:   245a83bdc025dc14a325b3c38b8a3bca2c631a9f
commit: e7c2aebf7644b84aca8e6fe98a67ca25af0a5b59 [27/36] coco/tdx-host: Establish an SPDM session with the device
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261022/202610220625.gi2GBN5M-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220625.gi2GBN5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220625.gi2GBN5M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tdx-host/tdx-host.c:221:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     221 |         if (!out_msg_page)
         |             ^~~~~~~~~~~~~
   drivers/virt/coco/tdx-host/tdx-host.c:243:9: note: uninitialized use occurs here
     243 |         return ret;
         |                ^~~
   drivers/virt/coco/tdx-host/tdx-host.c:221:2: note: remove the 'if' if its condition is always false
     221 |         if (!out_msg_page)
         |         ^~~~~~~~~~~~~~~~~~
     222 |                 goto out_free_in_msg;
         |                 ~~~~~~~~~~~~~~~~~~~~
   drivers/virt/coco/tdx-host/tdx-host.c:214:9: note: initialize the variable 'ret' to silence this warning
     214 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +221 drivers/virt/coco/tdx-host/tdx-host.c

   210	
   211	static int tdx_spdm_session_setup(struct tdx_tsm_link *tlink)
   212	{
   213		struct page *in_msg_page, *out_msg_page;
   214		int ret;
   215	
   216		in_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
   217		if (!in_msg_page)
   218			return -ENOMEM;
   219	
   220		out_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 > 221		if (!out_msg_page)
   222			goto out_free_in_msg;
   223	
   224		tlink->in_msg = in_msg_page;
   225		tlink->out_msg = out_msg_page;
   226	
   227		ret = tdx_spdm_create(tlink);
   228		if (ret)
   229			goto out_free_out_msg;
   230	
   231		ret = tdx_spdm_session_connect(tlink);
   232		if (ret)
   233			goto out_spdm_delete;
   234	
   235		return 0;
   236	
   237	out_spdm_delete:
   238		tdx_spdm_delete(tlink);
   239	out_free_out_msg:
   240		__free_page(out_msg_page);
   241	out_free_in_msg:
   242		__free_page(in_msg_page);
   243		return ret;
   244	}
   245	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
