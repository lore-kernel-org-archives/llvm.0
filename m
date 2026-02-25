Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C233D3D13;
	Wed, 25 Feb 2026 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031157; cv=none; b=ZrgpAM9vTf6Z6JnMUoPE92R1JtbqKN4sj5q18VEolEFHS4USFK686D4IvKYiWh/uTK2ToTGSEePBOVMQj/NqNtiKoc9NqGd9uC62gzi8qviW1Ztp4a3i5D8od4VAR+csyUXJYW0+R/rRgqSWGpsMpN4YNWkiDT/zNnwKONqQ3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031157; c=relaxed/simple;
	bh=kSsYurrjq+HVio58mv6AlOarPbhXO6aMR7kWxEXa7CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg5H1JivNhnPXfuQtusc2ct2Ls8O5//+AJRwuxm97TFSa4EbjmArHZCxSFh8bmB5H3c81wiQigurJ1JmgsY8B/fXKg+mysLGoQXb57E6iv5aG+HLVvde6b9WB4bJa1Lcbzskz+oYXesKOiFj1DxXRBkXF7Jb9IxEylmgGSZJXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MvlHQzRi; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MvlHQzRi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cro4zRxAz58bxQYP6rD+ggmqTIfWBGWN80fbbob5zHE=; b=MvlHQzRifbIvb3VPHIVW+QfHJf
	nv1XXo5euG6wYXOdatVx6nf0KRb0Y4s4slIY8hhQ1Sq8Jg2QxyRbwHkIu5+zdIfvzBV6sJU1tr9Ps
	/p/hljevennHdQ1qITDTLeQjZlKFetKRoiJ+J4U3QcQYmfUjN4LmKqRDKTxMO2zWHqnx3KZmqkONz
	ZWUApbsTdGZFBhh3FdWNXn4420J7Uh/8HLwRhWe0mDuhNQcRjEJd+4trywndHP0YAaRT/FNn2Xwst
	GI2Ja/vrvCm+822A/aSPqy5LxtZts1Y4tlt26CbfhvaaF8odsyWIXf2l1UN9dIWPFho63egbKETLo
	9KH7YojQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGFa-00000001CSC-0Kg9;
	Wed, 25 Feb 2026 14:52:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C1D3E301BD5; Wed, 25 Feb 2026 15:52:28 +0100 (CET)
Date: Wed, 25 Feb 2026 15:52:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, pkg-llvm-team@lists.alioth.debian.org
Subject: Re: [PATCH] lib/Kconfig.debug: Require a release version of LLVM 22
 for context analysis
Message-ID: <20260225145228.GB1282955@noisy.programming.kicks-ass.net>
References: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>

On Tue, Feb 24, 2026 at 04:16:30PM -0700, Nathan Chancellor wrote:
> Using a prerelease version as a minimum supported version for
> CONFIG_WARN_CONTEXT_ANALYSIS was reasonable to do while LLVM 22 was the
> development version so that people could immediately build from main and
> start testing and validating this in their own code. However, it can be
> problematic when using prerelease versions of LLVM 22, such as Android
> clang 22.0.1 (the current android mainline compiler) or when bisecting
> LLVM between llvmorg-22-init and llvmorg-23-init, to build the kernel,
> as all compiler fixes for the context analysis may not be present,
> potentially resulting in warnings that can easily turn into errors.
> 
> Now that LLVM 22 is released as 22.1.0, upgrade the check to require at
> least this version to ensure that a user's toolchain actually has all
> the changes needed for a smooth experience with context analysis.
> 
> Fixes: 3269701cb256 ("compiler-context-analysis: Add infrastructure for Context Analysis with Clang")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Peter, could you take this for a 7.0-rc?

Yes, I can. I would however appreciate the Debian folks to quickly push
an update to the clang-22/experimental package. Otherwise I can't run
this fancy stuff myself no moar.
