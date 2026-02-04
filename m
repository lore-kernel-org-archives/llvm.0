Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF87C392828;
	Wed,  4 Feb 2026 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193352; cv=none; b=f5PhaDTB05w6E2BhAZPi63pBsBayYWutwPlprK+afOHgy272csFRA9Y9hsp8r2KOXn5Jlk4rd/dpwtwN4npkczQ6gl7c0N+g3D1JZL5xYP+kKcpFytx6XqBXFw6KS05P6zmS7mLnm1Mthssjr5pDdTnzKQo2fM8sn2eKpl99zXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193352; c=relaxed/simple;
	bh=TxmBGI2Q00vUliMNm3wdicJqoKYHS5uO0EkXxzAWKc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW5rkLdEP6tJ1+6X6Tfp0KAm/VlzgW8Ds7TFFvhSIFiZ9IHLwOGoVxSdtffpwLyhc625/yKDQgEPQFJiZvft8zkIDeh8wOZ+i9lgBhdEGReUfk4JGzWpyQKPOccHmFzMfEFF8IAiYS46KUEShteKHG6D1nWIqyQ9eI44UDYwHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mps3kRyu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mps3kRyu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2SFh0tO6e7FI9zu7vtVLT1z2vtaObvhaNT2qiS7nw84=; b=mps3kRyu9hLV2pqE2dnN9TQqvw
	rUVPmUWjKGRoIZrKWdyg8g/0oNkT1PQmP8DcQXZyPwQMudV3aEZ0r5tGIrOEeTua8vFEeKeiJ3W9n
	D93QhJl7z7BJfZ+4XHFT6xFMv12Bmum4OqDdz8YH1DO4BsTC34y4YHwEDTjPMydyk0WG+WX7J74F2
	5I/RPbnOzXwQSeGwUiKoUhjctl6JSRewdX4JfvVmePcIkpT9hFjYawaAxYz0J+KpgtGUXcPUVpbdq
	zRY0GPhMxbtc9V2RJKKMpvxFyyE8tKcaRLk6Ul6qRS9uMbiSfvD/PSCqcFrvD88a2zQI10uhnQHqP
	HAm521rQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnY9b-000000007CQ-3301;
	Wed, 04 Feb 2026 08:22:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1F250300E8B; Wed, 04 Feb 2026 09:22:21 +0100 (CET)
Date: Wed, 4 Feb 2026 09:22:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: kernel/futex/core.c:604:23: error: cannot jump from this asm
 goto statement to one of its possible targets
Message-ID: <20260204082221.GC3016024@noisy.programming.kicks-ass.net>
References: <202602030343.HVSlSqJ1-lkp@intel.com>
 <20260203035603.GC52989@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203035603.GC52989@ax162>

On Mon, Feb 02, 2026 at 08:56:03PM -0700, Nathan Chancellor wrote:

> This appears to be the same error that necessitated e2ffa15b9baa ("kbuild:
> Disable CC_HAS_ASM_GOTO_OUTPUT on clang < 17") upstream but this is just
> regular 'asm goto', not 'asm goto' with outputs. I had noted during
> review that change might not be sufficient to avoid the error in all
> cases:
> 
>   https://lore.kernel.org/20250916184440.GA1245207@ax162/
> 
> This is not the only recent instance of this error because cleanup
> macros are becoming quite popular so I think it is getting to the point
> where we will need to raise the minimum supported version of LLVM for
> building the kernel to 17.0.1 or newer to ensure that we have this
> fixed. LLVM 22.1.0 should be released in a month or so, so I can look at
> crafting a series for 7.1/7.2 that does this bump.

Works for me, more recent compiler more better and all that ;-)
