Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F10D80038
	for <llvm@lists.linux.dev>; Mon, 23 Dec 2024 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734980132; cv=none; b=dcqQv9qk2SETKzifZV9k2BXXa1VNUqGTQ7mfvsJeoO6EhHvgWr7YOdKqCX/N6NjWlPZBPG10XyS/TgmyBIEBc2E17wa9NrfePQS1ip2xjMCcoZ7/dGHT4BcH0K1qlk7HqA5c+aQirPWgJ+fgrjjvLCnoW2ffXFF/IUn4+RMfZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734980132; c=relaxed/simple;
	bh=2JUHKeXXCO+hNnHI7mGd6qzcDXyKO5uUiu9uU29A38U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPnA0bqRxLiGtxIkcL6z1jb9eXh8hMS9icSks+EZAKacVxaMbh1rY4/MLpv0rkfQMXaNphLPl5noJ1//q3heFWx1fpctlq1yfcj3L+Rr1jHGxpMVlV1LCZuR9Z3jinQrbMA0JkEJlU/jSWfg62q6vDNahokASoCvkA+j3lM8bFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/y8wg55; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/y8wg55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734980131; x=1766516131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2JUHKeXXCO+hNnHI7mGd6qzcDXyKO5uUiu9uU29A38U=;
  b=g/y8wg55G6EpgI62VH3otXNq8k133ooFtJXCqtpcmVztH92UMROsRM7m
   wsuYUNKygNfZsMVVDjifS7/0s5YR6DXb4YNe+DarqrLt1hAX/HpCyBmm3
   i50n/Je6M2flPBEgOaqp6AAF8btHLthPK2xwlzizgIZP3+Nq2gE4kyPaV
   FkXmygkbRgNd19HJjvMG/rBfg35Wzw86Vl2qQSJ5X9u3ic9ukLNcfOEJq
   1KDhDsEtWWZZa4Zag51BM65yYu8ZRVm1GFa4bTmHQjmwH77PgLygTBRn+
   5wICELaENCYIf4dMmZU7BgrNDEt9qCRorAMRT12EMPvvPSD9sjPRpm2AX
   w==;
X-CSE-ConnectionGUID: lFkHPCC+T5Cy4yQH15nV0Q==
X-CSE-MsgGUID: qVR29xOlRkyIcZFv9HoV0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46870637"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="46870637"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 10:55:30 -0800
X-CSE-ConnectionGUID: /QCrP3JqRsaqe0C3YofZNw==
X-CSE-MsgGUID: 8k6il3CJTtOCw/0DZW2KsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99642765"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 10:55:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tPnaO-0000000BPQO-3DOV;
	Mon, 23 Dec 2024 20:55:24 +0200
Date: Mon, 23 Dec 2024 20:55:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Mark chain_hlock_class_idx() with
 __maybe_unused
Message-ID: <Z2myHFiOHpozKZsk@smile.fi.intel.com>
References: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>
 <Z180HFO6a61PtzYm@tardis.local>
 <Z19IYHyBbxf4csGB@smile.fi.intel.com>
 <Z2SWypPS7Lc2CXb6@tardis.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2SWypPS7Lc2CXb6@tardis.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 19, 2024 at 01:57:30PM -0800, Boqun Feng wrote:
> On Sun, Dec 15, 2024 at 11:21:36PM +0200, Andy Shevchenko wrote:
> > On Sun, Dec 15, 2024 at 11:55:08AM -0800, Boqun Feng wrote:
> > > On Mon, Dec 09, 2024 at 07:08:10PM +0200, Andy Shevchenko wrote:
> > > > When chain_hlock_class_idx() is unused, it prevents kernel builds with clang,
> > > > `make W=1` and CONFIG_WERROR=y:
> > > > 
> > > > kernel/locking/lockdep.c:435:28: error: unused function 'chain_hlock_class_idx' [-Werror,-Wunused-function]
> > > > 
> > > > Fix this by marking it with __maybe_unused.
> > > > 
> > > > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > > > inline functions for W=1 build").
> > > > 
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > This looks fine to me, so I'm going to queue it, but could you do me
> > > favor if you could share the exact configs that would make
> > > chain_hlock_class_idx() an unused fuction in kernel/locking/lockdep.c ?
> > 
> > I might harvest this when I come from vacations (some around mid-January).
> 
> After some investigation myself, it turns out that
> chain_hlock_class_idx() is defined outside "#ifdef CONFIG_PROVING_LOCK",
> but only used under CONFIG_PROVING_LOCK=y, hence the unused warning.
> 
> TBH, I feel we should really clean-up/consolidate those "#ifdef" to make
> internal definition/usage more clear. But nothing blocks this patch, it
> fixes a real issue, I will add the CONFIG_PROVING_LOCK part in the
> commit log. Thanks!

I take this as no AR from me needed anymore, tell me if it's not the case.
Thanks!

> > > I might add these information in commit log.

-- 
With Best Regards,
Andy Shevchenko


