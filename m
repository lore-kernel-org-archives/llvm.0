Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368CA3ED3D8
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927831; cv=none; b=YWuP5OQBgpDnZ0Egho4sNBivlFLNsuRZCob0JK5UMGSea5taG1E/3oMTMH26H+bDZg0SyO+/Amunz0QDaxIp7CfF7k3xh/unzpzsatJnS7S0eS2Sc5XLqHSxQwR8KKgmFNRmVICwPBBpAtNlLGCju8HHXX5kWtRvHYYbLF7QaL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927831; c=relaxed/simple;
	bh=ZsucKRzo2JOGX6CiLW9zcJ7BuvS5GY7TcqIkPJgStD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1jBEBa6iYzOShAUnlicubLcg3pBDThX+jKBJ/iSmUU6B/41NzPy/7wy9bLvqZszK3ChU8awUMpKhxv7BvqvAEcbLHhwNIY0MloYrGszBrbFoxODKBpbnxH5fkqFqVttPOMJ7HEeud+/5N0gbIrB0DUFSvqsdV2oltz1dvUjr0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMztuGeM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMztuGeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790927830; x=1822463830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZsucKRzo2JOGX6CiLW9zcJ7BuvS5GY7TcqIkPJgStD4=;
  b=WMztuGeMt5xZinsJH/xta1LxfINV78idZNaP84MYmlkoTGEkPl5kDjXx
   zV4qDOVC6NgFexSHMF2RB2V5Ua0sqvnO1cJpAuLqA1ONDHoPn5pGQ1awf
   JJh5CQ1ylDa6crfcbRBnXf0NOv6GPhFa7NbH/R2WBGNRMVPbDHWzctIaV
   9eS22yrgZYurbOtBm0GzAycrNT17AhbRDEh0lY76hqgvLtTJEvsWh8tM+
   dhMG7U082zp8eJct//l2LVpuTlZvVVsCBpgmFQUqVi+DW6aBHq9Oe2tgx
   fxVmxGnU6Jn4cHVJoKQCh+Icntn9Y7k4gVczVN7WDaIpF+zjkNZ142BqZ
   A==;
X-CSE-ConnectionGUID: jVOdxyaRTyCqRT6wFybrUw==
X-CSE-MsgGUID: cQ0gy2uWTgKinI3vwHMnQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90460489"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90460489"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:57:09 -0700
X-CSE-ConnectionGUID: H8G9kGd0QwuBL06wo47SJA==
X-CSE-MsgGUID: BCUq98xbTG+b5ZiIkPdAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274287331"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:57:06 -0700
Date: Fri, 2 Oct 2026 10:57:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v11 5/5] iio: pressure: dps310: assert the lock at
 runtime too
Message-ID: <ar9j0O7DdJ7O1DVk@ashevche-desk.local>
References: <20261002072526.250081-1-zoone.rupert@gmail.com>
 <20261002072526.250081-6-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002072526.250081-6-zoone.rupert@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 02, 2026 at 10:25:26AM +0300, Rupesh Majhi wrote:
> __must_hold() is clang only and does nothing in GCC builds. Add
> lockdep_assert_held() next to each, so lockdep catches a missing lock
> too.

Suggested-by?

But we need to hear from Jonathan and others if they like these annotations in
a mere IIO driver.

-- 
With Best Regards,
Andy Shevchenko


