Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC5286D76
	for <llvm@lists.linux.dev>; Mon, 19 May 2025 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679170; cv=none; b=Z78rueMNK35jMEVXcJx3VBEPyUcBauMMPC7J1Lvn9gqbyPCzBbf5Cl5H/M1bwSgkoLgqrN/hkzDPXkIhcukvW4RCzZV9bdFocpzttwbFxaaWGu94z+ttXi7CuABd8wWbky42HqqpRKeAi1TFlp38h1CCYh6H5ITNyYIsPnak48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679170; c=relaxed/simple;
	bh=KGH4zMpQ7qD9i5f4sPixq1K/THXTYM9pWp8ZS31Ly7E=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YobMPbGef8KTUoBcc6NBgNtI6mbufHc5CQplWsk5w2wj4IjSiBe4ozDEQ7X9kx0RwlXPQn3QhiXvisKye9LrhsCw1IYFyUkrM2i7/KT3DO4sawd+yAugIAOHnRo7cdSk+BUc/xWTdqK3HtApn0+V1BKP5Zky3pimv5Ly4+ZJvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlOm4eBi; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlOm4eBi"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c7913bab2cso476553285a.0
        for <llvm@lists.linux.dev>; Mon, 19 May 2025 11:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747679167; x=1748283967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce9QlVqnLl0uWFM7eacQ/M5kTWSPkz2EnpFgGM0tFis=;
        b=DlOm4eBi+Y9hDDLohZiP7QsDkOTKrrpLDAcLh4U4wHLtSv15GMobzK2Zz8/uW1Va/3
         AYop+TaPORdQeVSseC0tw0D/4CvGOJyeHV6g1JD/RETcTsBcYrGjajN+rMrLpJZY0Ccs
         U9nrLfkytouBD55gvBIw0bCsYOySuiV2d1OVXYeXkFpdFQdaaHJrHjcZLeWY3rGT8yze
         bdbLFCREZJGa0ntqeEYaEQSQjYq5Z+g/+tmkcDtzxSzrx3zlJy8LNREbLihqlT16Jz+V
         w/FUwr+s+icz//dBS3gVaU1UlL3dlArmJyJOc2UJpvNHZWmH6EUQjX0pMOiHLKVZYzzS
         1X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679167; x=1748283967;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce9QlVqnLl0uWFM7eacQ/M5kTWSPkz2EnpFgGM0tFis=;
        b=PzK3cfQutskT3pgmz5V0lx1C8Rha4iBq8h2Zy0Fn7B6SBEZ2VrYLX64a/aSY0YJ7Fj
         fttEH467kpPRZFbndQTWJmM5mQzXPlkRE9eRxsBWTf3+3KXDow4u+WT3sOcX9JyRLkgC
         n0xWV+b9CLAxLRm3D+ZVkG/wOhmzMDil2wKJUWhVUzJA4tfe5IF0tDi/O2zrr0PP4cO4
         Xks92PeYmVhe4FN9DNWMDmL6XqX9F3PmSvJTwHe0Zawj8EYmTQoDKLxX5H4ZpHGFurB7
         MGz1nB5cDK0YYO3yGubxJJStZQ6DpboxZyrRYn6yDc18+/oUsVTup758/uGatr8VSzHO
         vjsw==
X-Forwarded-Encrypted: i=1; AJvYcCVih2vlCTcWeTExoiLd2NUxTZ630c4gSRWe3nCdPjSEAUxREFfK0RsNntQpNAZd6Nr+RRIV@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhu7jDzivqNKcbaWvwCNx2RnHr5v9y2g9mR6LFk2/xI1372L8u
	TX7wDEbYpkkyN49lM+kGyEAyrYJWirqZ8IE21PV4sMgFE+/TqxtitcpJ
X-Gm-Gg: ASbGncs82mceiPofZOL0pyrOuTtSY80/7ccPO57Oo0/54+wHSfHgfZ6zmckdesLMiSf
	KA7RPulD38etAMxWr8pVjUyh2B5qTQNfQgdCRur/PDvEppNBb0Ocg2+ZU0h9mTU5J7MpNDs2sYS
	QEie6AD2NiG+syP9YzB5/0p8Ll5KEAuVHwAlQ6tZxxUgIKiipQPoUcJOalVRXFjUNrCdT8jvHAA
	ep7XgXMBzDgIRttBZmdfoJ6nHPzVZVBujeQDrN4rSjon7K3lNqGAJrm2H+cHW5nHHs/9G7JEI+W
	oJE7T6Cry+O0a4IatCHEKpjxAEUdVsq+/WNRzAok3RvLix4N1AfLE0hXuRLIlQrjx8QtqIs1Pt7
	GIHiozlCrxpxVjS0nDYllnA60PVv0f+Zi8D6/81aUag==
X-Google-Smtp-Source: AGHT+IEk73D5hU5Y8sNSajDL0L2bhfKMqVZEoILAk2SEPUyR5xGVY369yA3gX8z7NcvL2A7ScXshMg==
X-Received: by 2002:a05:620a:2849:b0:7c5:4913:500a with SMTP id af79cd13be357-7cd47f3d6damr1887848985a.19.1747679167523;
        Mon, 19 May 2025 11:26:07 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ccd94sm615228085a.109.2025.05.19.11.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 11:26:07 -0700 (PDT)
Message-ID: <682b77bf.050a0220.205248.9559@mx.google.com>
X-Google-Original-Message-ID: <aCt3veA8bw1EQ3AV@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 92DE61200066;
	Mon, 19 May 2025 14:26:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 19 May 2025 14:26:06 -0400
X-ME-Sender: <xms:vncraGJ9z7tDaeV7F00ICmGbP573QksziNl_XN3NK1sF6QLBgP4A0Q>
    <xme:vncraOKKTDyagUvLD6D7xApSC5hK42yLYe9WftARh1oN678mTar6hcpoGtN9Uxpmq
    4fMNzS74QRT8FA8dA>
X-ME-Received: <xmr:vncraGuGFm1rMVgVTBxW-Tujc93xsR8Dd3DeOO0Npsae9-jxvNnn92aMOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheptghhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    shhkhiesshhkhielrdguvghvpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphht
    thhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpgh
    hhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhi
    nhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:vncraLbJ4qhXFlYBIfRSgI-IkblrBN3GYRZnvwY00JiWaGLP1qLVlg>
    <xmx:vncraNYq1a3WGO_BJBOWhneNN9lCuD2MCAZp2ulVPU1r3v67kzji6w>
    <xmx:vncraHAdbhrYvmNL3ZeiO_cHA8xBo1hcxvC0lJgladgAYy6VNkrnDw>
    <xmx:vncraDa6MuVGJa0D9PJRKFGZ-2l2kpQjMxQXbWwiCDwMXYtDSdx9RQ>
    <xmx:vncraNqZXrDXBSTNoQGOlCZXDn__MJDzC9cOjeDmyHKMZN1xU8Fej9oq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 14:26:05 -0400 (EDT)
Date: Mon, 19 May 2025 11:26:05 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v4 0/3] rust: add `UnsafePinned` type
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>

On Sun, May 11, 2025 at 08:21:37PM +0200, Christian Schrefl wrote:
> This version now only has the kernel implementation without the
> config flag for using the upstream version. Additionally now
> commits for using `UnsafePinned` in `Opaque` were added.
> 
> Checkpatch warns about `rust/kernel/types/unsafe_pinned.rs`
> missing a MAINTAINERS entry. This should be fine because it
> will be included in the RUST entry.
> 
> This patchset is based on the pin-init-next branch.
> 
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks a lot for doing this!

Regards,
Boqun

> ---
> Changes in v4:
> - Reworked `UnsafePinned::add` doctest to not use get_mut_unchecked.
> - Link to v3: https://lore.kernel.org/r/20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com
> 
> Changes in v3:
> - Dropped CONFIG_RUSTC_HAS_UNSAFE_PINNED and feature(unsafe_pinned) (Alice)
> - Add comment to `Opaque` reasoning about included `UnsafeCell` (Benno)
> - Small changes in commit message of Patch 3 (Benno)
> - Removed docs mentioning not included functions (Benno)
> - Removed docs mentioning implementation details and added that as
>     comment instead (Benno)
> - Link to v2: https://lore.kernel.org/r/20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com
> 
> Changes in v2:
> - Expanded `UnsafePinned` documentation to describe differences
>     with upstream rust implementation.
> - Removed config flag for using upstream `UnsafePinned` type.
> - Add patch implementing `Wrapper` for `Opaque`
> - Add patch for using `UnsafePinned` internally in `Opaque`
> - Link to v1: https://lore.kernel.org/r/20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com
> 
> ---
> Christian Schrefl (3):
>       rust: add UnsafePinned type
>       rust: implement `Wrapper<T>` for `Opaque<T>`
>       rust: use `UnsafePinned` in the implementation of `Opaque`
> 
>  rust/kernel/revocable.rs           |   2 +
>  rust/kernel/types.rs               |  45 ++++++++-------
>  rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+), 20 deletions(-)
> ---
> base-commit: 9de1a293c8ece00d226b21a35751ec178be2a9fa
> change-id: 20250418-rust_unsafe_pinned-891dce27418d
> 
> Best regards,
> -- 
> Christian Schrefl <chrisi.schrefl@gmail.com>
> 
