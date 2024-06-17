Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE8DDA6
	for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 05:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718602583; cv=none; b=ki9dnYkCxTgLGEjFy7C/thgZwoynHyw6+tv3TpUjx1GgadQA0xOrnOtFB7Vv54V9pa6eyrg9Gtorz8O/rvu+ymgXXA7GcpW4GpeBHrjF27RY/R5VvwWLYSQhli+9AHVmPJ6eeG5meJU5AcMnAOcpnYSJC+7l60XDlmFaOexulHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718602583; c=relaxed/simple;
	bh=qNGJPYfBIO6Qqcf8w5/M6GsWzh6G1g0pb+xXn3QuMW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoNcjoxb247Q2qG4NheJaE7baUYW7hQv55Yza6NG94bB43Pc+EOb4BVamFEEXVx/Q5bWhnuP89OXM3UWv0TTFAQneRH6iSb0cGjHVK9jiDLKB1JPxGHHKMcP+IapvONNkNxb882zH6b6qBs/F7VsoO1ufVWEajxMd7IwvaISr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2WCB7Hj; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2WCB7Hj"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-797a7f9b52eso317637985a.2
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 22:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718602580; x=1719207380; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJeIgTT6Qh/sxRKpkuk9BR9tYX+tCBNvv142Tf4kLOk=;
        b=C2WCB7HjG+e2QmJcunJpQXB2qfjqIX4tD65460Q+thCCmlkfXBU8Vbee4ON9ZhEL+H
         oYsCVFAPcqKk9yw9BQJRqhwTnjbxQwBnjOf58SN9k73L9HMbWShr/iRqC7k3Y8mBnHrn
         VwOszpAuKUYvAQUSIf6L/oZYWwRUgjFBcWXWR9JZGTV9Ef2BvCy2Ly+lxnVTop/khGn2
         6g141HSNMPHGtnmat2c2ryFWXyEyWksk31znLqMsELnogS8aP1lU60CAApxOLGkNL+vt
         f0b6ENEZhtnUlTHS5Nin06j1s/5+T9IOsilCmwzLiESnOtpDQtW0LrRfIEKdq2L6UpVI
         Folw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718602580; x=1719207380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJeIgTT6Qh/sxRKpkuk9BR9tYX+tCBNvv142Tf4kLOk=;
        b=S4zrshz5LQD1EbdXcessKZ0yDn8t2JwfJqcNxAmajIZD5GDnJbpqhm4ejIVWlunlRB
         TUbhJFRaJVPBl9wFxPUBHtr3N1fKkwAx+ydPBT7qTYz/0RA6l7S16HiKm13rlCZWWXgf
         wUtElH/gU3lNcJNvggMuyVA0uSw6vCi8IUJ4k6A+qgNl8hmnifAjlqUvTQzlmL8kOvoQ
         GJ523fWdA//sWcBsIewKzKK0oVA0bXRn0QP5DX5WtofZ8cka1+uim8ZqnjI9t7+E5jT9
         /QdWUyQp4JxXvgKlFGYSO9CdfT9cYfAVmMmgqiaZRvnCRP/ixYZp6mkyc19SAA8mgqL4
         4Agw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ79V/93UlIhMt2mOpKbsL6hSlPCSiySbtVVU1DW0mn5hBuGsqCFOtiqLs/vZh7XHLK6DbDHFKaWbOVMEZfglmoh/OCA==
X-Gm-Message-State: AOJu0YwUzmPCzW7pYv1pTm50hWefHuRQQ84DdySd7CRgslOBZo2hUzv8
	fDg2+ww2kwgPrbMbQrB/ntr/vPWOMRbL80ZYuxTTcCv21qPh0zFJ
X-Google-Smtp-Source: AGHT+IHQxDKmzbQN3wDBWu2GUvw9lePhre6ZMLcLvCTUY/3kdj6Q6oqMmjAj+h53BtENoBkKnF5x2Q==
X-Received: by 2002:a05:620a:1921:b0:797:b67e:e843 with SMTP id af79cd13be357-798d258cf02mr869592085a.48.1718602580414;
        Sun, 16 Jun 2024 22:36:20 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe4f35dsm398786285a.122.2024.06.16.22.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 22:36:19 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfauth.nyi.internal (Postfix) with ESMTP id CAEB21200066;
	Mon, 17 Jun 2024 01:36:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 17 Jun 2024 01:36:18 -0400
X-ME-Sender: <xms:UstvZg4OKD0D5PdMwUkiymvL5RVxgMkqPDyDc2oI55hL3sxResMhcA>
    <xme:UstvZh6sjGf--LJ1guqKzRWVGnZUL4raAzsqsRnDe_w0MBAypia_nDlCVa6UOnE-F
    fd9KZlnRwz8S75bJg>
X-ME-Received: <xmr:UstvZveUkCBgqxC1AM2WOGv4P7WJRdcihWolYDynT_0R3qfYhm-D3DwSMTsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpedtteeuudejhfekffeiudeuvddvheduteejudeiieffhedvhffhffevtefg
    tdevtdenucffohhmrghinheptghrrghtvghsrdhiohdpghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgv
X-ME-Proxy: <xmx:UstvZlLD_I0DnJCopOEhlaBBeJjmGREaYlqiASh8Fv6MO2A9jTY8TQ>
    <xmx:UstvZkKa9vP5p9jv6p81qfz3AeuwJedYZeAg2weT3j6_n3wo96UYVQ>
    <xmx:UstvZmyWVWBZ8NH3B4zENjLVmv3YHMyyKgIO89Bohty3LX2JUZfGug>
    <xmx:UstvZoKlw68_7R3rFxM_YpO3A1mVdjfaLqcy7N8X5yqExmZLq4HidA>
    <xmx:UstvZjYRifXEzIfcyT5Mjjtnf8ibovnAmPvz4D5yA_GwgcxcQzqLcbcv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 01:36:17 -0400 (EDT)
Date: Sun, 16 Jun 2024 22:36:13 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
Message-ID: <Zm_LTXm3wJhcQIwI@Boquns-Mac-mini.home>
References: <ZmseosxVQXdsQjNB@boqun-archlinux>
 <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <79239550-dd6e-4738-acea-e7df50176487@nvidia.com>
 <ZmztZd9OJdLnBZs5@Boquns-Mac-mini.home>
 <c243bef3-e152-462f-be68-91dbf876092b@nvidia.com>
 <Zmz-338Ad6r4vzM-@Boquns-Mac-mini.home>
 <20240616155145.54371240.gary@garyguo.net>
 <Zm7_XWe6ciy1yN-h@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zm7_XWe6ciy1yN-h@Boquns-Mac-mini.home>

On Sun, Jun 16, 2024 at 08:06:05AM -0700, Boqun Feng wrote:
[...]
> > 
> > Note that crossbeam's AtomicCell is also generic, and crossbeam is used
> > by tons of crates. As Miguel mentioned, I think it's very likely that in
> > the future we want be able to do atomics on new types (e.g. for
> > seqlocks perhaps). We probably don't need the non-lock-free fallback of
> 
> Good, another design bit, thank you!
> 
> What's our overall idea on sub-word types, like Atomic<u8> and
> Atomic<u16>, do we plan to say no to them, or they could have a limited
> APIs? IIUC, some operations on them are relatively sub-optimal on some
> architectures, supporting the same set of API as i32 and i64 is probably
> a bad idea.
> 
> Another thing in my mind is making `Atomic<T>`
> 
> 	pub struct Atomic<T: Send + ...> { ... }
> 
> so that `Atomic<T>` will always be `Sync`, because quite frankly, an
> atomic type that cannot `Sync` is pointless.
> 

Also, how do we avoid this issue [1] in kernel?

`atomic_load()` in C is implemented as READ_ONCE() and it's, at most
time, a volatile read, so the eventual code is:

    let a: (u8, u16) = (1, 2);
    let b = unsafe { core::ptr::read_volatile::<i32>(&a as *const _ as *const i32) };

I know we probably ignore data race here and treat `read_volatile` as a
dependency read per LKMM [2]. But this is an using of uninitialized
data, so it's a bit different.

We can do what https://crates.io/crates/atomic does:

	pub struct Atomic<T: NoUninit + ..> { ... }

, where `NoUinit` means no internal padding bytes, but it loses the
ability to put a 

	#[repr(u32)]
	pub enum Foo { .. }

into `Atomic<T>`, right? Which is probably a case you want to support?

Regards,
Boqun

[1]: https://github.com/crossbeam-rs/crossbeam/issues/748#issuecomment-1133926617
[2]: tools/memory-model/Documentation/access-marking.txt

> Regards,
> Boqun
> 
> > crossbeam's AtomicCell, but the lock-free subset with newtype support
> > is desirable.
> > 
> > People in general don't use the `atomic` crate because it provides no
> > additional feature compared to the standard library. But it doesn't
> > really mean that the standard library's atomic design is good.
> > 
> > People decided to use AtomicT and NonZeroT instead of Atomic<T> or
> > NonZero<T> long time ago, but many now thinks the decision was bad.
> > Introduction of NonZero<T> is a good example of it. NonZeroT are now
> > all type aliases of NonZero<T>.
> > 
> > I also don't see any downside in using generics. We can provide type
> > aliases so people can use `AtomicI32` and `AtomicI64` when they want
> > their code to be compatible with userspace Rust can still do so.
> > 
> > `Atomic<i32>` is also just aesthetically better than `AtomicI32` IMO.
> > When all other types look like `NonZero<i32>`, `Wrapping<i32>`, I don't
> > think we should have `AtomicI32` just because "it's done this way in
> > Rust std". Our alloc already deviates a lot from Rust std.
> > 
> > Best,
> > Gary
