Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAA3164A9;
	Sun, 22 Mar 2026 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774220820; cv=none; b=d3KhB6j+qzlbWs/ClHRuMf1AkhOUzu306qHWrJze+cOVfKuO8BFF2NcmVpU3Kp+t+CKZatZNGoeUNdJIIheUVXrZ4mtduPUtt10PqIKMYp2uHK3zJ6lOy8TAmDsED+XM/1gkKxD+bPhyOahI543WLrrucn020H7WX1Udq55OT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774220820; c=relaxed/simple;
	bh=dII1mEDxg9qp3tROcU3V/XVIs1a1ZTqFgshOPho52R4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sYUDwzy6iFV0uTQhEixddIaRYPJIiaJooVR/rnklOevBOlBp6ebf3ltXA6D8rLTN6hzWSIUb+DCTm2Qt1O1iOZe0HsLZFYV9+9T9baPHsov25PyZ8YIX5x0AEihrUNTcJkqqZbg147zQEUtTdO1df2H1qh36W4hKuIDRt/Fog8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvFSDAOS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvFSDAOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774220818; x=1805756818;
  h=date:from:to:cc:subject:message-id;
  bh=dII1mEDxg9qp3tROcU3V/XVIs1a1ZTqFgshOPho52R4=;
  b=MvFSDAOSgcEW3DYdoqIozW2Y/1LyDtbcNQsbE3J/Aq9mVsqs/OKPUWra
   qmJFtbHdfNq8leNDuv+yvF62UXS2hJMA96a7OO5JJWE67Bs+r2nCv0sR/
   zGv51b7keon64kJd7gGndcsnPJSgCyKlaca9nBpEioyGlzEKw7EVsqkWZ
   quK7IN1l1WR/Lu9x2jtYx5BDxsaSxwh9pKtHEpbf52/KELOnHrX313ESv
   3QNqB1vVa+jZPhaYtFNFGhIKmYMINQWXmQ1BQD+LIIFaFBwf8tnyb63UA
   o1NBANekFMbYUQMIVo9cVkvlv3tyGv0yAX9ZEEKtLgaQ2YGoUWYN1jwZ/
   Q==;
X-CSE-ConnectionGUID: cqXwaDpFSSWyFn/iVgWpBA==
X-CSE-MsgGUID: q5Yrz+5aRuyV1wKvF+J0zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86697822"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="86697822"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 16:06:57 -0700
X-CSE-ConnectionGUID: JSLHwQWJSTO5xg9dLqVriw==
X-CSE-MsgGUID: kkse3p4sQm+8a0D6MZFU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="220625884"
Received: from lkp-server02.sh.intel.com (HELO 391eea459618) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2026 16:06:56 -0700
Received: from kbuild by 391eea459618 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Rrz-0000000006L-214I;
	Sun, 22 Mar 2026 23:06:29 +0000
Date: Mon, 23 Mar 2026 07:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 26/30] Warning: mm/rmap.c:1299 function
 parameter 'nr_ptes' not described in 'pfn_mkclean_range'
Message-ID: <202603230636.3Ld7jCJO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: cbef1d0b647d13181325aba9b7fb964d22e03829 [26/30] tmp
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260323/202603230636.3Ld7jCJO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230636.3Ld7jCJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230636.3Ld7jCJO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/rmap.c:1299 function parameter 'nr_ptes' not described in 'pfn_mkclean_range'
>> Warning: mm/rmap.c:1588 function parameter 'nr_ptes' not described in 'folio_add_anon_rmap_ptes'
>> Warning: mm/rmap.c:1896 function parameter 'nr_ptes' not described in 'folio_remove_rmap_ptes'
>> Warning: mm/rmap.c:3019 function parameter 'nr_ptes' not described in '__rmap_walk_file'
>> Warning: mm/rmap.c:1299 function parameter 'nr_ptes' not described in 'pfn_mkclean_range'
>> Warning: mm/rmap.c:1588 function parameter 'nr_ptes' not described in 'folio_add_anon_rmap_ptes'
>> Warning: mm/rmap.c:1896 function parameter 'nr_ptes' not described in 'folio_remove_rmap_ptes'
>> Warning: mm/rmap.c:3019 function parameter 'nr_ptes' not described in '__rmap_walk_file'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
