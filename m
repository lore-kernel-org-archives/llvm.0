Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40737EFFE;
	Tue,  2 Jun 2026 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438243; cv=none; b=iaga6OSHjSr2hD4yIqtXtfGsHOc62V+udrh4mxOyqZ9+K7kC1PKZudyiXXilBWOURbj74qKsEl1yEXnsLsTe8AE86N1c3Su3TV2nMY97yCfXIsZZxGjCSUEM7m9TXl3Vr4mwMx0EmPpSxskvSla8DADHx+zxs1msxBpqHfXCOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438243; c=relaxed/simple;
	bh=RWEib2RnEb20LqKk1HXo0Hlw/9aLTSYI4cHaTR/2RdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LY9B0ua5RtcUPycriw4gM4KKbVzP2A6HKyDCsimnHOzhLf7sWgXGRivDvWazWg4eIAkqD5fENHddXjk2o9CcktmNiatDpMXIHUHfqAS/vDDmfWisEoQztsVD9qV+9fKDgyRnAGCWLTFoxaJhGFJNp6Z2SfjR2LRVjihKE0973eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUb8SMOQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUb8SMOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780438243; x=1811974243;
  h=date:from:to:cc:subject:message-id;
  bh=RWEib2RnEb20LqKk1HXo0Hlw/9aLTSYI4cHaTR/2RdY=;
  b=eUb8SMOQb6cnCcWnR48KWaCtRoZXNHx/BXd1d/zGiYjsVBDSjy9VSx8t
   q9EwVYBOyUpHyLTZ3kzEgyWpzRyXr9r7ox/olrG77KJ6Z/ULb/mfVNuQs
   N/ceubFpfDAyT8qWkefAZimLzzjRnsNRUp8r0wffXzG1ECWGwsdu5PQEo
   Tl+DojoF4fBzwDq7VSt7n9vP9jLVwKyZ0n7r45haNHD+plbr+h0TujOdX
   8lgBQxKasL/Ioy8dR+oIKR4B0sO1iONSePDnUwmZhFvikfcFWxKyM3xAL
   Qn8IL2/Q+ES7aguQL+YvOnTOGIQj6wZr5c9UTbiSlTP9C9Bhlw3y+BqQt
   g==;
X-CSE-ConnectionGUID: RiQ9ANspS6yCv8rww9hOlg==
X-CSE-MsgGUID: XjBLuTaDSUisVwtLa6jhRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="84862376"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="84862376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:10:43 -0700
X-CSE-ConnectionGUID: PVG133l5TcWoDbuWV1ewXA==
X-CSE-MsgGUID: EL/DjPmoQwe9MX+2G0CkSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="267668524"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2026 15:10:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUXJl-00000000Cb7-3yGk;
	Tue, 02 Jun 2026 22:10:37 +0000
Date: Wed, 03 Jun 2026 06:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:switchtec-dma-sysfs 4/4]
 drivers/dma/switchtec_dma.c:1198:48: error: use of undeclared identifier
 'readw'
Message-ID: <202606030627.521Tgxiv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-sysfs
head:   7de58d38d826e9043f1c21054c804d326563a84a
commit: 7de58d38d826e9043f1c21054c804d326563a84a [4/4] dmaengine: switchtec-dma: Add pmon sysfs attributes
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030627.521Tgxiv-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030627.521Tgxiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030627.521Tgxiv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/switchtec_dma.c:1198:48: error: use of undeclared identifier 'readw'
           return pmon_show(chan, page, perf_se_pending, readw);
                                                         ^
   drivers/dma/switchtec_dma.c:1204:50: error: use of undeclared identifier 'readw'
           return pmon_show(chan, page, perf_se_buf_empty, readw);
                                                           ^
>> drivers/dma/switchtec_dma.c:1210:47: error: use of undeclared identifier 'readl'
           return pmon_show(chan, page, perf_chan_idle, readl);
                                                        ^
   drivers/dma/switchtec_dma.c:1216:45: error: use of undeclared identifier 'readl'
           return pmon_show(chan, page, perf_lat_max, readl);
                                                      ^
   drivers/dma/switchtec_dma.c:1222:45: error: use of undeclared identifier 'readl'
           return pmon_show(chan, page, perf_lat_min, readl);
                                                      ^
   drivers/dma/switchtec_dma.c:1228:46: error: use of undeclared identifier 'readl'
           return pmon_show(chan, page, perf_lat_last, readl);
                                                       ^
   6 errors generated.


vim +/readw +1198 drivers/dma/switchtec_dma.c

  1195	
  1196	static ssize_t se_pending_show(struct dma_chan *chan, char *page)
  1197	{
> 1198		return pmon_show(chan, page, perf_se_pending, readw);
  1199	}
  1200	static struct dma_chan_sysfs_entry se_pending_attr = __ATTR_RO(se_pending);
  1201	
  1202	static ssize_t se_buf_empty_show(struct dma_chan *chan, char *page)
  1203	{
  1204		return pmon_show(chan, page, perf_se_buf_empty, readw);
  1205	}
  1206	static struct dma_chan_sysfs_entry se_buf_empty_attr = __ATTR_RO(se_buf_empty);
  1207	
  1208	static ssize_t chan_idle_show(struct dma_chan *chan, char *page)
  1209	{
> 1210		return pmon_show(chan, page, perf_chan_idle, readl);
  1211	}
  1212	static struct dma_chan_sysfs_entry chan_idle_attr = __ATTR_RO(chan_idle);
  1213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
