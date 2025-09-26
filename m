Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BD5237172
	for <llvm@lists.linux.dev>; Fri, 26 Sep 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758903050; cv=none; b=Qp3pYlVowJxzcq62OZsg+YctmMutJR6oM3tOR+uoOtW/8Qwi5PRLdYvNlACZIDUQvhfM2p5p4MtyrTbafT4mGQm0HROj2a1iq7jzHL3gYjCQiaGH6z1SQ9vhUEYYka19JRzBWUt8NhgJN5tYhakAffCECDttZoowzqpadXO4dpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758903050; c=relaxed/simple;
	bh=V7kexhXSChwKrummz/CzaqELcFXuUj4bgGCNqOOCO1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaJkk0v5NDgpxjxYYw/EeCk++MUXLQFlHT5dWm3O+a/x05rTLoX0HKU3I/zv6psR/XY9HPzlzMgXw5sLV2zAQTtdXWrU4kPF+FfnOsIcAtNFyrcxDAaYsZyv6XwfuG0ySC/v5c/bVMFtt+T2DnX576S0xLyx2+iEi/WznFIRNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsK3g1w6; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsK3g1w6"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7f7835f4478so15014216d6.1
        for <llvm@lists.linux.dev>; Fri, 26 Sep 2025 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758903047; x=1759507847; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iS2jH8joxnDE0/hOPwBCvRREi5onrG6qq8QmOEtOYZk=;
        b=OsK3g1w6Qs0EgoYPRGrBKMozvuNJ/w7eXuWyH+TWKounTwCPIoLoLJgeK8WSosSHyI
         78Kz2BYcgyf17N3ubJGHATviFwXjEoUcwHmSNTyjf/yEFGwgAa1WhG8Jro7lYAy91gkS
         XCluNEzhFO/seKHCv3WNgHoRaPF051v0G2x0Ppae8N4rdkmS/Y3SwbxD9j0tibsYRpyp
         1K2paxDBmb8u98PYAjTDzSUp+KS4DKQGuiiWKhPKPot1/YX3kmNeYDHiMHxbQW4TWO8F
         dwl5bpdVkTevSCzJvc6cZC5y+KY1nVxyF0K1qEA453pO4ZP9cWfcztyCoPWNID6K/erl
         H5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758903047; x=1759507847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS2jH8joxnDE0/hOPwBCvRREi5onrG6qq8QmOEtOYZk=;
        b=mS6ykccouY/2vX7c9T8xNTY0y19z1b0HoQKgsqy3iQHPPW79FcqOJ7yV9VrVFdq9EI
         A7KCA4ByKk1S5I3PixzLjzMBVF0g21LevGi7umir03qQvfNltVPiTisxesaJtWztwD88
         XI2xMywNk1fZUxk21yTpZwxXaSJp+mvFPXSpshJDSdmtrZR1x9uKRmI40xeEIUksqTm/
         6jO/6zV5VJlTGyKRkwpYz5CJlFdfhW1qEwT6TOvF+u2t6aG7euYctIauO48sU64+6V8p
         38GZ4JYelnGl8E7bZ1H7CH+MOcZV+v7m/PFs9dsEu4S/ULV3GUgCO+2BUCR4acV4uraS
         at9w==
X-Forwarded-Encrypted: i=1; AJvYcCUNM/f53s5CX/PZxNQlM69a444yFEES6JEk80ZsGHMy12J0jo4XFJBL34DO5Yq65C0OmKEe@lists.linux.dev
X-Gm-Message-State: AOJu0YzzjmdCn18wCWpGBmJYhr1iyCEZZtd5epmThVuJQuEgqeU77mCf
	FDOo89yBGQzEFmSPPkUiUWgzi2/V6QoLEMk7TUezlQRi19Iu+vGjP895
X-Gm-Gg: ASbGnct0KZxmR9KLYvuJwCbCCbUT/crJ6l7QoaW3KB9e3fUzjG5wqVtZlkezxH675Zz
	DkPN14xCY8HICoKwLyqNYn4InqokR2G70fjtiSxIgzCy33wSCsH8SorJ5zs5zel3XvB+L3YIDID
	04mkd/BRaSCERHjn43wAMejH8ky4Y003eVtUHh9ZkuLaqaknEZc7U7uT3O9LcaNA3Qm7wSxhqKQ
	5rm2Vf5pKJ9K3Ew4roMNDuLnI24ygXMsZAWnA1fkZ3vFDcie/6rH34feSFp64XHOrYATFVSMdeM
	/S0yc94ENG9dM/PB9EJkrG1Gz1bE8y+89oNSGnegvVtbfb4reInaeUsqWMZUXQ+6MGXnSen16Mn
	3CJ7x9sMuMe14o+zfEQeI+BamxOYNxzJwNwPkn4HweyGdS50Kz/y8z3fMDLfU3S3Edzl0CNLiFU
	edjJzy52DPjCgf+AFA8SkYiho=
X-Google-Smtp-Source: AGHT+IEJzR6PCrUgJkNWH9fQSw/nY/s4Zu4U9QY66TsXFNh3e/NVRbzSY9nlbLgfJ09gjwgG9YTkEw==
X-Received: by 2002:ad4:5fc7:0:b0:78e:7a30:4d62 with SMTP id 6a1803df08f44-7fc28075665mr116691516d6.4.1758903047160;
        Fri, 26 Sep 2025 09:10:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8013cdf424asm28671636d6.26.2025.09.26.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:10:46 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id CABA3F4006A;
	Fri, 26 Sep 2025 12:10:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 26 Sep 2025 12:10:45 -0400
X-ME-Sender: <xms:BbvWaHVuXDP3iMjjPX1m7M90D-RNquoCqG1-esnmJoBZQAkpEpd3Tw>
    <xme:BbvWaPxByfBQ4KDba0u_gP05hEOPa2GwGVSFrFwj1ZDKwheQ9tzEHMjiMvO3m94Vo
    pw-fILu9wwFJpcKDTvrzb3_leAhSUzCccxhFghI2B1PHu1ckeOI>
X-ME-Received: <xmr:BbvWaGDlLAeh4zRnhHena0ITcMn-iqQroSYWAFMBj-lzXqd2AuLRdGK5ZpFtYnRPSMHgfmsK5w20xWICBdHyLygKoVFrB1a0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
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
X-ME-Proxy: <xmx:BbvWaN7gMW_uJOXoaGTJ9xSlmxs7n2SOoVL41AmneFiFZsrDOjL-tA>
    <xmx:BbvWaFknzs2z_PNwzZBGvsA40uAsb8YUJYaM6UCaDKjxqxRM7WbG3g>
    <xmx:BbvWaIc59-2Me0P7VNO45_KkiB0ShlA5xzw4G9hvwC7kfQ5kEfECMQ>
    <xmx:BbvWaG0UA8e0wvyM67dznKC7x3DNyCxCfifsnDms3P5cfKMviV4BKA>
    <xmx:BbvWaP4FRn_SWivUuOoKR9rfZR6a0P0Y3ZFVUjm5c2oZS7M15ACO598b>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Sep 2025 12:10:44 -0400 (EDT)
Date: Fri, 26 Sep 2025 09:10:44 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
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
Message-ID: <aNa7BDpKS2KA__4M@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918123100.124738-2-phasta@kernel.org>

On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
> dma_fence is a synchronization mechanism which is needed by virtually
> all GPU drivers.
> 
> A dma_fence offers many features, among which the most important ones
> are registering callbacks (for example to kick off a work item) which
> get executed once a fence gets signalled.
> 
> dma_fence has a number of callbacks. Only the two most basic ones
> (get_driver_name(), get_timeline_name() are abstracted since they are
> enough to enable the basic functionality.
> 
> Callbacks in Rust are registered by passing driver data which implements
> the Rust callback trait, whose function will be called by the C backend.
> 
> dma_fence's are always refcounted, so implement AlwaysRefcounted for
> them. Once a reference drops to zero, the C backend calls a release
> function, where we implement drop_in_place() to conveniently marry that
> C-cleanup mechanism with Rust's ownership concepts.
> 
> This patch provides basic functionality, but is still missing:
>   - An implementation of PinInit<T, Error> for all driver data.
>   - A clever implementation for working dma_fence_begin_signalling()
>     guards. See the corresponding TODO in the code.
>   - Additional useful helper functions such as dma_fence_is_signaled().
>     These _should_ be relatively trivial to implement, though.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> So. ¡Hola!
> 
> This is a highly WIP RFC. It's obviously at many places not yet
> conforming very well to Rust's standards.
> 
> Nevertheless, it has progressed enough that I want to request comments
> from the community.
> 
> There are a number of TODOs in the code to which I need input.
> 
> Notably, it seems (half-)illegal to use a shared static reference to an
> Atomic, which I currently use for the dma_fence unit test / docstring
> test. I'm willing to rework that if someone suggests how.
> (Still, shouldn't changing a global Atomic always be legal? It can race,
> of course. But that's kind of the point of an atomic)
> 
> What I want comments on the most is the design of the callbacks. I think
> it's a great opportunity to provide Rust drivers with rust-only
> callbacks, so that they don't have to bother about the C functions.
> 
> dma_fence wise, only the most basic callbacks currently get implemented.
> For Nova, AFAICS, we don't need much more than signalling fences and
> registering callbacks.
> 
> 
> Another, solvable, issue I'm having is designing the
> dma_fence_begin_signallin() abstractions. There are TODOs about that in
> the code. That should ideally be robust and not racy. So we might want
> some sort of synchronized (locked?) way for using that abstraction.
> 
> 
> Regarding the manually created spinlock of mine: I so far never need
> that spinlock anywhere in Rust and wasn't sure what's then the best way
> to pass a "raw" spinlock to C.
> 
> 
> So much from my side. Hope to hear from you.
> 
> (I've compiled and tested this with the unit test on the current -rc3)
> 
> Philipp
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/dma_fence.c        |  23 ++
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/spinlock.c         |   5 +
>  rust/kernel/sync.rs             |   2 +
>  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++

I missed this part, and I don't think kernel::sync is where dma_fence
should be, as kernel::sync is mostly for the basic synchronization
between threads/irqs. dma_fence is probably better to be grouped with
dma-buf and other dma related primitives. Maybe in kernel::dma? Like:

rust/kernel/dma.rs
rust/kernel/dma/dma_buf.rs
rust/kernel/dma/dma_fence.rs

Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

Regards,
Boqun

>  6 files changed, 420 insertions(+)
>  create mode 100644 rust/helpers/dma_fence.c
>  create mode 100644 rust/kernel/sync/dma_fence.rs
> 
[...]
