Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D761F12F4;
	Wed, 30 Jul 2025 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753857564; cv=none; b=s0u5gHf5laKgEJ/BVuPy7acbmuCH1Ybgal3AjW+fifr0hGEWz4Yq6WOw8RDczWTMAfQBeBbajT00w5pEXpesSvnROa9joVQqTkhc4kPXWVe39A9BkGaHXxVcHR9Id99DBJujT4fd8QRJOzeZDbgh+veqiwz7IURbYSiopUMnYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753857564; c=relaxed/simple;
	bh=/vMYwosxw2p+VDuGMGH3yHgF4fv2n5majXfQqdomUKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQ/HoJHu3FPSXUdBdilxu8uKTiMmDMCDZlPDi5uL7n/tUiNuU/ASnyIlWSoj8mwM8p+FISzUAceHujjPdlv69NUYhvQVdNrXC0iLJFGNLCqlLOBkFU7KmoX3JnawiF8hv9oxwoIXOCByJXIju/uWNb/mlfNh+O65LOM+s8iLRnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApgJu/Rb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApgJu/Rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753857563; x=1785393563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/vMYwosxw2p+VDuGMGH3yHgF4fv2n5majXfQqdomUKk=;
  b=ApgJu/Rb41PGltkywzZSY6sWBirmCft9avU0EXwU9Yp6wl7fY6RrirsF
   DPuTLQlmbj0NfdC9tPQiYRt9RuD/cwKrSCmBLIINZmMxTjrPq6in1kHDy
   vsyEdI7msCVkQ84DWfT2Fya8w43YhW8lCJKUVti+oEi+34DZysHAvzN/B
   /d1bTJUG5L+4jISfWRMPrpKDYdH0MivBA7otkojskd4cyjprH5kpANFJw
   CaRpEDbLG2/TphDO89RPYg9iXdF1lXPU56rUFCyCUsq6mRtdTcjg23YOS
   GtJLXTpShQN22CC6xLAj07GrDZkffizlFOBAjoFJjZAoiEP9tfGSpYz3N
   A==;
X-CSE-ConnectionGUID: ORh3LwIHR6ajGbrKbi8ryg==
X-CSE-MsgGUID: Ks3PmVFkRFmwSAIj9D2R/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56295598"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56295598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 23:39:21 -0700
X-CSE-ConnectionGUID: nJVsi4XhR26bJ7ZHR/zATw==
X-CSE-MsgGUID: xa0CPNEbR7a2mkcduEITkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163687342"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 23:39:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh0T7-00027s-0a;
	Wed, 30 Jul 2025 06:39:17 +0000
Date: Wed, 30 Jul 2025 14:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.18/cxl-probe-order 4/4] Warning: kernel/resource.c:342
 function parameter 'parent' not described in 'find_next_res'
Message-ID: <202507301452.Dmrkcrcr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.18/cxl-probe-order
head:   5e29cbd1077b79468339aca04b16e401252b5a24
commit: 5e29cbd1077b79468339aca04b16e401252b5a24 [4/4] dax/cxl: Defer Soft Reserved registration
config: arm-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301452.Dmrkcrcr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301452.Dmrkcrcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301452.Dmrkcrcr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/resource.c:342 function parameter 'parent' not described in 'find_next_res'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
