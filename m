Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07B2D876A
	for <llvm@lists.linux.dev>; Sun,  4 Jan 2026 06:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506892; cv=none; b=RG3MjJm3OmJn2PTvC8kHFPcEwqRMwCJCf4E9/g95J8S2q+gxHntnYKt5Zce3EArCyMCYfoaq5uVfCc5cCb+1u/wBJmpVgXjfE11b7DJWOb1NGGKto6VsGaZygU2MvRRnaxNLotHWp+tP1/ST4JL2ohk1+E8f6WaRRkS0BvGY+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506892; c=relaxed/simple;
	bh=/vlYxBW1gH14hcw6MHQkRzxbor2vvHRcB3qBGQ2z+Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWCD/hkmFmRAHheo2mIqNrMWQnflP1Z+ceqR80yfFFDgFiigvk+1ESrt9y8pKpIbGcLvuAvDwpH8C+QlhEDkRHUDhJM6+HdJInnE/zl4c1dRXjMgRhN9Y2DNcs/M3l/4b2kLLxuqKa4AJF3LioCY8+Ms+e+dlfbv6CfPYMX97EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=enMAZiVR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="enMAZiVR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5DCB840E0200;
	Sun,  4 Jan 2026 06:08:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1BXU3Dj6OJrw; Sun,  4 Jan 2026 06:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767506882; bh=Dbqd0rL3/FzIbYne0vhVXhUp0QRkV7TNMnop++/0n8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enMAZiVRy0Q9A7ItoHWnobv+tvl+mDVSPdH9sE8UshUDMlbTN+XOqRAeD6FwExWC5
	 w4vwj1Ye2A/+F+xsxC8ZOMK/RdWWsNuEHPrMspxFYJzCLbMtKezd4D2hTZ/RA7dyF1
	 feA7pFKul4K6fP+QWjmPN3XaX5pa6Tdu8921zlU1AiAZfZbeWPDyWz0mxSLZGkb0ly
	 KmTGLO1QvWi5ieJc7laJV1rjcTAwlVyDFD8badAYwO0eW8oaf9HhDOvU2cAE4o3SJ/
	 zODjpTDmhIaZtZ2hR/Y2M+r+b/6q9OdEuREf90xWRIvkBFA2YOS/TlSyt5ZkF1XMHe
	 cHXLwJZudGfeRkRkfFCmVnSaK3pjgLlyKNsOoa35WxFd8c/wqWD/rrrHrEdGDgEhBb
	 iF2zf58pVMDV7Rt8u3aUUsXdB9/8CLIcK7gXjjnDY6TSlUus4DKqtcX7ePGniqPnmQ
	 cTAfgiWIgU4PG4rVBv0pG1vnaWxaHcSKb7/8vCSOkAjFJ+8Yl1igGyaX5WcEdE28Cd
	 iApE2X1AnNuUSIOAPefwx3GE1NPEtgMM9gBmm9sUdOtEZHWgCurBVS9D3p5IevNN1v
	 0Q9APf9ib2SRH5pMreFVOZES5Y8kx8uAqFlQXM1ju36Xi4q70ox8GgBY2n1FwcwE6V
	 TUs4hQKFVySZMEvQ7gPDir9k=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4107B40E01B0;
	Sun,  4 Jan 2026 06:07:40 +0000 (UTC)
Date: Sun, 4 Jan 2026 07:07:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Brendan Jackman <jackmanb@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] kasan: mark !__SANITIZE_ADDRESS__ stubs
 __always_inline
Message-ID: <20260104060739.GAaVoDq_VggsNP5jif@fat_crate.local>
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
 <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com>
 <20251216130155.GD3707891@noisy.programming.kicks-ass.net>
 <DF0JIYFQGFCP.9RDI8V58PFNH@google.com>
 <20251218092439.GL3707891@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251218092439.GL3707891@noisy.programming.kicks-ass.net>

On Thu, Dec 18, 2025 at 10:24:39AM +0100, Peter Zijlstra wrote:
> > And in the meantime, I guess patch 3/3 is OK? 
> 
> I'm not sure, ISTR having yelled profanities at GCOV in general for
> being just straight up broken. And people seem to insist on adding more
> and more *COV variants and I keep yelling at them or something.
> 
> That is GCOV, KCOV and llvm-cov are all doing basically the same damn
> thing (and sure, llvm-cov gets more edges but details) and we should not
> be having 3 different damn interfaces for it. Also, they all should
> bloody well respect noinstr and if they don't they're just broken and
> all that :-)
> 
> That is, I'd as soon just make them all "depend BROKEN" and call it a
> day.

Right.

And I don't think anyone has had any serious plans for COV-ing the SEV code so
lemme take 3/3.

I, like Peter, am gravitating towards a kill-that-thing-with-a-master-switch
instead of whack-a-mole-ing the kernel.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
