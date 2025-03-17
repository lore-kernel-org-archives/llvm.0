Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4538B
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207363; cv=none; b=dZF9sT2C/sjzVNsI0EWNe02AtL0EfeuS1uZ2FIkypKT/zdSKZmoHvTEBd2YpFsAxBkM9JYPrS8h26SmIp8WTAJZr9iIkAUHnitEMuJZFmB1hoEoAHGi2fBij1d8O75gnoVcmuFvO0MIR7Qbq35qbvYYVfz7rBRrMGKtt+RvsdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207363; c=relaxed/simple;
	bh=BmHlcVeyDTGath6xJ5BkH3jTeyFsKHcpnCcAQlKKzB0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=euPj7rGATezTs/sQFMatmvq2i6KjRhMwc/riOgsebMrzM025pJBZf0/enXagWKC6sYB9/vXgkbmSHdzPQfnU8Q5Ng0CWfhtUepUFsXmsZxoIvuzhBYBPH/1V8WMBybrmLjp4ex9Ho9tNk+YM0ESqPUdLOzVmXGLkCladMdXhl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tk3F8tAP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tk3F8tAP"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso22006915e9.2
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742207360; x=1742812160; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZNMaIMiKoZDo5cQ6GyfS8+tsfIDXP/+Z/RHe17Imqk=;
        b=Tk3F8tAP9vJBkDpoHXXTWznHp08FuxyioXcK5oGgnMLc5VYinZD0IaOCepyhAKpnGt
         p+kw8SRqMrjdwhmH/h0qC4SN7T2yDi35SQuNIrmn4t/qk+L8CG997BUBjqQn89WXxGOV
         YMOdngqpZWQHIhLLg+yJd9CiSJmRannd0QegdnPprzWvc6ImDwlO42xAIqhacNlDXrv0
         HOY2oYm4fRi0oJ7yUSIaYe23sSvo4I1RpbgZfLK1nSsT3djRo3lI78/hXmR2FIEkNJxz
         L0fRZMN4dO11j04ja2/B5blwb07CfMKznCUKnWX114oGU3O0XUddIeV8pNxsA0zyGN4O
         HLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207360; x=1742812160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZNMaIMiKoZDo5cQ6GyfS8+tsfIDXP/+Z/RHe17Imqk=;
        b=kOwih/4sz9AwQtffV7kYbWeMflX+5uCup3QGRqOecjqlph/+Yupf34OBvrLG/ggq92
         v632qacqEvRMmxdJ8Y/Ymc/mvr7OJBt8mjWmRgm/+zITHEczlRvq97rxKEXQyS1KlQLx
         5lT9KJV/EwJ9g0CUyWtQLRfUhd9+fRieU080iRd6T8eka9b2HRaJAErUIEjWulk2e1uX
         /bik+3xpuMoNj15jjCM7NsYVGoB6zWYUMhn+mKyvI1yWPQhrfz8tY6LZnVqooBdbUwhU
         FZSWyOPVCGL0w+3W5ryaT4xNp3n0ARu71crzgLYgsv/j/7wFgWfTeiMXvg6kna1y7njp
         9Owg==
X-Forwarded-Encrypted: i=1; AJvYcCXsaNexhjwoM6y84ucelgR56BidgfVhBqStkvyLduS4eGZ1UhsgtnFBf0J119V6TZIIV4MH@lists.linux.dev
X-Gm-Message-State: AOJu0YzmfmdJy93YOiP9/kq+CUIuzFGr8UWpmoTNmbW7cHvQbKIgdNYJ
	uT2LNWYd1boU4EIP4/6ThIpTZtyputGpAXUxpMKlG5NTd/fPBv7fW2J9UOPxwgBTvS2O6q+zlpH
	4H45qk8Tddvdseg==
X-Google-Smtp-Source: AGHT+IFN0mg3rfLnL9s+jfrXP1fPxsq6jKqq7a5CxuQ9zdvV/QwOOR7cfyj2a84t+UVdZyooaIvYicO+MWpTJRI=
X-Received: from wmbfs18.prod.google.com ([2002:a05:600c:3f92:b0:43c:e51c:1a5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b84:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43d1ec622c1mr109294525e9.6.1742207359884;
 Mon, 17 Mar 2025 03:29:19 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:29:17 +0000
In-Reply-To: <20250317081351.2503049-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250317081351.2503049-1-kunwu.chan@linux.dev>
Message-ID: <Z9f5fehO186xoNAV@google.com>
Subject: Re: [PATCH] rust: sync: optimize rust symbol generation for CondVar
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

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

You don't need to send a new version just for this, but please format
the paragraphs better in the future. For example:

The notify* symbols are trivial wrappers around the C functions
__wake_up and __wake_up_sync. It doesn't make sense to go through a
trivial wrapper for these functions, so mark them inline.

> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

