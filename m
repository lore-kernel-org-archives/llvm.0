Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E92C0F6D;
	Fri, 18 Sep 2026 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736386; cv=none; b=OWdBmZIRfGmFOupeLBQk8RlkV7FW9uXFqEvybQvXUCtidVXW1HsZb6ZplzSQVuNIH9l/FT2MwVyZV+5S0d4/u9VndUikXsy/qnXIuB56Tp9RYJR6IpEm3y3B4htcXtdXx9O2BPiqUOVH99Vn47nA43mFm8iTk6uMDSe16rjNpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736386; c=relaxed/simple;
	bh=GtePAYNYADed/61YjwtEUIXiRqHC/FtVFK8+fWCWC/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6eDJ22dq+S7MAXtRcYcJUZqPegscCb1Jb4ASy5JbuL4WIRZkp37FyqoQ5yUHAhz0+56O4NCGeNhSB1by6A/+wvSpagW0Kb4mubc685OuoiNT8Rc/P2F6yjJFAcHkNAzSR2YOJFiLLXL8MZYv6taMCA7FqX24qHYNtvcrCmtO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=D9A8qhrf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="D9A8qhrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323731F000FF;
	Fri, 18 Sep 2026 12:59:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=D9A8qhrf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789736381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0elZGzzvhmy8MdWwXa5hmkM3x/Af4GcgbvgWuo+UbBU=;
	b=D9A8qhrf1PQk8NdU8xAzlSmJkZo2pspf5sn6nontAmzxeY0NaTkSjd4jaRTsFSDBoJxmA/
	7b9eEHHhJVYPiuJE6Mln/sxZL0vHZbSzwdddn1JrHHq+ZlhL9m9Vk3SIU1IWzyKz9e+eM7
	BSQIZwMQ0lYOYCIFn1xImygLtUVGlkM=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id e17657ff (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 18 Sep 2026 12:59:40 +0000 (UTC)
Date: Fri, 18 Sep 2026 14:59:37 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <aq01ud_zTYN-3Zby@zx2c4.com>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com>
 <20260917173920.GB356152@ax162>
 <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
 <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>

On Fri, Sep 18, 2026 at 10:20:45AM +0200, Jason A. Donenfeld wrote:
> On Thu, Sep 17, 2026 at 6:49 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Sep 17, 2026 at 10:39 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Thu, Sep 17, 2026 at 11:26:46AM +0200, Jason A. Donenfeld wrote:
> > > > I don't suspect this is the right change. On x86_64, this changes to
> > > > code from:
> > > >
> > > >     rep stosq
> > > >
> > > > into:
> > > >
> > > >     loc_2D9:
> > > >     mov     dword ptr [rbx+rax*4+0Ch], 0
> > > >     add     rax, 1
> > > >     cmp     rax, 0Ch
> > > >     jbe     short loc_2D9
> >
> > /me nods
> >
> > > >
> > > > Which is a lot less compact. It seems like the actual solution is for
> > > > gcc&clang to emit this inline memset mnemonic when the platform has a
> > > > good one, and otherwise not. But disabling optimizations for all
> > > > platforms, because it's broken on one, seems bad.
> >
> > Ideally, yeah.
> > Pragmatically:
> > the compiler doesn't know what you will link against or not; so it
> > just emits relocations that the linker will (hopefully) resolve.  I've
> > definitely looked at how llvm decides when to emit libcalls to
> > compiler-rt/libgcc ("the compiler runtime") and thought "I wonder how
> > this works with compiler runtime version N-1?"
> >
> > There's also the requirement gcc and clang have about memcpy, memmove,
> > memset, memcmp always being available (-ffreestanding or not) noted
> > below.
> >
> > > > In this case, the compiler is being smart: it identifies a loop and
> > > > rightly turns it into memset. But if this isn't a compilation
> > > > environment that has an outline function, it should do something else.
> > >
> > > As I mentioned in the commit message, compilers require all environments
> > > (hosted or not) to provide memset(), so the "doing something else" is
> > > nothing :)
> > >
> > >   GCC requires the freestanding environment provide memcpy, memmove,
> > >   memset and memcmp.
> >
> > +1
> >
> > >
> > > I guess another option is to just include a basic memset() like the one
> > > in lib/string.c so that it is only used if the compiler makes this sort
> > > of transformation, while leaving all other architectures alone.
> >
> > It's also possible to get GCC to emit the libcall, even in the
> > presence of -ffreestanding: https://godbolt.org/z/6hTrYq9z8
> >
> > And it's not the first time this code in particular has had this issue;
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b7bad082e113640fc81200ff869e5c2d7a9c29a2
> >
> > (is this patch a Fixes: for that?)
> >
> > Clang has __builtin_memset_inline to avoid explicit libcalls; AFAICT
> > GCC does not.  So we could use that here to provide such a guarantee
> > with clang; the code would remain brittle and likely break again with
> > GCC.
> 
> It sounds like this is broken currently only on clang on riscv, right?
> So maybe we can use __builtin_memset_inline, and get something similar
> into gcc, before a future gcc version also breaks? That way it doesn't
> break in the future.

There's -finline-stringops=memset for gcc (>=14), which should keep
things sane there. So, we can use that on gcc, and alias memset to
__builtin_memset_inline on clang. And then we should be good?
