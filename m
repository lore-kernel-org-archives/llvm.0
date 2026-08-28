Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC9D330B32;
	Fri, 28 Aug 2026 03:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888101; cv=none; b=nML/8tcEx5Mo51p68DW/xf+CzUFXcOtBvGM+Q8w6vPinVAYRfdqYPsU0TPzYlY1783lV4ZPvIDrTnHYt2DOHHTv7LZ6Cj8xzSjMXc4E+1J6iNJyhDPZuUXtKb7jpGaaSf+epHcFWAuzzQqE8LDhwAi2j66kgaCqMgZ008LMnvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888101; c=relaxed/simple;
	bh=78rDbH5MdoIE7uLQu4U80c8+igw7flrUxlbXmOtIPfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hMRXJ0WaEAUL3mfPYEBuBlsXmsaiklJjyrHPNkMm7OZOZ/ojP0OD5PhTLgNVUVxarMgKiVoRLwgIb1AK4nS4xfTwxLWDeo+rLp/6y02Z5qlAmsZ7VlbiS7jj/oTtNxyEbgZ7y5/92woiQYIt0YcrUJc65awovN3uclt3ISwiWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7CvJpv/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7CvJpv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787888099; x=1819424099;
  h=date:from:to:cc:subject:message-id;
  bh=78rDbH5MdoIE7uLQu4U80c8+igw7flrUxlbXmOtIPfQ=;
  b=c7CvJpv/svk79PaeABwTeAjE4iVfZVfABD1c0SUSC4PfrzbHIJbPfULT
   /EOwfeUguBJoXel3HaStFbHoKgSxDmZbQYTGupFOroVeJGALtzi5Y1LV8
   4RYxertDJAkiUjix4tpaNTlEU95eThSadek7VE03aE+9P2rWI3swyQGSE
   H+6VNStlntXqwwsdT+2kHnI1Kve2sNhz5QYD0EqREmllD1qYllgzEFByd
   q4Dq8at1TnlmIJgBmMxv00mvHubbSFK9GK5MqhDkPQT5QWCgwUTLMaFPv
   e9E3oeiXsM/sG0cjkEWr7DBTVgF9WqlkwGYAqS2rDpGuZpY0/2eJOR3c6
   Q==;
X-CSE-ConnectionGUID: jAxPXvuTRXK5vNqW1jO/Iw==
X-CSE-MsgGUID: cOSqRbq+S+G/sTn2OhcuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88519340"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88519340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 20:34:56 -0700
X-CSE-ConnectionGUID: Bt+3Fi9ITS6tX/dVJoJzsg==
X-CSE-MsgGUID: Bog7bKfzQXK06Y0ZYGOqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="268615232"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2026 20:34:56 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wznMj-00000000AJ7-0oNq;
	Fri, 28 Aug 2026 03:34:53 +0000
Date: Fri, 28 Aug 2026 11:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-exfat:dev 1/1] fs/exfat/iomap.c:175:31: warning:
 unused variable 'exfat_swap_iomap_ops'
Message-ID: <202608281159.A0nWeJeg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git dev
head:   20cb0bad8c3ad9220aff3e61e8703e17f72bb7f9
commit: 20cb0bad8c3ad9220aff3e61e8703e17f72bb7f9 [1/1] exfat: map allocated extents for swap activation
config: s390-randconfig-001-20260828 (https://download.01.org/0day-ci/archive/20260828/202608281159.A0nWeJeg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281159.A0nWeJeg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281159.A0nWeJeg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/exfat/iomap.c:175:31: warning: unused variable 'exfat_swap_iomap_ops' [-Wunused-const-variable]
     175 | static const struct iomap_ops exfat_swap_iomap_ops = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/exfat_swap_iomap_ops +175 fs/exfat/iomap.c

   171	
   172	static DEFINE_IOMAP_ITER_NEXT(exfat_swap_iomap_next,
   173			exfat_swap_iomap_begin);
   174	
 > 175	static const struct iomap_ops exfat_swap_iomap_ops = {
   176		.iomap_next = exfat_swap_iomap_next,
   177	};
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
