Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44B2FCE04
	for <llvm@lists.linux.dev>; Wed, 18 Jun 2025 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269077; cv=none; b=uxclSkIYfB3K9iRxxLU/drgkfc+7zAlcoFYyvYo1OnhvOTaoXNRsMjj90QGhZl/7fkL38fihuLhyO4yBwvZWBP6WM8V8Do/7whKdJC0GbKFoHO0zp4RqN9Do9BE42yTib7la5I96MLmsltJqtZZQZVfSqbBXZqjY8+Hfqgc/I/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269077; c=relaxed/simple;
	bh=I5P1UIUFVkt0xt/rfqM9sZBndH9SucUrmAiCbB05Y/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVHNF5BD4UiWtev7XMnrfr3wLq5kuJ9+XMCBtZ7YPRYe74/AEit0euAQjltXfybD85AUogI1bmwl9Y/u8MnToZKdKu+IVy0MtB9HlRgZu+YsHMtE5SHZpP+x+f0WgLyi/2QwAxYqpDShgy4qNA3653PUNlj+znuaSDFejrP5Rr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V++ILQiK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V++ILQiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750269075; x=1781805075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5P1UIUFVkt0xt/rfqM9sZBndH9SucUrmAiCbB05Y/Q=;
  b=V++ILQiKqVWgx4uZFQZFDqVRejicdS01k1NbeJdNDDZ9IGwGYzHpLnCZ
   P8Xt9CUrMKOrV/Vq9W4i25Ptnv7IE4JNjgytPT3QMhpc7Gr0BjX3sFXE0
   6SvsFeDQjtl5fcAxMTpN8djVQntBP7/55C4ooIQn7GmnxHJE96tdGzL6Q
   f+V6xuehrnJZ3NeZdpqRfNM04IOhSdhZBAmuYUghpmrMeJzY5viNpeZ5w
   sfrfRla0k5Fb7QECB1hzSYKnNdRSokPzD6dikfPbgh4NlZeMGQJp/h8Jo
   2nOPag5NO6g31H96HORznnYIj6QO7J1yrvsv2Jw2aE+/HeT+5Ddd9LUa8
   g==;
X-CSE-ConnectionGUID: qi5kny2WQkGpsq0ymCQVqg==
X-CSE-MsgGUID: OQVr4UyEQ3uBeMDxYfo/gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52589523"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52589523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 10:51:14 -0700
X-CSE-ConnectionGUID: IZFCaUSzRpaQ+m0R5vfuUA==
X-CSE-MsgGUID: X8IXv39yT3eNFuylF0tMDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="154696279"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 10:51:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uRwwF-00000007oeS-1evy;
	Wed, 18 Jun 2025 20:51:07 +0300
Date: Wed, 18 Jun 2025 20:51:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] lockdep: avoid struct return in lock_stats()
Message-ID: <aFL8i4Uraaw9390B@smile.fi.intel.com>
References: <20250610092941.2642847-1-arnd@kernel.org>
 <aFJL7GW_mdX-VZIR@Mac.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJL7GW_mdX-VZIR@Mac.home>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 17, 2025 at 10:17:32PM -0700, Boqun Feng wrote:
> On Tue, Jun 10, 2025 at 11:29:21AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Returning a large structure from the lock_stats() function causes clang
> > to have multiple copies of it on the stack and copy between them, which
> > can end up exceeding the frame size warning limit:
> > 
> > kernel/locking/lockdep.c:300:25: error: stack frame size (1464) exceeds limit (1280) in 'lock_stats' [-Werror,-Wframe-larger-than]
> >   300 | struct lock_class_stats lock_stats(struct lock_class *class)
> > 
> > Change the calling conventions to directly operate on the caller's copy,
> > which apparently is what gcc does already.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Queued for more tests and reviews, thanks!

What about this one:
    lockdep: change 'static const' variables to enum values

?

(I can't quickly find the pointer right now, but I think in lore.kernel.org you can find it)

-- 
With Best Regards,
Andy Shevchenko


