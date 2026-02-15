Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181B1EEE6
	for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771197501; cv=none; b=dgEgar3w+yeUwNEGIK6Ua5YjgZMwrDeIdDvqy5JZ3SrQTfWcaLJ3IZt+iuSJirXMnEpRfOh1kE/Ch88kD/iS/rDE3Wuz2gC20i+GzpE4Pv8r3ttSsttTnXpqmt6wku8L8zJ8RbNU3O4rx+EAPN4YrFAh/qMSt8WR+GN4+sFluso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771197501; c=relaxed/simple;
	bh=+ehCOEAaN0Kjfh1EIK4SsMxAJpy14lJ96QZN0sk3LOk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=boPIVSCIzidhYRO33mL8+i9sp3EjeVmq/ZTlcC+7PN6m1vspe0i21JYKdSXe+NcWAl8Zlki/Ts0FamdyHk52EqQ493nPSzXqy3GLgLeDElB1A5IEJi9H0hOKIa1rM/sODycY5zkZ5IG97aADUdeVKc22BXpVvhLi4eMuS5pQK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cd3GMCCs; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd3GMCCs"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43591b55727so2968237f8f.3
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 15:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771197499; x=1771802299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abQxCrV9998clHoIb1eLxxXVhtrIbNNpVeBCR4juSxM=;
        b=cd3GMCCswS6gz++GuHZuUNbmBLpHvkWki3IhADvCEzyfbqRxq3RFHLVmAV6AULY8cL
         0RgusJis5AQotRq6KBUqT8+gTZ35ME38AgJPsOCIpWZz1oBwyfzLBL1KW19VyeWUPyEc
         xu8L5qPyAEe3kjQ2tMTB53oie30sluyFQEo59mUV+oVKMCXruP6TE6o5RQGsFpBWYAc4
         py22Pb0P6xIvhU8tKFgwkbWnLQIWm1XxF3pxHtJm2P2C6W0ll5+DjSnoIOrk+F9r4NMo
         1hXk4UZvTF1LAZ/7azDnP6bIm8l2UzLtrInH7a/uyF5xISXjidGBcUituqP/BsOCE4sm
         a80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771197499; x=1771802299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=abQxCrV9998clHoIb1eLxxXVhtrIbNNpVeBCR4juSxM=;
        b=wwTeDPwOqoMKIqQhv0EEECmtS8Fe63GsWTpHFkb7PYuJt4O7eofp7BR6bmfQq1bRPR
         EQA3MrrRyyE28hN505BUd5ZMoH+lwZj1DcEmn8jMNRfjq5AGpreLyA6LG0pKCKMgUMLV
         W/k5jvsyRgwwlMcT2aDkfuhrXQLQwnhq7zs7vm83QT/OW7sHK5GxfXVQ2u7BMcEaRvpq
         NzpxXfeFYkodGaA51lKAREXjoakbesHNq+FqXCdKhJgqUPx6RukmccYDOBP4Vgdkt4gk
         LY3Jlwlakj4IlWMJmPRw2OwSy6BWjmtFxaWyPBnW/Czrz1CPgKwwuAqrKHKVRPgWojFi
         k6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt4e7ei5qKNEPnz73yela76dA2FIuFcbMaSr7IMqQlT0nQ6KHgeVje1We904qD1B/Jvp5l@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8mV881tQXKhqzSOWrArlInhS7+Hb/kUccrhPrQSwro5X/w4IV
	bRIW290XLjb5m7L7LBFYKTSU3IJGtMuZByq+Ltc0zS7r+mfM7NLpDQCH
X-Gm-Gg: AZuq6aIA1ipOx1RNbbtKoFbtqyjRr9BJUElXX+u7aAhKHPeqt7IKg9CSZBHxeLi49xO
	IqrVny8kOJk7BVNHlrFlCOouyaMAs8b6q92dZoi/KtgSqZrSpC6Bxq6lGrFSruzd9EdW7+wP+Lu
	WapW20JS8hhb8I0/Fxyk6yR4kAtQ9m1wLwG7XUBa84cjSUSAPZ6WOWZYKG8hYqVH7ccshtKqvUb
	PUUi1/b2th1IGABmV4WUjEyKhKTqyPRKTcNZCpHj44n2tLyVkBpyH8oUCSCdKvMUyAX6r9ZqV16
	ciGZBdTdzFuPDZu0G461XmYr0s3MfUGxmJP7xOtJyMp1K0f+mUvODgP9f9ScG1Dkpx3GXkoV2ao
	D22r+i5o5t0q35jC6Ry3fja71zn0pSe5pp8cRGwE+p6rCCn38voAzXUuXgfroo5f23LDEZ9CWSM
	2tASrogkw0JQQJ79XTDAz/Qy3cqrTGQ4LZtXDlpG6EXCIqyKSAToaJ4sFr4CYmq40Z
X-Received: by 2002:a05:6000:2403:b0:435:9223:bfda with SMTP id ffacd0b85a97d-4379db617a7mr10309100f8f.21.1771197498436;
        Sun, 15 Feb 2026 15:18:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm23197171f8f.38.2026.02.15.15.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 15:18:18 -0800 (PST)
Date: Sun, 15 Feb 2026 23:18:16 +0000
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
Message-ID: <20260215231816.2398e4f5@pumpkin>
In-Reply-To: <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
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
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Feb 2026 23:43:23 +0100
Marco Elver <elver@google.com> wrote:

> On Sun, 15 Feb 2026 at 23:16, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Sun, 15 Feb 2026 22:55:44 +0100
> > Marco Elver <elver@google.com> wrote:
> >  
> > > On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:  
> > > > On Fri, 6 Feb 2026 16:09:35 +0100
> > > > Marco Elver <elver@google.com> wrote:
> > > >  
> > > > >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:  
> > > > > >
> > > > > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:  
> > > > > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:  
> > > > > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > > > > [...]  
> > > > > > > > > > > What does GCC do with this? :/  
> > > > > > > > > >
> > > > > > > > > > GCC currently doesn't see it, LTO is clang only.  
> > > > > > > > >
> > > > > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > > > > GCC in case we run into problems caused by other optimisations in future.  
> > > > > > > >
> > > > > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > > > > does not drop qualifiers:
> > > > > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > > > > >
> > > > > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > > > > __typeof_unqual__.
> > > > > > > >
> > > > > > > > I really don't see another way forward; there's no other good way to
> > > > > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > > > > features because maybe one day we might still want to enable this
> > > > > > > > version of READ_ONCE() for GCC 8-10.
> > > > > > > >
> > > > > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > > > > years ago!  
> > > > > > >
> > > > > > > There is, from this thread:
> > > > > > >
> > > > > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > > > > >
> > > > > > > another trick to strip qualifiers:
> > > > > > >
> > > > > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > > > > >
> > > > > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > > > > raise the minimum from 8 to 8.4 (IMO).  
> > > > >
> > > > > That looks like an interesting option.
> > > > >  
> > > > > > That sounds reasonable to me but I'm not usually the one to push back
> > > > > > on raising the minimum compiler version!
> > > > > >  
> > > > > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > > > > suboptimal code.  
> > > > > >
> > > > > > I'm absolutely fine with the codegen being terrible for ancient
> > > > > > toolchains as long as it's correct.  
> > > > >
> > > > > From that discussion a month ago and this one, it seems we need
> > > > > something to fix __unqual_scalar_typeof().
> > > > >
> > > > > What's the way forward?
> > > > >
> > > > > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > > > > for old compilers with the better unqual_non_array hack?
> > > > >
> > > > > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > > > > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > > > > issues for new compilers. Doesn't fix not dropping 'const' for old
> > > > > compilers for non-scalar types, and requires localized workarounds
> > > > > (like this patch here).
> > > > >
> > > > > Either way we need a fix for this arm64 LTO version to fix the
> > > > > context-analysis "see through" the inline asm (how this patch series
> > > > > started).
> > > > >
> > > > > Option #1 needs a lot more due-diligence and testing that it all works
> > > > > for all compilers and configs (opening Pandora's Box :-)). For option
> > > > > #2 we just need these patches here to at least fix the acute issue
> > > > > with this arm64 LTO version.  
> > > >
> > > > Option 3.
> > > >
> > > > Look are where/why they are used and change the code to do it differently.
> > > > Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> > > > (I posted a patch that nuked that one not long ago - used sizeof instead.)
> > > >
> > > > The one in minmax_array (in minmax.h) is particularly pointless.
> > > > The value 'suffers' integer promotion as soon as it is used, nothing
> > > > wrong with 'auto _x = x + 0' there.
> > > > That will work elsewhere.  
> > >
> > > Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
> > > where possible is the way to go.
> > >
> > > Unfortunately I spent the last week occasionally glancing at this
> > > arm64 READ_ONCE problem, and could not come up with something that
> > > avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
> > > to go with the unqual_non_array hack, but not make this available as a
> > > macro for general use - we have too many of these horrid macros, don't
> > > want to add more to this hack pile.  
> >
> > Agreed, having to do such things inside what are already horrid 'functions'
> > is one thing, but when they get used in 'normal' code it is silly.
> >
> > Have you checked whether sizes other than 1, 2, 4 and 8 are ever used?
> > There aren't any in an x86-64 allmodconfig build and it used to be an error.
> > Even if there are handful, having to use a different define wouldn't
> > really be an issue.
> > Removing that support would make READ_ONCE() easier to write/understand
> > and (hopefully) compile faster - there is a measurable cost for the
> > 'size check' in the x86-64 build, the arm LTO expansion must be significant.  
> 
> I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
> case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
> 8 bytes (due to that static assert), but that itself uses the
> __READ_ONCE() helper which these patches were touching.

One thing that might reduce the cost of that static_assert is to move
the error_function out of it - defining that in every expansion can't help.
A few places do that, but it really needs a helper - say:
#define compiletime_assert_fn(fn, msg) \
	__noreturn extern void fn(void) __compiletime_assert(msg) 

> 
> We could invert the game: have READ_ONCE() which just deals with <= 8
> bytes. And __READ_ONCE() which uses READ_ONCE() if <= 8 bytes, and the
> non-atomic case if >8 bytes. However, I fear the static size check
> won't go away because the asm-generic version of __READ_ONCE() happily
> works on any type (it's just a volatile cast+deref) - I don't know how
> we'd enforce the size limit otherwise.

That should probably be a NON_ATOMIC_READ_ONCE() that doesn't 'fall-back'.

	David


