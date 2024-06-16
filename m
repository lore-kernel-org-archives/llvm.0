Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B93BD2FE
	for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718547396; cv=none; b=VArHgNb3aPbAob37TA8vu9uCzq9jMFPNAnDRDgqbhWBckCWxpgtXBSewV/1WQyHSORv5lSM8Asp4OpiOF03lB2U4IV9nnV0DCFA+g7qmS7WyL9SbV6EC0i+JllrBZ17KPh7ybL8N6eAhEWtupa+J3Ppst8m4NeFlWgTxK0+cY4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718547396; c=relaxed/simple;
	bh=7bdxquZWzFdlKtstaLLemdgdpCp+iDsft99AmCaM1WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWeXqEyjvy9BxSYp6R65q2oOpcjosrhLPzr057FXXBTJx+LC6hyEID6EYRNIRWIHLgcpzC6pL5LAiuCpXi+2nh6/TH45FDJUgS54ikD6xs3i9+fAydyvv0T6GyBDkKYooCRetJqKkqVG0Qkl1mS1UEgVjGL4NLc89LuUGmHbeMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDu9kChw; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDu9kChw"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-250671a1bc7so1722137fac.3
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718547394; x=1719152194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChmSjGncEeieZ8eu54I6JXi04yAV6jjSlQKYshr68pw=;
        b=iDu9kChw40uNDZ/LO6JGOq0iHkOj9HNaWrEUtQj+EZp3AvysYJ86rA4Onnsp+JRFAW
         fN7D/p9bssq1NJIqYrXZM2R1pBJzMkCO1ZtMFZUVmcKewK+tVI+bbU/jiaOvsD/VNrnk
         QdXXjj/XG8hg/UtD/+AjTuC6kKex1L5bcTGkHlQyxmJoNrt3bPx81hnFMNQH8fvVsb10
         HIB38GwsnPLZlWVpBhRFIBcHJNtgUmV807uraXuJsrCRlGKkOOWGoAWOMXyYMo96noAn
         604LPONltvSzSAoDFVqqjMnz+p//ku8FA2nMpocKIkcZ/2bCi0FAI+KQ6/UE383bbcyn
         U0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718547394; x=1719152194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChmSjGncEeieZ8eu54I6JXi04yAV6jjSlQKYshr68pw=;
        b=CBXdJPdQ2OfpElOund3qkY9C7kcM5wV0+xZDr6z+13iIhBl25gMU4ygwgkYnTKIa5X
         5bsSMjgPJMBDuOvK21PlaRz1jj57WXFrW+dNlKAXiGJ6HG97zgYHEtkP7ubw1eEzA2Gw
         sxCfcWLkM4PQxS5QePqHAZ/635h3fd7Ctoro34XZBLw055VtSaSxU2P5Fqi0Nanm46Rj
         sXGTDXn23KRyJ1f5QymwpNl8hY7/DCstKnk/E79ppDbSRGH7pRR7jLqW2hDo0rG4hie8
         BMyJ40btGCeI5FGFxHJUfGBTNCDatx3u8KI0+MW2CG1aZvsrNIXQhp3/lUe5HhWDXKR0
         CbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR9cWa/xdf/I21NLvUa71DlhzopT3Hov5sZ7a9i8EjHCpD0z1zkuFIFmBfvsovSK8MH3L430m08wr6vVkrtwZwqfPGYA==
X-Gm-Message-State: AOJu0YzwcTh3bhUAVFhkmE+DAzjYqpLC7c7v5R4i933eoYD9bIvN23hy
	3EccPlL/ipZtwP95M3o9Aw2H/omNmpzJIqy9R5+DlaPucCr5iDim
X-Google-Smtp-Source: AGHT+IEJURaA8R00zuQB4kZ2NpS8xoyLpNJer3p9uoW3RueWraMEm/js9QdlmSnSEq9SjQvZLHSrYw==
X-Received: by 2002:a05:6871:3408:b0:254:9501:db80 with SMTP id 586e51a60fabf-2584293f32bmr8961724fac.14.1718547394027;
        Sun, 16 Jun 2024 07:16:34 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79a4e1abc56sm73235085a.65.2024.06.16.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 07:16:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id A7EF7120006A;
	Sun, 16 Jun 2024 10:16:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 10:16:32 -0400
X-ME-Sender: <xms:wPNuZv-w9qN1uYRINCbjw_qOwZ32sCQqPKStxrUpF6E4whf-1rl9pA>
    <xme:wPNuZruSGAhLd6L0zorpHT1yzfVos4yZIdFuGk8bUvT6HS7FCXZYrpwd_3LB1mizu
    H3VS1wqC49Mb20l-g>
X-ME-Received: <xmr:wPNuZtDTDuxskLGiaBmKtVWRO0FFFF7RUMXOE8zwvmWwV3Vw7cEVNbwWDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:wPNuZrd7QL2n65G3s9G4zyJgGSN7GUr3rJc6QQeaxdrJqzA8BwYZhw>
    <xmx:wPNuZkPbkn52mwh1h3Ww8KR9bF2IM8CCcKHh6AqfsTou1IRw-A1owA>
    <xmx:wPNuZtkpMJIL6tvsfjD6d0ENJmakzBRBE6hk8NGXSso64jYNNXc4Og>
    <xmx:wPNuZutYxLgsexVdcfhdB06sF1l3_KaGIeevPmCTiafKFHN9BNwAYg>
    <xmx:wPNuZuvK0d5vNmZIvOUaB5TINpBHWKVM98kSCbiNbicix7_sifs6O2ba>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 10:16:31 -0400 (EDT)
Date: Sun, 16 Jun 2024 07:16:30 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Benno Lossin <benno.lossin@proton.me>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Message-ID: <Zm7zvt7cNT2YpiIi@Boquns-Mac-mini.home>
References: <ZmseosxVQXdsQjNB@boqun-archlinux>
 <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
 <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
 <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home>
 <b692945b-8fa4-4918-93f6-783fbcde375c@proton.me>
 <Zm4R0XwTpsASpBhx@Boquns-Mac-mini.home>
 <5lwylk6fhlvqfgxmt7xdoxdrhtvmplo5kazpdbt3kxpnlltxit@v5xbpiv3dnqq>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5lwylk6fhlvqfgxmt7xdoxdrhtvmplo5kazpdbt3kxpnlltxit@v5xbpiv3dnqq>

On Sun, Jun 16, 2024 at 05:51:07AM -0400, Kent Overstreet wrote:
> On Sat, Jun 15, 2024 at 03:12:33PM -0700, Boqun Feng wrote:
> > What's the issue of having AtomicI32 and AtomicI64 first then? We don't
> > need to do 1 or 2 until the real users show up.
> > 
> > And I'd like also to point out that there are a few more trait bound
> > designs needed for Atomic<T>, for example, Atomic<u32> and Atomic<i32>
> > have different sets of API (no inc_unless_negative() for u32).
> > 
> > Don't make me wrong, I have no doubt we can handle this in the type
> > system, but given the design work need, won't it make sense that we take
> > baby steps on this? We can first introduce AtomicI32 and AtomicI64 which
> > already have real users, and then if there are some values of generic
> > atomics, we introduce them and have proper discussion on design.
> > 
> > To me, it's perfectly fine that Atomic{I32,I64} co-exist with Atomic<T>.
> > What's the downside? A bit specific example would help me understand
> > the real concern here.
> 
> Err, what?
> 
> Of course we want generic atomics, and we need that for properly
> supporting cmpxchg.
> 

Nope. Note this series only introduces the atomic types (atomic_ C
APIs), but cmpxchg C APIs (no atomic_ prefix) are probably presented via
a different API, where we need to make it easier to interact with normal
types, and we may use generic there.

> Bogun, you've got all the rust guys pushing for doing this with
> generics, I'm not sure why you're being stubborn here?

Hmm? Have you seen the email I replied to John, a broader Rust community
seems doesn't appreciate the idea of generic atomics.

Regards,
Boqun
