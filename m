Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079457;
	b=19EG5jkls47QOFVWPZ56EO4+VQorGmcauCjfKsX1vEn3bjOMZQlWaPQuKR12ozI5lH6r
	 C1YbGnNvE+D9iRBu4HWZDlAnXP7yTuJmD86y54r5guvCLntxmEm6VDnvNYJiAibZUVJ3M
	 CSWjJr4oa2ckuTUv3jatCUjIwvajt8LKcPeYZCxcHQLANZqrjIwsayiOXatvusJldAWMr
	 6Dofi0g00SsCX4oDRc3wGDAC9kB8qGVd1nykb/SDIr/R9YdyPoQ/5to/S937Zzm7yHozc
	 J2xECxRxxD8u7kbkBKUuJdwSK7R9JwrFkRLZRD0/Bcp/f1GEiDn+NNTNlaT5J0N5z8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079457;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zX3/GPGop8Gkh0nyMPRMl+4NKaHlORI84nuLeJWPXik=;
	b=fkda72FeYUShD7fSc42OKXob+Z1jNaHmY4WbdlTI+u2oKq0ZgNqLcFnjeNHvUFp8VaWn
	 uIfT1qbpKOSbj7YpCxF4GyJLlOS38Qgrb7KH+anbQzKYmG/MGxdm+CyJV0MaP4958q8vp
	 jZeVQgOKM3pdpY8IKOdw0ZztTFzoGoZ12VtFiJdB93g3RDP1Mw2GvivhvZtzRjHNkdH9S
	 2VGNIM3fJxCg764WeAhxXCvyoKKAjwN/xlAnOCexDB5bJ6UiD33kPvQ4JGhm5V9CfQNDG
	 4+NE35Pxdr+YgtQbv9wV4wvvIjm9n1PlhrwduEnuP/V30gFPN+17kjHlRvR8W8IwwXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RZq45JMo;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C63606A335;
	Thu, 19 Nov 2026 09:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C63606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RZq45JMo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zX3/GPGop8Gkh0nyMPRMl+4NKaHlORI84nuLeJWPXik=; b=RZq45JMoQmwtuaZSGG1uaz52FC
	aRYU5y/8QJNvVnkWYXhRO9knBNv+MFZqFyJTWr3cK6ETiMmrKSy4Siuq6Y9+3+0rlOzKRi5juAK4h
	49+YL8I97UarFrknSQYYpuugNYeNrNYX9IayxfY1g8gVPuauNShMAMbLcYyfZTFEAQvmlw6L20z2G
	cl23G0U5OCHrgTHjvUVpwg0UUeC7VlrfvMZIsbTMvCimelL4FoWDMwUUxWlFvBF3smh57RrcnJ9n1
	EzeeSjpvX+mmUGdKmaT6a5xHXv5upAd50BedC3OnwMbtU7JS74SK6e/oqBlh2WSngbHrt1CFB36sp
	Jh5mugFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyAR-0000000H2C3-0ec9;
	Thu, 19 Nov 2026 09:10:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3325730072F; Thu, 19 Nov 2026 10:10:54 +0100 (CET)
Date: Thu, 19 Nov 2026 10:10:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kees@kernel.org, nathan@kernel.org
Subject: Re: [PATCH] x86/cfi: mark cfi_debug as __maybe_unused
Message-ID: <20261119091054.GO2668804@noisy.programming.kicks-ass.net>
References: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>
 <20261117183505.GL1813469@noisy.programming.kicks-ass.net>
 <av6OwOx3psCYzS4L@zephyr>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av6OwOx3psCYzS4L@zephyr>

On Thu, Nov 19, 2026 at 09:35:30AM +0330, Ali Nasrollahi wrote:
> On 26/11/17 07:35PM, Peter Zijlstra wrote:
> > On Mon, Nov 16, 2026 at 09:00:27PM +0330, Ali Nasrollahi wrote:
> > >     When CONFIG_FINEIBT is disabled, cfi_debug is never read, but
> > >     alternative_instructions() still resets it after calling
> > >     __apply_fineibt(). Clang 23 diagnoses this as -Wunused-but-set-global
> > >     with W=1, causing a build failure when CONFIG_WERROR=y. Mark cfi_debug
> > >     as __maybe_unused to account for configurations without FineIBT.
> > > 
> > > Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> > 
> > Does something like so also work?
> > 
> > ---
> > diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> > index efbc11f8c336..9bfc36566e17 100644
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> > @@ -1195,9 +1195,9 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
> >  #endif
> >  
> >  enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
> > -static bool cfi_debug __ro_after_init;
> >  
> >  #ifdef CONFIG_FINEIBT_BHI
> > +static bool cfi_debug __ro_after_init;
> >  bool cfi_bhi __ro_after_init = false;
> >  #endif
> >  
> > @@ -1894,6 +1894,7 @@ static void __init_or_module __apply_fineibt(s32 *start_retpoline, s32 *end_retp
> >  		break;
> >  	}
> >  
> > +	cfi_debug = false;
> >  err:
> >  	pr_err("Something went horribly wrong trying to rewrite the CFI implementation.\n");
> >  }
> > @@ -2281,7 +2282,6 @@ void __init alternative_instructions(void)
> >  
> >  	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
> >  			__cfi_sites, __cfi_sites_end, true);
> > -	cfi_debug = false;
> >  
> >  	/*
> >  	 * Rewrite the retpolines, must be done before alternatives since
> 
> Thank you for your review.
> 
> Regarding this:
> 
> >  #ifdef CONFIG_FINEIBT_BHI
> > +static bool cfi_debug __ro_after_init;
> >  bool cfi_bhi __ro_after_init = false;
> >  #endif
> 
> FINEIBT can be enabled while FINEIBT_BHI is disabled, for example when

Yeah, no, that's me not being able to read. I mean to stick that under
CONFIG_FINEIBT.


