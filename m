Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90521208B0;
	Fri, 31 May 2024 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717133929; cv=none; b=r7AC9T9R5fdcIkxB0doJmo6cLNJ68COyTSBp7nuLTm1O5ZqnDdmP1jUsmvGix61k2RJqs+eP4jCyLb8KvapXxXBrZD8dEwg5dmwoSp8vtnRgIz9i2b55tGqszINhcWOP57hND7LJ7+TKkaJy7enr+p/aqYNUIwa0/q5tP58HjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717133929; c=relaxed/simple;
	bh=SUn2EFp/JXjl6h8VHm9shM9fvTUbCGSIGcuxlP4buH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9H7OIk4wZloxo3BgSuFQlx3+eNfbW8clsDHLefFNb8brGIGxloXXBqW/5VGfxwTHOSegiqA8n822P+HB847iXI2pYVYQ6fcVq20/ktpxSIw2rWovcMvFev1vtJ7N5/0Ui3+LpWVUGxyPSExvJ+Ad7TYzuNeIoPVCU7pRSlzuIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKXjzO4H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKXjzO4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717133928; x=1748669928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUn2EFp/JXjl6h8VHm9shM9fvTUbCGSIGcuxlP4buH8=;
  b=GKXjzO4HsZJ+Ws270cFliBIYCPQLRGKmEMQF24/Qh8Q8rLz77EKf7Asl
   A9x8xbFi1dlcvecfQMdMZY1hXu9+D657mIPhRM6py1NkiO0ipagayycXL
   KX6p67HJcySj2FQ1XMrohtWigCagYbHl0rOzuAFAXaC9tpmqmtHy6iZ2p
   7VXWMb7wukSmAXkq19CkM1KrHOwetoqnYGAWMVlSSRbaVsHdpNWdwt/nX
   WSV/3x6q0aJPWeDVSjrp3KcmWjS1bj921Mb+xZUG9bK02rysjg6RemXq4
   fYcZRnDcmThw755r9VcjVjlNibbjuai3EUlearGTtMh93MashFIs/MGcu
   w==;
X-CSE-ConnectionGUID: vknYIVOLSA+zQ6TnGcanfg==
X-CSE-MsgGUID: 8fO6jhN8QKuk2ssFNlS26w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17508159"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="17508159"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 22:38:38 -0700
X-CSE-ConnectionGUID: mpv3jNSNTEG3WrNpSHfS5w==
X-CSE-MsgGUID: Qjg2T5fjSe6jQhV5+4zZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36158707"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 22:38:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCuyC-000Ga3-0J;
	Fri, 31 May 2024 05:38:31 +0000
Date: Fri, 31 May 2024 13:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/8] certs: Introduce ability to link to a system
 key
Message-ID: <202405311344.nMjBNBi4-lkp@intel.com>
References: <20240531003945.44594-2-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531003945.44594-2-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Introduce-ability-to-link-to-a-system-key/20240531-084602
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240531003945.44594-2-eric.snowberg%40oracle.com
patch subject: [RFC PATCH v2 1/8] certs: Introduce ability to link to a system key
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311344.nMjBNBi4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311344.nMjBNBi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311344.nMjBNBi4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> certs/system_keyring.c:450:28: error: use of undeclared identifier 'platform_trusted_keys'; did you mean 'set_platform_trusted_keys'?
           key = find_asymmetric_key(platform_trusted_keys, id, NULL, NULL, false);
                                     ^~~~~~~~~~~~~~~~~~~~~
                                     set_platform_trusted_keys
   include/keys/system_keyring.h:133:20: note: 'set_platform_trusted_keys' declared here
   static inline void set_platform_trusted_keys(struct key *keyring)
                      ^
   1 error generated.


vim +450 certs/system_keyring.c

   445	
   446		key = find_asymmetric_key(system_keyring, id, NULL, NULL, false);
   447		if (!IS_ERR(key))
   448			goto found;
   449	
 > 450		key = find_asymmetric_key(platform_trusted_keys, id, NULL, NULL, false);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
