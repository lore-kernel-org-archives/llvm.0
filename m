Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7C41A6814
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254407; cv=none; b=cOeyzBnRaK0QIc1l6sq/G5zFabKRJM4e4H0Skg+MOPxIz3YAcXtjfPOf0A30y27kSayjf6k90sUcX4w/fhm8KzaJWUsT0TCm25/Ui8Oj6AN8nOpFvnjOsn3xCQMzL8wQJ30khXM4QxWEhCs8FjbWDOz9u1o2KU7kxW8UjbXtH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254407; c=relaxed/simple;
	bh=ERYCdMLJnLzMQY2SEXPJCfFarlUbghcDwEa2Vy8mW80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McyufgXXlqv0ocLwZ1KSqMXAqZQdEw37jX3vT4rUnQllLD1wltzUPx7jMpf4LyCG69y5RlEpDdSh6QLqiaZDDvugG/Kb+46gRLIM8Mbw48WSEMnAHT3aiV+K0Ag95gH27b+wC+saixgXSs9nEL9pC+NjS8K+aRdZeIdKNPFJJYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gh/zR8hE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gh/zR8hE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zhS6wEtyL82mK4tYraCNhULjxYZl5Eh2+XSrwYDuWw8=; b=gh/zR8hEeHERmWebDM2eGK3v8V
	l6VuEW2V/VbaaCh9DBzZHUlGeOUdU8p+P5KlCIxsU6HK2VQP3wP/i5AlOY32OtbpMG+fsDmyZglp5
	4tWNefIBiA58Si/yWufw8NfwSgZfpcuJJElo7VUSj0qIYaNYgrBrxoY+DWK6SmYTP4e2UbWCfftvG
	HLqdQ/+/bxuoJtznuLGzDzISFma5jh+bkNG9oTUdJ+s9zyLEy3sSjKToiNQOCvm3zWww4ps200Cqo
	Q0kcGJ49Opb5z4P231+oQOkqHrcZP1Oy/ftXVnPiKW+Fv8xL1BI6MNrJ0xwMqZ2pw6fW+THOi+dO4
	jby4f3hQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iwY-0000000Graq-2VlH;
	Thu, 24 Sep 2026 12:52:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7EFB13002D9; Thu, 24 Sep 2026 14:52:53 +0200 (CEST)
Date: Thu, 24 Sep 2026 14:52:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, catalin.marinas@arm.com,
	will@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
	sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org,
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com,
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net,
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <20260924125253.GY776954@noisy.programming.kicks-ass.net>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <arUbw_TIA0Uj7oXT@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUbw_TIA0Uj7oXT@J2N7QTR9R3>

On Thu, Sep 24, 2026 at 01:46:59PM +0100, Mark Rutland wrote:

> > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > index 914282016069..3d8a969eab5f 100644
> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -987,14 +987,13 @@ void do_serror(struct pt_regs *regs, unsigned long esr)
> >  #ifdef CONFIG_GENERIC_BUG
> >  int is_valid_bugaddr(unsigned long addr)
> >  {
> > -	/*
> > -	 * bug_brk_handler() only called for BRK #BUG_BRK_IMM.
> > -	 * So the answer is trivial -- any spurious instances with no
> > -	 * bug table entry will be rejected by report_bug() and passed
> > -	 * back to the debug-monitors code and handled as a fatal
> > -	 * unexpected debug exception.
> > -	 */
> > -	return 1;
> > +	u32 insn;
> > +
> > +	if (aarch64_insn_read((u32 *)addr, &insn))
> > +		return 0;
> > +
> > +	/* Match ASM_BUG_FLAGS() / BUG() instructions. */
> > +	return insn == (0xd4200000 | (BUG_BRK_IMM << 5));
> >  }
> >  #endif
> 
> What problem is this trying to solve?
> 
> Mukesh's original patch seems to be trying to check whether we compiled
> things correctly (such that the bug_table entry points at the expected
> insturction), and I don't think that warrants a runtime check, but (as
> per my reply to him) I don't understand why that's a thing to check in
> the first place.
> 
> On arm64 we only call is_valid_bugaddr() under do_el1_brk64() ->
> call_el1_break_hook() -> bug_brk_handler(). We only call
> bug_brk_handler() when HW has taken a BRK exception with the BUG_BRK_IMM
> immediate, and that can only be triggered by executing the right
> instruction (BRK #BUG_BRK_IMM), which we ONLY use for BUG(). and WARN().
> 
> So I don't see why any change is necessary here.
> 
> If the HW has somehow taken a BRK exception from any other instruction
> (which would presumably be a HW bug), there won't be a bug_table entry,
> and so __report_bug() will fail to find an entry, and will return
> BUG_TRAP_TYPE_NONE, same as for the !is_valid_bugaddr() case.

Right, so I wasn't at all sure what he was doing, Rust is still mostly
unreadable garbage to me.

But I figured I'd much rather see him use is_valid_bugaddr() to do
runtime checks than whatever dodgy games he was playing with that label.

So *if* doing runtime checks is what is wanted, then is_valid_bugaddr()
needs to actually work, because then it grows a user outside of the BRK
handler.

Lots of IFs etc, but since I am having a head-ache and am mostly
useless, I figured I'd distract myself doing whatever :-)
