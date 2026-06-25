Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65C78C9C;
	Thu, 25 Jun 2026 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782349099; cv=none; b=tlAuRZBI1X+W/REXS1fmJmtcB3HZMxqYyX9q7RzItZ4CoVUGUym2f5xJtKZ2DAUobCqq7lVXAmqf8vGBiFUoleB2VeUNIED+USF7MObATtXLbWA586U3cmPJiPqlUJmPBq1dk7zITCZ/i+ZrSbfdMgA7oyAirJ1ZCs3rgMvzDiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782349099; c=relaxed/simple;
	bh=AM+BG8bOMSpA/gGDN+9xesasXMQ5+Gdk7og17fG06lY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LGHcvQNyD5auNDWnnZeOK14DfvJOg8NXmIhAWTc9Vxj6zUwlGl8JSb5u1Xv5VKMFMEV9FOXPxXxiU3nUzOwwerKUa/F1qhnZbPoxY22qILDyiFzjB1YBCuCH953+1dXRmOHKg/mEzL0gwgBsPFIvkWyxkOhOxbl/83GAge70MgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9GjPyF9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9GjPyF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782349099; x=1813885099;
  h=date:from:to:cc:subject:message-id;
  bh=AM+BG8bOMSpA/gGDN+9xesasXMQ5+Gdk7og17fG06lY=;
  b=O9GjPyF95v5wWAIK38VI+7x+VZV+GjbN0vNt9WP77Rl2kYfZQjsOTmQ/
   AfMTDXOv1gpPePaUuYZPhdTgEgWtWcBB5+ZCP55VuGiwr3MNT1UdaYoNW
   BwjmhW9UZa9km4ImSReIqj0s3HttCZ/EeucsQ5uRnsgco6p0HOxpSwycS
   gqbxwvpaIFtJdBiJnWn0Ft/LQMAybxzyv3FIYJjniv2+jaANmZG7B/ZWY
   EtjrVQK34FHrghCu9mO3PTSfprT/Jp2SMuYnM5cFIXJsb84DWNFGia6C4
   zsWaq50dYrQVW1zAEKgSUUaxMeuczsos2yqfYM7JHtKRxGHqt0uGrQJxe
   A==;
X-CSE-ConnectionGUID: WC56eU+vQg2JzLLPIAOCjg==
X-CSE-MsgGUID: TouL/3biSTurmnlzfV7yuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94241446"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="94241446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 17:58:18 -0700
X-CSE-ConnectionGUID: lBZg/EHrQ1aVu9gHpp5rSQ==
X-CSE-MsgGUID: SHSt4bh7S5uhpmW4VPSirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="252139039"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2026 17:58:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcYQ2-000000006Rp-0REA;
	Thu, 25 Jun 2026 00:58:14 +0000
Date: Thu, 25 Jun 2026 02:57:24 +0200
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [jic23-iio:testing 23/62] Warning: lib/kstrtox.c:59 function
 parameter 'init' not described in '_parse_integer_limit'
Message-ID: <202606250230.etPGuolf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   7667a80340e99fd45357d0c90ae05813b01bbfef
commit: 521b4ae3b5a47cf4ef5826016eecde08e8740bef [23/62] lib: kstrtox: add initial value to _parse_integer_limit()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260625/202606250230.etPGuolf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250230.etPGuolf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250230.etPGuolf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/kstrtox.c:59 function parameter 'init' not described in '_parse_integer_limit'
>> Warning: lib/kstrtox.c:59 function parameter 'init' not described in '_parse_integer_limit'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
