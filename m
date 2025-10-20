Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB0E34D4C2;
	Tue, 21 Oct 2025 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761067146; cv=none; b=VnNQasHls1bzqS6Qmb6MisAkJLdn4zKBCOwm2FaM+32mdefV94+IovivmDkIpYs1pJo98fQIRT6coZUsBlOwrSAVSRYXgRNNRGsvRL2dxEbqTxAMrjc6hYuSJr5CdHeD3SSphXBtggTKUQGNu2GRHO/2+dxHVn9hajrHvd01By4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761067146; c=relaxed/simple;
	bh=EYCensHCTYsKm3RvolDZoGIf0eSBvV+gt0fZiUhWa2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H78y9qqJAJYlJ2H6/xfl/XjhZHeU5c1XgJ8/WrGRcxCCpTBt7vNh+IJHakFFDLIAwHEkxSGgS5j6Gpkazgsu8lQyeAQ0cInXFX9WciitPSclI9jyBOastUTrjzP9Fpt2APFqchBx354xE1VL5bdo9GjCFNl5n1zOM7sd62CYghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iJpACR8f; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iJpACR8f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l9mMHyRpjZNuARz2M/ntN05dqQHUqrEry8WgR/OKxkE=; b=iJpACR8fALcW3zx4sxeUuZq+iv
	1jyrsXKGsC4gkwKU+RW8kNbkG7rgWSGQMovM9yPLj+yCPYp0glp86xXj3p3+Q0lKaPGqog3ytx/HE
	frEZT48/Vvj9Imreu6aII0MoLe+K6iMzxIHBrzp7eKvNUPAHnjrll/4WYGUOkJP2MTsT7S+MC9PXa
	/+VIUm15Huj/QuBoSWUl+7A5KA2JfVM25XR0iUe3qOBUQpD50gQaGUDbi3G9QD7kXTv2obfMid84g
	mzolNCNemc0Wb6zvid/q7xYTL7tYkYbCBN8lc9zJAlfq1sSg4XNcfDKddiQ3z/JWbavvmvJ+F4NbW
	EJ22ZbjQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBF8s-00000000tBz-1NPr;
	Tue, 21 Oct 2025 16:23:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 90D30303063; Mon, 20 Oct 2025 12:49:34 +0200 (CEST)
Date: Mon, 20 Oct 2025 12:49:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] sched: Remove never used code in mm_cid_get()
Message-ID: <20251020104934.GQ3419281@noisy.programming.kicks-ass.net>
References: <20251015091935.2977229-1-andriy.shevchenko@linux.intel.com>
 <aPYKpJ4MdjlGeILa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPYKpJ4MdjlGeILa@ashevche-desk.local>

On Mon, Oct 20, 2025 at 01:10:44PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 15, 2025 at 11:19:34AM +0200, Andy Shevchenko wrote:
> > Clang is not happy with set but unused variable (this is visible
> > with `make W=1` build:
> > 
> > kernel/sched/sched.h:3744:18: error: variable 'cpumask' set but not used [-Werror,-Wunused-but-set-variable]
> > 
> > It seems like the variable was never be used along with the assignment that
> > does not have side effects as far as I can see. Remove those altogether.
> 
> Anybody to apply this for fixes?

Why? W=1 and WERROR is very much you get to keep the pieces land, no?
