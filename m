Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036A176ADE;
	Fri, 27 Feb 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185592; cv=none; b=U/YkpEHf+be1UJ1tz0adrzpEUiV0YTUBhZCnXb1lDgy7Sse1zpoFSyc2Btle01kscGyGYWZCPB7ecarE+EExQBzScrRmSkEkYHvIEtYMdQFJwcSG8wH2QvqHGh2w4h+2ZxhMXht4Xazzc/PSo66SOazpz0eFqBZCtVZdKjt8EJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185592; c=relaxed/simple;
	bh=DB+etT43v8fqjRoMSX8OIxDzIOzmYQLycbjbENRUNaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uLd5/SLH8g5VnxfH9S9p+v1QYwh7/TN7dcL7gAayzNVf4Tq1KOaDnk1KkysXCiYGc3hI6si5iBW7j7aQVHaWhmOvzc3i85N5Hd0cPvxkHlNZzgo6bcsUU5QMuP4LGKGaU/zNJYKVN2RYztPHUGCG8AshNP6HY6kTFLPcgQcxqrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6zhZUjA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6zhZUjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772185591; x=1803721591;
  h=date:from:to:cc:subject:message-id;
  bh=DB+etT43v8fqjRoMSX8OIxDzIOzmYQLycbjbENRUNaU=;
  b=C6zhZUjAEllPiQcbBCGLUsgLI3yxSLjVqFOx6sOdYnG9JoU7ksA5aCIw
   87Q/VkVAEYDhGGSmsgRL7TZE5M44YlfNCrDwWzNfPOCLtLGNZf/jXr+0j
   ugT7QiY9gtluhB56Z4VU2pf7FVoApDbBuIV9OTYuf+p4/F+f5Wvciduqu
   ln301wYrJKioEyu0eG2gxu0nKzHrGLfb/3kbTvAUG++Kd6+ZAaVF0WfKh
   976gkhgGPtvB6KOlV4XUUdwqMavafc6IVGzofjQpPzCt+X5oVB/OLUOII
   Yf1ItXrsNjHBZzgNqcqg9dyzh4CBGpUCG3ovA+cDCaLMAi3SzyLsb/kQI
   g==;
X-CSE-ConnectionGUID: ZibFypPhTpajGyPs7/go2A==
X-CSE-MsgGUID: erI3YVpNRLeGLGbNQlIWHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83972598"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83972598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:46:30 -0800
X-CSE-ConnectionGUID: iar5mERgRfSr0Df1oYvY2A==
X-CSE-MsgGUID: J2bE45MpTb+UTkXUjHFDug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="254630730"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Feb 2026 01:46:29 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvuQT-00000000AQp-2sr5;
	Fri, 27 Feb 2026 09:46:25 +0000
Date: Fri, 27 Feb 2026 17:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghua Huang <yonghua.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Yifan Liu <yifan1.liu@intel.com>, Fei Li <fei1.li@intel.com>
Subject: [acrn:6.17/linux 2/8] mm/hugetlb.c:57:10: fatal error:
 'asm/hypervisor.h' file not found
Message-ID: <202602271758.f6AQNfwU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: 4867d13cd20c2bf8264e53e223e9b7283f667a73 [2/8] postpone ACRN guest VM memory cleanup
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602271758.f6AQNfwU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271758.f6AQNfwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271758.f6AQNfwU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb.c:57:10: fatal error: 'asm/hypervisor.h' file not found
      57 | #include <asm/hypervisor.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +57 mm/hugetlb.c

    47	
    48	#include <linux/io.h>
    49	#include <linux/hugetlb.h>
    50	#include <linux/hugetlb_cgroup.h>
    51	#include <linux/node.h>
    52	#include <linux/page_owner.h>
    53	#include "internal.h"
    54	#include "hugetlb_vmemmap.h"
    55	#include "hugetlb_cma.h"
    56	#include <linux/page-isolation.h>
  > 57	#include <asm/hypervisor.h>
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
