Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D8804;
	Thu,  8 Aug 2024 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723085133; cv=none; b=E5TA7Mi1lbwllpE3spUfTGKhpkwUWtACBXEbEEgbuNfMX7sEbZnru9Evt9hCOgC0YvzJmQ2nqMSsXZmFSC7PhtqyYGkZKv//j2APi+OsF+QezVMDRRjd7krTny4oI7y34rtIAeoQbp7YVjW1Dht42XcVBjLx7q+6Lhxqrq9/RPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723085133; c=relaxed/simple;
	bh=EIFCQjht4jb+lCTHB6POUFwoir2+OWGUko/iQdV/sdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzzkHULRfc9dvRgZw/EYN801HgAFQloMPcIQsgmkwhSWcx6nbpRxACi5M9ch7DJAmht8Z1CfAc8jVmq7UygaZ4y9Otlxj8ppH7rd8YdgMSad07x3iPJwIQ7C42/kD2D/9e9Q4bOhLYFV2l2PG7KfEQtIFA+ivSyblurA0uo14Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9BYd9U8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9BYd9U8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723085132; x=1754621132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EIFCQjht4jb+lCTHB6POUFwoir2+OWGUko/iQdV/sdY=;
  b=f9BYd9U8igX6RmIJSghLzgnmK53YfrXIJn7S7HpJpJ+ZVqB8gE8w5fhW
   d6VrA9M6EQhICphhteuqzM/CZwvBAr+tPirjMit49MQqKm848sfo5zTyC
   VZsv0t8JBT5ly+73T8AaM/x+Msl+7WxD9WtAYu0Y/zBjN5T1dseM220ae
   tmkOikCrH1mP+G7r8R1Vr7qfSbDIQ1PTmKKc9fMaJWAOOyflLHlgQ+hgS
   fcI0My0imKBb95Po+Ie2lD1aPDqaK4e8ryufBCq/cRIg43KNCwmrafYxH
   j/a7oUGVf2lI1JeMpnh+Bs7VV7MGqa8LLeHdxI/CcoSTJ1gDmtoFdsBCU
   Q==;
X-CSE-ConnectionGUID: EDdj2Xb7ScCw3iLlefFvTg==
X-CSE-MsgGUID: 0ofJwITBTZu42zGggG16jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21001907"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21001907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 19:45:31 -0700
X-CSE-ConnectionGUID: 2A8FKmQtTPqqyyO1UnY6cg==
X-CSE-MsgGUID: 7ICPPgzpQBiJNmFJuFDOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="80302409"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Aug 2024 19:45:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbt9c-0005s8-0W;
	Thu, 08 Aug 2024 02:45:28 +0000
Date: Thu, 8 Aug 2024 10:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
Message-ID: <202408081018.maLT93SE-lkp@intel.com>
References: <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/mm-Introduce-guest_memfd/20240806-024238
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7%40quicinc.com
patch subject: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240808/202408081018.maLT93SE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081018.maLT93SE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081018.maLT93SE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/guest_memfd.c:115:16: warning: unused variable 'i' [-Wunused-variable]
     115 |         unsigned long i;
         |                       ^
   1 warning generated.


vim +/i +115 mm/guest_memfd.c

   111	
   112	int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
   113	{
   114		unsigned long gmem_flags = (unsigned long)file->private_data;
 > 115		unsigned long i;
   116		int r;
   117	
   118		unmap_mapping_folio(folio);
   119	
   120		/**
   121		 * We can't use the refcount. It might be elevated due to
   122		 * guest/vcpu trying to access same folio as another vcpu
   123		 * or because userspace is trying to access folio for same reason
   124		 *
   125		 * folio_lock serializes the transitions between (in)accessible
   126		 */
   127		if (folio_maybe_dma_pinned(folio))
   128			return -EBUSY;
   129	
   130		if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
   131			r = guest_memfd_folio_private(folio);
   132			if (r)
   133				return r;
   134		}
   135	
   136		return 0;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
