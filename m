Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A6211C
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748888194; cv=none; b=RzBcgYAJrxb5GxBEinnTvHzLSqUqBInDW7dtV6gY4Uy/unLltLlUnMfah0M8Y+by5fPSmy1PZotm+X7u/+e4zDx0ty3iqEeNNkqyWXjgB73AnOP5cWOXRgKbCYoDDLmpJmaTXxh8jyGxaT3fgeOH8Ecx3SduZGA6MinWqniEAsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748888194; c=relaxed/simple;
	bh=zNWAUbcKyJBk0kKrgV3xuUBKPT3li2490MVoXiEBg8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkhaW+ugXpbwX9y53cF0KzgR7IA5oFavDRWvUmy9zHlQh4AEZuu32MhlUQOy4wq0+pima0VYLojpa9U5a0cePhwtje6VOgWUJzA5oka1u1dThBLUaVI6xrxdHahx7Ks4zRttkX4kQ4veSFsB9WUPZ1JeEHmGLcSaK2poNTEvwgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIfUQZ1c; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIfUQZ1c"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so31193456d6.2
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748888192; x=1749492992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRlNBEAau2uoDFvTup1FiFXZP9+zaPSqdDKtHcYY0H8=;
        b=dIfUQZ1cHGNyq9dddkYuGaRkdC1XD0oBlG8y/W4xkhWYsPmZ249+OFP77nqtvMwzoT
         kPBlJvk5K6DMdWU7514AjTPXuOuk+F/YyssGN2TUYlbTgPO6yul1oi5z6U5fEZXEpK0m
         OG5MI0jAy52EJBS2mVqu8W2JzJvbUeLQcHd+7+e6/yqHGdRUrlwxffjozSi1ylGQMuuP
         yV4+GT3iY3PETprTjREnY9SdsKf7HuLRG6ypo3IAYlzeIZsnhVyxP4cIWuCLK9hGOEVe
         kZoLtwB6Xcp3YicJ+g8i/vGZqBvpmg6reSl5dYEzpbri5CMmcMVtvegRed4eAZcAE81a
         OQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748888192; x=1749492992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRlNBEAau2uoDFvTup1FiFXZP9+zaPSqdDKtHcYY0H8=;
        b=X9SiMHj9bIiWxLc1p64UIH/RlU/UtgSfogpbMSQCpqj9i6blDH92DiLVVFnNY6kBLU
         3V2EXP08zPSVby9cjzmaNsSM5DIwhSOFW8qQnJa/WbcOU6fT20wF3+pe9DaBK7RVlBJ8
         juIx/kyYwEgC2MoHBSoyWLdcihGUEJMuqJuJT2bAnf8sfJ2DJp5z04A6OrSYRvJwbpNi
         g4xkjVnc0Aiwvf0VtwSBctuhVeaqE0XmpTA5E/koMG72L0xJMApRWCpEFU61uJUgtSlL
         5RDhkb0ZxE84+mR/bglvBJsUdTSCBZl/a5GuUkQbRXd6g8WXxDdbItGeA+iTiwnpEk9+
         FyXg==
X-Forwarded-Encrypted: i=1; AJvYcCUSyzfp9rAiCahzpoLbLFC4K1s4+d4UE8ptUIoWl6Bov2PRGAMFIIWer6JeJVgVtgNHIufE@lists.linux.dev
X-Gm-Message-State: AOJu0YzG/KEJoz6icJPegrKavjMl8jmoiEkX4DD5kLOXyJ3FE6ctCDUP
	3osML8zKtiARlEnDU2lhoRyoCWsc1z3o4M8DFr8hrVaQwFqKbuMJ4UU8BLwXzQ==
X-Gm-Gg: ASbGnctbkuCJ1Z3tull0tw6f2T7whmDZ9ftzV9Fwvm9tSN06X4HnzHFN7VGbxHsC81a
	TsPtCQ8XFCVrdV6eekHHwMG0q2zMLsWQVIoLfkV4DVSP4VmdmInQwu1b6nJl1egtNRyGM+owSq9
	dRJbfsOEe9ZJo+OhWon0T35QwMrUqxees3p9ziHRAJ+xYRwvsUilyPA2+cshdogr+kvy01H8BWK
	n7aGvK0kH8p6u/n2GwtZkI9iWmrE1smUAwryKD6xGQLGhalo7SimTCiIG1E5lH6mRbeixHo7Uuz
	pULwK9be+od23tCwHVS8cU+tAXSEwq51k1syBgMnuToeCsJcvJ1RvQW76Hj52Bhi0K5rRm4K+Fe
	Yq4KM3j+qS4hcxS0M2K90APudtjDnjVtlHVzsPiRKWQ==
X-Google-Smtp-Source: AGHT+IEe02Ts6fudZZKvuJiiRdgTKQlb3ymVTT1vDrGxfsPYiVCd7y9hm/fVo+gse/NjhWsOcOZLXw==
X-Received: by 2002:a05:6214:5096:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6fad90aa622mr139829746d6.13.1748888191615;
        Mon, 02 Jun 2025 11:16:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d33901sm64619586d6.18.2025.06.02.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 11:16:31 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3E2781200043;
	Mon,  2 Jun 2025 14:16:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 02 Jun 2025 14:16:30 -0400
X-ME-Sender: <xms:fuo9aA4iLPqlA3x25neXOeb1An4hS53uemKAwp3t-ARz3QpFxqrHlg>
    <xme:fuo9aB4wQfyYHBUffYs1SQPEg1fS9jpydKhLR57DHYMSwcfrWkyq_ukkIxcAF2JW-
    tnVnSggQd3cfnTjdg>
X-ME-Received: <xmr:fuo9aPfIBFD18APSNYv9ewZwhxJJCbiRP28qgl9q4YDNfu27SbwuTQsGfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeefieculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepjeevtdehjeeu
    ffehveegiedtheduvefggfegvdeiteevteffffdtgfeikeelvdfgnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhruhhsthdqlhgrnhhgrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiise
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgt
    ohhmpdhrtghpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtph
    htthhopehvihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprhgtphht
    thhopeguihgvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphhtthhope
    hrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrghllhes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdguvg
X-ME-Proxy: <xmx:fuo9aFLnLhnBaZrtQ1HUKA72O4g8ugPwjxYxkcTs1UkKR-LNdeRrJg>
    <xmx:fuo9aELup3TotpZtfZQsWTPWOkfh0h9kFTwgckNa7zToJZjPq07umw>
    <xmx:fuo9aGxaTu1BrxOiSAHAB1hAYAEHxEgpJL-mxqxJC3_OQzyLVkccuQ>
    <xmx:fuo9aIIZx-VGPzfR4rjsxqcmcYt1R0eGHpp6kzPNZb8Pkma55DHcaw>
    <xmx:fuo9aDZ1Of_87oijWBAVQj3R2pvxg7hud4gkBiPIpN2PiWyv3Bjn48Hx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 14:16:29 -0400 (EDT)
Date: Mon, 2 Jun 2025 11:16:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev,
 Daniel Almeida <daniel.almeida@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 4/5] sched/core: Add __might_sleep_precision()
Message-ID: <aD3l70xwuAVd3Zpz@tardis.local>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
 <20250506045843.51258-5-boqun.feng@gmail.com>
 <aB2aAEELa3253nBh@gmail.com>
 <aB2sZ60WI5thp6ve@Mac.home>
 <aCsm0x_mSUgAayvU@Mac.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCsm0x_mSUgAayvU@Mac.home>

On Mon, May 19, 2025 at 05:40:51AM -0700, Boqun Feng wrote:
> On Fri, May 09, 2025 at 12:19:03AM -0700, Boqun Feng wrote:
> > On Fri, May 09, 2025 at 08:00:32AM +0200, Ingo Molnar wrote:
> > > 
> > > * Boqun Feng <boqun.feng@gmail.com> wrote:
> > > 
> > > > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > > 
> > > > Add __might_sleep_precision(), Rust friendly version of
> > > > __might_sleep(), which takes a pointer to a string with the length
> > > > instead of a null-terminated string.
> > > > 
> > > > Rust's core::panic::Location::file(), which gives the file name of a
> > > > caller, doesn't provide a null-terminated
> > > > string. __might_sleep_precision() uses a precision specifier in the
> > > > printk format, which specifies the length of a string; a string
> > > > doesn't need to be a null-terminated.
> > > > 
> > > > Modify __might_sleep() to call __might_sleep_precision() but the
> > > > impact should be negligible. When printing the error (sleeping
> > > > function called from invalid context), the precision string format is
> > > > used instead of the simple string format; the precision specifies the
> > > > the maximum length of the displayed string.
> > > > 
> > > > Note that Location::file() providing a null-terminated string for
> > > > better C interoperability is under discussion [1].
> > > > 
> > > > [1]: https://github.com/rust-lang/libs-team/issues/466
> > > > 
> > > > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > > Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
> > > > ---
> > > >  include/linux/kernel.h |  2 ++
> > > >  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
> > > >  2 files changed, 43 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> > > > index be2e8c0a187e..086ee1dc447e 100644
> > > > --- a/include/linux/kernel.h
> > > > +++ b/include/linux/kernel.h
> > > > @@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
> > > >  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> > > >  extern void __might_resched(const char *file, int line, unsigned int offsets);
> > > >  extern void __might_sleep(const char *file, int line);
> > > > +extern void __might_sleep_precision(const char *file, int len, int line);
> > > 
> > > Ugh.
> > > 
> > > Firstly, '_precision' is really ambiguous in this context and suggests 
> > > 'precise sleep' or something like that, which this is not about at all. 
> > > So the naming here is all sorts of bad already.
> > > 
> > 
> > I accept this is not a good naming.
> > 
> > > But more importantly, this is really a Rust problem. Does Rust really 
> > > have no NUL-terminated strings? It should hide them in shame and 
> > 
> > You can create NUL-terminated strings in Rust of course, but in this
> > case, because we want to use the "#[trace_caller]" attribute [1], which
> > allows might_sleep() in Rust to be defined as a function, and can use
> > Location::caller() to get the caller file and line number information,
> > and `Location` type yet doesn't return a Nul-terminated string literal,
> > so we have to work this around.
> > 
> > > construct proper, robust strings, instead of spreading this disease to 
> > > the rest of the kernel, IMHO ...
> > > 
> > > Rust is supposed to be about increased security, right? How does extra, 
> > > nonsensical complexity for simple concepts such as strings achieve 
> > > that? If the Rust runtime wants to hook into debug facilities of the 
> > > Linux kernel then I have bad news: almost all strings used by kernel 
> > > debugging facilities are NUL-terminated.
> > 
> > This is more of a special case because `Location` is used (i.e. file
> > name is the string literal). For things like user-defined string, we use
> > the macro c_str!(), which generates NUL-terminated strings. For example,
> > lockdep class names.
> > 
> > > 
> > > So I really don't like this patch. Is there no other way to do this?
> > > 
> > 
> 
> Trying to see if we can make some forward-progress on this one,
> considering:
> 
> 1. #[track_caller] is really a desired feature to be used for Rust's
>    might_sleep(), Alice's reply [3] also explains a bit more on the
>    "why" part.
> 
> 2. To achieve #1, we will need to handle the file name returned by
>    Rust's `Location` struct, especially Location::file() will return a
>    string literal without a tailing NUL.
> 
> 3. Other than the current approach proposed by this patch, if the
>    existing might_sleep() functionality does not couple (task) state
>    inquiries with debug printing, we can maybe avoid printing the
>    non-NUL-terminated string in C's __might_sleep*() function by
>    printing Location::file() in Rust code:
> 
>     #[track_caller]
>     fn might_sleep() {
>         let loc = Location::caller();
> 
> 	if (__might_sleep_is_violated()) {
> 	    pr_err!("BUG: sleeping function called from invalid context at {loc}\n");
> 	    
> 	    ...
> 	}
>     }
> 
>     but this essentially would add more changes into C code compared to
>     the current patch.
> 
> 4. This is only a special case where we need the "debug information"
>    provided by Rust, so this won't happen a lot; and printing a
>    non-NUL-terminated string is already supported by printk already, so
>    we reuse what kernel already has here.
> 
> Given the above, I think the current patch is the best solution.
> 

Ingo,

Alice made some progress on providing the NUL-terminated string for `Location`
[4] [5], which means in the future, we can avoid the __might_sleep_precision()
workaround here, and yet remain the benefit of `#[track_caller]` (Thanks
Alice!). This also means we'd better keep the workaround right now, because that
keeps the same interface if we have NUL-terminated string from
`Location::file()`. And we can revert this workaround easily when the feature is
available in Rust. So I think we should take this.

Moving forwards, let me know if you need me to resend the pull request (there
are also a very trivial improvements in it as well), and I could rename
__might_sleep_precision() to something else (like __might_sleep_nonnulfilename()
or anything) in the resend. Thoughts?

[4]: https://github.com/rust-lang/libs-team/issues/466#issuecomment-2914476468
[5]: https://github.com/rust-lang/rust/issues/141727

Regards,
Boqun

> [3]: https://lore.kernel.org/lkml/aB3I62o8hWSULGBm@google.com/
> 
> Regards,
> Boqun
> 
> > There's a `c_str` [2] macro which could generates a NUL-terminated
> > string, but using that will requires might_sleep() defined as a macro as
> > well. Given that might_sleep() is the user interface that most users
> > will use, and how it handles string literal for file names is an
> > implementation detail, so I figured it's better we resolve in the
> > current way.
> > 
> > [1]: https://rustc-dev-guide.rust-lang.org/backend/implicit-caller-location.html
> > [2]: https://rust.docs.kernel.org/kernel/macro.c_str.html
> > 
> > Regards,
> > Boqun
> > 
> > > Thanks,
> > > 
> > > 	Ingo
