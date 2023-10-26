Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DD848A
	for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu1ay5zM"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b2b1af964dso546202b6e.1
        for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698330119; x=1698934919; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPjnRCIHnU5GzLqzoajHNOA82GCVgkswXThHFIsTG6Y=;
        b=Mu1ay5zM3w/F6+FBSM766Lg6d6iatI4zq7vBFhAMZt+hN+cTiXOBikovuPxD5wF+Y+
         fWj+uRK8OnSXlhOkQ9Jp1OtxiFbZCCCk5TFnfBYpUPb2vIoYDS0D5nT+EdibsNnuRL8d
         2ZgFRi9Y/sBEZJu0W+ZYTx68+ygQvPPSIN9WUr39bldn3c0l0/tpIvC4j/eddbedcfcR
         hD+W6WRGexOfeORW/7Rydsy5EhXclJcZ+u8JdiUiFsfOUCHVpmyeTpT5VSRt+Z5Py4fo
         iMqDvVhnTpixNPXo1lpWbfsP50IgjfEj048Dxe+Q0c8Sdkp7hRVZDTWVwahQq86946sc
         PWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330119; x=1698934919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPjnRCIHnU5GzLqzoajHNOA82GCVgkswXThHFIsTG6Y=;
        b=wgmLwLOVqOXka7XXcOGo4BkO+y56RtXVDBTXpb7hv1q5Ym6sNGJAgaS/hE2dVj4jIN
         etQdpc2KSBi1Rtuu/WOK8rQJqdCRtlvzPqjr4J8mEz+I1plrRg2fVADZYSshB10k/nTI
         G2Otun3tRLleduYRgYlkBRjoJbbOvQLHe6SI2qTte5eU4QuAMgWqp0NFR/aqPd9dCQsb
         2yqEoVUNQCwhTgxuGyTn08ckDc23bVXTN/IMLVQsN13VVLBUZ8z9MTNzcve/7dxOb7+a
         DFL2aBcCvZWq5JX0UxllB1TUX8ke91q7ADXtwepXkEHijg9xf1BrRzkpsUX4e2pAoDgr
         Jdsg==
X-Gm-Message-State: AOJu0YxDCz1pyKnYSLk9w3vk9nisgk5/wGb1Rzp+4+t6qS/fk0QqDOiT
	cQ6y0Vpt3oGGghXe3XZ+Jlk=
X-Google-Smtp-Source: AGHT+IGOORfdaN+ox+8dGnvK0hFjx7b4auYMD2QU259WIkEBZWSxO8HgvGRbr8aY5mL7QXVUpqpDYA==
X-Received: by 2002:a05:6808:e85:b0:3b2:d8cb:8e14 with SMTP id k5-20020a0568080e8500b003b2d8cb8e14mr24661826oil.28.1698330118606;
        Thu, 26 Oct 2023 07:21:58 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id g202-20020a8152d3000000b005a8a78fa9d2sm6085277ywb.17.2023.10.26.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:21:58 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id C94B027C005B;
	Thu, 26 Oct 2023 10:21:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 26 Oct 2023 10:21:56 -0400
X-ME-Sender: <xms:BHY6ZRm0CFDRawFDDqLMq38_zm2Qz4TaqVez6HlJZmIklCbNPXNF9w>
    <xme:BHY6Zc1AheJIzLy1eCZLvipKuXSNMJpy2pP_MLBUoZI7GFwy4_2aTEt8vF-rUDNwm
    zMxeY7HQ0G9c7VnxQ>
X-ME-Received: <xmr:BHY6ZXodUaXPHTT8AbNlXgE_ARzGijaca0D56FIcN3Og8YdXc0QqVDLH5A0>
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
X-ME-Proxy: <xmx:BHY6ZRmVYIFyK9hajxKhO7G9pXAEUukEHTKPJLJrKbGr4XnYCrC7Gw>
    <xmx:BHY6Zf21Yzn6zxmITRGYj8jw2L0D-XZgTjFr4KgYUzA2h1ai0BWaow>
    <xmx:BHY6ZQtnGLG5lML1wq6fh7r6fKIRvSH0eumBKpAZgiT44cC_7EZCtw>
    <xmx:BHY6ZUIHVJg3o5U07owCiEI9Tu0kYdhjSk0zcYaETeyW0rI6Nd5xiw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Oct 2023 10:21:55 -0400 (EDT)
Date: Thu, 26 Oct 2023 07:21:53 -0700
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
Message-ID: <ZTp2AVY5twZOKEtX@Boquns-Mac-mini.home>
References: <20231025195339.1431894-1-boqun.feng@gmail.com>
 <20231026081345.GJ31411@noisy.programming.kicks-ass.net>
 <20231026113610.1425be1b@eugeo>
 <20231026111625.GK33965@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026111625.GK33965@noisy.programming.kicks-ass.net>

On Thu, Oct 26, 2023 at 01:16:25PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 26, 2023 at 11:36:10AM +0100, Gary Guo wrote:
> 
> > There's two reasons that we are using volatile read/write as opposed to
> > relaxed atomic:
> > * Rust lacks volatile atomics at the moment. Non-volatile atomics are
> >   not sufficient because the compiler is allowed (although they
> >   currently don't) optimise atomics. If you have two adjacent relaxed
> >   loads, they could be merged into one.
> 
> Ah yes, that would be problematic, eg, if lifted out of a loop things
> could go sideways fast.
> 

Maybe we can workaround this limitation by using compiler barriers, i.e.

	compiler_fence(SeqCst);
	load(Relaxed);
	compiler_fence(Acquire);

this is slightly stronger than a volatile atomic.

> > * Atomics only works for integer types determined by the platform. On
> >   some 32-bit platforms you wouldn't be able to use 64-bit atomics at
> >   all, and on x86 you get less optimal sequence since volatile load is
> >   permitted to tear while atomic load needs to use LOCK CMPXCHG8B.
> 
> We only grudgingly allowed u64 READ_ONCE() on 32bit platforms because
> the fallout was too numerous to fix. Some of them are probably bugs.
> 
> Also, I think cmpxchg8b without lock prefix would be sufficient, but
> I've got too much of a head-ache to be sure. Worse is that we still
> support targets without cmpxchg8b.
> 
> It might be interesting to make the Rust side more strict in this regard
> and see where/when we run into trouble.
> 

Sounds good to me. If the compiler barriers make sense for now, then
we can do:

	pub unsafe fn read_once_usize(ptr: *const usize) -> usize {
		core::sync::atomic::compiler_fence(SeqCst);
		let r = unsafe { *ptr.cast::<AtomicUsize>() }.load(Relaxed);
		core::sync::atomic::compiler_fence(Acquire);
		r
	}

and if the other side (i.e. write) is also atomic (e.g. WRITE_ONCE()),
we don't have data race.

However, there are still cases where data races are ignored in C code,
for example inode::i_state: reads out of locks race with writes inside
locks, since writes are done by plain accesses. Nothing can be done to
fix that from Rust side only, and fixing the C side is a separate topic.

Thoughts?

Regards,
Boqun

> > * Atomics doesn't work for complex structs. Although I am not quite sure
> >   of the value of supporting it.
> 
> So on the C side we mandate the size is no larger than machine word,
> with the exception of the u64 on 32bit thing. We don't mandate strict
> integer types because things like pte_t are wrapper types.
> 
> 
