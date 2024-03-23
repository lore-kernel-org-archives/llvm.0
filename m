Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB97F
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 00:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711152937; cv=none; b=X0vzAJNqR/MU65Ey+lCzbD/7Br3G7zm6ETdCPFlrP8++JLB2rf5x+Gb99O1CaYD7ViglQzpzqVI/hZFYT13p+t8E8ehyyOvDKMrHq+ioa/JDZNoiU4OQF8JlUIWufPmXNBstkh1fn+FhO1sOozWTpOfnm9r0Ug+twe3nzPh+UlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711152937; c=relaxed/simple;
	bh=VTI9Sf3VccnbABPGXsY1j2qF+SStz+OEfznm86+qGLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMfn5lJhzTWNh6b+EX2ikc7hGsLITAznC7gomrRrmYVi64luhMf+/Et9MrPeDevGPul0hFuJMia9+lKIDvEi+o/Yd6OhusmOgHG2/BDvTFD1ji435vOJLuWaZkhAdGTAbPxhfCkWY+Ow7GyzNW9/fKvaCV35oKvkJ2fAGSVKc/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrdqsPmS; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrdqsPmS"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6963c0c507eso28509606d6.1
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 17:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711152935; x=1711757735; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whmVMHuEBXgRIj9diBxuHvfTM2nWAuNzeXBmM3HZHOY=;
        b=KrdqsPmSDNLw6JoCd+6bJCABMzCDvX2qL9a2Hs/wvltQ47iiAbhQFFVm6Clw80NW89
         k3S2Q2BfhaKM5w/27hikaNWY2t74xMuXKajPEWlLqk5fhegM2wYMCgCN3APKeTG7bWZk
         M5diyCG/X7DtLkfyFBvRjiWwH7dP+ILlVNsVOSrzwols9mtJXOYoqjNIQ6pjzJO0703G
         5U/k7VMVlIOpJghbwkMHaOePXvQBdinLLyH8Udmp8ySu/m56u0lcmaR7hXamTd+au5+P
         A1asWDIzDlgU4aGFkI5U25wsBp1tIxVohTPj6bKyl4wQTZ3i6LteaCw+2PZI86wTf/yi
         i2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711152935; x=1711757735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whmVMHuEBXgRIj9diBxuHvfTM2nWAuNzeXBmM3HZHOY=;
        b=fBWjPDtWfXwCxpABpY4c+X9vEIVrm1898o6Aakm2X5xjOTIqQh8m8dYSqhagvol/pv
         lQxIbHqheIEpoPg1909ccQ8ZIuhsC10WqGgcWwWXNPrXMAT/El2iRH7/KfDwqRjqjkj0
         DDZyZkvLNh6XqOXneAZlQqbDa24E3H4bfHhj9Vir/bVx+eib1krLLKC8jWqVGSwCvrlU
         OJ+5PMUPMZB7r5PLqxD21i2H7BDYJMeL4o0M/+1ApNds+lNPzRunriGtj4+qsxX9S4/F
         KeyK6GQJ/nDRs8py0dOMjtvQ6htzVjqP83N2FTwLUhIeQy2TmUAFqDdRmlHsnqH5kwnw
         Sstw==
X-Forwarded-Encrypted: i=1; AJvYcCXu1gE23KPAuo0Z+pjx8WqFEqNqNOi7djMlNYjH7X8sGLV8K/pspUjRmuNf6o7ofjqIIRTSq7gxwFixnezFH7A9C+tZZg==
X-Gm-Message-State: AOJu0YwjvcaSP00io6uhka4Teeffy/Il/lyNoD6DJUulxD+PJxlxN7tv
	9ar533FPJiXwV1Nby8DKqXBsFESuwlnE9TxglJpChXZLwk74kweU
X-Google-Smtp-Source: AGHT+IHOo27LLL5BHPFVw2rGuSB7QeBeHaMSJwGhonKrbQGbCwa6LdZz9tGDqQaK9+FrfZtfSfp36A==
X-Received: by 2002:a05:6214:2124:b0:691:3d91:80bb with SMTP id r4-20020a056214212400b006913d9180bbmr1044086qvc.11.1711152935122;
        Fri, 22 Mar 2024 17:15:35 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id i11-20020ad45c6b000000b0069068161388sm1558668qvh.131.2024.03.22.17.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:15:34 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id 8AF5227C005B;
	Fri, 22 Mar 2024 20:15:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 22 Mar 2024 20:15:32 -0400
X-ME-Sender: <xms:Ix_-ZUUr0Zr7P-rdVzLcnxOteaopQcoWP4M_QKcO5tgxJdwJSbrjRA>
    <xme:Ix_-ZYmGgdko81K4NeYOyyDZYPTSMk-kdIfkwzg_5e8SHsrcYicuXooExU_kpz0QJ
    qN_iU7d9tz9aAuU-w>
X-ME-Received: <xmr:Ix_-ZYa2scaSM2UvwgHKVCQsqYKycZ1LXAfzgb9OIMoB1XqBWwYj8xYSGx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtfedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefhhffgudfgfeeggfeftdei
    geehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:Ix_-ZTWHEgAkmfjD2i9t-JnRVOM_exrp-qCXzEaBaEeIw_6QY-boOQ>
    <xmx:Ix_-ZenzfIQS-GlYhhcrHv8B_gxu88-FH41lN5naq1F83dfGzs0bTg>
    <xmx:Ix_-ZYfMCRZRWH96zPWn5dt2PCIy9q8P_mmdEZ29vSZL9wQN3OkdGw>
    <xmx:Ix_-ZQHx_kACfeCCdbG3obFGRLJ1IKEWhOa38HM6rn2VyxigoUcvWQ>
    <xmx:JB_-ZflHnfpFS5SSC4nwSvCuOGUk2HWQ8168jZGHQbpB-kR7ky5mhYcKTnI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 20:15:31 -0400 (EDT)
Date: Fri, 22 Mar 2024 17:15:08 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
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
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
Message-ID: <Zf4fDJNBeRN5HOYo@boqun-archlinux>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>

On Fri, Mar 22, 2024 at 07:57:41PM -0400, Kent Overstreet wrote:
> On Fri, Mar 22, 2024 at 04:38:35PM -0700, Boqun Feng wrote:
> > Hi,
> > 
> > Since I see more and more Rust code is comming in, I feel like this
> > should be sent sooner rather than later, so here is a WIP to open the
> > discussion and get feedback.
> > 
> > One of the most important questions we need to answer is: which
> > memory (ordering) model we should use when developing Rust in Linux
> > kernel, given Rust has its own memory ordering model[1]. I had some
> > discussion with Rust language community to understand their position
> > on this:
> > 
> > 	https://github.com/rust-lang/unsafe-code-guidelines/issues/348#issuecomment-1218407557
> > 	https://github.com/rust-lang/unsafe-code-guidelines/issues/476#issue-2001382992
> > 
> > My takeaway from these discussions, along with other offline discussion
> > is that supporting two memory models is challenging for both correctness
> > reasoning (some one needs to provide a model) and implementation (one
> > model needs to be aware of the other model). So that's not wise to do
> > (at least at the beginning). So the most reasonable option to me is:
> > 
> > 	we only use LKMM for Rust code in kernel (i.e. avoid using
> > 	Rust's own atomic).
> > 
> > Because kernel developers are more familiar with LKMM and when Rust code
> > interacts with C code, it has to use the model that C code uses.
> 
> I wonder about that. The disadvantage of only supporting LKMM atomics is
> that we'll be incompatible with third party code, and we don't want to
> be rolling all of our own data structures forever.
> 

A possible solution to that is a set of C++ memory model atomics
implemented by LKMM atomics. That should be possible.

> Do we see a path towards eventually supporting the standard Rust model?
> 

Things that Rust/C++ memory model don't suppor but we use are at least:
mixed size atomics (cmpxchg a u64, but read a u8 from another thread),
dependencies (we used a lot in fast path), so it's not trivial.

There are also issues like where one Rust thread does a store(..,
RELEASE), and a C thread does a rcu_deference(), in practice, it
probably works but no one works out (and no one would work out) a model
to describe such an interaction.

Regards,
Boqun

> Perhaps LKMM atomics could be reworked to be a layer on top of C/C++
> atomics. When I last looked, they didn't look completely incompatible;
> rather, there is a common subset that both support with the same
> semantics, and either has some things that it supports and the other
> doesn't (i.e., LKMLL atomics have smp_mb__after_atomic(); this is just a
> straightforward optimization to avoid an unnecessary barrier on
> architectures where the atomic already provided it).
