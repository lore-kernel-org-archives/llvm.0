Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB44279F6
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402415; cv=none; b=LHCz0VukCZFl3oj5Y+pb2BcdyAvbxDe3/2c1p4Dn7FU3ZsgTUGBt6TsSNqWACyNgGAct/ZsB6GZP5k+6qmx97zC1RovTWs4/KkJoJwhp5EvE3DxE03eMNEAj9S+5WFgs9LryksbCYi4+IGw6bPU9fIdpjw4J4vO8bMvA4OqwxPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402415; c=relaxed/simple;
	bh=RXiRJsXFLLj0RxE9wlMaYRoDoEqk7EMINOWI0/yRAcU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0wlBxcbMKYiZJdCuwteTm0TSpiHDVMksb0CQjAF006Pnf86PDZpoQUJ6XCDCdM+zaEMhXe0I4D9GGfZGmG9xqELSY+cMMp40pkXhsLsm0ud2wD9X1EWALI6+6hFBB0h34zKJlikkuvLWCbphxLi2GsOVcosYRkrffBQmKFHidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTOvBkDT; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTOvBkDT"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-436317c80f7so147386f8f.1
        for <llvm@lists.linux.dev>; Fri, 06 Feb 2026 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770402413; x=1771007213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTrA9q7gvwCe8UT0/NDBaJmIUo6Fhril3QJx2wP9roI=;
        b=gTOvBkDTmGKbTqorO4qkOJzZwrITU/wz9kzDL+EC5klHJUHOqLCKEsmoP7oya+Z/8u
         ow6TkHJRl7QG4nEM72kie6+7tc9VEaEUAFMueTdc+hyrg66YFGnscMuCxuOMKr8/BMYh
         fgeaXCpGMcopA3mYceoUo2iRn47cJmsD8EV+hpjuc9/JO1NYJCa1PFgdPXCaL8OLsgrM
         eP2CJLnGxBcJgaxpXlTzvsIyR5q9NUl4ySnLhHe3QgeCxJpi7g24WsLk8nwDdSLKt5Uz
         lhrIygvqip6JrFHpXE5NzudaXMxUPuC/nBW2wp0Igubl7vY+73BC8FoZGYOLlBnAHln1
         cghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770402413; x=1771007213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTrA9q7gvwCe8UT0/NDBaJmIUo6Fhril3QJx2wP9roI=;
        b=tB5WvT7VU5deGNz0zjMa5uyt/b48VHac/fB/64wHWC3vRr3CwuCAhlVsbKZL4MAPbv
         8XusGhtLsLIOl+LTdWeJU85xVaGBCmqha3M/b2q8aWbibx6CO/xrN3LJOmbXoBSb+u6a
         J4PtZiJFUFo2mGAPsGBjBFMN3mH47YDfz3ma3NqEXi4feeIn06gRNiJLgNsrVoXw9qQf
         t8QrOP/8EQJzv/ONSjRhpA4H7cMeOpJX+PNo2uphBUccH5nbB52u/zOjTULd9kjvPP5S
         sZ6264I8OYOoOJvtrP9h3h4mquGOJ5lwJdUwBICPzy6Yn1usxq/sqEXAcqOzq3D+B+27
         Oj4w==
X-Forwarded-Encrypted: i=1; AJvYcCX8RPk04k2XD4hsq9Fy30xyZv454RqmtWOHAs2OJI6CDXLgV4ainjyb2IkwcxElp1l45sl2@lists.linux.dev
X-Gm-Message-State: AOJu0YzLIKCK+lmuLUutV8kpxTe/e2O7+WMwpWiD3mIK0M/OE/vCI6D4
	uwY/v9a9z2HBaSujJi6l51s6Zcqzsw116anZToIsjRqORxCcQDJUhzB8
X-Gm-Gg: AZuq6aImYCN8hyVf4+Sm1h+kAD4Vn4iRKDEPBDRJLNWRY1NFZ3jxs0iuVVhp5eyTGa/
	ii2P0tUBBFgXv9LbYf8vkbzWITDtJ2DUYXrjwKXrHEqstoaT8WQJKnt6O5oM8m6zPAQ0uK9y/5S
	ElTV1Fi91fqOB3YGiZWFMQ+SLOj9GLQT5O3U9NyYAaHuohrMXunRZiywCbCCwq7u0jBCMdj4xMB
	UFdrCprg8RMxyKf+f6oIH7Ft52Hz8BSSxLXR72XSddb11fBkhvSudOZf0A7JW/mocSG722VeCPD
	+IbijKpHMwbvuRgRKujFt3IP14JypaPNErGoVBFA1Uuj+Y9VlpUw+sPDmCU86ObBpcP2Tojuy6/
	xoWvsVyIhE4pSbBt9ontM5XcThJjRtJYJaVtV/MLVx5SGUfVt5Ml1ipYOIx662l/AOFfYEHP1vR
	vM94ZCb/gaVYkkr4fs+XvHjADDiyA91oHmuN8Mmgi78N1C9Vok7CCV
X-Received: by 2002:a05:6000:184e:b0:430:2773:84d6 with SMTP id ffacd0b85a97d-43629344cb3mr6228340f8f.24.1770402413004;
        Fri, 06 Feb 2026 10:26:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm8131876f8f.6.2026.02.06.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:26:52 -0800 (PST)
Date: Fri, 6 Feb 2026 18:26:50 +0000
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
Message-ID: <20260206182650.6c21b0ff@pumpkin>
In-Reply-To: <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Feb 2026 16:09:35 +0100
Marco Elver <elver@google.com> wrote:

>  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:  
> > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:  
> > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > [...]  
> > > > > > > What does GCC do with this? :/  
> > > > > >
> > > > > > GCC currently doesn't see it, LTO is clang only.  
> > > > >
> > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > chains, so I really want to maintain the option to enable this path for
> > > > > GCC in case we run into problems caused by other optimisations in future.  
> > > >
> > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > does not drop qualifiers:
> > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > >
> > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > __typeof_unqual__.
> > > >
> > > > I really don't see another way forward; there's no other good way to
> > > > solve this issue. I would advise against pessimizing new compilers and
> > > > features because maybe one day we might still want to enable this
> > > > version of READ_ONCE() for GCC 8-10.
> > > >
> > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > years ago!  
> > >
> > > There is, from this thread:
> > >
> > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > >
> > > another trick to strip qualifiers:
> > >
> > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > >
> > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > raise the minimum from 8 to 8.4 (IMO).  
> 
> That looks like an interesting option.
> 
> > That sounds reasonable to me but I'm not usually the one to push back
> > on raising the minimum compiler version!
> >  
> > > But yes; in general I think it is fine to have 'old' compilers generate
> > > suboptimal code.  
> >
> > I'm absolutely fine with the codegen being terrible for ancient
> > toolchains as long as it's correct.  
> 
> From that discussion a month ago and this one, it seems we need
> something to fix __unqual_scalar_typeof().
> 
> What's the way forward?
> 
> 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> for old compilers with the better unqual_non_array hack?
> 
> 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> issues for new compilers. Doesn't fix not dropping 'const' for old
> compilers for non-scalar types, and requires localized workarounds
> (like this patch here).
> 
> Either way we need a fix for this arm64 LTO version to fix the
> context-analysis "see through" the inline asm (how this patch series
> started).
> 
> Option #1 needs a lot more due-diligence and testing that it all works
> for all compilers and configs (opening Pandora's Box :-)). For option
> #2 we just need these patches here to at least fix the acute issue
> with this arm64 LTO version.

Option 3.

Look are where/why they are used and change the code to do it differently.
Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
(I posted a patch that nuked that one not long ago - used sizeof instead.)

The one in minmax_array (in minmax.h) is particularly pointless.
The value 'suffers' integer promotion as soon as it is used, nothing
wrong with 'auto _x = x + 0' there.
That will work elsewhere.

	David


