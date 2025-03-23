Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3632E336C
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742752769; cv=none; b=D7pAtWOlUAEWXwg5gBJmMO9vpHfYJuNuuhdtb3v+EXCIQy5ulFHI2I+WSFkOluQYVVUcr05HmD6CQYgNQf1SrsX1B58SUqWyI7ysPPYENRi4AKZwojIGyzggLVT0/xM9Yi9vDhw+/BTn5g5rON9FLjWxNBJDwetGIQDpq3vXLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742752769; c=relaxed/simple;
	bh=CV05HM2N/pgJ+by/utbNBCmmrHTeNxBdhsrtJxDPyrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jjb2L7VcGjGRslAbPUBnWiQh3/37CAnu0Ypl/J9qEdwsbLPPM+wZkbUNmDRnCUGwwHYAULztIVNTYXoQ4RFB+COdOqrKCzhAz4MOyYguDEcUHDuoclYCkVzSVhYQJbPlCha0WTRpfNJrKpz9s5G5xCYIA/nzo/JaOIsaDvmXUr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzGhjtQO; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzGhjtQO"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so1784386d6.2
        for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742752766; x=1743357566; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1r9xkS5nNGfHWOqGvzoM7DsZs9/l4KRsJMirzjSQ+8w=;
        b=bzGhjtQOPBycQYRI/nU2WOmaBsLfL65Fjh5Fq4Hi0zQQbK/KzJPWM4nPNWe7MeD+/J
         56/0gfiKTfsuX3HLwW5PrMCKb+FC+ZC0Fo2Dsb9RYMVHwBQQiAUO3dXA2m7fK5RkSEcp
         x/v9wKM9orbxZw/Jglmq/kwZm03Zjc7sR1MwUO2ertrheOdFpvGX+AivkEWUMNTjwHN7
         JjJ/XgpC+njneG9CiiSSbl75RGhMvJiOmoRz0iPOwRxXT0dQLE+Oi8WQG67mrav7OTBx
         lXDn7A9GH1KXHzWKERVVUDAb/kbTRs4ZZECkdnzK++OLg9Aprc4mZFbxVGw1FlUSIdZu
         oVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742752766; x=1743357566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1r9xkS5nNGfHWOqGvzoM7DsZs9/l4KRsJMirzjSQ+8w=;
        b=PnDdWn1opKi101jCrec3SAUlkopB1UIYZZHfNquXXOTjJditVcGLRKHsj+QFaLvCq7
         sX5MZxnRA3p5TeU5IlWMXsuZWJesI5jGvfyAtQa70ZUGQZIx52koyor6gyf3D1kICIuE
         goxlReB6U7lpUwqtCVmojavpiK9aVoqo68hlsat+njTEQkRd5cCseaqTe6TvPscEwMrA
         vMogixsz4Sc+34Tnwb64U1Q0kwFvYbFJeTwkKHI2YJakm/TN+ZoWPMuygHKQg0F3DZfg
         IqBS5CK9sDMzWdNSwJFhCWa2P6P8Vi3HNUq8P/T68vQZKJFuashRP40rSUohgd9T3wzn
         Y/gw==
X-Forwarded-Encrypted: i=1; AJvYcCXw5x9FJrXeP+VuR+odo1Yqa2cQk9oWu0Lw33UsksJkYsRI3wxAye3ZOA41jBIoBei23lGt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6Om5D4zOMP5A0VW5xUEpM350rVpx+z3LwrMN6+h1o6hiB/R9w
	FTUWd5xPJLqKJKXOJzvc6nwZuq4upWcbAJxD4NC8F5OYxSsbaz6x
X-Gm-Gg: ASbGnctKMvF0AuCjGs1Dapd1AWmv9+VRZfWkyhiDAnasU0Qhmb8ETvbiNdynGJaPgaS
	hity/kMWNDJu8VxEeOVhlJ5lmNXELre1Hq4HGmQcI+abf+ni75A078FPlcduy01YTlyJyiCivi+
	HqjUD6YkYSrc7+rCGOxs5XSGE/joTZ6LgAxJdwj7S4bmR1Sf8FzxizfPhBQTu89ZkwR713nyATY
	dXK4VY2BrA0UiEsWTuh31TvmfLe7TaXF1UWGKnpdsorJZ0lECaAauiPvjvglI9FbcxTPgjkypuk
	lgJyenFYyjnj0U5ZeE3KZ4fxZ4m9uK8d6581cNDkKRhmJYh8qMpsHGUHM/GIi3Jq3TzoP0DSBB6
	xQ4r52D1GIYjUGi6PBXsoDhdXytlHKLGUoGs=
X-Google-Smtp-Source: AGHT+IEBB/efSwLvmsR6PjdytJDIIxsqMlrTQm2bxHFbaAJqm8s77YSBZnCFBn4/4T6UCs3lmqWYUQ==
X-Received: by 2002:a05:6214:500d:b0:6e8:f4a1:68a4 with SMTP id 6a1803df08f44-6eb3f34f5e8mr164354776d6.39.1742752766441;
        Sun, 23 Mar 2025 10:59:26 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efdc416sm33644366d6.94.2025.03.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 10:59:26 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6DDFF1200043;
	Sun, 23 Mar 2025 13:59:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 23 Mar 2025 13:59:25 -0400
X-ME-Sender: <xms:_UvgZ-btw38nNMBU1wppsi7hIOyKcwGqVK3eRcbRl_7V7izMUNW-uQ>
    <xme:_UvgZxYLJ3qxA9VGzdeetJ2C88qpzeznwSaABiHV5WE-oqsVQeCz4LC4kBHUxe695
    -RVwiGnUM1Pw5XNyQ>
X-ME-Received: <xmr:_UvgZ4_UPVpAGaAUem69VfThUQ-MBQCFk3w3RKFBxECYN27PmKXN_4_v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheejheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeej
    uefhhffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepkhhunhifuhdrtghhrghnsehlihhnuhigrdguvghvpdhrtghpthhtohepohhjvggu
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphht
    thhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhope
    gsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhn
    uggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:_UvgZwpnAzQNaarsMKT90DyyW53qf7s12U812QaSROZ2pB5wKR25Bg>
    <xmx:_UvgZ5qfgRmz3KHf_0HlhtrZ3cunF70ghitagmjJUnn_bZX2cFYp4Q>
    <xmx:_UvgZ-Tsc4AzG0anZSZxu4Sgs6ot7Jdq1Ff6RX0_Bb-YqMBM5DRiPw>
    <xmx:_UvgZ5pG_mR2l6jPuACjwIpbpFpOgfsLybbLL17nIjNojc1urUrPZA>
    <xmx:_UvgZ244Wx7e-7L2AXWzBFaXKtMIDmntQVqj_D5c96O8nmdcNtP4kW5L>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 13:59:24 -0400 (EDT)
Date: Sun, 23 Mar 2025 10:59:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@gmail.com>
Subject: Re: [PATCH] rust: sync: optimize rust symbol generation for CondVar
Message-ID: <Z-BL_DFA3afcRYGE@Mac.home>
References: <20250317081351.2503049-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317081351.2503049-1-kunwu.chan@linux.dev>

On Mon, Mar 17, 2025 at 04:13:50PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*CondVar | rustfilt
> ... T <kernel::sync::condvar::CondVar>::notify_all
> ... T <kernel::sync::condvar::CondVar>::notify_one
> ... T <kernel::sync::condvar::CondVar>::notify_sync
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> 
> These notify* symbols are trivial wrappers around the C functions
> __wake_up and __wake_up_sync.
> It doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> ---
>  rust/kernel/sync/condvar.rs | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index 7df565038d7d..a826896ba3f0 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -181,6 +181,7 @@ pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>      }
>  
>      /// Calls the kernel function to notify the appropriate number of threads.
> +    #[inline]
>      fn notify(&self, count: c_int) {

Hmm.. I think CondVar::notify() gets inlined even without this
`#[inline]` attribute, do we need this actually?

Regards,
Boqun

>          // SAFETY: `wait_queue_head` points to valid memory.
>          unsafe {
[...]
