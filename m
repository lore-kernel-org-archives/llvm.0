Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9627510E;
	Mon,  2 Feb 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770048344; cv=none; b=krQY1PleXv5LxRzQYF3XakvqpyYFtqwQsWl1jY8OCHDsinxvgaAfKcRViKqY+cbvehuKi06gA9Ct2PC/YApYzxAMPbqL9ulCpl6ulY5UdHd2PXge910VusOymIW7s0f4j7YA258dWevTuvCabHwgbOWow6vyL1+9reHndCpFXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770048344; c=relaxed/simple;
	bh=cXGxG9ptyveGKRS8+OXlF+IZh2FPotdwQhMWSK78fFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWtDPzkyqW395JOOWanisimavMeZjIAgqofw4gDPzM3Tb95Yb9+0BfLduJYM9ZwPWIMisurKsABH+CgNI3vYxgCJYIQVO7lTtA4OgmUaLYLCMfyvgJDNgGGQMZdL+wyK85ybP/MhcapXAjphwm117f/vEmNu6QTmfCcGPlFkjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOhjTnK2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOhjTnK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22AAC116C6;
	Mon,  2 Feb 2026 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770048344;
	bh=cXGxG9ptyveGKRS8+OXlF+IZh2FPotdwQhMWSK78fFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOhjTnK2CkLobKfALOdCNjeYkr79hIC2K1lkzcSRz57R+i1muxRf0yENJjpsaj8cz
	 I6hqYyhovT2sDJa20oj9meKga0c04zh5Lpjyk3PvdFIvhTVWCStjacQmpwcglFWkjF
	 8jNb/Mz4xEpROV1bpJXzL2nl5JBTzV46IvRwDP8anJQOl8yReK0Kce6169lGNgZLJt
	 uqMCjBtBpWpAh52yfNTzpSbE3LLGPYY24UUStVKW1u1/4AHyIyDnmL7dZMCgT2k1gH
	 wCvSj7ZU4yinaVxWgAL2xi+aY4TE5tHvC5xvxitBSt7s9w3XxpvasRxY76jEWJOITR
	 +R71ti3IaqLfA==
Date: Mon, 2 Feb 2026 16:05:38 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYDLUhWMdvzKpTK9@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-3-elver@google.com>
 <aYDEiOutq3_O8irP@willie-the-truck>
 <20260202160139.GF1282955@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202160139.GF1282955@noisy.programming.kicks-ass.net>

On Mon, Feb 02, 2026 at 05:01:39PM +0100, Peter Zijlstra wrote:
> On Mon, Feb 02, 2026 at 03:36:40PM +0000, Will Deacon wrote:
> 
> > Since we're not providing acquire semantics for the non-atomic case,
> > what we really want is the generic definition of __READ_ONCE() from
> > include/asm-generic/rwonce.h here. The header inclusion mess prevents
> > that, but why can't we just inline that definition here for the
> > 'default' case? If TYPEOF_UNQUAL() leads to better codegen, shouldn't
> > we use that to implement __unqual_scalar_typeof() when it is available?
> 
> We are?

Great! Then I don't grok why we need to choose between
__unqual_scalar_typeof() and __typeof_unqual__() in the arch code. We
should just use the former and it will DTRT.

Will
