Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE3C2594
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 01:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754875482; cv=none; b=B0kmUj5mm1WkJZFwbXFxABkCPBZteBCQslFfUoM6QUnoX1mmTznnw5QSuOSw7Goq75cpxQnYq3D5e+Uxxnz/mC5ZaSLdrCitvoYmC9QLrAXkjrKqSLT0VArMUTQ+IkyTVoZLQP79y1f/5spFa8EAv9FhGmqlbXSaP+gw5MBjlK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754875482; c=relaxed/simple;
	bh=WtJuf/zMFqqZZzz+K4qh4sniOy2RRzXQmyzrX7GYhOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXwlqaHOtRRgTpiI8nEMtxv/kXVChtTs/HeMXLiz7LLSgg0LxeTlzN8sQzQbhNSxvZSkq6TXe9hPV0RnhYFStu6d5sRewvtETPDlOLY+S1apx3SeRPt0gPuD+SS40Jv7gVeIgvAIasFnXQ8qrBpD1gQhu0s4ZbrKAKQ21vQHH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQtKZ0B7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQtKZ0B7"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7074bad055eso23763446d6.3
        for <llvm@lists.linux.dev>; Sun, 10 Aug 2025 18:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754875480; x=1755480280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA3TMw5sp4v1L/ktOGoFRCSG11wCWiMXJf64flXffa4=;
        b=cQtKZ0B7q0h7f8rmfO/7LY2WiPPxDuNb66UhSap8E4Fz9UiEJOxgjUn7JDqJDf1UzT
         +rP5MxjhFvNKxe2B8DcUMNCWUzNftDWu1kLjmpfhxq6Isl/xIltAmGSknrX9ppUw2/lg
         p2JNhUmxRC1Lb/VQd/3z9VDpn8fjadv2u8eUC2wnzMFt6qcBlubOiJ5esM/7o8Ranlcp
         /L9x1zQfnv8nFvyd7SEte037o3oo69TGuEgEyVnmKILRj9ZxVMRGyT8QC9EUVY0sFRgJ
         GxlLpo1VxccrwTOBe08ysRzDeYEWW14La/TFwGCcMXg7YnjDwtU2hU2DatrBjboVfJvP
         4Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754875480; x=1755480280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA3TMw5sp4v1L/ktOGoFRCSG11wCWiMXJf64flXffa4=;
        b=b5nfH13Uis7vBRiYEfNHyiBkDsSNGUc2Mkp/VUCfv0+e0vV1cdPyN2iCVPenZyfAz3
         TDDpVsZceubdnYOgVau+eT8N5iG3i9/59JAdZHNjuRDaeV6ebOGm5fq78mgJdTzDvQty
         //uSpWTKeP/VubJRde810yn9vZ//Ym26s9dELaiu9f0EfLA0CJ1C0xQ+IngTfxM1K3gA
         IXuqshIP/S3hEUBIrtRKgxv5KP7TgQVmuc4Jl/m5ywARadMLm3/I8bdBUqIQfwaAYRy0
         zHKtKILKERDg6LAsFSaPsF3gNLkuFngBAlrVJsIUZ6nf4eT7oQ9lv2Y1Te8FxA+cSC3c
         U3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOwVB9e3ERQbwA/NorSiwlX6UUc4+uU6xVqmDKgZ1OFZX89xrLoEszBeA3U8MArmF8v42s@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+uJd77WDChlcfwoWlAU8+dDydUvyYYYV9J8dOyes98JO7PW3u
	w0V8Ctpaw3a8knTQVRF9H0B5wMmjakNnzHBpx3xbwFsA1ZgSr1txb+1l0o3DbQ==
X-Gm-Gg: ASbGncvDqZVVAr8EwcoiEt8sbbpYrv5QDJiG3rsMUTn0WNwo3EQ6R5vuL3Yt+rdxc16
	+Ftnbg+JIURvbGODakeGqbNUEfki52rZ6NQgQr3QhkT6ffE+ilDS+FEk42IoJYtzDW0aw4oaoMb
	+f1q9iGSXHWENW3vYiiCEizzkahAVvvoecZDiB7lOuR9z8JooSTHTnO5o3x1aLmuwMJvkt7++hu
	hZbOB6TDAxNg9kwie6x+EzchtqTB3YM3VtjaVCmhaiAXtbIksupyhDvv4iapKifpH5sJg+nF7Xg
	fsJ4PNmOVNGYeWz5U3ipTp4oU5jCbCNc4RkJarKS4JLTKKCewgko4diF+FUHRQAKiYSCwkyYbw3
	pzWInwzlZUgN/ojVbOUUot8GC6GzZcRf3iOXOTBJRadb38uvVoWKsg/8YZ+4wTodB0XUANhlIJ7
	Tf26xs0ZkVOs7RsmZESYP+UKx6zyoos4tZhg==
X-Google-Smtp-Source: AGHT+IHLTGqZsJZ6sW5t4IoHAGpadkfnmoEdge4NW0DcDiLplipYaqU7kjzQt0oSY3FeTScoG7qH5g==
X-Received: by 2002:a05:6214:21ef:b0:709:205a:d90c with SMTP id 6a1803df08f44-7099a27ee53mr164596796d6.3.1754875480141;
        Sun, 10 Aug 2025 18:24:40 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7097e906c3csm68183516d6.65.2025.08.10.18.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 18:24:39 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11118F40066;
	Sun, 10 Aug 2025 21:24:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 10 Aug 2025 21:24:39 -0400
X-ME-Sender: <xms:VkaZaP4hRE5GxA1LCyiN7an7_5Wrh7JkWVPgl8Wv5EUhBrUksmUtgg>
    <xme:VkaZaLXOfi1zu1XKZXWOtxUvg4jTp-4Rtu_yr4VAMk4wbx8kol9z78Lm6Z-c8C0N7
    YGEMvjfFL8sZ5yttw>
X-ME-Received: <xmr:VkaZaD9Vn5sO-QxWpcVZjbqM8aKzQvhcxRJ5WWkU-dZFmYAQUtZlxzK8ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeduudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefhhffgudfgfeeggfeftdeigeeh
    vdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhithhvihhkfhhoshhsse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggv
    pdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhho
    rhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
    dprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinh
    gusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:VkaZaIjzOyAwiG3tTyGVt0pYqosrTjK-0YEJb1Aqv7lviLa-09pWlQ>
    <xmx:VkaZaCWShKUwvRNUhRx0O2TC3_LeKQIbG6c2Ul75GIy8qFr0ciPuaQ>
    <xmx:VkaZaEt8CgBI79C4U0AMRKPDr8VjrtHGkMA-GjVQ9SoeKobF5yXBaw>
    <xmx:VkaZaL_1AbpyBTQIW1uNicSsKw3YMKJAEQDQ4vd-CBMt-5c5T23n5g>
    <xmx:V0aZaMvZ2GnG_IF2gfMwW1LiWmbKbnN7RJM0Mo68hLhfUgIc4LZkRjax>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Aug 2025 21:24:38 -0400 (EDT)
Date: Sun, 10 Aug 2025 18:24:37 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
Message-ID: <aJlGVfdwVXp6Cmcw@Mac.home>
References: <20250811012000.444173-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811012000.444173-1-ritvikfoss@gmail.com>

On Mon, Aug 11, 2025 at 06:49:58AM +0530, Ritvik Gupta wrote:
> When building the kernel using llvm-20.1.7-rust-1.89.0-x86_64,
> this symbol is generated:
> 
> $ llvm-nm --demangle vmlinux | grep CpuId
> ffffffff84c77450 T <kernel::cpu::CpuId>::current
> 
> However, this Rust symbol is a trivial wrapper around
> `raw_smp_processor_id` function. It doesn't make sense
> to go through a trivial wrapper for such functions,
> so mark it inline.
> 
> After applying this patch, the above command will produce no output.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/kernel/cpu.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
> index 5de730c8d817..cb6c0338ef5a 100644
> --- a/rust/kernel/cpu.rs
> +++ b/rust/kernel/cpu.rs
> @@ -109,6 +109,7 @@ pub fn as_u32(&self) -> u32 {
>      /// unexpectedly due to preemption or CPU migration. It should only be
>      /// used when the context ensures that the task remains on the same CPU
>      /// or the users could use a stale (yet valid) CPU ID.
> +    #[inline]
>      pub fn current() -> Self {
>          // SAFETY: raw_smp_processor_id() always returns a valid CPU ID.
>          unsafe { Self::from_u32_unchecked(bindings::raw_smp_processor_id()) }
> 
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> -- 
> 2.50.1
> 
