Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F94428469A
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390614; cv=pass; b=M7nM7kEBG5JtnLfjVDjswfTpVLWR/Uv2+WYrp3SonXgmsFCrzxxcqiNJOnbIfJN94scUIyx5c90fzvnYcAtL9/m5KFyJX3HvPG5sTQYr97XVnIcng8RVcI80EXdzLd4Z/U3m1gSIRdSRCAY0hqp803xeYFAHq0NVifCRqqXUoEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390614; c=relaxed/simple;
	bh=8LuOnGKle314G+TmzX2PcVGb4teVfbMjwqEB5kictyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g531EA3m0G5lMrHZUfuc2zb1qcBaCqNr99jf6qciUoHMEUdtbFbJjdR21YF61SWg/UU8TkjkL6lYyQVsLTJX/Ct9LuDsglpCQbGaf3RI6bCuzdy1lLuhvKYloiwR6+3WXu2V9oTUWrtKkJkJCD92tEvs1pmOpMQ3pH9VMO6lBYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AteoWVNY; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AteoWVNY"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12460a7caa2so899849c88.1
        for <llvm@lists.linux.dev>; Fri, 06 Feb 2026 07:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390613; cv=none;
        d=google.com; s=arc-20240605;
        b=FAA7slEKXnLCMKap1vFyqYNkbxXXVsOQTB+67lzktaKjSF6El9S2P6RWxIJgH5DOFZ
         vV0pnEZa6tievN1yGpSv1KJHyepddX5CaNYXUPf7jki1lc1sbQXwxEDGJtmaVdP7cpJQ
         LWYHjKOroQ/XV3XPC/6sAbdTDcxBf3ePbDuIk+jAHIdedICnIbmPN0YdjGTufbwTv+yL
         e0b3HOO8LSrffxwJRvW4DwOlSEB9fwDYRMBXh0Y19cw7mH4wRvZQlr8FH0miUhen/OB8
         zyIDQ8gFjaVN55D3Oc3PWWdZh4yfpuJARLjg+dYYuBPSv6Qj2EhzCPPMIJ9owYuOvBGj
         F/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=;
        fh=59n1F3Xy7tdHqURkpBWduC/Tl5QviRjRyd8yucZH6B8=;
        b=SZkarVoL5Bah4TZdIewnVLRKkB/YCBxaWaQ4URVWPZripckYF0Qr/haG/cbFJZD46K
         wi/J98n8TwQb+PIkDiuZh64J6OR7AHv3JivyGaTl1u2PE6InQDw0q0Y1TXdYZRuR5Z05
         iResqRMME63wSVcpnagJdzdKayorle5o1LI0wScMa2o2Yaro8KzmTXx/YNkBBUMoob6+
         KNWPSYdHtU1oH+G2fltYIluolNMQl3UZJnUpjoQ3AUrpXKq1bEZ8JNwAiIKY5W2lY5Mo
         XVaZ3DCuKiygP8SprF37bNbqpiOkq1qxdz3VnEUniMzuYpZ343e67NTXdbTr5UKutrF6
         T2eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770390613; x=1770995413; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=;
        b=AteoWVNYpxm0aKKQi+XSVEe2m8JssIfo/6qH5xgBwNJD7/xGTI67Cac9S+FYkXhr1T
         NUWjL0UROUVp4so4696TSzNy4atjd5nNXc0wJEvhgfes3IbhxYsv69DLe+6AiJdSeyin
         w1e6yduAolAAsnrJvisIgHl/FfZteOc/iIaQL6PcllmeETwpbLBu87n7LBo4z+VDUnEw
         kcN3DLc1/zGWIxznCIGAlSMyDygSkNQNgjZcSbCPs6bv6AvwA207e5ae1Y4fOYUJODZY
         zQygYH/QSyOEdqChGpf20ExMl56r0iVBWjaqN2Wk3DmUzDqmZcNuxnkKPuqw7A1GU5VG
         HO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390613; x=1770995413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=;
        b=ODNIVjoB/sbUHmYWAmjx7JA6flDWCM5Vu9GYOWcrKVWIr3YJe5d+z4UyQVLqJo8tT+
         NmtR0ZpDazJh17dgjOzVUF6mVcvFrELYxdqwsN6s0jPE/CE9hUjpn5hlQmvnrZTn0jtY
         t7VJrd81+Eb8oTkIhfi4yKXhNFN/hb+aPVkE8yHSWibC+Qwu75Ybz6SIBHkYlyy22QLi
         3TD19tRDu84sQClT9j4nhb/i8bzAZ1rOzois4yt4mICtx6QGd7vhOuPJ+IDkEnZxH7L8
         PvezGktO2pKf1nRVKE50to4DC4S4heIREA58PsYFj53V9SoVNMjmsn3GWKyVnyifyf2/
         SzgA==
X-Forwarded-Encrypted: i=1; AJvYcCUg89zOEOqg9Rbci167DYUr1o2/9jglHRvL+aaZ3NgMxRGR+NC2kiYwXmebdvcHMN5Abk47@lists.linux.dev
X-Gm-Message-State: AOJu0YwRnxtvxJakeGQC4iQ5s2HE53ZhTcdbBMgIIZppgixPe1NP5IAe
	2cijdMlej7aLUMTZ7U7ITKLIo2uc1Y/Zsag96uEKvgozyamwe0GbJon+eHuM143XLvw9V4nSjZZ
	P3nLBkSRb0I9wQklhPd4AmjcWcct6iQOLwv459dOY
X-Gm-Gg: AZuq6aJraPuFKOmFfE5GmRpmWcOwxUcn16GGdhgkcwpr8HT30Lm7E8WyQPcvBwTwXZl
	9MP0Id2PorV8SyFrpchlvNRypVvyPdTK1ezyO08eKKhhvHHR4tKT+2W8n2mIh8Ehf7W/6mmXZbW
	8osFdDg9WWmkEoHumnPVJNkz/3LsnNTrypYx6iehoP9r7sZyQZodGHtPCfijRy8k7iRffQTqnNO
	081Uhi/4KSKQzltWqyN6Jbm5ndenX0a/bT04/L+SCnHrBgzrRjTEteY1hbCCrvqcmBociNzGHV3
	11XmCRnolAqBcuWHckCQnor9sz5mSmIFzD1C/Q==
X-Received: by 2002:a05:7022:4395:b0:11f:2c9e:87f8 with SMTP id
 a92af1059eb24-12703fe8d42mr1356108c88.34.1770390611792; Fri, 06 Feb 2026
 07:10:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net> <aYNUmEfDzq7lTFFr@willie-the-truck>
In-Reply-To: <aYNUmEfDzq7lTFFr@willie-the-truck>
From: Marco Elver <elver@google.com>
Date: Fri, 6 Feb 2026 16:09:35 +0100
X-Gm-Features: AZwV_QjGWgNCD8_CbzAKGRGQz6hSk-9w0IVxQz6j51nG9zFrUKiXSKoq5saBYLA
Message-ID: <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, David Laight <david.laight.linux@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

 On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
>
> On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > [...]
> > > > > > What does GCC do with this? :/
> > > > >
> > > > > GCC currently doesn't see it, LTO is clang only.
> > > >
> > > > LTO is just one way that a compiler could end up breaking dependency
> > > > chains, so I really want to maintain the option to enable this path for
> > > > GCC in case we run into problems caused by other optimisations in future.
> > >
> > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > does not drop qualifiers:
> > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > >
> > > So to summarize, all supported Clang versions deal with __auto_type
> > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > __typeof_unqual__.
> > >
> > > I really don't see another way forward; there's no other good way to
> > > solve this issue. I would advise against pessimizing new compilers and
> > > features because maybe one day we might still want to enable this
> > > version of READ_ONCE() for GCC 8-10.
> > >
> > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > years ago!
> >
> > There is, from this thread:
> >
> >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> >
> > another trick to strip qualifiers:
> >
> >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> >
> > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > raise the minimum from 8 to 8.4 (IMO).

That looks like an interesting option.

> That sounds reasonable to me but I'm not usually the one to push back
> on raising the minimum compiler version!
>
> > But yes; in general I think it is fine to have 'old' compilers generate
> > suboptimal code.
>
> I'm absolutely fine with the codegen being terrible for ancient
> toolchains as long as it's correct.

From that discussion a month ago and this one, it seems we need
something to fix __unqual_scalar_typeof().

What's the way forward?

1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
for old compilers with the better unqual_non_array hack?

2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
__typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
issues for new compilers. Doesn't fix not dropping 'const' for old
compilers for non-scalar types, and requires localized workarounds
(like this patch here).

Either way we need a fix for this arm64 LTO version to fix the
context-analysis "see through" the inline asm (how this patch series
started).

Option #1 needs a lot more due-diligence and testing that it all works
for all compilers and configs (opening Pandora's Box :-)). For option
#2 we just need these patches here to at least fix the acute issue
with this arm64 LTO version.
