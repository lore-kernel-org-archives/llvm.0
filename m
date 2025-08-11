Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50933F6
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906215; cv=none; b=Kwx9A1tAZOMiq/mTjuGrD0g+DW8D0UjeVwPULD8kT54RnrQZpHjovhB66dOVYCHAqrH2xAO74oCsO4MWpAohodiPh+vlB0hURtZS0SOqfSnSzJHHBXglUKLvo+4nvjOXMWtPfVf0V/smRPttdlr7s/QZgsAQPu9KA2Xp6eT/1Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906215; c=relaxed/simple;
	bh=oFgFdsAMTf/qCY/7xWsxSAnmK9+zLrC/nC52m7Do2DE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VjWNO9Z77nS0R5R5iUOUT/aiOEK5z1WJOb4ZzdG9qALDrQT21Kzuq3x2aALbJpIHdS5PRpNQ4xkMnM4PmyszQvPvTTn6EosS3VnkIHHniCuAz30bqmS6MH7hJzirsFslHLnNGQo62BPS47CftyBPo7jv+0nJlYOy64Bn5qNzunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2DtXwxS; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2DtXwxS"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b7886bfc16so2730421f8f.1
        for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754906212; x=1755511012; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl1+NNQeO4OdoNvXCOAgTlcv+G1b3QMdpUJ6J7g2VAM=;
        b=H2DtXwxSb918Hf5MoXOJ95/kIvA81NMRXg+kmUKtFVPByEvPjvLtVP5Z2d22EN/6Ux
         AidEVH+JAEzol96LiB0yjiDaSpgLWZEYRpbQ6T3/ycLngh16/L9PvHZhsLsA7c9ACkTd
         DBw2xJmvU1bch+SzHgCY8Csk285DfyL1DCqAN5xxdl4bEFxyA3M1TFa4U2PswXa0f7DK
         H7OfcJC+mWxKw2byqmz4D0LwNuzRBvXlt0y0kcSfiFcHPrlgE2KSIS8tyLy1/2VFm41k
         ZhXoB7QdrQqS5nXkVrfTs24ZdRZK51SlDoipla0Z0UaRIgCFcmB2qLljnaetq0oAidpa
         uPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906212; x=1755511012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl1+NNQeO4OdoNvXCOAgTlcv+G1b3QMdpUJ6J7g2VAM=;
        b=bwddxrCKXprvJi9e/2u8jy67bqnAwcxwAlgTTAf2p2vtJo9GUDtfB1dIbMHTBWc9JI
         tn9XTCyIudfdIxhc1h13iKJaH45rtEBH7hKQTVRuk8GkMoPS4QEkjgX2YhbkojOjE42+
         f4vMVT3N75MJh+TXEffnLYLquhvaDY1KxC48YCVBoYI9ropvR/nVo5u4aYCx07iFUGSi
         JgkzQDV1mfiLvAvn7UAXadURm9PLJWJmT/2l8GSfs7lD2FaYjBdHzIWnDN548OGMAf8n
         RQRdbiopCKfhzhAHsiIia6tmjrNh2fLdOEYZtkyfizMf2foDh5w7iM4B10kvr6ktiP5s
         x3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc8fv5d0kXHGmlzaRHcpRQzoZBbknaK4EanOe0aqcks43xN5yqgtJ1FbrfA33jXAQoLi8P@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvl1LPDFEAVb3qyCx1Nt7eKm0shX4mdwtfkOUUHA/VuA9mnZXH
	Dv8w0BJSP41bKnaTsrdQH9nVINsohmZrJmsnqXeLWpoKK1BisJStAFHU57oEvx79zQqL1Fh48h0
	jzcDXUTp8fZxihMmRvA==
X-Google-Smtp-Source: AGHT+IHRBVCM/fJteETaWAs/3isleNIYRq7dqVvVCDKq4GdPu37Nrdb9yhp68WF7Uhd2xtOfaLaHAqeHeno8MUo=
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:3b3:a665:e00e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2083:b0:3b7:9a01:e52f with SMTP id ffacd0b85a97d-3b900b786f1mr8987086f8f.44.1754906211937;
 Mon, 11 Aug 2025 02:56:51 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:56:51 +0000
In-Reply-To: <20250811012000.444173-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250811012000.444173-1-ritvikfoss@gmail.com>
Message-ID: <aJm-Y6oMiWGB5yCQ@google.com>
Subject: Re: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
From: Alice Ryhl <aliceryhl@google.com>
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
