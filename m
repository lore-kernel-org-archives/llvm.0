Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A71494CC
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392445; cv=none; b=DiV5smpRChdygVUUQZNuw4NmBZ8k6uQDb7oy2dnt9tRoyfgVe6iCZOlZLQ6B8OnokJx0Ani2wLwgL/g+lQ39r8PHf7DGV1fD9SuXRfjdCX88bqniWJ+Ay71roefqIbtWx5dbjN06zx1IKGod9hN505oR/sKHLMg4cg5EL7ia/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392445; c=relaxed/simple;
	bh=eFLeqjVTgPiAw090376SG17Z9mJFbm6/n922cRk9UCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVcyQJwgS3LbZvyI30MFzpbvjZ2DE4qR4k1yF40H2kXtBBWlsLZ+mBJH+VpE+6nVt16aSDCopbD7dKNLTgMn/r7t73MazFHj0kUvLQQqn4yO6w4Vn1I269Lklao6fqrsWkK7koaY3Cx2nCgsEj6hfJzA+SNja1Np7bMftzJhIhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk/9ItEI; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk/9ItEI"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f0afda3fso495715785a.2
        for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392442; x=1737997242; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeb96j0t17KQfGBwsIYcLGCn6v+WZtBjSK1nZ3wXEWM=;
        b=Qk/9ItEIMen0QSs9gMv9YcL3Fd1jk3Ccnj5DP2nh1aAp494IdlyY0hNLa+xexAd4gV
         J08txDhwy0o5ir7C6dwPDbHYqvkTeprH5fONhGaQxOmTLMHIrDRKjFMa+TbrOwCxHvqy
         jFIhpQEh3HMddzIHOy6tGQOhVxPn+auvJP0M/tPF3JtGDKlFUVDZjy7bpucMGst24ZLh
         iS5yZEUGtbU0ClZ9L7u2p7uddz2nfhfevta++qulUteYodhjxiHnJ234mfd1wCkEQ5ma
         zVazF4lfryrZI4EgaDWs7wgb54yQ3rmGBy7OCRkZwst7TzmFMc5Bersi+r0w6KMAWtix
         Y2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392442; x=1737997242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeb96j0t17KQfGBwsIYcLGCn6v+WZtBjSK1nZ3wXEWM=;
        b=amfisI7OaymnnElQ/EfOWmIm15GYiY9Xx3l9ee8IO9ztA+RTrl903PQrYC9MUTfl4R
         J1JmafCCTY3HYFEh29EXKAOJ2oIGNuDDXoVBKdJRk4Y6mvDdtk2/bOvI0YpAHR1ylLLt
         s9E2ufSQnUWtSmaN9kO6+Y2Vb+QxQ/0B3BUjLw3PfxdnmQH0U+8g6yESqe4hPlUMN5Z+
         RhBvOrFTxYCQqUZmOD8BCKz32DCVaDH0NgRED1RPuapZ6bV/CBfL5cO3wmnVJRatezR9
         v5xo+Nrpxo4duTkm75HUY1o/eCht7wxn/kqNKZPpcUkOM7er+NP4CX+MKS7zHBAQvDLv
         WNvA==
X-Forwarded-Encrypted: i=1; AJvYcCUh6QTzdeH1kT6cQK/pGZMoqH3NIHbLki0XRP45CZlygM/P/bo1ssaIwIbkCohxS/zSSJ0Y@lists.linux.dev
X-Gm-Message-State: AOJu0YzAM9GDixu9OXP08GsWsmvZFj1w2CsUScbLTIimL8sHE+tqS8IN
	gvj/7nGg9DDp7M4tRkereAr1t7RtZExoa+kLlWoIWJK6nFubbBEL
X-Gm-Gg: ASbGncunyPUuH2n+2aN7l2xK1n+476lS239tL/vdtqy7vv6pdfko/bGoGsy1S3S2lwv
	bud4pN5iJZVNV6qNTWFfYWnZrcIJZV+Lz8zY9XWyGSXl3NdgZWWPYpXCWFlC55kpebsyEUQBRNV
	LAJdc/5bUHMWT9vAUubUL4HH0lU7yOfHVbwriSTUW7GYdp7RWZFXcNYHZrzl7iLxuRN/lX2uqpo
	exzawiFLTsS3+pg+0xDta7b5ZW+KGocVv/CkQyKGP3LlzrSsrzMfKsI+44f5mxvs5QI8YJPZVSY
	+g8imMUWRJn2TJWxbfGl7FmumBFQ+/xILjsuAPUfusxvzR1/NJlfFOFqj322
X-Google-Smtp-Source: AGHT+IGf4AI7JaLK7TNosM6inktWGSB/kmQMPZG3r0ageFq9tjJOTReQMLnEMWDU9BAuX13fc98aww==
X-Received: by 2002:a05:620a:29c4:b0:7b6:dd7a:9716 with SMTP id af79cd13be357-7be631e5237mr2069398585a.10.1737392442457;
        Mon, 20 Jan 2025 09:00:42 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61480ff5sm461455685a.47.2025.01.20.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:00:41 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3F6241200078;
	Mon, 20 Jan 2025 12:00:41 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 20 Jan 2025 12:00:41 -0500
X-ME-Sender: <xms:OYGOZzfeXpRkijZQ83Unk9dOwxnRndRwAVrNBhkA8wxyIViW6mEugg>
    <xme:OYGOZ5MjtDw-FFOS3WT5ps6xFf3BsZsUGYA-y10JuBFDYlD2PNml2OPdGcTGv4B48
    gtNRQmdnRPhFQWy7Q>
X-ME-Received: <xmr:OYGOZ8iPje0tVkF68qQuVvuUMhRH1OK5O8Sy_F25mBDLN72BJUkXmlKd6hU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmh
    hinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtth
    hopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OYGOZ09Ut5UsY6-4qHqs91zu6PqbnvRAHeYx-RdlC1Y9NSImSDPaTg>
    <xmx:OYGOZ_uj5eup5_HamQ1N5r3Duu8BtiMFYdDGeKZUo99jC2CllcgyMA>
    <xmx:OYGOZzHwZBiFsMF_v3hTT8JHXntoU08T78uPxyy4ds6NLZbIQ_gLjg>
    <xmx:OYGOZ2Pcj3BSCZbNLLWBZc5MXjFViMdgsnB2uyJ9DQpbdCCWNiBVkw>
    <xmx:OYGOZwOVNjsLFWKxUQuFcmkOYeFmkO3iacmhTxPhL0AngUjr1Ot1w_u6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jan 2025 12:00:40 -0500 (EST)
Date: Mon, 20 Jan 2025 09:00:23 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Mark chain_hlock_class_idx() with
 __maybe_unused
Message-ID: <Z46BJ8FhWCIXbM7p@boqun-archlinux>
References: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>
 <Z180HFO6a61PtzYm@tardis.local>
 <Z19IYHyBbxf4csGB@smile.fi.intel.com>
 <Z2SWypPS7Lc2CXb6@tardis.local>
 <Z44FHR2Z_i54PHfJ@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z44FHR2Z_i54PHfJ@gmail.com>

On Mon, Jan 20, 2025 at 09:11:09AM +0100, Ingo Molnar wrote:
> 
> * Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Sun, Dec 15, 2024 at 11:21:36PM +0200, Andy Shevchenko wrote:
> > > On Sun, Dec 15, 2024 at 11:55:08AM -0800, Boqun Feng wrote:
> > > > On Mon, Dec 09, 2024 at 07:08:10PM +0200, Andy Shevchenko wrote:
> > > > > When chain_hlock_class_idx() is unused, it prevents kernel builds with clang,
> > > > > `make W=1` and CONFIG_WERROR=y:
> > > > > 
> > > > > kernel/locking/lockdep.c:435:28: error: unused function 'chain_hlock_class_idx' [-Werror,-Wunused-function]
> > > > > 
> > > > > Fix this by marking it with __maybe_unused.
> > > > > 
> > > > > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > > > > inline functions for W=1 build").
> > > > > 
> > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > 
> > > > This looks fine to me, so I'm going to queue it, but could you do me
> > > > favor if you could share the exact configs that would make
> > > > chain_hlock_class_idx() an unused fuction in kernel/locking/lockdep.c ?
> > > 
> > > I might harvest this when I come from vacations (some around mid-January).
> > > 
> > 
> > After some investigation myself, it turns out that
> > chain_hlock_class_idx() is defined outside "#ifdef CONFIG_PROVING_LOCK",
> > but only used under CONFIG_PROVING_LOCK=y, hence the unused warning.
> > 
> > TBH, I feel we should really clean-up/consolidate those "#ifdef" to make
> > internal definition/usage more clear. But nothing blocks this patch, it
> > fixes a real issue, I will add the CONFIG_PROVING_LOCK part in the
> > commit log. Thanks!
> 
> So now that we have:
> 
>    343060092585 lockdep: Move lockdep_assert_locked() under #ifdef CONFIG_PROVE_LOCKING
> 
> Do we really need:
> 
>    8148fa2e022b lockdep: Mark chain_hlock_class_idx() with __maybe_unused
> 
> As it would hide the problem fixed by 343060092585?
> 

These two commits fix different functions, so they are both needed.
Though, we could probably regroup the functions into one big #ifdef
block so that we won't need the __maybe_unused annotations.

I will take a look.

Regards,
Boqun

> __maybe_unused annotations are almost always canaries of something 
> messy being hidden.
> 
> Thanks,
> 
> 	Ingo
