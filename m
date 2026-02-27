Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD335A3A0;
	Fri, 27 Feb 2026 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772226792; cv=none; b=pQbDZv/NIignJT/72/8SsNYzi/14bRsmT8jn/QGzmdoxNHH/T5LeCTMsKVDCELUa720YUlzqWdSrwHysm9le31+Y/jInESM11ZtfSLAs8dR0r7hE/bITt65niXn3VuFO9o0mC2MH01ws1gEZP2uRoer8q3ydPO9G5/dMOJkfjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772226792; c=relaxed/simple;
	bh=yUNaZ08AghZyC3/4QNM1eE2clkET8neMelpR1tAYj64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hvqccr8g85bhoFCL8tz5jdcWHWc76FgM0YBNSsjeq0K3+6FOKdRaUfMkOcj9WpiNX2AxS+JHEh/DN4f8ScoWacktBozEFyOCgosIFaHMzJknbxSREWktyQ/ljzMltZ75ZUJY9NornAPros0WWCK89UoNu7goShVASCWwhjOT86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwwMZuge; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwwMZuge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772226790; x=1803762790;
  h=date:from:to:cc:subject:message-id;
  bh=yUNaZ08AghZyC3/4QNM1eE2clkET8neMelpR1tAYj64=;
  b=mwwMZugeyhd0gOBqGTwhBvy5vDuFF8md52i9SO1GYQsnKIMzFXeLtLix
   S3l7WfCQelavu5hg5UJZ6x4QA3rMKq58WBkIB0RDYZ8bfx+syLv78fAGF
   nnGRhiDe91sCwZKbSeES0nooQl4A/GMgutrWfnqsKX3rlwubKESv3Vnke
   fxZGU8iIc9z4gPv8fHrS/CPS+3eRn7uVtR//pSkmSnkxwW7hgaD1GuXr+
   LGKBri95fMyfcqoVrMKYhigqge7zbSHnAEpcm/zuunNwi39wBtX5srAuA
   A80iPvxDydswcEAp6Q6Dc4E1AI6O/tpbG40BDhmmx9r4tHQ+Dnq670I8q
   w==;
X-CSE-ConnectionGUID: Ne5spD6DSUK80WJfdGGE2A==
X-CSE-MsgGUID: dOmtt3QHT7uT7Bq4MQ+DlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95938181"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="95938181"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 13:13:09 -0800
X-CSE-ConnectionGUID: 8gOrPyq7T++2hOn4mVf3Nw==
X-CSE-MsgGUID: EJ72c8/4RiaIKpyvkdkqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221634284"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2026 13:13:06 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw58Y-00000000B4Z-03X0;
	Fri, 27 Feb 2026 21:12:51 +0000
Date: Sat, 28 Feb 2026 05:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Li <fei1.li@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Yifan Liu <yifan1.liu@intel.com>, Zhangwei6 <wei6.zhang@intel.com>,
 Haoyu Tang <haoyu.tang@intel.com>
Subject: [acrn:6.17/linux 5/8] drivers/virt/acrn/hvlog.c:148:13:
 error: expected parameter declarator
Message-ID: <202602280536.DjiDLtir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: a0a08e545dd9dc1bc3bdbd625684163595678fa6 [5/8] virt: acrn: add acrn hypervisor log back
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260228/202602280536.DjiDLtir-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280536.DjiDLtir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280536.DjiDLtir-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virt/acrn/hvlog.c:148:13: error: expected parameter declarator
     148 | early_param("hvlog", early_hvlog);
         |             ^
>> drivers/virt/acrn/hvlog.c:148:13: error: expected ')'
   drivers/virt/acrn/hvlog.c:148:12: note: to match this '('
     148 | early_param("hvlog", early_hvlog);
         |            ^
>> drivers/virt/acrn/hvlog.c:148:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     148 | early_param("hvlog", early_hvlog);
         | ^
         | int
>> drivers/virt/acrn/hvlog.c:148:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     148 | early_param("hvlog", early_hvlog);
         |            ^                    
         |                                 void
   4 errors generated.


vim +148 drivers/virt/acrn/hvlog.c

   104	
   105	static int __init early_hvlog(char *p)
   106	{
   107		int ret;
   108	
   109		pr_debug("%s(%s)\n", __func__, p);
   110		hvlog_buf_size = memparse(p, &p);
   111		if (*p != '@')
   112			return 0;
   113		hvlog_buf_phyaddr_base = memparse(p + 1, &p);
   114		if (*p == '$')
   115			minidump_size = memparse(p + 1, &p);
   116	
   117		if (!!hvlog_buf_phyaddr_base && !!hvlog_buf_size) {
   118			if (!e820__mapped_all(hvlog_buf_phyaddr_base,
   119					      hvlog_buf_phyaddr_base + hvlog_buf_size +
   120						      minidump_size,
   121					      E820_TYPE_RAM)) {
   122				pr_err("hvlog region [0x%llx, 0x%llx] was not entirely mapped as E820 RAM type."
   123				       " Disabling hvlog\n",
   124				       hvlog_buf_phyaddr_base,
   125				       hvlog_buf_phyaddr_base + hvlog_buf_size + minidump_size);
   126				ret = -EINVAL;
   127				goto disable_hvlog;
   128			}
   129	
   130			ret = memblock_reserve(hvlog_buf_phyaddr_base,
   131					       hvlog_buf_size + minidump_size);
   132			if (ret) {
   133				pr_err("%s: Error reserving hvlog memblock\n",
   134				       __func__);
   135				ret = -ENOMEM;
   136				goto disable_hvlog;
   137			}
   138		}
   139	
   140		return 0;
   141	
   142	disable_hvlog:
   143		hvlog_buf_phyaddr_base = 0;
   144		hvlog_buf_size = 0;
   145		minidump_size = 0;
   146		return ret;
   147	}
 > 148	early_param("hvlog", early_hvlog);
   149	
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
