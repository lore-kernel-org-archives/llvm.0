Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F01265CC5;
	Fri,  6 Jun 2025 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199818; cv=none; b=P7iYUzECfyEZAJf33e+gNostH6//7bLj8Er51V51av8SL87g96jTi1uvy6SihxUkMnMJcVlLD5B/UZ+La+X0HzxpoIWili7hCsYfsSKGEXDPv6e25ncCb2Mk8YReW544MRS4YFG6ec3EDb55cME0+mTZPeyfuRFBhIbiHZ73BKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199818; c=relaxed/simple;
	bh=88yyzmoVei/0kAR59Zn18QJmxgJ+Psm3nVy5MwV12t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY2qs5oYp1n3WhrCULo+22KLK7RA2Y86wCq9UdaaP0m/jJBzAImdEloCdcyznooMVfq/vW+cMXu00PLVqUoPh8O6qRxE8mA24GnVEti906PvxQCiVcb7geJgom+Gjc/5UO9nDgRbDWrW4mn6P0QTUDzc9zcmUyzbTc50qyEuwlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jpGKPZsa; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jpGKPZsa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g2mmM0Hm8i0Nmu2E8MI7iFNf1jatd3lN0x3ayh1jAbI=; b=jpGKPZsa9kmzqX4RXlyPJI8Bq9
	DB/X8lxFPshdGE2cqCHgZCHDBKiwfMZv7zx1lXvbBztH4JWYv3vYm37WseTVfC27mbybE8zr8vOQc
	84n1pMkUHraoJ2TgbfbMvSGY/Ng2f/rsul9Z+srptUitqPpgxxnYUb3/7ORkOfLlLsSzUqGre/+pZ
	PZPHOb3RI7rZdNvvDVxO5v5MTmdW6PtN9cc5ros/aYhgK+X/Qq2oWZ/F9i6gZMaU0bZNA8ulAVzXl
	9yFSsMk7vhGoyzrCQmMbzAPMNrLSZrAonGf/4ew6ceAkns8zWqJ1/8FzGebo27npq/82bfOYqPeIa
	3zOZAf4Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSmE-00000001Fjl-1Q7u;
	Fri, 06 Jun 2025 08:50:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6F44F30078B; Fri,  6 Jun 2025 10:50:13 +0200 (CEST)
Date: Fri, 6 Jun 2025 10:50:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [peterz-queue:x86/urgent 4/5]
 arch/x86/kernel/alternative.c:264:14: error: call to undeclared function
 'its_alloc'; ISO C99 and later do not support implicit function declarations
Message-ID: <20250606085013.GX39944@noisy.programming.kicks-ass.net>
References: <202506060355.7UJHIyDa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506060355.7UJHIyDa-lkp@intel.com>

On Fri, Jun 06, 2025 at 03:23:09AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
> head:   e87348e4a2daaf44da409991ca751e8844b27ef8
> commit: 01c48b9466bf0ecf95821e3ea1a58b876c4e8aaf [4/5] x86/its: explicitly manage permissions for ITS pages
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250606/202506060355.7UJHIyDa-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060355.7UJHIyDa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506060355.7UJHIyDa-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/kernel/alternative.c:264:14: error: call to undeclared function 'its_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      264 |                 its_page = its_alloc();
>          |                            ^

*sigh*... obviously I failed both typing and compiling before pushing
things out. Lets try this again ;-)
