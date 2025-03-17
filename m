Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A2523BD0B
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207061; cv=none; b=MepEwbKWnjECTEHcrpLkM7eSNY1mS7IbXpnmjI9dl6NFvjofTnfByiEBYyIAKr53VEgzGzqZMTPmkoveD/3fGdX0K8TQTYRwvPFk71jcmtYsVkEaA3pJeqOVW5I4i0fc1dOHB0XZhcbdky86XuBuyEQNqd4WdydkVyZ8xCTQci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207061; c=relaxed/simple;
	bh=T0XmXTPHuSifmlk1GQv7S8pl94t1Wv6LlKDhlqctDvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gQ+hAOyA9Pnr7NwHuUkc92v9jX0EOHaD9+/Q9l3+TEmvBCzYsmJl1/FbWLRIVTe62SVrAuoClxPhUuyjrtJWDyB67JW2HUqDG6NFYCL99qXFBQZ2vojeLDX+Ie6wdf3hLNKVsXellX5NEzYgbFgpeXV1qZlIhrx76xS6SPkKXok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wTYbtgKN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wTYbtgKN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so15163145e9.2
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 03:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742207058; x=1742811858; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8K4Jrr2cHn05wONB/FH2XsdIcr9ioXUuaymWvPlQBPA=;
        b=wTYbtgKNDIh2mggNThF5yQmkyYkSEJ8XBENm5msBcLDV7QJauB4lVnTEO+O1VjB9rd
         6h/Bxs8AQKaD9ys48FY8OntamD9W57njYuN97YXZrCLIk7AL+v/Nl12wRzlsDCK4qik1
         jDnEX2l3de5JcEUm9/7bqNK/0S37JZH8WPGriHp+0PfFpghvqVkspFrW/Rsz+6Cl1sRp
         djxAanyMfsyRbtOCard4xmgBU3ALpfY1Z4lWHrDcvyUNKV+XUju2CofIal6mzUeiB4Hk
         LV97cuvMzYmVaXTC2Ftn5MbHg1FOrM+vYzrXEzotPJNMX6S2gHDeBXOYX4ws0vQC3szH
         9hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207058; x=1742811858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8K4Jrr2cHn05wONB/FH2XsdIcr9ioXUuaymWvPlQBPA=;
        b=Eh7sEGQeJP8I2uFpWpUBdDkg1odpv1zs2pqNUXqHvkPGzu5sm/H8SIabAhEtm1MUxD
         clVpxvEmQSu0cDIpTL9Ruv8Jz7qivh7OQAytoB14LWMOhchdIyFTO6xmc1B1OysQ/AVQ
         51kfNmHe73TX6I8pg6+5UvPUEJbJugNBMUShiXFUzybTuicLhO1xd8HqZlXA31em+3M3
         BaFCF4RFW9LmMp6EUI03jVOseXvOH4SYcM1q164OBwhLcJE3OB3fQRH8arSMZyu3zaqI
         ntJ1+delzK3hfgKCBHH+G+M0bYHdohY2J41hdZKYHSzyOkXasf5c/+VQAZ4PCJkGMbKW
         2ZiA==
X-Forwarded-Encrypted: i=1; AJvYcCW0JUVuyT7S7ArVcog0vLYHdR7+tIzvpAz58A3dcBDArXmykU+0guvr69Via3/gCJeyvVYa@lists.linux.dev
X-Gm-Message-State: AOJu0YxFcxjA9qlxfpHSGSNyaCd4Iw3mw16s00mS0r/Q4dMR8HxOiezz
	oOIwGuQ4VEqOiLGaqCPBWC3VPmX+/sKGBqL8GMtYjIOtTxL20qgjXJYOF31FxtKE9s7mOlzIoPt
	5pKQpl38SdbNtKw==
X-Google-Smtp-Source: AGHT+IGHM9Im2dqX3gfz0NV8cc0x3CfI4wJk+09faVb93t75tZtSx537hGUim5yDjXgoSpEfdSGA14kssfoPG70=
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43b:c450:ea70])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0a:b0:43c:f969:13c2 with SMTP id 5b1f17b1804b1-43d1ece13a4mr114040775e9.28.1742207058149;
 Mon, 17 Mar 2025 03:24:18 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:24:15 +0000
In-Reply-To: <20250317023702.2360726-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250317023702.2360726-1-kunwu.chan@linux.dev>
Message-ID: <Z9f4Twvl-UaX1NQp@google.com>
Subject: Re: [PATCH v2] rust: file: optimize rust symbol generation for FileDescriptorReservation
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>, Christian Brauner <brauner@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

Adding Christian Brauner who originally merged the
rust/kernel/fs/file.rs file.

On Mon, Mar 17, 2025 at 10:37:02AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*FileDescriptorReservation | rustfilt
> ... T <kernel::fs::file::FileDescriptorReservation>::fd_install
> ... T <kernel::fs::file::FileDescriptorReservation>::get_unused_fd_flags
> ... T <kernel::fs::file::FileDescriptorReservation as core::ops::drop::Drop>::drop
> 
> These Rust symbols are trivial wrappers around the C functions
> fd_install, put_unused_fd and put_task_struct. It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
