Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690917D2
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345919; cv=none; b=FSaI73PS6Sl8On253zm/fMnzgCFrcGjIethW1oV7HExgGRZnQ3cd+xnAQsMhpeMNm3DgDIQdgTDqA/XHFqopu25sZNh5mtkczWwImE0GqXKv6wjDRVgAU3mh9Y8PcqVIC886hYuzK0d5yhGd/Ko7ePhAyzq09qE8bHPIdPcbe1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345919; c=relaxed/simple;
	bh=QPrpZgTs8vPTBHFzbhy83lux56ucmvLYnhqKqXH1vlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZaD3B2jg8g9hURTpxVJoj1NlVP1DrFxp4jtmiXg4KdB+UhPfKR8Z1bIB4I4UUxhx4GpKAHWsUtLtwpAQtLSB1yukVI+HRE3xYvZcG6ig3zqtQUOY59aYFszwyqPF53eM4SFJD0/aBdSsUQYQzpkuG/FJeWbkvX0VydNYyWwLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gLHjBBOX; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gLHjBBOX"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-3871a08189aso34871371fa.1
        for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 08:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771345916; x=1771950716; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8VVVA27vXMecotvakD3mWfyoVh5TXj3m2nUAse+m5/Y=;
        b=gLHjBBOXa47Ovwz5K4k3r4WX+s4AMee4mmbGsXGoEyc/sSTEfFpFp4adMdLiSVJSao
         pftKX2YJoY6h/ULr6YdE22UqUhmrI1xbZJPZoKpvFrvcCBrzxV1K0Erb219E5wmGhR/D
         TcrWOjrqAhAfHooDlGDv8TI7rYZsfQzMW7tFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345916; x=1771950716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VVVA27vXMecotvakD3mWfyoVh5TXj3m2nUAse+m5/Y=;
        b=ZfaRQ5F3G5MX9LQQryqfW/njOWBx8BOcytcfX//J4xCTDdorENOZKVasmCdGAYuhSR
         cJtvuRQngrfz13YapipDxq9iJeUwnUkhy3dE2I8Xztr25N8ZbH9x1n1yo6ibF43qkbgk
         rUPeFSySp+iOn/sCkYcAucZF2zcNr3XDevssw8Dgox517kob2NddFEOZyFIXZHVfQJlm
         dA7SgX3hhyy2mca7EfudizrYtqckj3VP/RXVLh4TbRvhW7Bjl/D4zi+g8vYL0738GFYc
         nWexS4FknDlEbNmmhroFamzLpHbmm3VjLE7e2UJrdKcVkRjj35usKZ2nhd6YRwZh6JNN
         piDA==
X-Forwarded-Encrypted: i=1; AJvYcCUblE/OI75qTJ2c65QDCm5K1Mlt6+V9r8k/zbURiCxN0zaBGSgb4JedDNdU7n/n7lPjb4TQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyXs1jU47w4A8+/j2AELQMFcTN8Ly6EWhzNGGdD+lHMQW2oNYrp
	ajFps5b4yYjJ+diBG/+/U5CggJvBFjICauGqVLa9dNBPgGVxR+/eDr+Mj4s7kahTOeA3PfUVHg4
	sALwCJn8IRDs3
X-Gm-Gg: AZuq6aLvt8WoKtBPG8KWpYJmCqg+THfG7kC0xhlCgR1olw6KJCxGCgF5S7aH8+SNpFd
	XaqAny4YOs7deGFgqHkhSix9zwQ30MG/NBgu86C2yubLMRv0f+8cqY+1znjoFw1f6syIj1fF6Sc
	kZ8uFw+iGOynR25yPxede841sTsmuA/C/eaJb82JLXR4fR8MnEQU5sxUhNiUE0Uxd9v/ScAeRem
	Ste46LoVPX+3cB5DLdwXtYMpivSBXTfCkXLStGd/lhx9O83OxIsByBuHGVq7uAxMjZOl/NLvpG5
	tX1L2LvScEftU5WrOsctsSTWn106/DX5IfHcgPUYawrdiCJwv/IDjAEG85rUZgAeJsgTucBKjPI
	gnykyl0VLG1YZ8VI2Wgup6bF4sE5/K2GTUguREnp3JalrK+yjcWVvCMT2uPDZLeGOM91YjkLwMy
	gkq2Dy6SLclFpc15Hv5TJbJEutcEVzIcGk8/UB888ttscjw5cnQPbioVuIip9XCfbVJ68sEM3x4
	cvn
X-Received: by 2002:a05:651c:f06:b0:383:b9d9:3fdd with SMTP id 38308e7fff4ca-3881057263dmr44787791fa.34.1771345916065;
        Tue, 17 Feb 2026 08:31:56 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870692b7b8sm35302191fa.44.2026.02.17.08.31.55
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 08:31:55 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38704f70ea3so37529351fa.2
        for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 08:31:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMad2FLDuXAaMZz2A1aZv8fnDlqOl/lwNlVOyzTBGYAdnr8n3sB0vn3zbcPQq2l9cNvEHQ@lists.linux.dev
X-Received: by 2002:a17:907:988:b0:b8e:d04e:e4fb with SMTP id
 a640c23a62f3a-b8fb44dce24mr825863766b.48.1771345431078; Tue, 17 Feb 2026
 08:23:51 -0800 (PST)
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
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin>
In-Reply-To: <20260216174324.75d47e37@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Feb 2026 08:23:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
X-Gm-Features: AaiRm53uZCbuFwEyfKCGb0ntN5PpXfYQtY2WkHebZ_fqBMtvDsyJbw5Zc4B6Gvw
Message-ID: <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Feb 2026 at 09:43, David Laight <david.laight.linux@gmail.com> wrote:
>
> >
> > Try doing something as simple as a "var++" on a volatile, and cry.
>
> On x86 I just see a load, inc, store - not that surprising really.
> (clang did do 'inc memory'.)
>
> It's not as though 'inc memory' is atomic (without a lock prefix).

That's not my point. My point is that it makes for absolutely
disgusting - and pointless - code generation.

That load + inc + store is a sign of the compiler missing truly basic
optimizations because "volatile" is so badly designed.

The thing is, we typically even *want* a single load. We actually want
not only to have basic optimizations that don't even change the
semantics - we typically even want CSE.

So we want basic optimizations and combining loads. The main reason to
use READ_ONCE() is actually a worry about compilers doing even worse
things, namely rematerialization or memory accesses - something that
compilers don't even do, because it's a bad idea, but people still
worry because they are _allowed_ to do it and who knows when something
silly happens.

So I want that READ_ONCE(), not "volatile" on data structures, because
*some* day we can rely on more modern things and compilers will
actually get it right if we do it as

 #define READ_ONCE(ptr) __atomic_load_n(ptr, __ATOMIC_RELAXED)

or similar.

But last time I looked at it - which was admittedly a few years ago -
the compilers we supported didn't actually do anything reasonable here
(ie the built-in atomics were fundamentally worse than the ones we do
by hand, and even basic things like __atomic_load_n() weren't
actually; better than just using 'volatile'.

Maybe that has changed. We've upgraded minimum compilers since.

             Linus
