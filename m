Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BDC1EE7C4
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741862852; cv=none; b=carkPZIsaAkUdN7YsXsK7+GUeM4i4gTw6oOAYwK3n8n4d9xpuFUOEw1N+tak7bt9TWfeqJU6ZXCkqh5yRtYR2wx25dM/tlKiTi7UERXiJP7dZFY/XjYCK6N3DIF069TqscAdkYYHdFXB8Y42ypK/w+WyGP7YLbmdRFWa0pKbnNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741862852; c=relaxed/simple;
	bh=LP5eXeugNTen1bBkv90xRuq2BmM2qnVG2bEcP7+53GM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dnKzxCR5vAlKBH3lR3HHAgB2aBzWJT6j3erU0RqHKDkb5U/ESO0TaP1vVyVRWYuYIdmNUeWPKNsNKKMNxkC2VHMYstsXOpr+IiNypHYfs6mmmwRpQZf4t20xKg3KQuRLn4k1ro+Mqc2EiHmRfAb9DvsEj9bwuXfSPlDShcZshm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yMzbFued; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yMzbFued"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so6003385e9.2
        for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741862848; x=1742467648; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ9g0Gaavw77PwDpx2+pgwcbpRIgEDZUZKLzgDfdqpQ=;
        b=yMzbFuedB2VPF+G5ZsRic9SDbKHVoOAuVOxYrsIrWYqiAqrfjTVtmfT2wlnFd67eIm
         RE4PfOqI2P62BrXkKgX++VCwSdVVhsW0YvIg+Ewt6P7ixvgrtrXh2VslXT6QO6bR6Z2K
         b95WlwlnV3WTMKnDQ/3+UdnlSShyNNzBBV7uYRmu4MEIq3KlFJSOqknZILF5fPh1FvLM
         dRtBy0ohz910jw+GjYoQdZtwDYXHEvwJhiYTLfUFOsnVYA/kGeqbNn4OmVDHyFOt9zPd
         /zppNOVczES8lArpG4NGbE1OLOUiHWOV7cLasHAnHgX3+NxOypu0lVdD7Vy/qrEw3P2H
         pqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741862848; x=1742467648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ9g0Gaavw77PwDpx2+pgwcbpRIgEDZUZKLzgDfdqpQ=;
        b=Jna6Wyg+0Nxo0uYvWX+FJE09h3ZFDHgBDOvyVePCprVV37s7G/jq6HzJQ6q8bto4fj
         BRcdn18KZq5PunVmBE7Hrt2HGeSq6ZBRh4k32W3auKMrYIX3IesSWB7mBKxMQGBUp7JR
         Fhyu5k9GM8JzF86h0GZYgHHlV5AVjAalSRRtmWsusY+hRe2rY9nyAS0Bf+lUvoG8o5Ds
         nJzFndwQ0OVUb2dBVLYuF1l/O2vsitOEUz2qziMUqefwPggdxdB6ATSac1+ymsQGol7a
         y/g29W4SuCRqsxH8F6grdeKjmXIk9jIOU6ljUrqy3MjBAa2smB6nDKSA+pqXF1b8R0RL
         Eldg==
X-Forwarded-Encrypted: i=1; AJvYcCWH7zeBQpy0gUvZcgVRopSXMQb6PHTtFYAhtRRjKvXxk415t9Fz/9ocUwa45kZi4tfNcJhV@lists.linux.dev
X-Gm-Message-State: AOJu0YzCnGeK6H6neRLudfZ2sq+dgHauY67ZPho+q2rZjdz7Hm/COIOa
	tQ30zJVW0PdlQ7r7xg6teW8kgWaFQ5zhX1TOEymOaek5Zmhoe2i4B+Tk5wAZfSnm6L6jTgQS/+t
	xYkeuxRMpQfJc2w==
X-Google-Smtp-Source: AGHT+IFnP3JhBHMfVAgiBjDgec8Dj8Ys+oEmuI/lcu/U/vWhF0K6dANq8oFHYUxugoP1r6AAO5LgIu0hY38u4Vs=
X-Received: from wmbbh12.prod.google.com ([2002:a05:600c:3d0c:b0:43c:e9df:2ecd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b95:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43cec97779fmr192265835e9.11.1741862848323;
 Thu, 13 Mar 2025 03:47:28 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:47:26 +0000
In-Reply-To: <20250313084525.773620-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250313084525.773620-1-kunwu.chan@linux.dev>
Message-ID: <Z9K3vokYu5osMCwh@google.com>
Subject: Re: [PATCH] rust: file: optimize rust symbol generation for FileDescriptorReservation
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

On Thu, Mar 13, 2025 at 04:45:25PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*FileDescriptorReservation | rustfilt
> ffff8000805b6ef0 T <kernel::fs::file::FileDescriptorReservation>
> 						::fd_install
> ffff8000805b6e60 T <kernel::fs::file::FileDescriptorReservation>
> 						::get_unused_fd_flags
> ffff8000805b6f08 T <kernel::fs::file::FileDescriptorReservation
> 					 as core::ops::drop::Drop>::drop
> 
> These Rust symbols are trivial wrappers around the C functions
> fd_install, put_unused_fd and put_task_struct.It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> After doing so, the above symbol will not in output.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>

A few notes:

* Your own Signed-off-by must always be last.
* You're missing Link: and Suggested-by: tags.
* There are some grammar issues, e.g. a missing space before "It" and
  the phrase "will not in output" is not good.
* Let's also add the marker to `reserved_fd` to be on the safe side.
* I think it is easier to read the symbols if you list each sybmol on
  one line like this:

ffff8000805b6ef0 T <kernel::fs::file::FileDescriptorReservation>::fd_install
ffff8000805b6e60 T <kernel::fs::file::FileDescriptorReservation>::get_unused_fd_flags
ffff8000805b6f08 T <kernel::fs::file::FileDescriptorReservation as core::ops::drop::Drop>::drop

Alice
