Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6B810E3;
	Sat, 18 Jan 2025 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737200826; cv=none; b=os6HLfsCbLhseV0yCeWuGiZsD2exJl2Pnvf54OLTK7QcOk8edsJ229INN9h6ndcg2u0JdY6zcKY4CClLF2ov+dwFQ5p5PBpLMnIZSlsJJJfBEzczNE28oFkTgMZmppGJYqiyL38O9FdwgCYia2pK57WY4CcfFBePg3zUwlkPHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737200826; c=relaxed/simple;
	bh=zpxSvvjb974cwOEkdrCMy6RS2i6NLYtfvyKB88Yi9S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZgjTGQOFvcnLzFh+hUCygzGMaJirjiVM2r+z33N4REy+ElQLEPahFhwiF0Hj7XAoyZ+u1dKTUHJaslY++kgZbPCwMcUd8Dx4kaMLv+mMBeP+1OffDCXIcH/PIa61FjbTqOVj7YHjqrCUXc3UyJhpSpW1M9F7fY1edHlz5VIdOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biEJ+DmJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biEJ+DmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737200823; x=1768736823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zpxSvvjb974cwOEkdrCMy6RS2i6NLYtfvyKB88Yi9S0=;
  b=biEJ+DmJ6wafH4y91PKq20SX+mlD0plguEojiY741HaEv7cjxifbAyzb
   h/O1w1Ay0BH+h5+5o5e6Sk1etYbc3fA3xYbl+KaW6w299clb5QfDlg79Y
   V18EyMfEZMIrOKf5Z0eyiQawy+rzQ8t8qKB8gV+h1TZU6W1wULKBjZy4c
   5NQ7uZ6OvnZo60hCTrjpMoMD1sA6KRAEha7LXvNj5+fTIXQgt1OYGJTGT
   r3C6r577mB05p/gpsTjF/wgxleLI7/nXhKa07wCm6Qt1dvH51I5IZF0WZ
   LaxrLZgreuBrrGoFIlXiW7uLEQWTkh/KRnpinag1p9EoM3dEh5gdZWpmx
   g==;
X-CSE-ConnectionGUID: z+ifaLpmTeKmzPccFlOk8Q==
X-CSE-MsgGUID: 5LYDvaQXS/qYcI8w1MtmWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37788595"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37788595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 03:47:02 -0800
X-CSE-ConnectionGUID: 1wMbtvWTTQ6QZaAeaTHk8Q==
X-CSE-MsgGUID: ahq+0frrQliSQNT1+GVk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106940576"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jan 2025 03:47:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ7I3-000UMB-0q;
	Sat, 18 Jan 2025 11:46:59 +0000
Date: Sat, 18 Jan 2025 19:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on
 final folio_put()
Message-ID: <202501181952.HVN9OJ5m-lkp@intel.com>
References: <20250117163001.2326672-2-tabba@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117163001.2326672-2-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20250118-003538
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/20250117163001.2326672-2-tabba%40google.com
patch subject: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on final folio_put()
config: i386-buildonly-randconfig-002-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181952.HVN9OJ5m-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181952.HVN9OJ5m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181952.HVN9OJ5m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: free_huge_folio
   >>> referenced by swap.c:101 (mm/swap.c:101)
   >>>               mm/swap.o:(__folio_put) in archive vmlinux.a
   >>> referenced by swap.c:101 (mm/swap.c:101)
   >>>               mm/swap.o:(folios_put_refs) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
