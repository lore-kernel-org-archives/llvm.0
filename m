Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538349;
	b=T/DOK7jNrF4h3dO8dQCURi7AN+enctD0XTTkXvyPK6KjuvNuUmV8QoHv3yTruERag5jG
	 XLkVUDa/n6oI9ZiI/zp9pJDTddR0Uv1P1sfvG8U4dnB4L8J1Oy2eynWnh9v66zV+s36FQ
	 tSVqlyB0mCgUb6Qk3L308ebuSHXGwP0VhIIydyJ9IddxkfHhCGxgXxDcjTk030qaYt1GV
	 EsJUsk8RSY49M8c5he+Arr/85fdYI/TX3ws3yxZ5XC56rRitSKfY3kCWU1k/fn0XWQvDP
	 RHvCIC5GJWnKHIMfK9ReLXtLw8Bg8v2MDBu9xATYNdKIaear9RtFtneTjUYWMAgCBOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538349;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=O3Yc9yBO+zRnIRqu752XYobg3uDpvi0FYWhI2zmSe4E=;
	b=kTy2uRUrEQjAFp2SDJ78N6lUKKxbd53X5VivISQKH3XcEeZKjNRJxPFuwjj11IjbasyG
	 aFRYg8P13HgeWiV1clAZ6rmI5z1OU936xzd7+9+XCvVzfUjRpUecQHI8tmmn2Q8ToBA/e
	 m/oEio9A+C0CZAm1ZNlP0YlwJWjnlMm7k08RcNwPh2n3ZBs7MCocPl4chO9HLTvwtBUHJ
	 AzqUEAQ5iF3jbR5x6GMQGP/C7HFSRI+sLIe9B4JhuF8o/UiH4Cy5Kz8JYAUpTsgaMD9iE
	 q/1IVoKT4z2DolheRZAbltLSjk+C9dUcA/w+5S7QQ7/VBSwCXDKUoVfrVz1cnCCDRpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ng4e1vBb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6oFIjVyv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D0606A31E
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ng4e1vBb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6oFIjVyv
Date: Tue, 24 Nov 2026 17:39:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795538347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3Yc9yBO+zRnIRqu752XYobg3uDpvi0FYWhI2zmSe4E=;
	b=ng4e1vBbfdX5/dorThtbISpx96vazOBXlS75bQ2/eq1KONdWOyaoeBjLhuZOCBJvui7H5U
	S6MAkHe4MV9l9CGM4rz7PgBa0YD7+j36bwtysAms8757gZUw3UEclZFhoEIcSzW7sdkGKX
	CKb0Ky9HuvdvsvrFtZq9xT5NqUmKwQhovwatLslSQN6LQLdjHiM4S54VX5oxavLaFyQOqA
	HLe846EursoSM1Cvz1cwO0w9880Ul9AKMnAqWEkAhDaDgpYzr7kEFhVXPBYFz6KVeQt8km
	qUXPWlfiHSyIpAMozjHh9tuVMO+3wj0kxsZU5Jxisxwk1muLFaYQaU52+TPQTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795538347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3Yc9yBO+zRnIRqu752XYobg3uDpvi0FYWhI2zmSe4E=;
	b=6oFIjVyvpb//At/nw26MytUw4eLxYdY7Hn/TEb7xhBNtPBW1dm5lc8mQ+QfyUCqISMPIjL
	CgCMpYAN0x1G+tDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
Message-ID: <20261124163905.tkkaLhJ2@linutronix.de>
References: <20261122105646.2223131-2-ardb+git@google.com>
 <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
 <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>

On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
> On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> >
> > On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
> > > Very detailed commit message, but you kind of bury the lede here on
> > > what the actual problem this patch is fixing *is*.
> > >
> >
> > Apologies. I'll trim it down,
> >
> > The TL;DR is that non-volatile asm() statements with memory input
> > operands are not elided by Clang if their output is never used.
>=20
> That's not a bug; both Clang and GCC behave that way.
> https://godbolt.org/z/sEhec4oae
>=20
> (perhaps there is a clang bug somewhere, just trying to suss out if
> there's something we need to fix here; forgive me for being pedantic
> here)

I see a=20
	movq %gs:this_cpu_off(%rip), %rXX

on x86-64 with clang-21, not with gcc-16 for local_lock() and
local_lock_nested_bh(). Are we hunting a clang bug or considering this
patch?

Sebastian
