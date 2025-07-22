Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681073BB48;
	Tue, 22 Jul 2025 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753225977; cv=none; b=EO4RGPtgDsAMHEnDl06DS8ZdE4Yq1CHaJxCe1m0dpLEBkxcDwOw/DBkozPmAq4OtEMANdncvgJV02HVWLHxTeb1qbbcRk5SsqPJ81y2GkJfWXX15fHPZb5MxFrL6+Hm8biWif1k7Xs3sbsuHmbq7XuXP+rOFvjXjFDEbmwQKuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753225977; c=relaxed/simple;
	bh=0PpI4h9ouxAdOPS8G5ylHI9xapyiwd3HhKbsKi2uoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKiOZxy52oBtWFjuYBzZeXEUxZBoCxiMFq7eLRjdb3c3bm9FB4jWU16g8H0C3Q/s/pj/vgwHc23MtShxRtucML4aE5nE3oGI5Vygvx1nLklsO8mQrLTshSNwseZ6jqYxXBQKETVfttJaI+JoaRIxJN5GOgj2avfdgNLUYVTORY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEQqVVY7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEQqVVY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753225975; x=1784761975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0PpI4h9ouxAdOPS8G5ylHI9xapyiwd3HhKbsKi2uoUQ=;
  b=PEQqVVY7hJq9jTqqMc3CecUfJXLpU0fgjNmjeXQAeq5xcjSODXmZHZP5
   b7WE74apGZHIHSoQx7lqk1rT7Dsx5qEbM4X5RsL21SoHANNMO7VZ0J86P
   M8fu6hWoUp+3+8kHVZuiBBrVkVncSIPAEQb5DeUWB6VKJapgzfKDcS7Y/
   Lm2Butzl8RHr1jGGY18L5U8n1SSpFPMq4QVbmfsc/Z4ii86iRM9TiGDyp
   I/kZiTMbIztOmGB7AdqivMktSZVmeWzrQbRIx4IeGmTRvI0okmRhgTIE0
   C1bYa1poEt2cBdTN3UdBjI8lDJy1BbleMdsK5gqYWcXb8uKxZNtvMAlqx
   w==;
X-CSE-ConnectionGUID: F2L7CjyGRXaz3te20fpoZg==
X-CSE-MsgGUID: EgxniFvuRFW6njLpb1jc2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="72948779"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="72948779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 16:12:55 -0700
X-CSE-ConnectionGUID: lJwpszYGRziUNzXtTd9ESQ==
X-CSE-MsgGUID: ARs2A9gJTnaxIn+GGoVYww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="159367689"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2025 16:12:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueMAF-000Imd-32;
	Tue, 22 Jul 2025 23:12:51 +0000
Date: Wed, 23 Jul 2025 07:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] mm: add static huge zero folio
Message-ID: <202507230711.qUxejgnN-lkp@intel.com>
References: <20250722094215.448132-3-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722094215.448132-3-kernel@pankajraghav.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1b0686bd18c1aa9d7f01943829faa5befe6ab3d1]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav-Samsung/mm-rename-huge_zero_page_shrinker-to-huge_zero_folio_shrinker/20250722-174504
base:   1b0686bd18c1aa9d7f01943829faa5befe6ab3d1
patch link:    https://lore.kernel.org/r/20250722094215.448132-3-kernel%40pankajraghav.com
patch subject: [RFC 2/4] mm: add static huge zero folio
config: x86_64-buildonly-randconfig-004-20250723 (https://download.01.org/0day-ci/archive/20250723/202507230711.qUxejgnN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230711.qUxejgnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230711.qUxejgnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:78:17: warning: unused variable 'huge_zero_static_fail_count' [-Wunused-variable]
      78 | static atomic_t huge_zero_static_fail_count __read_mostly;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/huge_zero_static_fail_count +78 mm/huge_memory.c

    76	
    77	static atomic_t huge_zero_refcount;
  > 78	static atomic_t huge_zero_static_fail_count __read_mostly;
    79	atomic_t huge_zero_folio_is_static __read_mostly;
    80	struct folio *huge_zero_folio __read_mostly;
    81	unsigned long huge_zero_pfn __read_mostly = ~0UL;
    82	unsigned long huge_anon_orders_always __read_mostly;
    83	unsigned long huge_anon_orders_madvise __read_mostly;
    84	unsigned long huge_anon_orders_inherit __read_mostly;
    85	static bool anon_orders_configured __initdata;
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
