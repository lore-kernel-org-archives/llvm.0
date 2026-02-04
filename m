Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72243ED13D
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212215; cv=none; b=rqs1FYYYkNtRXL40UwJMEFfKwn4kkCFkc9gpSn1jU0hNlmbZ1zyHjH3ldsTVDp/GeOqa5/fQE5ee7nzAa40nKDIW5v2HA8g4cLi1/eVUe6ZfaswJNGd8T4XFmXXPl7NAtdforFmidMAaWxPs7kF6wewwacxU8eJB4IzZY0KO28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212215; c=relaxed/simple;
	bh=Ek8/E1uf8JioxwC17102C6P6AwOf+FpydRqado7kk28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K72rBVkI9ST5UnJKjQHRvYA/LR+gb+BN/qH/MB1zXwWPsqeLw2NiSwEKMQI5eBM9dRbX3wb9GXEvixLmc/3xaJpxOdKolqM13MQMlb+g/2DhiIIcTrmUMNFxlh2SJxCqn9oC83gVpVTFmQmSF9PYqb3zRkPVIRldLRB2A4qN6HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sD+g6p66; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sD+g6p66"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806e7c4220so9171535e9.2
        for <llvm@lists.linux.dev>; Wed, 04 Feb 2026 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770212213; x=1770817013; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=sD+g6p66W5e/gOfXpwkomqLFh8uiVJuMxVSruGUgvSWwA18GwYXiPI0sg0unCXknHT
         kAoJ08sb3xusAmEkX7Y9QBpvg9fwrzbyt+8Plgu+UAwYJsXtDrMn6de2KqPDvseGbICf
         r6uZ6LRAdXfX8nv24jPf7SgoSHfLBJ15PgrwBJy1v5931K3/LCPzuxBxl+RXv+StnTWB
         Ef//LYzR/UUu4JZWsEhyVD++WhdiFlupRZFyKKImnzJyqVh08NRfsGZS4BmIyRs4e+tp
         FanJLsVx/7OdjT3JIcL87xNqSqNXrK93h7Mx6GzAsYd/zrxmue0Cmhq5q0dt5de4vP4C
         DQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212213; x=1770817013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=kLiOlo4WN7+sp7StrQAYBUWaZSUs5OxPCtCp7mOnGCsYorURfUQxBG1sT1weHAN7DX
         ekt3+r1QB3XsIOfYc3t88a3oejUCTfGHNODALVy4U7tCJT+J9OsrKEacCNI+tP4QgDNY
         TZjvuOYvl5A2lqvc1/YT6eXvlTfZaWaKTBhljA0SLGatbfcfU7EqEURmL4Q7KCbXSLhr
         RqglOtaXFHFkGG1vXu1aR4MzQpgmUkf7G9KDo/O1Ak919wqRskM0wfGJDA5WJfAZY+k8
         LbH6V4zHg97pLhoL0b2SBB+y2DUXSMuPuOQ1XcldAPNwMEWxEQ3lT+/DDCWtPTcsLz5w
         jkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkaTFRpWyKnEsxGpeMPEnkJMsvb5GaRKsbOeEjp6c/d7mWMumMqh8s7a6A3XJWJgwaWhJH@lists.linux.dev
X-Gm-Message-State: AOJu0YzWG1gljgGG4VmVU1pBjADWya71VDFkLQMQCwV51qMp1r6aAxEn
	LL+vIb9ekdjMIdlnRuEEz8/zmPFzeW6XTW31lzijk+HK284uVzoabhCVc7YSsPOeIEQ4QdsBknE
	yDNkWU69cOJWIFNCJKg==
X-Received: from wmqu6.prod.google.com ([2002:a05:600c:19c6:b0:480:4a03:7b76])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c17:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-4830e930f73mr44864985e9.11.1770212212161;
 Wed, 04 Feb 2026 05:36:52 -0800 (PST)
Date: Wed, 4 Feb 2026 13:36:50 +0000
In-Reply-To: <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260204030507.8203-1-linkmauve@linkmauve.fr> <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net> <aYNBtc2Jbtg9sLIE@google.com> <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Message-ID: <aYNLcqEo45oWpRYi@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 02:06:53PM +0100, Peter Zijlstra wrote:
> On Wed, Feb 04, 2026 at 12:55:17PM +0000, Alice Ryhl wrote:
> 
> > Is there any reason to not make it Rust-only but for all Rust code?
> > Making the / operator work seems like it would be a good idea.
> 
> Why would it be a good idea to have it work on non-native types in Rust?
> 
> The reason we don't have them in C is because non-native divisions are
> expensive and doing them should be a conscious choice. The very same
> argument should be true for Rust code too.

I suppose that's fair. Perhaps one way to go about it could be to create
a clippy lint for 64-bit divisions telling you to use an explicit
division method?

This way cases such as `core` that use division can still use the slash
operator because the lint is not enabled when building core. And normal
kernel code would be told to use the explicit method instead. Or kernel
code could explicitly choose to silence the lint on a specific method if
they want to perform a lot of divisions and know what they are doing.

Alice
