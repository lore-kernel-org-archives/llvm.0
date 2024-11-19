Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C3172767
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732005413; cv=none; b=Dm+OngWcKjnuZhwx7SHvJfnRCrHziIKjpwJrrxJ1m5HhwKpBRGRA7+F6dGRenF9o7BXgaKLJsm17SdET9/jVce0NL+RhytgbYH5o2HMpvLnnuFM1yUFL+YpPI5AUPOtZMkev2nnnEzrnJzBTcQoOWXAkwzJzTlSgqcYQsmsCa1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732005413; c=relaxed/simple;
	bh=+MTvleFySir8FtP2uB/UOknrMvhVUid7WSDjacUiN1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPgEdkKJxZft/csYobSD3rBNUvhdaacqMxbgSt35cQGfXL+p3BUMH8DK09A68Qou8HK+KEQzQYM7CQwO0QcZiiCnH9kRl9yjAsOe/Ee8ktEbslJo8R8hUUvjfq//CdHaSEiNQkQpq1rn3kU3bzrFvUmdTeb400JsuaLu+fR0d04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bw3sWGId; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bw3sWGId"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-432d866f70fso5516285e9.2
        for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 00:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732005410; x=1732610210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDqTouV9BVPKs1qxw5HUNjIJ97gDgkRw2ACsRZndJJ0=;
        b=Bw3sWGIdxP1QbfEpAwHmppUTYK+ZhHciRF2RH6jyqQSoEYL60SfqNIk1WajgB8eCm2
         a/yPevKO4uCN6JVH/p566JskHb+scQAgsHWoeZWP5pQpVcaQafaBR4qEoka7mFO7BI1l
         9qSgRNRs1x1F9T6kX2ab7QZ0140RU45s43sE/ApXIRFofMbfbABiFhMgUHFP8na5Bdp4
         kquWDMEbN8mN0z0ypaj0E1m5VEXQAeFkhUIKQArZADI02dpwz9N6gM9Bv5c6gvyheh0I
         saVY9LgHewa87AVJ54+s/NwWiqQg+rHfTm1qx65LeveqdI8aErgCPTDG2kLsQHypb5xW
         U/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732005410; x=1732610210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDqTouV9BVPKs1qxw5HUNjIJ97gDgkRw2ACsRZndJJ0=;
        b=cDxLw4l+uegrzqZJppkEkBJ5h5b+fWyvWJE8veZ/jtWZTk5miWavH7b9wod5C9lIri
         ihW7szUD/bN9VKq4v3F8tfvZUaDSkMfdq7k2Nr7xdX86UnxJcwBkqoPd8Kv5JNukO/J/
         huPWuzxkw9OO16ouQAgjO6GIbiwlM1wioQO+G5cruZqEGP9jgoY9Chbkjg7lg8JfK6uF
         YEsBwcJpqehMqZiJ8YiO65fCzjbBBLT6cs7GHk8GDu4IDFOfEYeE1prsSD+RDkJfRbiO
         81SjCVhysmmV4V6XtKo7F8EI2FdY7aRY868P3XBsZMo0abIqAMZceZ89WQXc0erz4Rk5
         lpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfx4d0AjBn9T/4nvU43laPW413TS5MyD+IyIS+MLKx+2GVG5n3qTEbi8U+57hGCSKLxPmk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ThEGirnDpQQffQha9HKTEjxkTyjRNDxpH/1NwEioDjzMFu6x
	0FA4h8MjpcMA1ttW+GlBRoj6w/CQXmC8zhXy3cWtaQHdSgpv5Pe8/YLudP6IIZbknKSB/UWts+G
	brsaMXL9QaOtSj6vvIF+wlSQFJigs/O+Ksb9O
X-Google-Smtp-Source: AGHT+IFn12obJ8XL6amrk2N2Qj1d2LRmnwgIFMT7b3jmYMIY7gdAA1MtHRCcurUYNkF/oO5FeyBfxH420CYhnypZ3DA=
X-Received: by 2002:a05:600c:444f:b0:42c:b905:2bf9 with SMTP id
 5b1f17b1804b1-432df74eb09mr147079455e9.16.1732005410440; Tue, 19 Nov 2024
 00:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411181440.qEdcuyh6-lkp@intel.com> <20241118202727.73646-1-aliceryhl@google.com>
 <20241118182818.7717993c@gandalf.local.home>
In-Reply-To: <20241118182818.7717993c@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 09:36:38 +0100
Message-ID: <CAH5fLgjBpz7bPvanupPSsJx3fjLAa7g7nMjLgSxjEde_KDGV2w@mail.gmail.com>
Subject: Re: [PATCH RESEND] jump_label: rust: pass a mut ptr to `static_key_count`
To: Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, boqun.feng@gmail.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 12:27=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Mon, 18 Nov 2024 20:27:26 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > When building the rust_print sample with CONFIG_JUMP_LABEL=3Dn, the Rus=
t
> > static key support falls back to using static_key_count. This function
> > accepts a mutable pointer to the `struct static_key`, but the Rust
> > abstractions are incorrectly passing a const pointer.
> >
> > This means that builds using CONFIG_JUMP_LABEL=3Dn and SAMPLE_RUST_PRIN=
T=3Dy
> > fail with the following error message:
> >
> >       error[E0308]: mismatched types
> >         --> <root>/samples/rust/rust_print_main.rs:87:5
> >          |
> >       87 | /     kernel::declare_trace! {
> >       88 | |         /// # Safety
> >       89 | |         ///
> >       90 | |         /// Always safe to call.
> >       91 | |         unsafe fn rust_sample_loaded(magic: c_int);
> >       92 | |     }
> >          | |     ^
> >          | |     |
> >          | |_____types differ in mutability
> >          |       arguments to this function are incorrect
> >          |
> >          =3D note: expected raw pointer `*mut kernel::bindings::static_=
key`
> >                     found raw pointer `*const kernel::bindings::static_=
key`
> >       note: function defined here
> >         --> <root>/rust/bindings/bindings_helpers_generated.rs:33:12
> >          |
> >       33 |     pub fn static_key_count(key: *mut static_key) -> c_int;
> >          |            ^^^^^^^^^^^^^^^^
> >
> > To fix this, insert a pointer cast so that the pointer is mutable.
>
> Hi Alice,
>
> BTW, how do you test the sample tracepoint? I see you add a tracepoint in
> the module load call, but currently we can enable module tracepoints on
> module load. How do you enable it when the rust_print module gets loaded?

I've only really used the sample in this series as a build test. The
bulk of my testing has occurred by using this tracepoint support in
Rust Binder where I have 30 different tracepoints and I've been able
to verify that I can enable them and so on there.

Alice
