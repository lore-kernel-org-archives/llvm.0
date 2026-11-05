Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876188;
	b=dY220U41JxyjIVV7h4a9+mU+AgO1Q2knhr5AbMThPpzMXjMabo3wg3wlywDKvVVRM2zC
	 w+E81vtZImdS9hqe3faIGIRKOqu2ISLMNggWfTa1TWIWFwt57PUaWeM95ifyn4JE3Hh06
	 wkZuYZ6/iBTMmcKViEuKyBtI24vtnSXz2d4CMvGEkhw6mNRLvC1+gRScpc75wmIjv1M4z
	 5VGHeE8soS7xkbHPms6lElGnGOiS/KIL9wCWaAiuqzfSLTSCabtMRm9OmdNfUT5BmUT6K
	 W46UhTP79p9GfaPBl9mq3+RZmySKQ/ZZ1N4QtZoFPpRgRaZok3wTVJPRMjeBXp/9vNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876188;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TsPvZ3BVvxqP10a7IO9divG+E8WhNN6C4RdnHP0+gUg=;
	b=wInGuSjuwPSw1I6f+rXb1V9qlSRN/3vJBU6X25bsGTdlqVSpD4XPyPlzj6TznwsONoqj
	 0v57vzFNr+EowRIxIDVhHpWPgtqFCEJxngRtpDpwbYzJta1b7DB5K00pPinWsOAxiDjuG
	 DdnBOUlOoksYNU7Jdcl+24uw+e0ty+XI3pIPT4z1LkqQV1iolEw4ak2Dv5TlxxWSC0nNk
	 c6+kmcS8mYRqUQdl6g4K/NSeTNmQ9kN5Gmy1Is+BK8GD0L/GDYDbL49q6xGIHepiVK5NI
	 DerR2Fu26UEeXGxfnEL3xn7qtjfgx2gl/vYQlfMOQTivxhyTVHtv/UWzXdrI7/7F8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dyt3zPuw;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C9606D803;
	Thu,  5 Nov 2026 10:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 487C9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dyt3zPuw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TsPvZ3BVvxqP10a7IO9divG+E8WhNN6C4RdnHP0+gUg=; b=dyt3zPuwsRWOl0uAf7ZY8W147o
	1k+SC8N7uwgLD8XyylybdrZa+m8Rwc3ZPMR+Jsf+CzN1NE7+HgqOozic7dYa3gVRh0G/Gju1eS1KU
	ZiqxF7aeZgXB4w3k0/ZTiIMNOMRf4BchOHjw5omLVhqeapBDy4I9wMHPSon2WCCXG0JLrXhdY3CmT
	iPirhpMpUtPYhjLn3pRsnJg2iseFMxczEqG6xrYWwVKm03495PFlWZeKJlgvYU8iL+zpsO2B4THau
	DMbgUAL8DQVtgFK+PuIaE4xeCl9il1RcNZEMUNgyejaW46juVxt/KJSkfpcjR8VsJZR5z35xBIN/z
	J+jqK/aw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv8p-00000002rDc-1XF3;
	Thu, 05 Nov 2026 10:56:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CE8DD3002F0; Thu, 05 Nov 2026 11:56:21 +0100 (CET)
Date: Thu, 5 Nov 2026 11:56:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-team@meta.com,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261105105621.GN1813469@noisy.programming.kicks-ass.net>
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

On Fri, Oct 30, 2026 at 08:56:12AM -1000, Linus Torvalds wrote:
> On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian.org> wrote:
> >
> > With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
> > becomes a compare tree on every x86_64 build, so system call dispatch is
> > the same whether the mitigations are disabled at boot or at build time,
> > which is basically my end goal.
> 
> You're basically saying "with that patch, both cases do equally badly
> whether disabled at boot or build time".
> 
> That's not a good end goal. You want both cases to do equally *well*.
> 
> I do wonder if we could do computed jumps. It would be lovely if we
> could basically do something like
> 
>       # syscall number in %rax
>       leaq table(%rax,%rax,4),%rax
>       jmp *%rax
> table:
>      jmp syscall0
>      jmp syscall1
>      jmp syscall2
>     ....
> 
> and avoid any indirect memory lookup or indirect branches (outside of
> the one computed one). And no extra call/ret frame.
> 
> It's possible that the branch prediction hardware hates those kinds of
> very dense jmp patterns, though. I don't know.
> 
> We could have a single static jump that picks between this one and the
> "conditional branch tree" version, as in your patch at the beginning
> of the thread.

The thinking here being that you would still not actually load any value
from the sys_call_table and keep it all in code?

As Andrew already pointed out, this required ENDBR (yes 4 bytes) in
addition to the JMP.d32 (5 bytes). But when building with kCFI that
would require even more.

Notably, you do not want the syscall dispatch to be a kCFI evasion
gadget.

The kCFI landing pad would basically add another 16 bytes on top of
those earlier 9 bytes, at which point you might as well round up and use
32 bytes per entry.

At which point one has to ask the obvious question on whether this is
actually better than just keeping the sys_call_table and syscall
functions as is.


That is; do we want to go back to unconditionally doing:

	nr = array_index_nospec(nr, NR_syscalls);
	regs->ax = sys_call_table[nr](regs);

Yes, this will turn into retpoline for old hardware, get patched back
into regular indirect call on recent hardware, and will get kCFI/FineIBT
crud on for 'free' when your build swings that way.

It does mean syscall hijack through sys_call_table[] is a thing again,
but it will be the fastest option on modern chips and automagically
'scale' with the mitigation options selected.


OTOH there are still million upon millions of that old stuff out there
in data centers :/


