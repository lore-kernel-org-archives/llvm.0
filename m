Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F6A7081F
	for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771193821; cv=none; b=M4gVdGX/MjwBvsfQ3aIbluzW9mgkM2JT4d9Y5Z33JcF7aX7qybtaCTDaE5qbB3xy6pp9MDKWSXgTDnw4iOkLH+rl66CBjpwM9be55TUyKbqk/IDhbuHnXEdJjbTOhoLfI9YwORN9vsrvQpnZW0F+IDoGngfjafg5z7WO9YVMYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771193821; c=relaxed/simple;
	bh=hJNZsiHjZFwnJ9fS95IR9Tp7m0vT5l6IZphGtg/FmiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fk9iwUm0TqfcYcPgz+5OttTvMfS3Pf5IjrRhFOoL1W0ha5msX5riGzQ6Xq2BsNx6bRzeAe3MM378B21hNmATRhpstXGvQWlEtbKt+tI51IL21uSRugVQZqiEz+BtOKDNAecsxHiASuSDAS9RLla+PlhrnHG2QJ/zD4knOFjXFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROB6FtjK; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROB6FtjK"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so29211015e9.1
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 14:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771193818; x=1771798618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDmUias2s0pvnhz4ZeDjGfgxnsQChrumnkaZhgFLeFw=;
        b=ROB6FtjKT/NCY6k9sbicoM3FkN93p3a4DJmCw0GWgZFjomipdYjQKmq8690uJP0ZH1
         3p2sCvVGMlOTKHqbu+lrkPv6ruGWHl2aoeJJhoiPXLjFgqElkcvqK6WeOHbemyBRNldq
         tzEg3n9myjz00q8YhKw9PyMiQUPG1/FAq9GmNh23p8GaSoTdZshqFOkQsONcSn7aQfCz
         fhFoZC+SZZMY38bAhRACAkgEQT5zHELmSz5wU3TUF8we1AMyv1UnecGBXPUj9nhXrCEJ
         Ch/U0qvEJR+KWEkR1xzcSBV6Yy54Um4xUBd1kaEVMSngHnWIe6UrI0JFUEh0JQL4gp/Y
         EroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771193818; x=1771798618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDmUias2s0pvnhz4ZeDjGfgxnsQChrumnkaZhgFLeFw=;
        b=Nb5AahSMSAy7JTNvdBpyJrO+7iYhcgDpUnkrywQlBvcz2KaPqpiUh+EFvKc3utq7wK
         reZKaWelRMFyI9GcdPbaz4DX9UY8/jK1t6KXyhRaMwjwvaH6s6ao7PWmrkS8gcSgp02y
         xQtRMRoHjKqR50OLYiKtNT/RcpE/fbSCgxU3aJczbDgRjrFkUnPA+6NVi2We6FdHFSWp
         3tvgShNEqELVJPkAnKh77oNoTszPgsvHTpJTdV9Sq2HlgL/eNEoBj1UfQxgfVvitbkUb
         p/sy512IEn8IlDafwXzNTyCfiCbKuNA2ThT8kRwao3Piz8PGc1L7QZyHMTSfWC7OKLKj
         R0Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsBBVRhVN2SGWylWj2KQIjLQq6iRvtDLQ7b1IJZ1ccipo82QuccggTBQCpCFfeG7JyMfb@lists.linux.dev
X-Gm-Message-State: AOJu0YwTRt5H+hRhMWPmwj4eN2RXb4Pj0Nf5uscDVq1aU/kX/SWNnV8Q
	lIdd9zokIHHwpu+mjH4GvfLV+Wo0zlBcXSSb33TOB/iTxM4CMoCS/KD7
X-Gm-Gg: AZuq6aIRcjp2jj2V4VpSnTg4/EENsB3ai0hqalWnI5UHFzKJSorf3UAQBVc9ks+P8i8
	r/dHDOT/43ZUQD5JoEVc3FYl93+KlzVhbASwSDTx6crjJU/zAYILo1O4hC4HFBiiCKaNCkZm71N
	L8gSnzUa27EdqhwaiYZx19JGAtWRsNuzc1HY99FUoDlYAKZBEDiLOwM/IVHR7+mykev0zTUoch4
	TZTz5Sla0VloiSPnrxBrELgaC/Lq1jL2w4sDvIbhszpaK+lygFwfu58Ju/t/DOwydELeK2S84kk
	GFlyP1JV2/H7us6okvzw+4EfVX6dLWW9hAFQs8LgcyG5iu8N/AraWYBJL2fX5Yr5k9Y97h8ddIr
	Ma5QhpnBps2XbWcuHqJ1/rSzsiussBz0M5zfsbrxnQ1lgCLQY7dqBy4pBpMmkvOQTKZapUsRqv9
	3Ecwk7VULodVnv8apbqswCvGLzG8fXALLVY7iwusWcdfuXxiu73607i81NNE2otAxw
X-Received: by 2002:a05:600c:6211:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48373a09741mr161305915e9.10.1771193818234;
        Sun, 15 Feb 2026 14:16:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm24535875f8f.5.2026.02.15.14.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 14:16:57 -0800 (PST)
Date: Sun, 15 Feb 2026 22:16:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260215221656.68b2fc1d@pumpkin>
In-Reply-To: <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Feb 2026 22:55:44 +0100
Marco Elver <elver@google.com> wrote:

> On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:
> > On Fri, 6 Feb 2026 16:09:35 +0100
> > Marco Elver <elver@google.com> wrote:
> >  
> > >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:  
> > > >
> > > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:  
> > > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:  
> > > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > > [...]  
> > > > > > > > > What does GCC do with this? :/  
> > > > > > > >
> > > > > > > > GCC currently doesn't see it, LTO is clang only.  
> > > > > > >
> > > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > > GCC in case we run into problems caused by other optimisations in future.  
> > > > > >
> > > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > > does not drop qualifiers:
> > > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > > >
> > > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > > __typeof_unqual__.
> > > > > >
> > > > > > I really don't see another way forward; there's no other good way to
> > > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > > features because maybe one day we might still want to enable this
> > > > > > version of READ_ONCE() for GCC 8-10.
> > > > > >
> > > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > > years ago!  
> > > > >
> > > > > There is, from this thread:
> > > > >
> > > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > > >
> > > > > another trick to strip qualifiers:
> > > > >
> > > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > > >
> > > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > > raise the minimum from 8 to 8.4 (IMO).  
> > >
> > > That looks like an interesting option.
> > >  
> > > > That sounds reasonable to me but I'm not usually the one to push back
> > > > on raising the minimum compiler version!
> > > >  
> > > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > > suboptimal code.  
> > > >
> > > > I'm absolutely fine with the codegen being terrible for ancient
> > > > toolchains as long as it's correct.  
> > >
> > > From that discussion a month ago and this one, it seems we need
> > > something to fix __unqual_scalar_typeof().
> > >
> > > What's the way forward?
> > >
> > > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > > for old compilers with the better unqual_non_array hack?
> > >
> > > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > > issues for new compilers. Doesn't fix not dropping 'const' for old
> > > compilers for non-scalar types, and requires localized workarounds
> > > (like this patch here).
> > >
> > > Either way we need a fix for this arm64 LTO version to fix the
> > > context-analysis "see through" the inline asm (how this patch series
> > > started).
> > >
> > > Option #1 needs a lot more due-diligence and testing that it all works
> > > for all compilers and configs (opening Pandora's Box :-)). For option
> > > #2 we just need these patches here to at least fix the acute issue
> > > with this arm64 LTO version.  
> >
> > Option 3.
> >
> > Look are where/why they are used and change the code to do it differently.
> > Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> > (I posted a patch that nuked that one not long ago - used sizeof instead.)
> >
> > The one in minmax_array (in minmax.h) is particularly pointless.
> > The value 'suffers' integer promotion as soon as it is used, nothing
> > wrong with 'auto _x = x + 0' there.
> > That will work elsewhere.  
> 
> Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
> where possible is the way to go.
> 
> Unfortunately I spent the last week occasionally glancing at this
> arm64 READ_ONCE problem, and could not come up with something that
> avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
> to go with the unqual_non_array hack, but not make this available as a
> macro for general use - we have too many of these horrid macros, don't
> want to add more to this hack pile.

Agreed, having to do such things inside what are already horrid 'functions'
is one thing, but when they get used in 'normal' code it is silly.

Have you checked whether sizes other than 1, 2, 4 and 8 are ever used?
There aren't any in an x86-64 allmodconfig build and it used to be an error.
Even if there are handful, having to use a different define wouldn't
really be an issue.
Removing that support would make READ_ONCE() easier to write/understand
and (hopefully) compile faster - there is a measurable cost for the
'size check' in the x86-64 build, the arm LTO expansion must be significant.

	David



