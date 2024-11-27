Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA5201002;
	Wed, 27 Nov 2024 16:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732726375; cv=none; b=JOmdvUZBOXsrdxV/P+8NrVBzz9WMKJADBl3ReYIXIJojJRQm3dfD/jg3akvpxH+oqnK6lyODmYNo7PVXINl6QcpDsAGMVO/CkTnGqW/n0/CZ+W69r1HKd7SM/AEPVo98jYAxS/rRmZ8gIckba4T8D8+9+0DsW/sXlpt9eBhhn40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732726375; c=relaxed/simple;
	bh=pQFFJkVDgwGGcNT3jNePQjm/pQxkmLBBuFzPz74TwaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFyzB7pPDltRyHPaTYBgZDkzzJ7LhAUoIKuuBhZcxSxH5va3vvLW/W9eKIrIKe5mkTlQOJ0hrVdMY/Ibw7IFu9iVG3bGdfYS0UhTJSMDPj94ArwGLRHnTC5iVKQoEANYsD88Z0RWb7Fc/3YuAuhq71ZmFeeNdWNcW0uUhP+TjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePXK54qV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePXK54qV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732726374; x=1764262374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQFFJkVDgwGGcNT3jNePQjm/pQxkmLBBuFzPz74TwaQ=;
  b=ePXK54qVKsGDwiZdKHolkH8bf55CZxZC53ZpHJruuJMi/mlisteSVWhe
   zM85HZeaXqsNhtktUTT7/TYd4yX9id1b0QPhJ+OSMDK5G8RrOJePIk5pX
   n5K33zsko1J/gqVeJc0OLpOblGAMn7TL+QOmC3yRYXGqFNsO3ByKi7+Pw
   05zazCHoG75X4tYl+3yGmvScin9fLeA0CQX7xMxPtC7gEiKoqmZVq01YK
   dTEOef2gJC8hB56u2ImIZFZam4pyGlSL4+MIgmjZu8N1b8Go3ipFN9yNy
   jB1+qBaQ1cpJmtEhs+KE7Ye5sO9g8RfQP//NkCaDceG06cxS7C1KNgRQp
   w==;
X-CSE-ConnectionGUID: GVEYNmCHR9CLbRVHixJMYQ==
X-CSE-MsgGUID: cej6EbLyTA6FYR+7UbnJjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44319680"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="44319680"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:52:51 -0800
X-CSE-ConnectionGUID: Vw/1rTUZSwuiQ8dZJqr4jg==
X-CSE-MsgGUID: 2y2bsZxOSkiXBzzqNQcsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="96750875"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2024 08:52:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGLHT-0008Aq-1B;
	Wed, 27 Nov 2024 16:52:47 +0000
Date: Thu, 28 Nov 2024 00:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Dalmas <marcelo.dalmas@ge.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/urgent 1/1] ld.lld: error: undefined symbol: __divdi3
Message-ID: <202411280005.IVzoUqkP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   299130166e70124956c865a66a3669a61db1c212
commit: 299130166e70124956c865a66a3669a61db1c212 [1/1] ntp: Remove invalid cast in time offset math
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20241128/202411280005.IVzoUqkP-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280005.IVzoUqkP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280005.IVzoUqkP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __divdi3
   >>> referenced by ntp.c
   >>>               kernel/time/ntp.o:(__do_adjtimex) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
