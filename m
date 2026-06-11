Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AC30DEB8;
	Thu, 11 Jun 2026 19:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206134; cv=none; b=Me/hP4DIAYQ77DDIb7DCf3KTPVP2OyF886GUWfS4e0L6nwwiHvkbfSGz7zI/hHAPAHzogoahJmfFXyf9oAaLyjUjEaPu8SVeZruBdTBcCxR5EQcthAPLMEJqPkkLryScHIw1xgI2c2hLJeQFolvtgXouzG+gcZdCk9d7dW1phh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206134; c=relaxed/simple;
	bh=p5QPawHMjTq8D3EPgkhTwPBzrNRu6zmFROilZF3lTHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c794DCcjQ7okZWYGhOuSS/2fF9TfiYQ7zOHiMX0BbwPCN6VvTc78FNri2G0TNLbNkZHNc7hnZN8aBeJoFQULPqlbI1I0ImMvB7l0wpU3+p9Y22cmR8nyNo5LK8wwujgADY16K+wQBy3NoQohfdT5zX1UgpKFmIPxjRNqJxBS+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jOZvkt+0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jOZvkt+0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w0EWEUg0T2YXgOikKRNlNkeMOG3wiQMYZyZacU4kkh8=; b=jOZvkt+0AjfLO6hh+4KlqVZXse
	AEzINykqeIM66+ws4ZPJsz7cDE2ruJykb83jJlv950jQatWcgRj//maklA1NUOpUlbagoauwNp1D/
	TyZJve0I4NSaN2S0fCbuWNEN08DumcPVkQQ+zoys1bU+tNZabeFSAknA3hVXrJ156yaKyoclj6haV
	GZfVIiZcpSD1NuWPBAfwOquzIj3oPiAKxl/n5sgblV2zyhPcMuBh4yAUctgE92T+ezhHgKmkdBDY8
	oCmhcx31OFcsH8+Khmd/IY8MJSKuIa0+F+uMhLKYcVghw++GkXhZKYXHXQMJxcclV6cxSHnPUd9St
	9h+4LQPA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXl55-00000005bMi-0TYi;
	Thu, 11 Jun 2026 19:28:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EAD24300312; Thu, 11 Jun 2026 21:28:45 +0200 (CEST)
Date: Thu, 11 Jun 2026 21:28:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jens Remus <jremus@linux.ibm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Heiko Carstens <hca@linux.ibm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] x86/cfi: Use symmetric SYM_START and SYM_END in
 __CFI_TYPE()
Message-ID: <20260611192845.GL187714@noisy.programming.kicks-ass.net>
References: <20260611155716.830563-1-jremus@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611155716.830563-1-jremus@linux.ibm.com>

On Thu, Jun 11, 2026 at 05:57:15PM +0200, Jens Remus wrote:
> Commit ccace936eec7 ("x86: Add types to indirectly called assembly
> functions") introduced a x86-specific implementation of __CFI_TYPE()
> using an asymmetric combination of SYM_START() and SYM_FUNC_END() to
> add a symbol to the KCFI type identifier that precedes a function.
> 
> This asymmetric combination is an issue if SYM_FUNC_END() ever gets
> extended in a way that requires it to be used symmetrically with
> SYM_FUNC_START*().  For instance to emit DWARF CFI directives that
> denote the start/end of a function. [1]
> 
> Use SYM_END() with SYM_T_FUNC instead.  No functional change, as the
> generic implementation of SYM_FUNC_END(name) expands into
> SYM_END(name, SYM_T_FUNC).
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260522110427.2816637-1-jremus@linux.ibm.com?part=3 [1]
> Signed-off-by: Jens Remus <jremus@linux.ibm.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
