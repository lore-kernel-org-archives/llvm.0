Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C9ECF
	for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718553045; cv=none; b=MgW1KC/nlMyf/R2Kt3qFQq0UYfBHPIaAqnNujhaHoWAPglb22c+ccfIARPAmQdVDOik3sFQOrdKE7kG0yCpo3jgjYVA6aKHGnpJ1hHVc/pohVTcXfMckfU+/lmTfHXqT42KHGMoAjo7Z+lyODSafyTestoeyt2E6hg88I2zPdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718553045; c=relaxed/simple;
	bh=Wg4H7m1DXoMVcfFsc9++uNoYAhYlEgbR9dGVm8CvBvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCvFQQ7PZtyi8koU1AUq+/C2Wz5Yk04by0fbLmL77Ct85nEoQjRX3QyMKE7VMDwE7BdkLW0iMdbag561slEDQRbbB2BLQ6/YcyfixyxQ9cYXiDkhqawkhJnjT3PJwPPA3fpMlCUO5p3v3OKIMpgminRqEqifvxbUP7hUnDA53L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVwfbS06; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVwfbS06"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d218ea7750so2063982b6e.3
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 08:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718553043; x=1719157843; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j3Fg3WwnJk25meGhg6shxE3UUo613qicSEDB22KFRgc=;
        b=GVwfbS060WX4Lsg60GJsJ3RHV+YNVzaMTTPuI2l3gG/soAjV7ZK0BzcYWyWaqWDCmE
         MW5xoDLx/klHbBURDKpqw972eg2/rd69NW7ZUTtVuGlwTpyeiBiHE2GyS+dnGLoTH4OA
         Vy793tu9EbdXUiPR3rdfrYxF513TUqs9L35j4HtIdwpUZoP6i9phRbkQUz5iG39S3GWd
         KPmBc5AsELrWNgWiAx82+y5p/Nxtm+v2N6137f7kZG971UQHJ4Bk6OR2ym1iN4PZqkRH
         yFtTiVepxd46pJ+jP3JgX/Cicsnoc1Qx8dF/Quk/vR5F0PgiSGOZ1V3H48bJap759XA5
         /brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718553043; x=1719157843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3Fg3WwnJk25meGhg6shxE3UUo613qicSEDB22KFRgc=;
        b=Oh5jNogc08cGcuuNebjOSO7Ft91PqZlekRrSvFkMhwMlRJ1crE8bjwvlRAlysOQHZw
         TYX1zL1ub0TNF2gEca2EhleDuSnn1r1wM+jZIEu0/CqHieMRyV3U6Ast1HGASj+Y3EEf
         JVCA0IEBe0cgfkgZsreQNK2M/oiLWkwSIN4q/oEDncLuEScke9CKPfHjAtrctJhdW4xm
         DoMBoMgZZg0d7kRerVqHarpW628VIAwYyF79YoTpFM0V61PwfFkHAVtSBs3MzZ+pasxR
         w13ZaAqM8YQJHcpVY7dOcfn4pfvhp1WetRGemBdy1H7YQU7KiMVF5rQlqGm6mami3PBt
         +mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSxuGSnBqtcdozgq5a3gMZizwODNtOg/T0BHJF5wfaD7Qo+MqoeHZo9eLdsYBVohVT6kjZlbwJ6oiQX14We4RXrzzVMQ==
X-Gm-Message-State: AOJu0Yz4N8c0I85I4JiYhE+rH9d60zrxtfOSs+/YleCQV7hmuP55FEfT
	ELOhNGW2Y+BsD+opVJnkmh2Qh/ybjmbvpxG19atiF+gYISjYkH2F
X-Google-Smtp-Source: AGHT+IHsBUccvKKQtIW3gs2Nv/J7ZleyA0w8pwKlkr1m47UIV/KI5EmBms3um2pUeBDU/kGLGiU/3A==
X-Received: by 2002:a05:6808:2191:b0:3d2:27b2:fde5 with SMTP id 5614622812f47-3d24e98103bmr11343198b6e.45.1718553043181;
        Sun, 16 Jun 2024 08:50:43 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe279c0sm347743985a.110.2024.06.16.08.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 08:50:42 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id B84851200043;
	Sun, 16 Jun 2024 11:50:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 11:50:41 -0400
X-ME-Sender: <xms:0QlvZtu9ee8eLP2UzP3OGaXFlRPOhNrpQ-oIMRWlJ3IReaquGwx7-g>
    <xme:0QlvZme0Qo-_7nA4mZ7-KkVw7CFpoEoEHVG-4K6Gz-WAnJV3FIENZuzykX5-TTmCG
    IOfm3AZ3FvrpgNJFg>
X-ME-Received: <xmr:0QlvZgyyz4Wm2sxsCzc3ZH06t_4xsDkckZjbvPfOfeTtQvIiQRn-1wqa_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefh
    gfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:0QlvZkMDWWOMLvlXtS2o1QtXDZ8T2wx26rsHYzL4g030-2oivomvgA>
    <xmx:0QlvZt9Z3J1UKbhLQsWkyqPOJl_GdrB_jHXrFZB6vn5RdOkQ4LGsjw>
    <xmx:0QlvZkU6C-zehZXjrB0Y8qtf_McOvO6nV2z-d0gyLns-SoLzpUbMCg>
    <xmx:0QlvZudeW5dbI5uYQSkxFVZVrwaB1msXsuGhRUNAhnoalgTw0mMubg>
    <xmx:0QlvZje_z2Dz2SmkEpzfF0t7WYOJLcWeNbLHnWqIPmwWzBSo6URdIEuQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 11:50:40 -0400 (EDT)
Date: Sun, 16 Jun 2024 08:50:40 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Benno Lossin <benno.lossin@proton.me>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
Message-ID: <Zm8J0NKh_XXDzt9X@Boquns-Mac-mini.home>
References: <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
 <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
 <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home>
 <b692945b-8fa4-4918-93f6-783fbcde375c@proton.me>
 <Zm4R0XwTpsASpBhx@Boquns-Mac-mini.home>
 <5lwylk6fhlvqfgxmt7xdoxdrhtvmplo5kazpdbt3kxpnlltxit@v5xbpiv3dnqq>
 <Zm7zvt7cNT2YpiIi@Boquns-Mac-mini.home>
 <CANiq72mz=OzzHJJyOPeWcxEtppP+v0KUq63_u5NB7-R84avaPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mz=OzzHJJyOPeWcxEtppP+v0KUq63_u5NB7-R84avaPg@mail.gmail.com>

On Sun, Jun 16, 2024 at 05:14:56PM +0200, Miguel Ojeda wrote:
> On Sun, Jun 16, 2024 at 4:16 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Hmm? Have you seen the email I replied to John, a broader Rust community
> > seems doesn't appreciate the idea of generic atomics.
> 
> I don't think we can easily draw that conclusion from those download
> numbers / dependent crates.
> 
> portable-atomic may be more popular simply because it provides
> features for platforms the standard library does not. The interface
> being generic or not may have nothing to do with it. Or perhaps
> because it has a 1.x version, while the other doesn't, etc.
> 

Totally agreed, but that was the information all I could get at that
time ;-)

> In fact, the atomic crate is essentially about providing `Atomic<T>`,
> so one could argue that all those downloads are precisely from people
> that want a generic atomic.
> 
> Moreover, I noticed portable-atomic's issue #1 in GitHub is,
> precisely, adding `Atomic<T>` support. The maintainer has a PR for
> that updated over time, most recently a few hours ago.
> 

Wait! Could it be because of me? Or I'm thinking too much about myself
;-)

> There is also `AtomicCell<T>` from crossbeam, which is the first
> feature listed in its docs.
> 
> Anyway...
> 
> The way I see it, both approaches seem similar (i.e. for what we are
> going to use them for today, at least) and neither apparently has a
> major downside today for those use cases (apart from needed refactors
> later to go to another approach).
> 
> (By the "generic approach", by the way, I mean just providing
> `Atomic<{i32,i64}>`, not a complex design)
> 
> So it is up to you on what you send for the non-RFC patches, of
> course, and if nobody has the time / wants to do the work for the
> "simple" generic approach, then we can just go ahead with this for the
> moment. But I think it would be nice to at least consider the "simple"
> generic approach to see how much worse it would be.
> 

What would work for me is a somewhat concrete design consensus (on what
sizes we are going to support, the expectation on how many traits we are
going to introduce, etc.) And then a simple generic approach is not a
problem. (But I remain my right to say "I told you so" ;-)) As I said,
we cannot just do generic because of generic, we have to have at least
some idea abou the things we are generify on (the scope and the cost in
term of how many more traits people need to understand).

> Other bits to consider, that perhaps give you arguments for one or the
> other: consequences on the compilation time, on inlining, on the error
> messages for new users, on the generated documentation, on how easy to
> grep they are, etc.
> 

These seem non-issues to me (except the grep part), but I'm relatively
more familiar with atomics and Rust, so it's good to hear others
thought, or wait the feedback until we have the patchset to review.

Regards,
Boqun

> Cheers,
> Miguel
