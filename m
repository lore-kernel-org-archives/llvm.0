Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8A33A1A3
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711204895; cv=none; b=qWV1gW5RJWdDVNWm1gsPVzHF4iGZsWlnao/8PEY0vfEYwXsnzzd+iZuPk4zgYts0wsmeLiMtntcB+5bCBMEQ2jdcWHeFL3VQc8D+iNdZJXVuiJDgaONKYzSRQPp0ReXbdytQ/miYmZuL4g9MXil23qtuRnwG8/LqV+FLJyhPsOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711204895; c=relaxed/simple;
	bh=3VQPb1kSUvBE9uol6WHaPTW1ils3Q0RNDodZuAFBPrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfE3mOcTF/PFksood+qZF2mxYcqyXD6coOURb4ANTnj8LW5bSEMG9izjv2DFwClypEheykfb9+omFFPQe6CWYDrBHsMf4f80HsD5Y6nKVUeUHPWyUQm5I/RiQ0e5MP3Jv6WSKnp+KUJrcfgl8vYdenC3BxPbDIwThHYIknmKk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+rJnt1W; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+rJnt1W"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78a13117a3dso274424485a.1
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711204893; x=1711809693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBoHlroea6/GTbzQ3nCArEwBGcVlF3t6u5u31TFOQ5c=;
        b=d+rJnt1Wq+Zlo3KseHOETBJ8/yOS43cASeA48TNu/+b1qqDM5cGmZ9rCxdccoDzYkD
         OnnsMdAnmuvuXaej7vRsOa3oq0Hf+JTvqNhv01axX2xNQwI6bIV1N4YgeQPZFTFhx16b
         9nesT58jx7YCjRxKvR34/d/HopJZXssehwKw0URHLpUvSm14pJ+Cvj9JoPVcYNnSVuCr
         zpHV5qLBCVt3bCZXKm9hRbw0RsjPOpCr65VnXWMF0NDhtZc0gJ73iaB3Bs6l9oNqOCd/
         FYqHa7BC5NV9K0/IrqgmE6TsR+zJcXywvjfezvDpEBWg8+Qzq9C0NXt3OufJasMPAxTy
         5gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711204893; x=1711809693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBoHlroea6/GTbzQ3nCArEwBGcVlF3t6u5u31TFOQ5c=;
        b=ErmbLJSimAGKGcQiyzsu48Dpr66R9jlXRQpNXsTYtQGgLskqxsqVpEf9gQWzrSNikP
         Tig3iM+2h0O9H1rq9mkTZu6PVSRYqGItit8azDeImutptKVRYAenmWs+2RQSUvuCKDUh
         iSyERkVFjLgB2krhMFz4xwh4zTBJxS1Ja7jfXp/qJyBzYOLhNizn/NUKys3kvGfUKXrw
         xXqduO3Jx+nY9dddYPCqrAC0hAg8rN5pvhJPtHsrF/TIhiwUC/TpO5XXx40+eFa4LbD2
         +zZhKKDnybZ9JEgxiDiRL+W4O0uf8zWN6bXBJk8w/iFDS3z4VZILyfKpVwIokIqC2AuQ
         BlEw==
X-Forwarded-Encrypted: i=1; AJvYcCVPuoZMziOzuqACD/bIGg6CpM7MJOJDNcM2lRWVQG6JJq4EfyPQBKpy111wC09ybsrqvkZiY2Hs5JBjHnDjN0GWJ3EmDg==
X-Gm-Message-State: AOJu0Yw49ONH0ZeMH8qyRVrivjifnZDtFy9EyqiXvmALn78VV4UMcX7X
	D16PUb4nYhBXua5AF+8nrmupzpoFQCuRLicKzGxjoUv15WIrFkmh
X-Google-Smtp-Source: AGHT+IHlE4DNx4doL/DAGkVKI+43x0e7x4Fv3FAQsZNSiGDB9AFauE0kQDFVKk0ctSx+uT+Q0ETTzg==
X-Received: by 2002:a05:620a:a53:b0:789:e5e3:f0f6 with SMTP id j19-20020a05620a0a5300b00789e5e3f0f6mr3057320qka.14.1711204893267;
        Sat, 23 Mar 2024 07:41:33 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id k26-20020a05620a0b9a00b00789e2961225sm714626qkh.61.2024.03.23.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:41:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfauth.nyi.internal (Postfix) with ESMTP id B26BB1200066;
	Sat, 23 Mar 2024 10:41:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 23 Mar 2024 10:41:31 -0400
X-ME-Sender: <xms:Gur-ZWGlrygVIdhmjfcRMO8f2KqnK_yM3c_pmOlAqe3R1VMeh5Oy4w>
    <xme:Gur-ZXWswPwPnaBsdXbksb_ZWiQ5F8ffOydS-dTC6GeYK5ZgYB5yjFAJZWWO70APj
    b_vxEE9KmOpR6kv1Q>
X-ME-Received: <xmr:Gur-ZQLkNiJwpiV7m4s5J9fQjyKiZb-U3kTBdKwMR7p6ixKkOzrYCnGuIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtgedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:Gur-ZQFN9BSeI_hz14QaJdfZs4u78MwTSBsu6DtYCAAo8hlJmQVbRw>
    <xmx:Gur-ZcVzY4Bzn8c1cxT7RJxxJXdSdbXxlN335lEOVLCQypmNXDW0zw>
    <xmx:Gur-ZTPl3RSz78P2eoUZjtv3XT-G4sAshJnjp2v9wAD0ff_f3moYWA>
    <xmx:Gur-ZT36BzZ4ta7f2FmNX3uZz8nJ7jEO2ameSfMkoHec6zn7xHHMJg>
    <xmx:G-r-ZSzLmvm18a4Gr2ctMIWWUgK-28yXoEXnQMK7iuKOGyo04jGNiK5FdHsLPwvU>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Mar 2024 10:41:29 -0400 (EDT)
Date: Sat, 23 Mar 2024 07:41:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Message-ID: <Zf7qGONJY33KdLCH@Boquns-Mac-mini.home>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <Zf4fDJNBeRN5HOYo@boqun-archlinux>
 <03f629b6-1e4e-4689-9b69-db0b75577822@lunn.ch>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03f629b6-1e4e-4689-9b69-db0b75577822@lunn.ch>

On Sat, Mar 23, 2024 at 03:29:11PM +0100, Andrew Lunn wrote:
> > There are also issues like where one Rust thread does a store(..,
> > RELEASE), and a C thread does a rcu_deference(), in practice, it
> > probably works but no one works out (and no one would work out) a model
> > to describe such an interaction.
> 
> Isn't that what Paul E. McKenney litmus tests are all about?
> 

Litmus tests (or herd, or any other memory model tools) works for either
LKMM or C++ memory model. But there is no model I'm aware of works for
the communication between two memory models. So for example:

	Rust thread:

	let mut foo: Box<Foo> = ...;
	foo.a = 1;
	let global_ptr: &AtomicPtr = ...;
	global_ptr.store(foo.leak() as _, RELEASE);

	
	C thread:

	rcu_read_lock();

	foo = rcu_dereference(global_ptr);
	if (foo) {
		r1 = foo->a;
	}
	
	rcu_read_unlock();

no tool or model yet to guarantee "r1" is 1, but yeah, in practice for
the case we care, it's probably guaranteed. But no tool or model means
challenging for code reasoning.

Regards,
Boqun

> tools/memory-model/litmus-test
> 
> 	Andrew
