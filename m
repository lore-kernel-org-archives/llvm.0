Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467F1E1C02;
	Sat,  6 Dec 2025 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765037758; cv=none; b=lM8mPVbFKM5YQmz1KGkgPbPoAfGzqgzgEo+x2t32TKN4iv8FuQdTTHv1QinNNyq2tacGl6pwSnkIOBF/3+76U5cVZw6S4zA1MufKYUFm3tnEVwe58F3RZi9t2ik/o4KdTrTzW4622EIIq31b8SSfvvtU36Kg+xvuS9wSx05T3yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765037758; c=relaxed/simple;
	bh=2JS1k+AoKJhmOEeuc6jrahFKtew4+KoqVrp8Ku9zZNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG/WfJVDbjYT3YTz+iTwKpCiz0IdplrmBXWPgumTo5x9IGwK2L/v+5KCY12G1suNKm0qn+BBBaV3yNBgyD6Y7yEwWUvwumJE9q41SHW9EDLghUQUtX76QNW20ko1kxO0CoykUI+Lgf9S9Dpz4bC6rTtowfsNJGyG84BLmaEmaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk4UwASn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk4UwASn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765037757; x=1796573757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2JS1k+AoKJhmOEeuc6jrahFKtew4+KoqVrp8Ku9zZNI=;
  b=Xk4UwASnq68Et8z9hc3bUGZ1EaJLjiKTsgfjPMERXEEJJY/+05J7K3Se
   ZOorsXXc609uf2eLEDxphWfftD+u5AISzgVw18AV13lqPf6USGve4BG/U
   UQG5R5kRPsugnUqJ5YvBzUwRVFQmsQ4iChU4A+/tkbMLymdMxYf/rZhUz
   IpQ3pjKyB8GBq/8IVsOF6zCZC00x+4NUr0gwUScCA9qLZbQX5Ot/C+iSS
   JC1KPvgR4ppYRmOtYOAYGPJSm3HCjo1TiM6d89XcqQMPl5aorLzYLcdaT
   3dnsGhIeCpM3f37EKuUIeP7sBuJ0L5Yq++NRiaNSENQTGlKoIFjQDlv9W
   w==;
X-CSE-ConnectionGUID: CuEzYEkTTAanEN7IviJDSQ==
X-CSE-MsgGUID: uHZKJaTcR9uqXNECCmVhlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="77668638"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="77668638"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 08:15:57 -0800
X-CSE-ConnectionGUID: BR9CUGNcQKWokzMxD1rkmQ==
X-CSE-MsgGUID: R23OAB8VQeaOpugbFs0H0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200474417"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 08:15:54 -0800
Date: Sat, 6 Dec 2025 18:15:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>
Subject: Re: kernel/trace/bpf_trace.c:475:35: warning: diagnostic behavior
 may be improved by adding the 'format(printf, 2, 0)' attribute to the
 declaration of '____bpf_seq_printf'
Message-ID: <aTRWuMNDMyjM6OYu@smile.fi.intel.com>
References: <202512061425.x0qTt9ww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512061425.x0qTt9ww-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 06, 2025 at 02:44:24PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f19b84186d297063a1006ca9e1c8597f77a75581
> commit: 6b2c1e30ad6846624d935a7ea98dae60458126b8 seq_file: Mark binary printing functions with __printf() attribute
> date:   8 months ago
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251206/202512061425.x0qTt9ww-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061425.x0qTt9ww-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512061425.x0qTt9ww-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Not an expert in BPF, but the compiler recommendation to add __printf(1, 0)
sounds reasonable to me. Anybody to confirm that and/or send a patch?

-- 
With Best Regards,
Andy Shevchenko


