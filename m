Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038B1FECB1
	for <llvm@lists.linux.dev>; Mon, 19 May 2025 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658458; cv=none; b=e+mE6pW3p5ZAI3nThSIlXrI9vi7RywL9puPzc7ZBehN0ACiJw6kmgxHa8OhBA09KOR4K8AtvWpH1hBmQ99qlgv8buoLYCckP8tB+/tyuUUrByIuLZW8GhUSp4n1mohOJUWKtcGBC3tlAZpQFxI6wbUCzH2Ewi9eUKJsKeuhb3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658458; c=relaxed/simple;
	bh=pZ/q2IcyaKRZFo9NGBc8Uoa7oyO/n2mGtP+zq1BbZ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rW2U6bqEsMGX4KKBQAo1kbUvkhUY1eqUuTcNuqcOtqqw3kLsQBAjTzoBSxKm9E9M2EL0z7oPouUz6oveyYbi2IJ5/UmgBbqjZgqCvsNpoBlo2/INSUiNWjKd1XTvaLyLHuOjwGDfOZdhNgLi6LJCMwZI8zeYaZy3+PGQ+1eiBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+lMMYjE; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+lMMYjE"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8ae08e3b3so40202256d6.3
        for <llvm@lists.linux.dev>; Mon, 19 May 2025 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747658455; x=1748263255; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HL4PEgvdQSii9S9OzQmnwTX0Z46/rSId1V0vWlnEH0=;
        b=A+lMMYjENSu64LFNStQT2vTlfukURaCLSjardDl6TaDbRuLVQLHo/v1HNCuYOXVg20
         JkGStZDd75TjpZ9fI6NuGUNQ4TL2XekNNw/YuzvVL8WrswnUHBnVnodxv/JYQKiwcuK5
         oPt2ht/8+ovZpluwYM8LcUhI8MaNinL2WydXMD/tKGlsTzeBR4UosbPcGbaDhhHZdx3u
         x4iZjObUXUEz71Cdc4fjcaPwTXpYW0MA7UtUquMbabWJVZdrkT2HCBv265L00OT8q0aY
         LnNAifMGx4Vm+zkF7ZT4pxc4rtZrdxYNM7QitSg5KsXs+TG50oQnkR93ITJQEZoJ0MM3
         v3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658455; x=1748263255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HL4PEgvdQSii9S9OzQmnwTX0Z46/rSId1V0vWlnEH0=;
        b=tscu1Bp1+w+NxvGHxnDpUoxEz7dN879NStwavC8xCK6osftNs1W64linvOfD44u8xn
         QIyiPExDl7UbzHApgv+GFCUdh8FXMi1K8acE/PYyv90VaJwaU64IcmEQdNj7hUNiqKVp
         m/ALBr4O15fKZg7mvFjAoYDJvl30BOVxJntC296HzuCyCR8+zn+CkYUH64JtOBCL0HIC
         g3MUPhgPb5qizdqByZ91bff2TZjHlywaCvcE2elsUY4/tRZnjRQWRURfxr8zoCb9t8S2
         w+exsfvMJMVvd3wqxjv6mijxhuqDWldG3xh5p8OV9QBIgySKS7HhvW6TqUIu9/ImSSa0
         svxg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqA0o+NTh/uBS4uchoIwlAE+Z8U4dHeOQVSVAEDkJy3CPX+HVx6IKVjoOiQ4r2imifY11@lists.linux.dev
X-Gm-Message-State: AOJu0YxfX1ME3az9d9VWKtlug4HhgoomrNGFFNE9xxe1fLvjFQS12elZ
	lNyBp08CNX0HKZrBNC6k03ouhzQUxiF672pUabUskPSb7xfZvajP4edG
X-Gm-Gg: ASbGncvQxi1USMrwIMUMcIoFwcFngeG/QrODq0AaMYCrOl/4gGN7W3cPNnI0qmvJH7R
	cnZ2aVXLSqP7ZxZfZQjht1shMjTKyB+ki85rqSMx6ygJcOxGM5W1OyKZrn083WWhMruOVLF93fo
	Yu5xxgVE03aFtwc7+5uvfqftAmXaEIaJqtnRygqQV/wDzUfUoVkRYVT2U3cq7WVgx6jBlfXXcr+
	x1tzpSMvLzVmD7tzPoFC7nK0SfgBj6HMHnqaxN7S0BjIV67v1Yq2oUz8FTaDTTxPqRqD9+P8CMR
	FlHplGiPbv4sw3P/3qc9QPLZTSn/ESMlhCC3+bDpOOfd2niB/gxPKi/C+4ySatHjg8QXtwVDR2G
	ZqhjbJ3h65UGB+C1zkV6esmZXwLKyegi/4vY1+YVwfA==
X-Google-Smtp-Source: AGHT+IHowygK3ZyKOQeFR4gHSylWXGMc7TC+uPQ+k42ijshuY2kG998H9pbjMtzWFboAOgDteCzGRA==
X-Received: by 2002:a05:6214:c44:b0:6f4:cbcf:5d46 with SMTP id 6a1803df08f44-6f8b08abafamr192189606d6.20.1747658455074;
        Mon, 19 May 2025 05:40:55 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0883b6esm56139566d6.10.2025.05.19.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:40:54 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9E6181200043;
	Mon, 19 May 2025 08:40:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 19 May 2025 08:40:53 -0400
X-ME-Sender: <xms:1SYraOi5BfD5SAVLJU5LfrukU11x64_9w5nvKDA9qqe4FBTvJHmGQQ>
    <xme:1SYraPCzTDHN9B8gjEH65q84s9OUJmDLTZ87NRxfB8ifmin2TWia1zZWge8-oXL-h
    Ts6vBhNCFzow33yIA>
X-ME-Received: <xmr:1SYraGGV8t-e22HZ3TlvRlDoLFZUwqdRMmUx5Ke8TkkK9UR-aFPjkRon>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddugeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeejvedtheejueffheevgeeitdehudevgffg
    gedvieetveetfffftdfgieekledvgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghdprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruh
    hthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhq
    uhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtg
    hpthhtohepfeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehj
    uhhrihdrlhgvlhhlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnth
    drghhuihhtthhotheslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdr
    vghgghgvmhgrnhhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhooh
    gumhhishdrohhrghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:1SYraHQszmT8vz7b1TgXroqgmtHAXKKJTPxNyxH0qdz_72Xm95Axgw>
    <xmx:1SYraLzp7PaE4aw-fA7M3gWcAixese8Uv9p5x1wsBccnNYmBQ6QcNQ>
    <xmx:1SYraF4JFf9M2A0yYrLnPLF1q4yveHWg8bjC5U-QkeaSLwSqg50jFw>
    <xmx:1SYraIwCpRtAbXCV_pCaP10hjL3JnDxQ4aeI87885yrFg1ElwgSN7Q>
    <xmx:1SYraHiqTM-_ve_eLjOCnTLENXGdiCaW6JVomyxoTXveOousgTzcbCmB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 08:40:52 -0400 (EDT)
Date: Mon, 19 May 2025 05:40:51 -0700
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
Message-ID: <aCsm0x_mSUgAayvU@Mac.home>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
 <20250506045843.51258-5-boqun.feng@gmail.com>
 <aB2aAEELa3253nBh@gmail.com>
 <aB2sZ60WI5thp6ve@Mac.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB2sZ60WI5thp6ve@Mac.home>

On Fri, May 09, 2025 at 12:19:03AM -0700, Boqun Feng wrote:
> On Fri, May 09, 2025 at 08:00:32AM +0200, Ingo Molnar wrote:
> > 
> > * Boqun Feng <boqun.feng@gmail.com> wrote:
> > 
> > > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > 
> > > Add __might_sleep_precision(), Rust friendly version of
> > > __might_sleep(), which takes a pointer to a string with the length
> > > instead of a null-terminated string.
> > > 
> > > Rust's core::panic::Location::file(), which gives the file name of a
> > > caller, doesn't provide a null-terminated
> > > string. __might_sleep_precision() uses a precision specifier in the
> > > printk format, which specifies the length of a string; a string
> > > doesn't need to be a null-terminated.
> > > 
> > > Modify __might_sleep() to call __might_sleep_precision() but the
> > > impact should be negligible. When printing the error (sleeping
> > > function called from invalid context), the precision string format is
> > > used instead of the simple string format; the precision specifies the
> > > the maximum length of the displayed string.
> > > 
> > > Note that Location::file() providing a null-terminated string for
> > > better C interoperability is under discussion [1].
> > > 
> > > [1]: https://github.com/rust-lang/libs-team/issues/466
> > > 
> > > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
> > > ---
> > >  include/linux/kernel.h |  2 ++
> > >  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
> > >  2 files changed, 43 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> > > index be2e8c0a187e..086ee1dc447e 100644
> > > --- a/include/linux/kernel.h
> > > +++ b/include/linux/kernel.h
> > > @@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
> > >  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> > >  extern void __might_resched(const char *file, int line, unsigned int offsets);
> > >  extern void __might_sleep(const char *file, int line);
> > > +extern void __might_sleep_precision(const char *file, int len, int line);
> > 
> > Ugh.
> > 
> > Firstly, '_precision' is really ambiguous in this context and suggests 
> > 'precise sleep' or something like that, which this is not about at all. 
> > So the naming here is all sorts of bad already.
> > 
> 
> I accept this is not a good naming.
> 
> > But more importantly, this is really a Rust problem. Does Rust really 
> > have no NUL-terminated strings? It should hide them in shame and 
> 
> You can create NUL-terminated strings in Rust of course, but in this
> case, because we want to use the "#[trace_caller]" attribute [1], which
> allows might_sleep() in Rust to be defined as a function, and can use
> Location::caller() to get the caller file and line number information,
> and `Location` type yet doesn't return a Nul-terminated string literal,
> so we have to work this around.
> 
> > construct proper, robust strings, instead of spreading this disease to 
> > the rest of the kernel, IMHO ...
> > 
> > Rust is supposed to be about increased security, right? How does extra, 
> > nonsensical complexity for simple concepts such as strings achieve 
> > that? If the Rust runtime wants to hook into debug facilities of the 
> > Linux kernel then I have bad news: almost all strings used by kernel 
> > debugging facilities are NUL-terminated.
> 
> This is more of a special case because `Location` is used (i.e. file
> name is the string literal). For things like user-defined string, we use
> the macro c_str!(), which generates NUL-terminated strings. For example,
> lockdep class names.
> 
> > 
> > So I really don't like this patch. Is there no other way to do this?
> > 
> 

Trying to see if we can make some forward-progress on this one,
considering:

1. #[track_caller] is really a desired feature to be used for Rust's
   might_sleep(), Alice's reply [3] also explains a bit more on the
   "why" part.

2. To achieve #1, we will need to handle the file name returned by
   Rust's `Location` struct, especially Location::file() will return a
   string literal without a tailing NUL.

3. Other than the current approach proposed by this patch, if the
   existing might_sleep() functionality does not couple (task) state
   inquiries with debug printing, we can maybe avoid printing the
   non-NUL-terminated string in C's __might_sleep*() function by
   printing Location::file() in Rust code:

    #[track_caller]
    fn might_sleep() {
        let loc = Location::caller();

	if (__might_sleep_is_violated()) {
	    pr_err!("BUG: sleeping function called from invalid context at {loc}\n");
	    
	    ...
	}
    }

    but this essentially would add more changes into C code compared to
    the current patch.

4. This is only a special case where we need the "debug information"
   provided by Rust, so this won't happen a lot; and printing a
   non-NUL-terminated string is already supported by printk already, so
   we reuse what kernel already has here.

Given the above, I think the current patch is the best solution.

[3]: https://lore.kernel.org/lkml/aB3I62o8hWSULGBm@google.com/

Regards,
Boqun

> There's a `c_str` [2] macro which could generates a NUL-terminated
> string, but using that will requires might_sleep() defined as a macro as
> well. Given that might_sleep() is the user interface that most users
> will use, and how it handles string literal for file names is an
> implementation detail, so I figured it's better we resolve in the
> current way.
> 
> [1]: https://rustc-dev-guide.rust-lang.org/backend/implicit-caller-location.html
> [2]: https://rust.docs.kernel.org/kernel/macro.c_str.html
> 
> Regards,
> Boqun
> 
> > Thanks,
> > 
> > 	Ingo
