Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBB32AAD1;
	Wed, 25 Feb 2026 22:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058195; cv=none; b=hERR3aj1m7WysntodRId9PFVt+2A4PQTcls5zbrR9JpZ3tIDsD0UHr3e2dFt6X7o6sOLTpLEY38I775Ps0/DsqeuPvR8tNVcwi/YA/l3bhINnLglyGzvH+Q4wc/ZbKfn7R8Ugg+BEQ0XfWbkq5fwgx/ABrE8LbclkrgBJ53QpnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058195; c=relaxed/simple;
	bh=UCsGgwb2GrSNlin1aY4ZbuuW16qaI6AY56aFJsuqHoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRV47se8NJqCP1Lr1uEHuEIrL9QpGTOV4sLHyM8ifVm9erm9Rhgh+BYp+ducRIdCWlwBl3BtwMALujoA09TzPR6GJ+NU5d5rpNL3Akn4RaJHQ2Cx+Mg6hClX5QjBmgCI/OuDsmwn3oOBwJY4WhZ6jtTwNa6wwfj7SUNH5ss/ae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jK74oz8t; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jK74oz8t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1barFty4Bo7aX9Xad6stVkzMQrWN7UjAZzcAxpzX3v4=; b=jK74oz8tfjo09/5V1ByikeC7pk
	nG6OP19MxyPThJ9LvipnmPP/UWPe4hy+2vvuedWrSEcP6By/N03AYllPEJNjm84Au7H2NwPtj+RC3
	YxJw6x5Iteq8OreofTjj73OTx6aJGiIeZ2I4LaomIjGijfCZ0wBincbuK7y+shMGROyE71bl/B3DJ
	u4fxjxcwgU/su67J0qynspAyi//CFnLRgZzsqmhxvk3+ee2ywpQ7KpiwVwSpXY/KE2mCOr99khfhd
	sc8mYOEdu2teFgHxmzNE5qDqozbV1JKy2bEvy9s4D8+2dw7GSjyKJWYOT/c/8ihQ5W1K47cPShakS
	L6LuNb8Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNHe-00000001jq6-3rnw;
	Wed, 25 Feb 2026 22:23:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A8FE730095A; Wed, 25 Feb 2026 23:23:05 +0100 (CET)
Date: Wed, 25 Feb 2026 23:23:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, pkg-llvm-team@lists.alioth.debian.org
Subject: Re: [PATCH] lib/Kconfig.debug: Require a release version of LLVM 22
 for context analysis
Message-ID: <20260225222305.GA582287@noisy.programming.kicks-ass.net>
References: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
 <20260225145228.GB1282955@noisy.programming.kicks-ass.net>
 <20260225185357.GA2755225@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225185357.GA2755225@ax162>

On Wed, Feb 25, 2026 at 11:53:57AM -0700, Nathan Chancellor wrote:
> On Wed, Feb 25, 2026 at 03:52:28PM +0100, Peter Zijlstra wrote:
> > On Tue, Feb 24, 2026 at 04:16:30PM -0700, Nathan Chancellor wrote:
> > > Using a prerelease version as a minimum supported version for
> > > Peter, could you take this for a 7.0-rc?
> > 
> > Yes, I can.
> 
> Thanks a lot!
> 
> > I would however appreciate the Debian folks to quickly push an update
> > to the clang-22/experimental package. Otherwise I can't run this fancy
> > stuff myself no moar.
> 
>   https://packages.debian.org/experimental/clang-22
> 
> claims that the experimental clang-22 package is at 22.1.0-rc3, so you
> should be good. 

Ah indeed. Operator error; I forgot the -t experimental and apt claimed:

  clang-22 is already the newest version (1:22~++20251023025710+3f47a7be1ae6-1~exp5).

But now I am indeed at 22.1.0-rc3.

