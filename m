Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC02E64B
	for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIE1i3CT"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso675302276.2
        for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698330204; x=1698935004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmQ12llQk3IZSo1cj6ehbveeVOkoR+zL/LYihr+kgBA=;
        b=kIE1i3CTdqCrKpA9dC9vC7mOC7E1RJJcn0TF936/OzDAJlv4vfcH+c3cM+bTomHMiK
         0//nDQpbVzAXiipNs5EQEPzIl43EA/jLlehU2soq+NKEwm35EcVF0bKczxK5xtRRYsUd
         BSNVLo8ZwMwW+O2S//X7h2eQCUucagv7/WLViocjzDMFxvKqYeGabrE2LZI6Buz+5HZ8
         tje/CmBiNKLFDKccVs+eW3uiBnKYM+54sY5ggZ22oVMOkc5hDIjx5kOlibXznWEGsHia
         WNPHDdaRJf7R9t1BcwHcnx54YkPLd2M8FwhjeG95cyXro/or4OyZUg065RCx4errt2ic
         TjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330204; x=1698935004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmQ12llQk3IZSo1cj6ehbveeVOkoR+zL/LYihr+kgBA=;
        b=PX7gDM6+wCOu1LZAUpNT+Bt8Q9MTtuLtnPpdGNEVezQDicLgyOOH3pxof/KDaeHhhC
         wBGSD3D/VVnG0rPqSr7o7BuY/pSxjXZq7lR79Jct2gs0CekrBX4JzP4QVAE+tyq7IHJz
         jif7uDzMWzPrOWdA9t3Fo/Q0rDWiRusdHCHAkm/00XA7FDFVoszTmNfiJq+myVqjsjT1
         s113Ig6yGEB5i6uNejJU228EZERQpUTRdSWDEOehHZBy+M8mPApROngLIXjrB8g6p7KU
         slKNC023cxx1FcXh9BPyz8dKqahVxCmupMjftDz6vYryY8sX74iOIkHTQ/0shzhAZp5u
         Gvjw==
X-Gm-Message-State: AOJu0Yy/RJG57agwmGOSk015AXiTHDsoZsWUfFZoD6/gchwgJjOoIUmp
	zxt0oPsVuAvyXNXWk1ylZb4=
X-Google-Smtp-Source: AGHT+IH1fP8m0ZfURzq/DYK3dN0nkQ4K1zNYSBgKw8eHs+E9drhtEjW1W3aytItYucb04Mw1q71plA==
X-Received: by 2002:a25:aca7:0:b0:d9c:fd8d:833a with SMTP id x39-20020a25aca7000000b00d9cfd8d833amr19746794ybi.59.1698330204037;
        Thu, 26 Oct 2023 07:23:24 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id 205-20020a2505d6000000b00d814d8dfd69sm5314546ybf.27.2023.10.26.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:23:23 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id A68B127C005B;
	Thu, 26 Oct 2023 10:23:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 26 Oct 2023 10:23:22 -0400
X-ME-Sender: <xms:WnY6ZXn4lB9TVEVhjEs-iMQ9zSHVUF7Brqfa3pebbcmICW4qc1-epA>
    <xme:WnY6Za2dLI94QaOdsGzzxDYwgH4jbKkYMI2jLX_H5AqoCUD_hHvTwuPsl-uc2J0Yv
    ZV5GmpIhA6KvHlGUw>
X-ME-Received: <xmr:WnY6ZdrohGQwXZCTCBX8y3wgWXGPxQW0ied1kmNm-PKN5gslsVoPX1-kodA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledvgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudff
    iedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:WnY6Zflspi88sF3fgu01H4l2D0B37XPK_uXRLMaRv-2LcyiuWY0dHw>
    <xmx:WnY6ZV3gk2_I24ou6ijCgALyVCEzmtKZEcc60DuXfHxUIXZDP2aIHg>
    <xmx:WnY6ZeuxLFr0iJhu9Gs7yct3EP3TeJ3owikW4OPYePen44xv2Z0Q8w>
    <xmx:WnY6ZSK-H_V8jB0yAOJA6Ttrl4PfsNmA3jL339jK2qrz7MGEyht4JQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Oct 2023 10:23:21 -0400 (EDT)
Date: Thu, 26 Oct 2023 07:23:21 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	Tom Rix <trix@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Matthew Wilcox <willy@infradead.org>,	Dave Chinner <david@fromorbit.com>,
 linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC] rust: types: Add read_once and write_once
Message-ID: <ZTp2WVlMxqmlC4Rb@Boquns-Mac-mini.home>
References: <20231025195339.1431894-1-boqun.feng@gmail.com>
 <20231026081345.GJ31411@noisy.programming.kicks-ass.net>
 <20231026113610.1425be1b@eugeo>
 <20231026111625.GK33965@noisy.programming.kicks-ass.net>
 <ZTp2AVY5twZOKEtX@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTp2AVY5twZOKEtX@Boquns-Mac-mini.home>

On Thu, Oct 26, 2023 at 07:21:53AM -0700, Boqun Feng wrote:
> On Thu, Oct 26, 2023 at 01:16:25PM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 26, 2023 at 11:36:10AM +0100, Gary Guo wrote:
> > 
> > > There's two reasons that we are using volatile read/write as opposed to
> > > relaxed atomic:
> > > * Rust lacks volatile atomics at the moment. Non-volatile atomics are
> > >   not sufficient because the compiler is allowed (although they
> > >   currently don't) optimise atomics. If you have two adjacent relaxed
> > >   loads, they could be merged into one.
> > 
> > Ah yes, that would be problematic, eg, if lifted out of a loop things
> > could go sideways fast.
> > 
> 
> Maybe we can workaround this limitation by using compiler barriers, i.e.
> 
> 	compiler_fence(SeqCst);
> 	load(Relaxed);
> 	compiler_fence(Acquire);
> 
> this is slightly stronger than a volatile atomic.
> 
> > > * Atomics only works for integer types determined by the platform. On
> > >   some 32-bit platforms you wouldn't be able to use 64-bit atomics at
> > >   all, and on x86 you get less optimal sequence since volatile load is
> > >   permitted to tear while atomic load needs to use LOCK CMPXCHG8B.
> > 
> > We only grudgingly allowed u64 READ_ONCE() on 32bit platforms because
> > the fallout was too numerous to fix. Some of them are probably bugs.
> > 
> > Also, I think cmpxchg8b without lock prefix would be sufficient, but
> > I've got too much of a head-ache to be sure. Worse is that we still
> > support targets without cmpxchg8b.
> > 
> > It might be interesting to make the Rust side more strict in this regard
> > and see where/when we run into trouble.
> > 
> 
> Sounds good to me. If the compiler barriers make sense for now, then
> we can do:
> 
> 	pub unsafe fn read_once_usize(ptr: *const usize) -> usize {
> 		core::sync::atomic::compiler_fence(SeqCst);
> 		let r = unsafe { *ptr.cast::<AtomicUsize>() }.load(Relaxed);
> 		core::sync::atomic::compiler_fence(Acquire);
> 		r
> 	}
> 

I forgot to mention, this can also resolve the comments from Marco, i.e.
switching implemention to Acquire if ARM64 & LTO.

Regards,
Boqun

> and if the other side (i.e. write) is also atomic (e.g. WRITE_ONCE()),
> we don't have data race.
> 
> However, there are still cases where data races are ignored in C code,
> for example inode::i_state: reads out of locks race with writes inside
> locks, since writes are done by plain accesses. Nothing can be done to
> fix that from Rust side only, and fixing the C side is a separate topic.
> 
> Thoughts?
> 
> Regards,
> Boqun
> 
> > > * Atomics doesn't work for complex structs. Although I am not quite sure
> > >   of the value of supporting it.
> > 
> > So on the C side we mandate the size is no larger than machine word,
> > with the exception of the u64 on 32bit thing. We don't mandate strict
> > integer types because things like pte_t are wrapper types.
> > 
> > 
