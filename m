Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0882E5437;
	Mon,  8 Dec 2025 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211190; cv=none; b=ki/14jjs+BPYEMFL8rYv6/bUPlkCGqpQpS5S6vGKtJy9T2WMfdf1dEHTPHSlYuuXt2WE88lkisltDxJ1qVySWZF/oHk4BhtN9Mu7ZG2233ZVFyDXZnqETzSzuHpAQcm0QyKB+d+4g0UwXgrqOOQbg50+TxQb9eH3caLD4F+fAHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211190; c=relaxed/simple;
	bh=KVuj2x7GaG5xyxCXNTE09TCfDYelRFBr39ud6i5fUf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSlmG1Qy5xzE0ipU15bNlD/EL55FbLkB2uyb1hLMZMUrvQ9twZge2QT6tiuQHLfDRDiAAn1LVL61cE/jsxv+asUdu2DgSwuwXon4cezQL7LcBwen2hCiTk7G2cZpHGQexeeA/OyErFgRRiUA1NtRfGbr+/20vl469a0WeGXcPFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fr8GB7Ak; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr8GB7Ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765211189; x=1796747189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVuj2x7GaG5xyxCXNTE09TCfDYelRFBr39ud6i5fUf4=;
  b=Fr8GB7AkOaTy/ZtZcyrERGa4oHTmrC8HdjumgVFYcPzaSq00Pf16iLPO
   Xg7Nghq+8Hvr2qSidf7SycMuuJBYyT8Xexc4NPfq/9Z/RwCojRKiPZkMf
   LddJJxXXpIsyLyZ4mPDpLwvqC1EYHjbKNN0VYYrPxE/8Z6Woh+fbcnMGE
   Ur99PWBy0U+p/grGTzWTtwwhyJ1RkMYfSI3TKGWVbl0btejjg2Tj9KpoU
   TDEG9zHpDzMr7RZov6uR2kpn82pvSF9KlL2r9qrGwNmg90aeWuQkQSJuQ
   ZuQLRCRzmwbZXR+Z84p9Uj/LNQvBj6AKguC2mQw9NGYUnjWkHvmvhDhvK
   w==;
X-CSE-ConnectionGUID: XljPGEq0QQeuLtfdIW9dUg==
X-CSE-MsgGUID: hpkyhU/0Rxqt7I1z2JWyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67234790"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67234790"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:26:28 -0800
X-CSE-ConnectionGUID: EAQ7FV6NSH2NnWU7lqHa6g==
X-CSE-MsgGUID: XefRYCUARO28Lpfl9z+9EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="200421708"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:26:27 -0800
Date: Mon, 8 Dec 2025 18:26:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>
Subject: Re: kernel/trace/bpf_trace.c:475:35: warning: diagnostic behavior
 may be improved by adding the 'format(printf, 2, 0)' attribute to the
 declaration of '____bpf_seq_printf'
Message-ID: <aTb8MDNm2KiOpJTl@smile.fi.intel.com>
References: <202512061425.x0qTt9ww-lkp@intel.com>
 <aTRWuMNDMyjM6OYu@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTRWuMNDMyjM6OYu@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 06, 2025 at 06:15:56PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 06, 2025 at 02:44:24PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   f19b84186d297063a1006ca9e1c8597f77a75581
> > commit: 6b2c1e30ad6846624d935a7ea98dae60458126b8 seq_file: Mark binary printing functions with __printf() attribute
> > date:   8 months ago
> > config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251206/202512061425.x0qTt9ww-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061425.x0qTt9ww-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512061425.x0qTt9ww-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> 
> Not an expert in BPF, but the compiler recommendation to add __printf(1, 0)
> sounds reasonable to me. Anybody to confirm that and/or send a patch?

FWIW, I just sent a patch
https://lore.kernel.org/r/20251208161800.2902699-2-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko


