Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AD277037
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782450; cv=none; b=KRlfDNfpcWgbr6S32jfc/FWUXRS2JCr/6yBOCxO6S/JQpHrKQjE9PQymtC6eq5i5Iow+E7cfksUqRsEhcNocDbOmTxxOfj+D0TLUcN+UEyR0GjZ+rTZxD/LBxwGs8/bvRiocwoivDAiEXtEOIjtiBV3yZ4N7Rvexl6Msr90RmX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782450; c=relaxed/simple;
	bh=92OJhgzUjFkOtbE9HWjk9mos4q0J9p13l5+gly9O6B4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DGx1zPtRRxbtFOqPXy61wuIYJu2/XAj7/wrB5RQviSzSnz0/61Tx2yV0ckV8kwSAdenqLuZHmALvc4dMSckBPwB3uLr+7V7sZ/r5Xjdz59Z9NaQ4jSZOXQ6yiX1krR7i/VxAoIwXHFksm1OhowiCRmsq2JUEJr4IeOvNVHIqCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lEnVrqcq; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lEnVrqcq"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43f405810b4so9566795e9.1
        for <llvm@lists.linux.dev>; Fri, 09 May 2025 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746782445; x=1747387245; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xse/MuumvZWNGL7RhYB2Lqx5Phv6lYmDCP0vNNVPW4s=;
        b=lEnVrqcqkL1+EkRQTRkH+ANQBy8GseA6Wd90VFcHYzUuObmPXnsT10pxYcx9QNZ7QZ
         E1C2C5DbkrZN2gnrGUwEQ1L9VRnwGKoXcLu3Z1EPxKmwRoRkLbqZROzGuK7L9i+JDmiL
         5LrVCUz/X4vS3RkwPvjv9vXI3JaPzEG8IByKynQc3tRPBbioVPKrKrbxzIPcQUaw92tl
         eP8GDhYdaE9/cI5U2fNB31H0xkHG7I3AqTF1spFWeva6jNFI/fQ+uWZgL4QxnIVMDcLN
         sBmMKdp2G8AnW9gZVAVEEdvO0Tidk92jNSBoJ9rxqt0e1+wKBIbCHB/PdKdl3+zWvLxl
         XzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782445; x=1747387245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xse/MuumvZWNGL7RhYB2Lqx5Phv6lYmDCP0vNNVPW4s=;
        b=f2ZHpfPOEcKFbRSzm+7CmxEdpGqskl7tbTVBbu9EkSia//MCL68UybA8P6efMGHY5Z
         XZP/2xQ/zlo7xsin2YVzKFiY3Ot3vCCSl5Q6x/Aor2yhgAkimQAGfwgW/n6BpHbosctj
         ecaZhhR6/pydYOTKY4Yi9+Yw6aKaun4mHkkbBEVcUhvbBLs2XzfTwKZTamQHL3VekG7w
         4hnPxfuu6m2etPZvfcHsmV9+Z+6B9sC4HN9+OJAEzZhhohGvHpQLJnfiBsBMLG3VEQ+t
         ucFcRRh+bcOWJ6J+2J+WWoiwhU/HNPEJn86j0tsJ6vMqF6+fztJlIRqjNjt917DR1eU5
         1TgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8k4TZ87iqfwDBI8XROUGaHblkh9Y20NVHK0kpKYDSfWnGW1VfaWQAXIj+l/HQAlRRqvLZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyT5uFNfLFIKvi6ec7OhDjv+FM4fl+NaV+5y2Wb3iT8NzjDh+qR
	7558cuZjdOX9oYN4ioLkyKmtT8avF8wwRKsQbt4l/XYSgyW5a/rX/QfDIzatcKHBetz8UuEpwES
	O2tcVIPXuvpytVw==
X-Google-Smtp-Source: AGHT+IEfB4RX5z3hIuO5Du+V62ZdH6yKf3Q/8br7x4OG7oxYICZrWu8v/yGtMoMSgvs+ViJU/R9zsW+6x08prmc=
X-Received: from wmbfk10.prod.google.com ([2002:a05:600c:cca:b0:440:5d4e:87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6612:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-442d6d448c9mr18690195e9.8.1746782445453;
 Fri, 09 May 2025 02:20:45 -0700 (PDT)
Date: Fri, 9 May 2025 09:20:43 +0000
In-Reply-To: <aB2aAEELa3253nBh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250506045843.51258-1-boqun.feng@gmail.com> <20250506045843.51258-5-boqun.feng@gmail.com>
 <aB2aAEELa3253nBh@gmail.com>
Message-ID: <aB3I62o8hWSULGBm@google.com>
Subject: Re: [PATCH 4/5] sched/core: Add __might_sleep_precision()
From: Alice Ryhl <aliceryhl@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Tamir Duberstein <tamird@gmail.com>, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Mitchell Levy <levymitchell0@gmail.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Borys Tyran <borys.tyran@protonmail.com>, Christian Brauner <brauner@kernel.org>, 
	Panagiotis Foliadis <pfoliadis@posteo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"

On Fri, May 09, 2025 at 08:00:32AM +0200, Ingo Molnar wrote:
> 
> * Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > 
> > Add __might_sleep_precision(), Rust friendly version of
> > __might_sleep(), which takes a pointer to a string with the length
> > instead of a null-terminated string.
> > 
> > Rust's core::panic::Location::file(), which gives the file name of a
> > caller, doesn't provide a null-terminated
> > string. __might_sleep_precision() uses a precision specifier in the
> > printk format, which specifies the length of a string; a string
> > doesn't need to be a null-terminated.
> > 
> > Modify __might_sleep() to call __might_sleep_precision() but the
> > impact should be negligible. When printing the error (sleeping
> > function called from invalid context), the precision string format is
> > used instead of the simple string format; the precision specifies the
> > the maximum length of the displayed string.
> > 
> > Note that Location::file() providing a null-terminated string for
> > better C interoperability is under discussion [1].
> > 
> > [1]: https://github.com/rust-lang/libs-team/issues/466
> > 
> > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
> > ---
> >  include/linux/kernel.h |  2 ++
> >  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
> >  2 files changed, 43 insertions(+), 21 deletions(-)
> > 
> > diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> > index be2e8c0a187e..086ee1dc447e 100644
> > --- a/include/linux/kernel.h
> > +++ b/include/linux/kernel.h
> > @@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
> >  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> >  extern void __might_resched(const char *file, int line, unsigned int offsets);
> >  extern void __might_sleep(const char *file, int line);
> > +extern void __might_sleep_precision(const char *file, int len, int line);
> 
> Ugh.
> 
> Firstly, '_precision' is really ambiguous in this context and suggests 
> 'precise sleep' or something like that, which this is not about at all. 
> So the naming here is all sorts of bad already.
> 
> But more importantly, this is really a Rust problem. Does Rust really 
> have no NUL-terminated strings? It should hide them in shame and 
> construct proper, robust strings, instead of spreading this disease to 
> the rest of the kernel, IMHO ...

Rust does have NUL-terminated strings, but they aren't the default. In
most circumstances, obtaining a NUL-terminated string is possible, but
we can't do it in this particular case.

Specifically, it's because we're relying on the #[track_caller] language
feature. When this annotation is placed on a function, it implicitly
adds an extra hidden argument to the function signature containing a
pointer to a location struct that holds the file, line, and column of
the caller. This works recursively until it hits a function without the
annotation, so code like this:

#[track_caller]
fn schedule() {
     might_sleep();
     // Call into C implementation of schedule.
     unsafe { bindings::schedule() };
}

would report a line number in the *caller* of schedule() rather than
just reporting the line number inside the schedule() function.

The problem is that the location struct is generated by the compiler,
and we don't have any control over how its generated. Unfortunately, the
compiler does not place a NUL terminator in the file name.

> Rust is supposed to be about increased security, right? How does extra, 
> nonsensical complexity for simple concepts such as strings achieve 
> that? If the Rust runtime wants to hook into debug facilities of the 
> Linux kernel then I have bad news: almost all strings used by kernel 
> debugging facilities are NUL-terminated.
> 
> So I really don't like this patch. Is there no other way to do this?

I filed a proposal to add a NUL-terminator to the file names used by
rustc-generated location structs:

https://github.com/rust-lang/libs-team/issues/466

But I have not had success with landing it, unfortunately.

Alice
