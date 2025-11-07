Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B429B8E8
	for <llvm@lists.linux.dev>; Fri,  7 Nov 2025 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501561; cv=none; b=G67a/GqZlpwopFKczwwrzh28cLk+1T1KmXsnv2xxj5Plyr/USu3rrgfxxUNdwmndwP+Z46QZdBNjJqXQuOB570H9gK3B1e0qN5o1V0oqDil5H8Fhx8Rc+B6Pdw3ITnkNXGKKD0jUBajoGiVaLKcSB2bcrT9Q+A9pCaXNduEBDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501561; c=relaxed/simple;
	bh=+diiEQPiVT7tccwuYGJss8sQks1bsZk0Dz/jt7Hp4MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHKQib3HVmsDPyuNz9pSgGDc4csVHuimsePfopkN13W+60jEIyVJ+AI9pYVmRQeo73rDwfUs9yGjwSVeZYkJNlLzTzSi9hIMHv8tEtKff0rS041l5whFG5jzCBUKh7rJQVNZNdb8hcWtgH6Q12TusnhCNZ8TcHWRnYN1Oaw+TG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUSdhOz8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUSdhOz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762501560; x=1794037560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+diiEQPiVT7tccwuYGJss8sQks1bsZk0Dz/jt7Hp4MM=;
  b=hUSdhOz8ZtTULBZWKc6e0PCGBaEYghKrTVjXQaZ1Flcfy6rAgnIKFqBE
   2VAjDJX7GClqaN1UNNGNCIn2tMabS+IN0cwirOj40UkyM1edPf0fmOatP
   ZE0mUF0RxJ5VfMDTu+HIsrHNlpaF+8o/SgiXbIywejaGSoIgVchh5VPoC
   in9tyE0oF/He5QzpxrecHow9dnuU4xszv4hw0yjxLgc0jN9E+sLtg64UY
   eYR0HhEzzpquvpIh9LTQumFZxKOgazPbaacAIrQDkMB8SxbbnZx645Vqt
   0Xy/fOMPdQtRReQygXlinSXEui5nFhHW2T3QOHlW8yAxnUT5DahaGlVJW
   Q==;
X-CSE-ConnectionGUID: 3uz2aIGURgaino/kpVr6mQ==
X-CSE-MsgGUID: Mq4ClnUURMKN22nwEeZHEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64575396"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64575396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 23:46:00 -0800
X-CSE-ConnectionGUID: rodQ50wXSxKNS3HfDIURBA==
X-CSE-MsgGUID: mlPeMpl2R4iQxVCE/GGGmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="218630898"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.27])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 23:45:56 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vHHAP-00000006OJt-2Ugh;
	Fri, 07 Nov 2025 09:45:53 +0200
Date: Fri, 7 Nov 2025 09:45:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v1 1/1] compiler_types: Warn about unused static inline
 functions on second
Message-ID: <aQ2jsZjRLqo8mvha@smile.fi.intel.com>
References: <20251106105000.2103276-1-andriy.shevchenko@linux.intel.com>
 <20251106151649.GA1693433@ax162>
 <aQzGP8Z-mvSS9w7C@smile.fi.intel.com>
 <20251106170616.GB1693433@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106170616.GB1693433@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 06, 2025 at 10:06:16AM -0700, Nathan Chancellor wrote:
> On Thu, Nov 06, 2025 at 06:01:03PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 06, 2025 at 08:16:49AM -0700, Nathan Chancellor wrote:
> > > and we should
> > > probably drop the sentence about removing __inline_maybe_unused entirely
> > > since people such as Peter will never want this behavior by default. I
> > > do not mind doing it myself if I take it.
> > 
> > But future is uncertain, it might be that GCC also gains this and it won't
> > confuse anyway as it might become a truth (no more such warnings in the code)
> > at some point.
> 
> The reality of the situation is that moving this warning to W=2 is
> basically the same as just turning it off entirely since building with
> W=2 is not a common endeavor for the majority of folks actually writing
> kernel code, so the number of warnings will just continue to grow. At
> that point, there is very little reason to believe that we would be able
> to go from W=2 to enabled by default at some point in the future since
> people already do not like it enabled at W=1 where it is not as
> impactful as enabled by default. As a result, I feel like the comment
> genuinely serves no purpose. If GCC were to change its behavior to
> match clang, I feel like kernel folks would still want the current GCC
> behavior.

Okay, I won't object. But so far the patch taken as is, please fold the changes
you mention in it (will require rebase, but personally I don't care, all
depends on your workflow, followup is also fine to me).

And thanks for taking care of this!

-- 
With Best Regards,
Andy Shevchenko


