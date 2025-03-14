Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7231F09B6
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944607; cv=none; b=l5VJtdtauux5zmXNXWyWYNwfOvo3pg4hnQUVW2YmCHq67FxPskz8vwU2rlOhbxaBuF+07t2fkwc1Zdff3ZVn0caYQAAZM4nxUaAr9RhH9u2Pi7dtaeYOpL1hROGo0fYb3mdkV5bhFrbIhZ/Dw0vyl3O/PaU90m7EWHNcVtjtLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944607; c=relaxed/simple;
	bh=7B240d6j4OExyYUlEP6p1T29DEbvNYI/esoZe1OK7gk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jzSelB3Du4M5yGP1Z4+f4hE98UgAq/XCK40ZDHjtS+Ck2RrrcmVIFNJjDu9/p9vxdZJmJ0vws2/mokoIBFLKhSKxg8t0h8qD+VEdv6XZcwH4V8eWGcVlcLTetBCdiEEt//0OfDGvS2jWxlQbZAt8kOWCVpagKcHLJzBQZg4V3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kyK04OMd; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kyK04OMd"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d08915f61so11351865e9.2
        for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741944604; x=1742549404; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx9uDZ+QhqTeL0tFVgUFI0Mccb4hWoxO0D5VjPF0f/8=;
        b=kyK04OMd7ml+xDVMOJub+QxINiPsrIsrS92wSaJHmO9fOFVnN4fE/Mea4oJxXR5dEl
         zihLlT4t5dW4jWlwTIuawtJnLU/SLjT6Coo3Ka6dxo32FLTJTPG9K7zfX9J38jPnv9B6
         FZbMLKi4MBt9snfU5NhT4hoRqKtqgv/czr3v9BVIHGcxwgEaXtttXpBtw6QspFVG14Mg
         MI9Ndf5jdltkaiM0AEjAxjSmPjuPm1Fl36MY48ICuE1Wo9IAqAX0LUnNX8q593xYGR79
         efFps17c1yMZjKyqcxZISuH56xxuEdNIBJ3rxPtj5y+U27VAs+t8fQ+zENT/ITxjWj+B
         7Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944604; x=1742549404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx9uDZ+QhqTeL0tFVgUFI0Mccb4hWoxO0D5VjPF0f/8=;
        b=uzcbEMeDskSF9uMhhd/Bgf9Id1rZjMTtYj1HkEWnYSSK0klS3noumv30DMNyiPQe/E
         ioAYSkIhg1/Qf1LBm6aWJ+AdX9d6J5MaHCCCLeXi6+yCQgGHz713s8akY/Vu9ywqGGF0
         SsDla6VcObAQdijM/TUJLxsTN64rSj4J8UAtZkk3FkGDPx2ChidVKsmj70znbY+VvFGF
         +agH4SItXJaiUtmsrFJX73OH8XhfhmYgNcO/1fFVIhMvQQl8oFSZTZev0G+/QTxK8gka
         RppY8x7WQgoqj3oVuYvwV1iGedjsnVfVsHir1sO+D9hyZyHtlX00tY3AX91fIA2PcybH
         eMzA==
X-Forwarded-Encrypted: i=1; AJvYcCXno8wUd35d0FUCAUGFwHLrGy+LhqaIQCAHGUBKgsQLQ57OjNkzypc16ri+sdJ1koMoJIDs@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7XlEW6eP/9zp8tg35y8ZVorz/F3NpwMqA3QGHp5ap/py6LC/L
	kHw2LId2xuZB2Mw8R99CJtDiKY2H9h4UX4TQsmzaLk99TxFvF6WFOiwhm13CpFTOixFY12M0RHO
	lGXB/Juwbic1iJA==
X-Google-Smtp-Source: AGHT+IGDsrKK697tTln1RD7AuELwm2Txn2iyfq75zdHGM/J4mNu5ImB/Z+SRHD/kqQ29qRrXLQhTzZpkycOOh54=
X-Received: from wmbay4.prod.google.com ([2002:a05:600c:1e04:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4708:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43d1ec78842mr25457025e9.11.1741944603897;
 Fri, 14 Mar 2025 02:30:03 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:30:01 +0000
In-Reply-To: <20250311-inline-c-wrappers-v2-1-72c99d35ff33@posteo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250311-inline-c-wrappers-v2-1-72c99d35ff33@posteo.net>
Message-ID: <Z9P3GcZ-pstV2Y1p@google.com>
Subject: Re: [PATCH v2] rust: task: mark Task methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 11, 2025 at 03:05:52PM +0000, Panagiotis Foliadis wrote:
> When you build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> toolchain provided by kernel.org, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*Task | rustfilt
> ffffffff817b2d30 T <kernel::task::Task>::get_pid_ns
> ffffffff817b2d50 T <kernel::task::Task>::tgid_nr_ns
> ffffffff817b2c90 T <kernel::task::Task>::current_pid_ns
> ffffffff817b2d00 T <kernel::task::Task>::signal_pending
> ffffffff817b2cc0 T <kernel::task::Task>::uid
> ffffffff817b2ce0 T <kernel::task::Task>::euid
> ffffffff817b2c70 T <kernel::task::Task>::current
> ffffffff817b2d70 T <kernel::task::Task>::wake_up
> ffffffff817b2db0 T <kernel::task::Task as kernel::types::AlwaysRefCounted>::dec_ref
> ffffffff817b2d90 T <kernel::task::Task as kernel::types::AlwaysRefCounted>::inc_ref
> 
> These Rust symbols are trivial wrappers around the C functions
> get_pid_ns, task_tgid_nr_ns, task_active_pid_ns, signal_pending, uid,
> euid, get_current, wake_up, get_task_struct and put_task_struct.It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.

Typo: "put_task_struct.It"

> After applying this patch, the above command will produce no output.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
