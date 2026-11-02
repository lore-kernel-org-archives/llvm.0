Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645408;
	b=WuOWrKeN8h1VWKWeTww8CAbrBgQ0b2za6aqYL3O9jPVwJgMSNXJsCKrY1POjWVjle10e
	 6tDw+q/+efxOdfmziq/f289pxUwGhCi6hYR4yRMkeuRXyvM+b5a0l81QKzEK6OzfagGxS
	 ExoSTbKn0GcMLB1isS5iuP2YBQd2WveH2cTAtGyr9Siw3BsGwNIkshqCXOxVk79tRVPjF
	 xqToGgY+ZfKbbwxqO4tJiValC05A47e7ZOw17Rd7F28n/3TP1pcR8NjtUdtH//prBWt0q
	 RWI8EsX78INDWTYS5L7JGLBf3CQgNAI0Bi5N8dlC3UqtRTOSQNnnGlemqQeWdVE1Q2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645408;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=J3zIJ3gk1eY7N/ZBU/IvNwURLViQlts0fQeLtN252cg=;
	b=MHDLFsdu75pcdBTsGWqID4ejcmhuFAFjBufMX9AFRO2Cw2NdYs/3KMY5TyTaLxBy+mrT
	 2BhVXzeeTBI4DcRBvX9Vx+hzzLV2OJ3nT1/YFnC/MPsLkAs49nzRBWCJKr0OQT2bPMIdG
	 aAbk+MKVQdaZganQ3LP7XZBpzFB+lFWtYiGRzLLKa+8rXWp+xIyg5a3ntkGT/M912zz9g
	 bIGs63fqbmvtMBgWiUN7ZNdDHO8ahS1RceQ8l91yYnan48TjVAuvDa/989kn7ApxYvJrB
	 zVF9Q2pDEf2CvjOio45M2lCnXE1MUlfYX/zsK6hXBVCFfGi101UqrF4y5SyFuUpRRtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=OaiydFFW;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDECE606A327;
	Mon,  2 Nov 2026 18:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDECE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=OaiydFFW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J3zIJ3gk1eY7N/ZBU/IvNwURLViQlts0fQeLtN252cg=; b=OaiydFFWMoqJ/gYJedDx9l+hYP
	sqff92kj//BahEG9qzrJtWdxcpNGGapueKNV5VelIBEpOIx93G8txJtplLXpI94QsQhEr2cQbhX94
	U8VOOWioUllagEiBFIJ9bOUDEO92RUk9eScpZClGd9rqafT8VsJBVgsY99Zdr7n7xvAsioRSZWtsT
	wzDYUpBYYeKMISmP0nWI3kE2e6DMfcVNEje7RtLKotWpGmwaPSgy+nlONlCWdosXHVdpQE53vB3s5
	/vjVvW7hnHmRooMHwmKFMqYCBvT3FGRoNClSeIV42rFktcl48dlBk2wGyUcJaHP5y2y/wtrDDmjVW
	piytbiQw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNx6J-006MGt-0S;
	Mon, 02 Nov 2026 18:49:47 +0000
Date: Mon, 2 Nov 2026 10:49:41 -0800
From: Breno Leitao <leitao@debian.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <aujZL2d08hMp7FK7@gmail.com>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com>
 <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
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
In-Reply-To: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
X-Debian-User: leitao

Hello Linus,

On Fri, Oct 30, 2026 at 08:56:12AM -1000, Linus Torvalds wrote:
> On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian.org> wrote:
>
> We could have a single static jump that picks between this one and the
> "conditional branch tree" version, as in your patch at the beginning
> of the thread.

I am looking at this on top of Peter's "x86: Harden syscall dispatch"
series [1], and before spending more time on it, I would like to
clarify how you see this suggestion fitting with Peter's series.

Peter's patch 1 makes -fno-jump-tables unconditional on x86_64 and
drops array_index_nospec() from the dispatch. Patch 4 then marks every
syscall __noendbr, since dispatch is only direct calls.

The computed jump you suggested is somehow a jump table, just without
the load: the syscall number picks the target of an indirect JMP. So I
suspect we don't need array_index_nospec() back on that path, given 
the user explictly set mitigations=off (?).

Is that what you had in mind:

  a) the switch tree by default
  b) table as a fast path only for kernels booted with mitigations
     disabled

Thanks,
--breno

[1] https://lore.kernel.org/all/20261102112549.714541309@infradead.org/
