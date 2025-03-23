Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777D01779AE
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742752148; cv=none; b=X5/bM8XoSKozlu8C4qSkhQ2iDpfosz2bqOqdWtCMBjDdx3pAlQBpEsEzGKmiYlLn25VEGnvVMySIqyUH5jGHgbi6KPHZonYA/1xa9MkQuzf+TiOkvhlF6BydLjZ4rYlDxSDStdFJYjCgf8prGwGTmh33QE76wziVATPhF1DeXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742752148; c=relaxed/simple;
	bh=SG/EBYlZWIpjS2XnWIM7BPdKAfQ27KKiGHLIKdXWnY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9dLIYoZTcu5lRMaySIO1LV3RbAokotqlK9P354aIbPOaiSpr6j/nZUvLw3BUlCt28lbItOSsTATBDfmkVY5Tu8CIK5k/laGAQ5eZIDhbRweliwgoFpaabcYA26EBNB2fB4PWiLS31dvcOXY7PzeG6jBfqWhdiB3eR+OpKIkxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjoQSP9V; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjoQSP9V"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769bbc21b0so39422761cf.2
        for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742752145; x=1743356945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ+uJqVTsZ3avtStcJ/Ztz1VeIpyTD8NbqJn/aT9rMo=;
        b=NjoQSP9V8VxUgMh14p18ozPdVIf7ICJexXzv9GxC7K7X82/CikNnRLEsqCx7FQp0G0
         bPZHbreqjukIACvx3dBvuUWV4m/sDNFTYARcDgmtBlAyobxobDsPLxeROorMf0Pj0TED
         cKFZq3VdqdJV5EsNTIn13rQAIbSUT93NmHEVSpbNZWP6a0j8XHmRNeInbb7RN0x924x5
         pfWpHBTv7N9I0LYhu5+1ho4mF1aziS4nFZ+/51Y4vI94+X6oajWXc3xNKDM+OyMfNNkF
         J+ksEA2rf4ksm/5LN8I+0PA9uHXL6rxgv4R4ReduXClkk4/+rk6GR69GXopduvG+yE6V
         8J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742752145; x=1743356945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ+uJqVTsZ3avtStcJ/Ztz1VeIpyTD8NbqJn/aT9rMo=;
        b=nGTd8ZKa8WM16ygqNl4sRoVTikGDz83W5BuLXl2O7dkGK/cHaOkfTA/omSsAqqDfDX
         +UoSW1bDPgQfypY1uPSjFfL7hx9nKbGBPVo0OD/dsOxn166+BxWUho5dqBmAkee+aRUa
         SykugaZHq+4WSftjDOpkf9LHqNt9jqwXRMo2P4ObS9HEz1HgZYCA2hUINsCSer2Lp35k
         DkRXCHDDEgT17KPIWCrujKR5Sh07hb/NH/bo+7rTy100pjQW2TyYzGeRgVVxdJm//+1j
         6Qjp86xxBZPrlfMgn/TkW+y8t9S8JOSQa5hBg8l9yLKEJ7xXovXoxKPzc7Dkzfj18/Dl
         7KOA==
X-Forwarded-Encrypted: i=1; AJvYcCWTCqbetCv74w5hkcwr0KNncycUzgtAqc9OrkxOwfwntqP9WYA3QithAQiaHdronwj+npDm@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxs+9XoqRTIoqQdfn3I4sfEhbkVmZsdDXV5/HjKUnMNpY58REf
	UNRwsrwImYHp0JFNBYtzrvbPJ77+2Dpitg8m9Izv80URYEJGUxim
X-Gm-Gg: ASbGncvf0dUbFdbWZkacOcOzz1FNh0nhoDacr0OGHdnQhSVZvekk++Pj24dBmJ615MO
	LslUfp2PH1fJkTpDNkTRgkA5e8hYoxVyb0ulFvubKZcMzOeNWoJdbR0xQoATfM1XbJyMED+/c8u
	H5TBxX7gDtpPtn2jrKLFduMpM3fWWZ/SRCSSaggYFOyrCeT0p4ZGOovygy6e0xlZgakfp3gxJZl
	FIA2SwSZFQwNWQQ4Cz4Q7qcZmWVWjVBXxWeeN+DVLWJX2bWM3lW9LTEX6VdxC+OA2VGNJARYVYP
	q1pMvYxmxgmWpeumC/LzO1oD6NiojGOIUU+lLpagC01MVjL+Kd/7lPuw2xMeTeELYAIQ2/DtTYS
	ZsUaNjo43yTI2DUduP7mQidhpdR+ezvfvaws=
X-Google-Smtp-Source: AGHT+IHwOMkiPyfCebAU+FAmjNOE9+kHDmW37cwJs+eNWPDT3lqiXEsUNpMavaTipAKKb+6RfMr4eA==
X-Received: by 2002:a05:622a:1928:b0:476:afd2:5b5e with SMTP id d75a77b69052e-4771dd65d18mr208515231cf.13.1742752145286;
        Sun, 23 Mar 2025 10:49:05 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d179f42sm36056481cf.25.2025.03.23.10.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 10:49:04 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id E888E1200043;
	Sun, 23 Mar 2025 13:49:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 23 Mar 2025 13:49:03 -0400
X-ME-Sender: <xms:j0ngZ90Mne4yNM_NAqXTZLpCComvPhYGRqfGdjav1WBhnP_AAKhNDw>
    <xme:j0ngZ0EkH3zseaheX6S92TVMVS36FBbHPdZpNwTc-pPoGMEwjgLhoPpYJeLwHIgth
    9vpia4duZJrXlWqDg>
X-ME-Received: <xmr:j0ngZ94tIZVn4fwyfX8gCWEjuXOH0uMeLSiNPArPus22lPAs1HgMVrt2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheejheduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:j0ngZ61n4V_BhQJwP8uulWcxWCfztjIu65i8y0ldbM8SR4bDPpxU-w>
    <xmx:j0ngZwFX3isJBz5nUmQEhXOTohqKliqTSz7wxGhW2MX68u4cM4Ci0g>
    <xmx:j0ngZ7-NqAPfMHfcTHNuwOFxoJHlLcu_NxfyGMCEYXXoOIyjs2jIJQ>
    <xmx:j0ngZ9mFz770s8ReWyObLlXDa2gaxPcMRPmGkK_VHTxB7yuc77A8BQ>
    <xmx:j0ngZ0HAWUuJVohC8nduQIUGGvvwJjg34izbUVxe7-m9rDnSVfU753uU>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 13:49:03 -0400 (EDT)
Date: Sun, 23 Mar 2025 10:49:02 -0700
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
Subject: Re: [PATCH v2] rust: sync: optimize Rust symbol generation for
 PollCondVar
Message-ID: <Z-BJjjEZBzwKJ9mS@Mac.home>
References: <20250317025205.2366518-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317025205.2366518-1-kunwu.chan@linux.dev>

On Mon, Mar 17, 2025 at 10:52:05AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> 
> This Rust symbol
> (<kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop)
> is trivial wrappers around the C functions __wake_up_pollfree
> and synchronize_rcu. It doesn't make sense to go through a trivial
> wrapper for its functions,so mark it inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> 

Queued for future tests and reviews. Thanks!

Regards,
Boqun

> ---
> Changes in v2:
>  - Add link and Suggested-by
>  - Reword commit msg
> ---
>  rust/kernel/sync/poll.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> index d5f17153b424..a4f92c545fec 100644
> --- a/rust/kernel/sync/poll.rs
> +++ b/rust/kernel/sync/poll.rs
> @@ -107,6 +107,7 @@ fn deref(&self) -> &CondVar {
>  
>  #[pinned_drop]
>  impl PinnedDrop for PollCondVar {
> +    #[inline]
>      fn drop(self: Pin<&mut Self>) {
>          // Clear anything registered using `register_wait`.
>          //
> -- 
> 2.43.0
> 
