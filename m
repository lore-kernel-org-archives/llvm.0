Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9514A4F9
	for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 21:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771192583; cv=pass; b=abH3q8OQVon8l3xIBn4zdfszWlp+G92ID6w+Qlb3OchPlTUNMGWTG/xz8NWMOENrGbpjg94nl/UTRiyf51rUjw1XFHAlPbwltSig7plRsdPf/Sk15zkDpaK1SUalhx73W+KNIgWfdW+QPBE3snMtRHrFjEhY0nGxDdyv+BJ/0vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771192583; c=relaxed/simple;
	bh=lYcWWqtfOweMey8LSF//d08G1T81MuNxFLPi1dwNg6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miGTXtH4DKexi/rDEel12kZgPUyl+MpJRXIvNCMGi0pu5fXXz05MIXpzsRzwWEOM7QMVTtRwAND8IWwSMKWTvIuBO0ivWi4G1zrKFSunaMFd1UqjMkD8GPPrg2RfDw8kuQIJrI8zfQpgZ3VxAZyfu569LQycIZhmRHuCbPU8U4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZqmruYcX; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZqmruYcX"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1248d27f2b9so3285997c88.0
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 13:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771192581; cv=none;
        d=google.com; s=arc-20240605;
        b=ddQCuc7JsZ/JvO48FFwIi0JOdBqAz3g6HlHfWlvgiYYdj2Tv65y+jnNtapIXVQqkOe
         nFKKl+PIaae39+UzUGKGJio1hbIa176NuVvjM1PsTNQr39kZXco+loLBXJzW7ybVwUSk
         5cEetPs1dwBx5kAJDwDpi0P13WwEFoGuJWcytJ/M08+yOjOFZuGDWNfdpokObgJ2Erlz
         NIai2AG5NCtn5Gzg0zmCMv4n1f/gsiz449mqCnFAPJhlaC8QiRhctC535BqJWOyLmoeR
         RTcW1zP9vG+0FHFW7lGvExZascNgqgnUCzsXF3i0m0I6m3Bui/m/LGaIznu8yuG6kerj
         cyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=;
        fh=qTwmsFNbI8zZp1q/oFjFiX/0lvciqi/6Bgt+8EERPy0=;
        b=MKdK3QzrN/KiF5i/lh+xb9yzXnzg7ACbgFz4dp1Ji0AK+SJ8flQQICRj30tLMIMrB5
         TUiaXgP9v5jb0p5Oeou/5eg0ykeSyxKaEt7/SBll+G+STbP4s3QW18uZAKv+8I6ziG+J
         FdW9iUqEUWLrpYNAZNzQfTRAo8gWG0knT/2WCY07dhzRa7J0/4MoR8Qx0r1zQkoLo2aq
         FIqBl/NmItv8y8JdEX/eYHIrjP9mOWKsU+By1M1/G4Y7HnD5CxqWhPcdBs2zEfWtDX0R
         l0fKH06iT31IGDKb6i0NsBncsvGiQ+ZpS5+FgZ7FvEtjVlASCWyqs9tyTQ35GGoJNi+G
         pXuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771192581; x=1771797381; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=;
        b=ZqmruYcXDl362XvYU/0+DnD6A6NFFWURdaD1TejmYvtV2IVTs0GmnAa0U1qYMULqAS
         /N6ckbQMF9wI+Sk+vE2hvxLC4EIrZ0P6qABMizcNMci2ZIeCKVisHgb9IuQZcpcFJEj/
         7CNgQPMfxgzbUiaXkt3qn4gd5p5EmVFU1ZJD9XORLT9cSYn6Qust/KYbNTCWvKQ9xrA2
         4youPW7YX/5m3dzsDja0DIQSZEFik9qIZ1vQBYdrBdfau2o2XWV/xE4Mf/YHLb1FFVhi
         bRi5QmFNPJWnUN28j7osW0xGWx7IWg78DFeUs7bu+W2BBOhk9fdt5C2zhEUPtxIf+Jyh
         +qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771192581; x=1771797381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=;
        b=kNSuRRRAVAJTSlNw3peCP1OMtcS74Nn54B15IMazErDzmYr4/BDuNyqp5wbXrzq5WH
         DmeTLH8FQANU5BBozVXpOdW1Haez9Sj13F4jgHPWVy8EyerquCm91SwGhAqD4t/xOpJC
         mffGE5dK6WipVgpYojUOeFmg6Cn6+GLKHjhzZyjkzI85kWRzcffdjI3X/6W+U0nRx7r4
         zTkd+4SYUmM00iVVDQvP6zw+8VlDwkQSUJpORcW/OlDHf7z1Zbaabo2vTJHXYW1n5gAO
         FpAeNu1ulZcd567bcvzr0m0xeXwjTjDa6zD5K7PG13IvYlOPr+WMkdd3+3Zt97edvHul
         EQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCUcLNf2B8Y/xEcLIQG4P0mH9ebCQm6w8I2/i5vAT9XxVSMpNE1Zrq4yUarMOTW5uh77I18g@lists.linux.dev
X-Gm-Message-State: AOJu0YxZU1jZ7/KfmewsnYsObxscxxNUyFVo+xv4wWMACyQLW3r8w51r
	QRkQEa2qh3fqpNT0HxF3kC4r9mP3+L1gxB6Npunjlvu3W8GRIiMyXgnhzuWYFXECiAxl/YFodan
	kenrOHaIPHISPtIMSohlznjVABzCBnccQnn2MYAHw
X-Gm-Gg: AZuq6aJqXNMT7haisvh0odG9ZPlsu0nKgw71rEjmbjs2X7t8uzNWBZqoy1ohApb29eC
	GYLuomExiNZGRK9ncdJiI8RH29Umwgd+EMEzvXqw3eK/Z7XX3FIMqUPItVsloeLF5aV8x+22Mzl
	/9Mo53IrDOKR5SDz26ap5oR+XaNdU3fY+J3Bi/FuitXrlfRFDfqDA7uFYLtSYES8gY/KHTn7NEd
	OppovnjDgKXF2j3pKHFlTPaiEPR/GzEVCI6O+ApDU/EXVnmiBYOX65GOtY3gUV6fdHZufrsfqMq
	jsuBtoJXZzxzkrGQEsa4nKidKTkt7Gtnw9sLW4Q=
X-Received: by 2002:a05:7022:698d:b0:127:366c:8727 with SMTP id
 a92af1059eb24-1273982c9a7mr3858541c88.40.1771192580702; Sun, 15 Feb 2026
 13:56:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin>
In-Reply-To: <20260206182650.6c21b0ff@pumpkin>
From: Marco Elver <elver@google.com>
Date: Sun, 15 Feb 2026 22:55:44 +0100
X-Gm-Features: AaiRm52TaMQeR8grnhXihV-a9M4jdnZTVuSJ1xV8IMKlu2UE36vvlBNc2AapGhA
Message-ID: <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 6 Feb 2026 16:09:35 +0100
> Marco Elver <elver@google.com> wrote:
>
> >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
> > >
> > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > [...]
> > > > > > > > What does GCC do with this? :/
> > > > > > >
> > > > > > > GCC currently doesn't see it, LTO is clang only.
> > > > > >
> > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > GCC in case we run into problems caused by other optimisations in future.
> > > > >
> > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > does not drop qualifiers:
> > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > >
> > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > __typeof_unqual__.
> > > > >
> > > > > I really don't see another way forward; there's no other good way to
> > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > features because maybe one day we might still want to enable this
> > > > > version of READ_ONCE() for GCC 8-10.
> > > > >
> > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > years ago!
> > > >
> > > > There is, from this thread:
> > > >
> > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > >
> > > > another trick to strip qualifiers:
> > > >
> > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > >
> > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > raise the minimum from 8 to 8.4 (IMO).
> >
> > That looks like an interesting option.
> >
> > > That sounds reasonable to me but I'm not usually the one to push back
> > > on raising the minimum compiler version!
> > >
> > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > suboptimal code.
> > >
> > > I'm absolutely fine with the codegen being terrible for ancient
> > > toolchains as long as it's correct.
> >
> > From that discussion a month ago and this one, it seems we need
> > something to fix __unqual_scalar_typeof().
> >
> > What's the way forward?
> >
> > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > for old compilers with the better unqual_non_array hack?
> >
> > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > issues for new compilers. Doesn't fix not dropping 'const' for old
> > compilers for non-scalar types, and requires localized workarounds
> > (like this patch here).
> >
> > Either way we need a fix for this arm64 LTO version to fix the
> > context-analysis "see through" the inline asm (how this patch series
> > started).
> >
> > Option #1 needs a lot more due-diligence and testing that it all works
> > for all compilers and configs (opening Pandora's Box :-)). For option
> > #2 we just need these patches here to at least fix the acute issue
> > with this arm64 LTO version.
>
> Option 3.
>
> Look are where/why they are used and change the code to do it differently.
> Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> (I posted a patch that nuked that one not long ago - used sizeof instead.)
>
> The one in minmax_array (in minmax.h) is particularly pointless.
> The value 'suffers' integer promotion as soon as it is used, nothing
> wrong with 'auto _x = x + 0' there.
> That will work elsewhere.

Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
where possible is the way to go.

Unfortunately I spent the last week occasionally glancing at this
arm64 READ_ONCE problem, and could not come up with something that
avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
to go with the unqual_non_array hack, but not make this available as a
macro for general use - we have too many of these horrid macros, don't
want to add more to this hack pile.
