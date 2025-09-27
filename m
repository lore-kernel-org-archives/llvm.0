Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774C2C17B4
	for <llvm@lists.linux.dev>; Sat, 27 Sep 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758979994; cv=none; b=S5yx0Awv673T5Vnew/vdAsmfEv/LHuBIvVIiX9HIGbKs+i4FOVNsYF3QaYAAJ4PIHEnF26b3bCbUC5l22DvgBWiWp8hy8McnJ5HDde2iWbmQm7JzCQjWyzh9DZBqeCVRoFPwAdo5bVs7ZP44TcvmPwYafyflwScfAJCopStP3AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758979994; c=relaxed/simple;
	bh=U7jLK9g7Yw/WoRuxeBbXjiHDDRSKGS09wBhJ1bF0+CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP2DLcmOVadF3I7S8mISglIK7OlWb/Hh1wSw3DNEwx7EYYq48H21wvDFWGYbSh+pkRr/v52esVmNbYE8fONng4UUxUTmcWu0pagpcrroZXgen0fKP+DUPRCM/O1OJscYwckFaIBcXn8LnHBokCLQUBX3tOg//1OLOhYL/0l0VZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgK8B6XU; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgK8B6XU"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7e3148a8928so22783276d6.2
        for <llvm@lists.linux.dev>; Sat, 27 Sep 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758979990; x=1759584790; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jAJz2iZlVqH7fub6DPlrBF+dlNC7fGvqpAeWouU/7VM=;
        b=OgK8B6XUmN06x2s5F3uciSv3kaFOHbtfC+hWcKmeJuEG2tZ8RLx3wHFwXqLBykDsKJ
         Y4c1Z/3VUO8sUm+zisgLbPvJnUAiBgo666EQyq1Ws/n5C/3vlnWJUJEKc6OxmjR2AC/4
         0VrTJt/XEOYVA6tCxAdl/Hct/lQMDvOcMMVoSYj9UJ/loZC9Kll3OiAEEYjAjwiMP2vx
         3qqG6fcjyIwpnZb8BK8/R6tqlG2IccQWxjfZ496RTSLunDx7VxAO+3wVbM4BHdkwqG9y
         Y4lp4R4vPad08vJI0S3v71JZ9SLk4k/pb11GVuZbliYqqEW/PwgJ5kSiZk0B2I9ZmeVY
         Qvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758979990; x=1759584790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAJz2iZlVqH7fub6DPlrBF+dlNC7fGvqpAeWouU/7VM=;
        b=Uk/AmxFAP3Q2gxivCjh1Yi6CyGR/Mfq8Aq88hh/E/fNT3CYtMZkhxVJs/3LX0xnQaR
         nALp/FQGSwwmpSqR6BwmqtXMydDPZLyFxxsoZRo7GybuUgAc8FQy1KfJfN4/bd67nsMJ
         dPiP4yystO1um8EJITDP4SUThw8YVUA3T2Y/94Vc1ep18NJbmA06l+ZWsemxNmY7004r
         0wPKoQY7lpUx/5MctxoeiAoAU9SAae+2yYuTqUBwVl8gg7HEh856JOEg0Dmg/l2I3gB9
         IPbeeoAFDyxnJ9ZImKEa1JoseP1WPlxSXwBnDy1nocTo8ChjQtSYK1crpCoIYVGvHX+r
         DINw==
X-Forwarded-Encrypted: i=1; AJvYcCWvbVQ2LmpKHuEG3OSKGgIfejh8q032wl0NIjU1dNirlurniqNq9OMhtTeSKOXTogc5oqRj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhgiywwh/7dGV6BYMsZTe5NP/f2icAFvIzAFJt3RbOwNArtGvn
	FBHjrdLlK4qbPM2GFpgjZkVLA2CXCtwtppewx/Qb3c2o0IXS2d4FVUR9
X-Gm-Gg: ASbGnculn8DTvjgBPymnp1ryevBWLPk9HPUGkcnL+DYI7vts+n/WivdSVqmws3WeuvX
	PCucI4fLVn6AI8wYkyja1E5Mz2pBYVozsHCSMZMrRAE+CAwHS5TpT6iam2lDpGwd00PfsWWWhN7
	ZoqmHuH/ISs8xXg4lZMATdFpEZ3qh3z1mEv6tDw6LMVYzd2eO2uS2bYAAcFg0si+lanLLO+2Z1m
	pzZAVEsSRkn1doZqcBWa1Ly3lLGv78FrRTRngk2fNUXtwHa6tIJsL5RyLTlfRQYNcsbX/0qRowG
	goHcBZpGJNkuCo3FJnBkTflYR3W3I6aRvIlbI3EezD9A6DDa5CK0qF2vNFsz7etDgvtqCcyNWmV
	NqT5luqPJmd15tIb72ea7uunQ6qw6J8nyWFcKkXRbENJ91FnqQ3DE91dCwbjl4+C1u49/2JlMY0
	/gJh9bn7SnImsLxSddV+6JZJvaE0i+BXuFXg==
X-Google-Smtp-Source: AGHT+IGH5UGkTv252dC01JpSDkaJcJ8KfFAosg2KR2cHgR/gkXTKN8Ezxd2HpK6jf4Aw75VWq5kbPQ==
X-Received: by 2002:a05:6214:1301:b0:79a:5e61:b6e7 with SMTP id 6a1803df08f44-7fc2bc2f235mr148121586d6.17.1758979990313;
        Sat, 27 Sep 2025 06:33:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db11fc7e33sm41268141cf.51.2025.09.27.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 06:33:09 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E0E02F40066;
	Sat, 27 Sep 2025 09:33:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 27 Sep 2025 09:33:08 -0400
X-ME-Sender: <xms:lOfXaK-F5kwgMw7tlcjOR660qWhqCLrWrAZEe7epHUwd9o-JfImhfQ>
    <xme:lOfXaJeKeS3Xn5-Akgf5PnQayfL0UCcRj32akuvmHJrsFVIOi6RoXygEImaCEDIDs
    FodizH3rP8OG9AiW8mo21ldnIliy9zWjHGum-JJePd4NLv7IVo7>
X-ME-Received: <xmr:lOfXaEmj95r0yOYn4h5v7ABWtbr87idcTFHf5aZzJcHSW2oJnmLCcIBGTulB3ceINcf1FxPwdVPDxPn2_NQAntzVNQpHx5Dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejvdefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekrodttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtvefhfeetveeiueethefhhedvieelveeuffetudevueevueekveduheehieff
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfeehpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehphhgrshhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehl
    ohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:lOfXaOgQUiKGJ76g8NZ3aKhHZKRXR7xf4qy4eWoMhRhJJcbnDuEnNg>
    <xmx:lOfXaGolzL_423YlYH3OllI9b70btOBalabRJPBlP9aNbpqsYXS1rA>
    <xmx:lOfXaBR23bkhC3zmGaCIYkInVEKP6yWKxQEt16HtkdLcLxC61_QuUw>
    <xmx:lOfXaBmk8fFkFier3uut9Rv3MypIL-z6K2i5_I21X4JLUoAXwJIKSA>
    <xmx:lOfXaPzq6u9J9Oep9xQ1JEINrLFC0m-OW4emMKoTX6g68CsOPyX8PaPg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Sep 2025 09:33:08 -0400 (EDT)
Date: Sat, 27 Sep 2025 06:33:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aNfnkhXnnxqdfPYz@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
 <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>

On Sat, Sep 27, 2025 at 11:01:38AM +0200, Philipp Stanner wrote:
[..]
> > > ---
> > >  rust/bindings/bindings_helper.h |   1 +
> > >  rust/helpers/dma_fence.c        |  23 ++
> > >  rust/helpers/helpers.c          |   1 +
> > >  rust/helpers/spinlock.c         |   5 +
> > >  rust/kernel/sync.rs             |   2 +
> > >  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++
> > 
> > I missed this part, and I don't think kernel::sync is where dma_fence
> > should be, as kernel::sync is mostly for the basic synchronization
> > between threads/irqs. dma_fence is probably better to be grouped with
> > dma-buf and other dma related primitives. Maybe in kernel::dma? Like:
> > 
> > rust/kernel/dma.rs
> > rust/kernel/dma/dma_buf.rs
> > rust/kernel/dma/dma_fence.rs
> > 
> > Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?
> 
> @Christian König's opinion would be valuable, too.
> 
> I'm not super convinced of that because dma_fence has not really much
> to do with DMA. They're not very different from completions and are a
> mechanism to synchronize consumers and producers.
> 
> Actually, before f54d1867005c3 they were just called "fence" and then
> renamed to "dma_fence" because someone wanted that name.
> 

Well, dma-fence.c lives in drivers/dma-buf/, and IIUC it will only be
built in CONFIG_DMA_SHARED_BUFFER is selected. They are enough evidences
to show that dma_fence is not considered as a general fence. Of course,
the implementation of dma_fence may not be tied to any DMA
functionality, but before we make it a general fence in Rust, we need to
at least change it in C as well.

Regards,
Boqun

> 
> Anyways, I don't have strong objections and mostly care about having
> them available somewhere.
> 
> P.
> 
> > 
> > Regards,
> > Boqun
> > 
> > >  6 files changed, 420 insertions(+)
> > >  create mode 100644 rust/helpers/dma_fence.c
> > >  create mode 100644 rust/kernel/sync/dma_fence.rs
> > > 
> > [...]
> 
