Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD81DF98D;
	Sun,  3 Aug 2025 19:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754251096; cv=none; b=MTpCldfq3+XVtqz9Kj0nQSNXxmRA0ZgOOEpYzg2D38bKY3LxmegpS3Fw/F2kJmgukRmNktDZzUHAssKKRaPTIplJdgPdubaFtvO5L2Up1m84TK/K3MBLWDD4k1QqAzzBoZaZXgWWe2p/aRcQLc2nqWFVp2ByDsFCRyzcNr0e3FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754251096; c=relaxed/simple;
	bh=A9dvT3pglRgF2n9Bxbe7tD7fUBg0uZ7O8X7iFHDvK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mn6tKyDtsPJFEiSzK3QbAO4otY4L0vZK+m/EO3q/5Z44NTKk5iV7DNqEsJIgfFyaaPVrc2Padi6rB7c72C0wP414FnZGXFExCbDmZt/i+X/SjWEhUONomTu4OqEuJHjuVv26C/wg96IZlVuLqw61k3Ry6voiUaE9qNY+o1Q/eyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXrlm/0W; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXrlm/0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754251094; x=1785787094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9dvT3pglRgF2n9Bxbe7tD7fUBg0uZ7O8X7iFHDvK9E=;
  b=HXrlm/0W2HjTSUHs1XUlVLpvUC5nwGNzPyy8Xvh9XRKOtB3jvvt6sShI
   y+uCx8gRS8uwJYYwSUgiAcS3otl3WJfTKDwarq7NaiPvXe6VVlYz07FEP
   RFZsilTXwPYda7zMvlAVlvkFzfi86YAlju6NQKYRymCdJyxnb4RMEpcHQ
   LurU6oem9QLn8/LoDU9jsaXzVnBzzmSp0g0rBHfDYnLhMj5QbTuYtvXe1
   d+8QR0WQB6y+wS9xJO8TYe+HDPjLwRBYkl4uK1E7kHEKmdxAFGM7YteWp
   sFwO/s7ec5mJvWkaaJClOppWL2A5fvQpW/nq95vmHt6OKEBqBq6J4s+dN
   A==;
X-CSE-ConnectionGUID: eQ2EtFEISUCPgknExDksMQ==
X-CSE-MsgGUID: Bp0VW2nnQiCHrNdFhl9OJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67965849"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67965849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 12:58:14 -0700
X-CSE-ConnectionGUID: L0odeZ+NTSWqajY9K3R//A==
X-CSE-MsgGUID: c4i6+VQhQyK5jlfy9z06mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163259935"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 12:58:12 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uieqP-0006cG-2s;
	Sun, 03 Aug 2025 19:58:09 +0000
Date: Mon, 4 Aug 2025 03:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 10/20] Warning:
 drivers/pmdomain/core.c:935 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202508040315.KkDNI6DW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   87c07c323b9020baa5f4fa3659783d3063e4a0e4
commit: dd95bd1a306b179ed43fc80286c6eca4a8455bf4 [10/20] PM: domains: Add a flag to defer power-off until all consumers probe
config: i386-buildonly-randconfig-003-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040315.KkDNI6DW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040315.KkDNI6DW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040315.KkDNI6DW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:935 function parameter 'one_dev_probing' not described in 'genpd_power_off'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
