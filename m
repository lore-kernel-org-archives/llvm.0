Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57213C82E;
	Wed,  7 May 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605596; cv=none; b=kkyw+KQOQnV5EnaHIxpIiR/BY72JCUq44c6KjxOsBbYMHb085HdlCCwYlFs5Ltob62Bie2FhtiFY2+nfXfEexOYr4mDzxtGSvNBZzCbe6SZnwK9qtFURaOdQD+vlKQKTRWPVmI8AqbUNs6NsoO0MD8I9X071sMCMQXeSa+INRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605596; c=relaxed/simple;
	bh=V220L8PDY8aoneJiOf+aZ0L+k4ftdr04pojPRIC8mMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7nWgP/oM9a4YjoYMtzMuY87347AOb2cjADss72ZMTyTyUOV1giz9Rq/NbjSyiqs3SsjevQMx0aNiRJZzRjyAwTU+6RWB+xmj6zwqMXSzxmIFvZQGgUcfhLGsuSjSBs3Dq6UwLcc2bTXEFFh/OTUf3IyBZbsjuWsxUVEsZBPwSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERQSc/yz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERQSc/yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746605592; x=1778141592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V220L8PDY8aoneJiOf+aZ0L+k4ftdr04pojPRIC8mMY=;
  b=ERQSc/yzFN2+QOCFqQFDxsCq3p/zdQErtQjq5YML3xPNuDWCG2Kbi+sy
   w+tOhPrLDHtR3pasoOIvtvUEX0EjtoX4nEEKve2Z+HboaXS8ClV5PHC2L
   gfhBnHnoVBStZvq8qhwne0Ml5Rq0Iuuohitejkowpkn1G7pO8/9OVmBwF
   xe2sYdX3I8cXOBRxFidJyasXUvF87Cndx1LBy+c3T8luqb0rQTAoaEbEo
   A/2qlX5PaPuEpkW4mulb49LtFIehhmN7CNzbbwZYHLtOP2FDplTRxpd1j
   pNX6nY7YYS7/9FaUyU785aJcLLCfqG5S8Xj4kBnWAUb6gPY5ZMO88HJLa
   g==;
X-CSE-ConnectionGUID: s07OICwETRetqWrpeoMFKQ==
X-CSE-MsgGUID: eNNn05/vR6CW/rXGttAjMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70827298"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70827298"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:13:11 -0700
X-CSE-ConnectionGUID: 6CXonMTBS1e3DT1o18E/tQ==
X-CSE-MsgGUID: tet5waZBQ/qd1QBxd2AsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135885209"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 01:13:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZts-0007OC-00;
	Wed, 07 May 2025 08:13:08 +0000
Date: Wed, 7 May 2025 16:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [linux-next:master 2038/9308] .pylintrc: warning: ignored by one of
 the .gitignore files
Message-ID: <202505071520.7aBIzkeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 02df8e3b333c3d8550a22ffdfc969caec8462df9 [2038/9308] docs: add a .pylintrc file with sys path for docs scripts
config: x86_64-buildonly-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071520.7aBIzkeM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071520.7aBIzkeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071520.7aBIzkeM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .pylintrc: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
