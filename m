Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1634C77D7;
	Wed, 21 Jan 2026 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008747; cv=none; b=D1fYYb/RgRfYRQiSEmoAikJnbwk8X8PUpGfnTzogBp49yUbdtD1CtBhW2hcllbBZY6momB9T2FunokPsOwZY5u73fACW+/JQhn0eO6zLNeaiFMUJA8R17h3+ld6LIsflH4BqUcjYW98RGShziYTYnnccFk3UBRjeBkiaBON+CHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008747; c=relaxed/simple;
	bh=Q8OIlFojfFeRC7/t6+aslxY9unT1FVnXdwdcx9u9f5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQNiM1QPgDCN2zNy/KSY1l8gPFAqLMdjvEzYx5jcqcvdmuRZW2jovnNbXZOOou9eAuncJmESz2Ignijy6NNpT3fJg3vBCOds7snNMZx02WjkYgtR8ROVYtPwHpTp94ZJXNx/VW8Htoo7hdDyUZrOdp4gN94DOWkHGcuipR48WvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q0BmxUh8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q0BmxUh8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U8iG7uCC98OcehrzMmcFuGQMuH8ZHnkKGw4MU6ErNmo=; b=Q0BmxUh8ddW+4Ng5xpTHrPzbu4
	yhGKxCa1XSO+OHYGHt8FkFoGjcM4IST1lYgAehVvpEdfYQH+zn/GgwVIXrOTUq8/X6n+PpDiELb5X
	uI6xaogjCUmN+M16ibPJVV72dk+75iXiOmyyhp5LQkQiD4nz90xpr9ytT4d1phs8PzyC6BrZORyKG
	JJMklkHaEbsfAQ3q1VQLBIXNY721NzqSb246UQl0abk0oeEk8r+Zn5yrpNJ5VFu7i4FAo0vGCi3pN
	FthuZlZz6DSGHH9qQM0GceBcysC3/XShz+LMqT1GwUqIeh2kmVOUSnzlnxNrmgK7bB+BaxZKVdYj6
	/ykzHu5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZz0-0000000GWWm-2cfj;
	Wed, 21 Jan 2026 15:18:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 80FDD300329; Wed, 21 Jan 2026 16:18:57 +0100 (CET)
Date: Wed, 21 Jan 2026 16:18:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Marco Elver <elver@google.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [tip:locking/core 24/43] mm/huge_memory.c:4055:8: warning:
 spinlock 'xas.xa->xa_lock' is not held on every path through here
Message-ID: <20260121151857.GF166857@noisy.programming.kicks-ass.net>
References: <202601212251.RuHvsKd5-lkp@intel.com>
 <20260121143100.GC166857@noisy.programming.kicks-ass.net>
 <aXDuAoDeFOhHvHAP@rli9-mobl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDuAoDeFOhHvHAP@rli9-mobl>

On Wed, Jan 21, 2026 at 11:17:22PM +0800, Philip Li wrote:
> On Wed, Jan 21, 2026 at 03:31:00PM +0100, Peter Zijlstra wrote:
> > On Wed, Jan 21, 2026 at 10:27:16PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> > > head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
> > > commit: 6e530e2e31191d88f692e6c8d3bd245e43416e4f [24/43] debugfs: Make debugfs_cancellation a context lock struct
> > > config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212251.RuHvsKd5-lkp@intel.com/config)
> > 
> > Again, that is:
> > 
> >  CONFIG_WARN_CONTEXT_ANALYSIS_ALL=y
> > 
> > Robot folks, could you filter out those configs from the randconfig set?
> > At this time, it has no value reporting these.
> 
> Sorry for the meaningless report, i will update the bot to disable this config.

No problem. Thanks for removing it!
