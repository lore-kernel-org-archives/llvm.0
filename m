Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069742BAF7
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742751393; cv=none; b=XTFOImEWL8lVLubaUtxds7/mV/OLTIz7XQXPA8O4F2Ei7om/eCCXVlIJ/eBdIBrUPvOspBBxDUjJQNq76R17DbmZYqxLS4BjcKPkgKsRh6F1F0nO174oYv4OkZoZAC1H4ffSdBZnSqVjxG43QujIv06LP1wY14ezv0uYGE6g/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742751393; c=relaxed/simple;
	bh=tw3/0MDVahV5gYA1D5ZUev1jqNbxH7cuac9JUXXrv2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqUIaZzecFtkaJ6EQn4LCng+dMoh1Gw+KnSaQ7UWI3fW2xoHeV43eIp7PflCyYF/xwLO2OZ1GgKIQL03jwRVwdrSbFoMim4o6BcfI830S5abCZCvuykj4jPiNCs7nSyd0uPeB8QrA19XjBMk5tyVhGYVFDMHt5ML8OV1p+ZosZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp/z2CFR; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp/z2CFR"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c59e7039eeso524306985a.2
        for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742751391; x=1743356191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJmxmLHnI0b74eLfgzEkn0Xb7QzO7kjHFPv4KK92C4k=;
        b=mp/z2CFRpcB1vRFUrPuevocuBdduedLUmPG09yXhf+QzsOyGhfh32hyfRYljxVm/Di
         h1BYnVuGgwz45lBmK/TZ+6c1RGlEshwQgid+jywNYtOvm+zOQDIxcrSOXPTB32HI6vEl
         5Jb7QshiIEVTOAVOni7uMQWvOQcRDumIm+MgIROHUveB6+hN6YJClHIl5StQrOfyEsnk
         ovc+TMaJIGZ/FHuWIpmanGuBSnAngo4ZAruSNHkJtAbAeaB7x2LlNkvQDAuxgLaMB7eb
         TaNEsFdWlHfQaHZ6/KMnipCXtQi9T3jfO8+d2wYoT/h5J16wd1qqyMMJ6AXg6zInfaPk
         gOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742751391; x=1743356191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJmxmLHnI0b74eLfgzEkn0Xb7QzO7kjHFPv4KK92C4k=;
        b=cmWESCIndNizToveOd6sbg3QKgN5uQ/eIjhb2wdexoxfe0VP6CmasJeF4dRyR5b0JW
         oENIdqKh3Y9dutWGdxHf/kLEPrGdsO60OwEadhnjc6p4ALHoIUExrxgBANsIBwauOM2P
         ucAr5+WJo+3YZCR85Yo5Bn64PFLC1LtwOX/G6FPtOlZrIopy02KY2ctzGOki+tLUwWts
         ZCDtKjKZIC7cSY2vSvN8MkKKlTYloWcKdVz5pIlrd5KKEIyDnYWHDZaZU1RPw1+qC58o
         YgyQqVM21BfoDnPIvmQdo9gInTxP+0f6fuSoC03C2QOJWpsJIomPmKFjg59kcGwvhqHR
         eOBg==
X-Forwarded-Encrypted: i=1; AJvYcCUVdhFsdFAUzUalHd4jtywVF7hgXzH+qyK8sedy43Z/qiWIL/2z9W1ey3CUVgzzY02hRon+@lists.linux.dev
X-Gm-Message-State: AOJu0YzcOJMv31IQc9siLxRc0Cm0wPEBSv8KZeOzmayEXadztkbbA/wL
	+V5rqgqxNRhHMCpBJPB1DeyJALzwx0Hy1CUbOkTkFWTFxP4UR87V
X-Gm-Gg: ASbGnctzQetNxCI7ofWzKS5JPavhfZUEQSnqItHJYy0YOjbGhGv5PH/Yv1u+9UUnHD4
	y6UHmBZdY84xH7g5/ONnGNNaAI/xkhc4ODo64gwb/+2IuSjYIMjGIsjJ33NATw/p0aHe1QcGUS7
	jGq+3SORIEZ0mZh9Ig8D2h/It1hQJQLxcUPrBj4pstqRiEEPSqO9OVrF7OrouYli4+iXGuxMRR8
	5qrKwnKyq45lRYSwWcS7ycSaBGymIUyChgEe39cY86ptgKo/zgLUEj4baj8VvBq26FykkgVoSCE
	7vzrpk6KNnqzWOz8aDGOn+Jxha53y6dI0/h8aRfxZCrBpEdqdo25dp1Duhdw27828xFQFVgVskR
	REyeD/vnUkcaIOyg4EH86HsF2Hp3ex5Lb9/Q=
X-Google-Smtp-Source: AGHT+IFPXx3Q4TX1Xs2Z84TncJkMZsWBNJhJ343KnGGojWAVSXxnbqwjcFG7410Xa+SesHkkJ5NJcg==
X-Received: by 2002:a05:620a:29c5:b0:7c5:9a10:7824 with SMTP id af79cd13be357-7c5ba15d9famr1184377385a.24.1742751390630;
        Sun, 23 Mar 2025 10:36:30 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92cfe65sm384903485a.28.2025.03.23.10.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 10:36:29 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 42AC81200043;
	Sun, 23 Mar 2025 13:36:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 23 Mar 2025 13:36:29 -0400
X-ME-Sender: <xms:nUbgZ8Hy1gTIxowI2y2C-W_Y0z2hfWYovxZgPJevFIS-YQFT0N77Sw>
    <xme:nUbgZ1XegJ1sibZCAMIvAwQ-Te3mIZohopMiyXckDwexXgF26Rb3LS8Q9-iuoVQjQ
    G-P_BPQzrHTOKKATQ>
X-ME-Received: <xmr:nUbgZ2JgW3uB0mTmllBXEif9LeoiRy2jqL6LVvKosEkkBoh0VXWUDIun>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheejgeekucetufdoteggodetrf
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
    htoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhunhif
    uhdrtghhrghnsehlihhnuhigrdguvghvpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorh
    hnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhl
    ohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:nUbgZ-GBu7karf7bxbSTuXjOrc3z5CeO4meI733rVw8v5mMfWUfUvg>
    <xmx:nUbgZyU3NqHbamDSNkk9sbFzZX97-PHhioyTcJrtgVSsYU2WEvyG8g>
    <xmx:nUbgZxNVo8Yv1hxoYNi0O6FcW81f-526reDkRUSopUsRdjxMLordag>
    <xmx:nUbgZ53cG6zvlV6vCYO4c6xafq44DB0cDqIhLfz_Yi__rs39bGhEZg>
    <xmx:nUbgZ7XJft9LcxmzcTaFm4p0v2uNPgplr_2L0IDjMnTQ2o1NyfkzZjGM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 13:36:28 -0400 (EDT)
Date: Sun, 23 Mar 2025 10:36:27 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@gmail.com>
Subject: Re: [PATCH] rust: sync: optimize rust symbol generation for CondVar
Message-ID: <Z-BGm3zBEGazp5gb@Mac.home>
References: <20250317081351.2503049-1-kunwu.chan@linux.dev>
 <Z9f5fehO186xoNAV@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9f5fehO186xoNAV@google.com>

On Mon, Mar 17, 2025 at 10:29:17AM +0000, Alice Ryhl wrote:
> On Mon, Mar 17, 2025 at 04:13:50PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@hotmail.com>
> > 
> > When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> > with ARCH=arm64, the following symbols are generated:
> > 
> > $nm vmlinux | grep ' _R'.*CondVar | rustfilt
> > ... T <kernel::sync::condvar::CondVar>::notify_all
> > ... T <kernel::sync::condvar::CondVar>::notify_one
> > ... T <kernel::sync::condvar::CondVar>::notify_sync
> > ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> > ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> > ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> > ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> > 
> > These notify* symbols are trivial wrappers around the C functions
> > __wake_up and __wake_up_sync.
> > It doesn't make sense to go through a trivial wrapper for these
> > functions, so mark them inline.
> 
> You don't need to send a new version just for this, but please format
> the paragraphs better in the future. For example:
> 
> The notify* symbols are trivial wrappers around the C functions
> __wake_up and __wake_up_sync. It doesn't make sense to go through a
> trivial wrapper for these functions, so mark them inline.
> 
> > Link: https://github.com/Rust-for-Linux/linux/issues/1145
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> > Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> > Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 

Queued for future tests and reviews, thank you all.

Regards,
Boqun
