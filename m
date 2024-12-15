Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E37A47
	for <llvm@lists.linux.dev>; Sun, 15 Dec 2024 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734297704; cv=none; b=pUebYOXnmewOL1ktGOEKXO7BlveRrmmRrlpzLvzzwKfCnE5OQQL40O4/7dW4rHqJRW7FR3i0RBoacva0d7RflWEc6kE59ZCm6i1N/7O61uFAQ4hJLye+tYVwU68X+b9f1+4tQi0YUdU9eNZkfv46bVybleU8WUzi9CkX34Vp3Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734297704; c=relaxed/simple;
	bh=uiu/rZ/2h6Qatpt9tW0lKhnaaPyKFAIk8arm/WnIjxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or/8GYfh+/yCUWxPtkKWkklq/rZ4I8PZ79rZGGPG+KYxVAxsniRrpS/ZtsFpXIUzU8TpSXauSLrRx+9SZQBJ7Jc2CO3YP2mFPCHpvjLzWTh4p1i1JGPNM/DJM6c6/aCqQJo8xR/0XpjW6qV5/Z+yINJLJq6VBpsZqe467iCDx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZqZlbEJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZqZlbEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734297703; x=1765833703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uiu/rZ/2h6Qatpt9tW0lKhnaaPyKFAIk8arm/WnIjxk=;
  b=KZqZlbEJ6bNCj4IP2As8/oDRLnLWmrce7oOHyoPVKMCgZEeinR3Ggw6p
   5+OqZGeZv9f9OjGf3T63ZmFY+0DJ4oC2VWZoIGElC3HhpeDD8uj8/a1in
   tz3Mn5udtA8FosC4UNlgIk5u8fMAu1xtxIV7qGOmDpJJ+9G2IponluoCW
   aSMOLwSppYp3V23KOOIuTU/MJWmj6IejjcAIYfOeKN6mwjHggjrNS9k35
   i8FrtQ8OGATN3wTMrxRz2QMsK/twv23gtAEDmR4vRz9QgNS5jtEl5cx1M
   MBn7fUICd3rc9HV5R9OrbJbDDVOiNJRzgD8aoCerQIYF5H1XF8FW4njt2
   A==;
X-CSE-ConnectionGUID: Pw0YFyTiSTKUfj9OM/bFyA==
X-CSE-MsgGUID: p5aA233sT+GcEC1Pqj/+rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34587815"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34587815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 13:21:42 -0800
X-CSE-ConnectionGUID: oXvty+OoRfu6br3VSFEaZA==
X-CSE-MsgGUID: z4a6q6FYTV2Pjkl9EiFNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101598138"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 13:21:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tMw3V-00000008KL9-0CQw;
	Sun, 15 Dec 2024 23:21:37 +0200
Date: Sun, 15 Dec 2024 23:21:36 +0200
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
Message-ID: <Z19IYHyBbxf4csGB@smile.fi.intel.com>
References: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>
 <Z180HFO6a61PtzYm@tardis.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z180HFO6a61PtzYm@tardis.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Dec 15, 2024 at 11:55:08AM -0800, Boqun Feng wrote:
> On Mon, Dec 09, 2024 at 07:08:10PM +0200, Andy Shevchenko wrote:
> > When chain_hlock_class_idx() is unused, it prevents kernel builds with clang,
> > `make W=1` and CONFIG_WERROR=y:
> > 
> > kernel/locking/lockdep.c:435:28: error: unused function 'chain_hlock_class_idx' [-Werror,-Wunused-function]
> > 
> > Fix this by marking it with __maybe_unused.
> > 
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This looks fine to me, so I'm going to queue it, but could you do me
> favor if you could share the exact configs that would make
> chain_hlock_class_idx() an unused fuction in kernel/locking/lockdep.c ?

I might harvest this when I come from vacations (some around mid-January).

> I might add these information in commit log.


-- 
With Best Regards,
Andy Shevchenko


