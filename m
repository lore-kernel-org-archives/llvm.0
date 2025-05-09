Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4717238D5A
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775161; cv=none; b=Uq9gNSZdskxBh9ZmMlLyemuZQGWd5blxF/N9/iDdBV9v0ZYFD07tprvuxmkCNxoIPZiM5cnZbi2idOb1o2gNPAdpZ9WRH9LTb2u/zd/hom/wBiEM/lq0ijCUZ7Wls2zWi5Waf2ihm9unyhJZk+mbSfcrDONSvIRMvB2lgEzJGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775161; c=relaxed/simple;
	bh=C6mDpnaR/sLALalCTG2F9+y2wyLmIawx/3g6JvyML/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTYra9qBkpYS3wkzZe2dM4DWF/QA42OheHztwOd6Q0nYCm6GYlChuqB2pp0LAtElJMQ96QGvroWx7PIkYfFfaBfRszZrgs1/Hrz28luyqRAz4XMj6Wn1G7x8jUc2R8kdltKzj8aH3jTaH7KhuiYndWwKFBmGvK8BS/oLLkRoqLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEDm14ju; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEDm14ju"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecf99dd567so24782806d6.0
        for <llvm@lists.linux.dev>; Fri, 09 May 2025 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746775157; x=1747379957; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEEF2dYVp6IYEOXVj/odIE//ILxHazbUNnumfhkoOBk=;
        b=aEDm14juBpdkJBoi08NZoq0sfhneJSO7mAvzqkQov6jdGt6ynO6E4kOMCr+6rgGIox
         4VToP1hC2eazqQMUwBDt9sqGAPC3SWblMy0jCiFtS+hRJjFEfPfJjGXK9E8kxF/PSr49
         XZ5ABuuCb8trCdQmf6F+IuLDIUagke6HLWi6e5KJEmVqmPEeaCUtm1+XwMqJm4CFR+y8
         ON5TK+3bq7fZIk8ix0WQY9SRYjNjKG2o59Zv714f3O3l8zXB1gq4NTd+079iATC5huMK
         X0vVvCI6xlAFeitcHvBl7yN1iGZFXCg13EWflgRaNpjRJgo6L26TwYV4lRxLNyfqUqpv
         IwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775157; x=1747379957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEEF2dYVp6IYEOXVj/odIE//ILxHazbUNnumfhkoOBk=;
        b=JDvH3R/X1XRipucNiTXl6xHaog+MTSFLhH6KxH6FPM6vr09ze47gyzb3NrXZLrZmgT
         9lF26EnUqJZnlQ/zoF7/wccjBisgBGE75GUFq783NjPNm89aoRTecHuK5UDb0GG5kb+m
         HanEwSErzqaSOoAx2lFjoBwxDmamQcJl8vNg1yP68bDSPf3KM8mPOYjgyn+na57Dv+Pf
         OlN2Ne4F5uHsXUzRhNHFXYguxgwIbkJvOrf94cOQC3z7ZuKTfNkJ75oxqsOR/3UWCSjX
         HPuBhxU3b/7Q9e2Kf7EjetkBKbf/CWyVdsYYQiN+Ohid+bqTHN16qD4pZAA/sj8QAcGt
         ug0g==
X-Forwarded-Encrypted: i=1; AJvYcCUo0+ll5sAGPEfE2wuh3tQfmpj8IyqzzUvshQmrXQEyK+6jKYFmZNyDGXNwD5AFyKqzF17N@lists.linux.dev
X-Gm-Message-State: AOJu0Yya7cQBIrZij9YCb1im0rWt7lMiEBnREolVDhExtNHnNW3xYbH/
	d9jJsE7Ep8SohtYSxhwxj4fxcYnf4kRld+7ckt/nhEVNsLsNn7OC/5qltg==
X-Gm-Gg: ASbGncsNiQb5z1HwMPbeOK1oWTx2gTq+pLK4iHT32ABk4Bj8zqQ8YDHc0yz9/7VaAX/
	mL9dlu/SZi1OJ+jz7Pakx0wtWyi2XRQQTs5dwxd05wI4YZCmgTyKg3MutN98jyubnAfLPBcUPle
	gjLDUPzDibSJRfbDhD/vC8Mwiy0SMCw5+xFxYuIDJ9sBKn2AHx4xkOqrZ+bqoRmXYI93pMgP00F
	rrrwLl5QpUaKJp0UEF/Bn43wtRCpeAK6Fzp7WIp7BlSzKjTpE1a7999JH1bCFbXWp1881gVOsye
	MkdHoSp7mmy19U8NANL0aYIPW/dyEjA2c1XD2ME74L1XHmP0VcbHqlLUyKpo27R3MwmtVzasYR6
	gtRbaXYIquWJycKkBX366hui+QkGjfx4=
X-Google-Smtp-Source: AGHT+IEQBSAtFEWvAn9Bu40xDuzcDonSeIINvn0y/cqVzlkWN3FFvQBHNwBFRhRGFbv1EbjbEgFfkA==
X-Received: by 2002:ad4:5d63:0:b0:6f4:c84d:d1bd with SMTP id 6a1803df08f44-6f6e47c26d5mr30915456d6.6.1746775146435;
        Fri, 09 May 2025 00:19:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4689sm10206106d6.28.2025.05.09.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:19:05 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id DA8951200043;
	Fri,  9 May 2025 03:19:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 09 May 2025 03:19:04 -0400
X-ME-Sender: <xms:aKwdaI5lZ9hV0-9tZpnnbxIxjauNJzaXlt_NKbMgfCjHL7-CDbuEtw>
    <xme:aKwdaJ7tIRSgnEzFi-XWsPY8vKU3rwxGuhwLxTtKGCOVKcz6yOm7OK2pTMDpKPaG4
    KSx-YW6HDGvtcFCEQ>
X-ME-Received: <xmr:aKwdaHd49hZf2sKtMAhlGZVsiIwGj4XzGitDhZrShIvMTDw_ExlcsV1m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvtddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:aKwdaNKgw7ujogb7O0063iug6O7bmEZeOmjelf5Ro3z6SFWiX4uYSA>
    <xmx:aKwdaMLpo06aE_bsv7qG_y_-Cxg1dUwLcfsEkxPJfy4yq-mYicBXvw>
    <xmx:aKwdaOxvjfvWrC7ssLNh0zVkObWAxSGHrsraS_ABZWmNz1xR5LM6qA>
    <xmx:aKwdaAJB9HXCDtbShdI5XBnOrt7DYHuKvNWcnDo35S8Y2X7NWuDffg>
    <xmx:aKwdaLZG8F17TvUA6OQHZXxCF-GTgDe5twZyX9x-gu3bbZXRRq75JxQP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 03:19:04 -0400 (EDT)
Date: Fri, 9 May 2025 00:19:03 -0700
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
Message-ID: <aB2sZ60WI5thp6ve@Mac.home>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
 <20250506045843.51258-5-boqun.feng@gmail.com>
 <aB2aAEELa3253nBh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB2aAEELa3253nBh@gmail.com>

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

I accept this is not a good naming.

> But more importantly, this is really a Rust problem. Does Rust really 
> have no NUL-terminated strings? It should hide them in shame and 

You can create NUL-terminated strings in Rust of course, but in this
case, because we want to use the "#[trace_caller]" attribute [1], which
allows might_sleep() in Rust to be defined as a function, and can use
Location::caller() to get the caller file and line number information,
and `Location` type yet doesn't return a Nul-terminated string literal,
so we have to work this around.

> construct proper, robust strings, instead of spreading this disease to 
> the rest of the kernel, IMHO ...
> 
> Rust is supposed to be about increased security, right? How does extra, 
> nonsensical complexity for simple concepts such as strings achieve 
> that? If the Rust runtime wants to hook into debug facilities of the 
> Linux kernel then I have bad news: almost all strings used by kernel 
> debugging facilities are NUL-terminated.

This is more of a special case because `Location` is used (i.e. file
name is the string literal). For things like user-defined string, we use
the macro c_str!(), which generates NUL-terminated strings. For example,
lockdep class names.

> 
> So I really don't like this patch. Is there no other way to do this?
> 

There's a `c_str` [2] macro which could generates a NUL-terminated
string, but using that will requires might_sleep() defined as a macro as
well. Given that might_sleep() is the user interface that most users
will use, and how it handles string literal for file names is an
implementation detail, so I figured it's better we resolve in the
current way.

[1]: https://rustc-dev-guide.rust-lang.org/backend/implicit-caller-location.html
[2]: https://rust.docs.kernel.org/kernel/macro.c_str.html

Regards,
Boqun

> Thanks,
> 
> 	Ingo
