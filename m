Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F901E888
	for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718602948; cv=none; b=o2MVEAOZ0G6WTVWfEmICW6lCPqZoO4Ah1MI4OWGNtWW9BVJ7mEz6kDPulYAUISNEQem5fKAPvuY9MoViDOeKVppnn/BX5m9S4Ds9uCRWeYv2TXYJykT5MsdvRNXwNQHXM+zQEo8sLvF+Kj08+efMb1Q9vIT1O/Wp1HZGIyAyWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718602948; c=relaxed/simple;
	bh=fe1CDe4TWdB/mkMo+Ij8B6m8DzwSgqUdshEjV3EiiHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwA8/Snx0aNX9qXAX9Zud2pavYxaBYmovqv3sMNzOFWx2a1gtJU4xf628EI/m8x5kRE/HM5f5UEw6HESD21uOLB3n3QCQRk+53IOHzyEhfl2+WUpDyMMiIsdlwcoh5ad5xl2xBKclhponUSRKgHLjl0bDf7GmYwOfJhPJqHNz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7QmObaa; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7QmObaa"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-441567d352bso26903391cf.1
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718602946; x=1719207746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djPwZuKbvrmoSptmQGftbxnFBiXhu4eAY3uKLEqMxtQ=;
        b=B7QmObaatYRBR3chhC1YOxML6n0LwGo7WM04xwpffLVjrRTL3MHWTbEDsTnLq1zQdW
         /A7dGGsB81qn8+Ytshdu3Dt0hAEnLWnAZRqq41w6y+HZGnPkwDGzv0feJuwzpaxvqXL3
         aafOr2vPkCpIWQc+Yfdg9PQDxrRxvHb2GW/i3RGdgOrHJF2G1LmbLLHezAR3WYOqzF2S
         3/103/Ke6SpKQvU5vP/grrKG4lc3wxX49s4xZLJJXaW+rICnDNrhl2zJfHMRWkqlp7JQ
         BzqrCnJG3bbnw76/l9MLrA+nXiIdKGSFZ/KgidA/aW6C0SapBetvXATrRcZoiskGleRU
         YWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718602946; x=1719207746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djPwZuKbvrmoSptmQGftbxnFBiXhu4eAY3uKLEqMxtQ=;
        b=Q6/YgEiLBItAywKL3Q56RgqQ2YWOL1wXHgjMeVVae74qbjMqWiaT7PSEtRs+xUUgoO
         TJB7shFr8y8k0L5HoxTmOgsjR2Mrx6dC4uMb6+5Tg1hLMGImtZ0RCXtSjDDNrGXjFBHQ
         cSJH281Ns8gjpXk8fDFg58VvLX1g5IIJPBw0hQm7ubSpMaTStgOvZnoXbIXAfJP9VAok
         9lBohViQ0tB7n3ItEEAu+QWvBN0iSFkNWJe20CF9zP/WYWdjIX+uJEQRhw6yVmcCiUAc
         SxJL+mJk+seYzEPwdfdpoaWS/m7431pe+3gEAEdy6mS3D//8Xh/1Fat8VFneGe0dLO71
         TweA==
X-Forwarded-Encrypted: i=1; AJvYcCVbpxK9bZ3uH0PRYV54aPpZnwrZ4DiKVuiDY4kXHifHWax4riNKkBV6YW7VkSJvM5SQ4o6Oiu2qryP+R7xIMFQU4zFh4Q==
X-Gm-Message-State: AOJu0Yy9fUAANQBpGd00vMnKF9uMQ2nqkcGfp4DehcQIzLqJy6z8lifg
	prXtO7Zoks/o/z6MTAnj+hlIyNQ0BVQ7gkLpCgkmLTQ9Ssk2rNAC
X-Google-Smtp-Source: AGHT+IFs1jHgkUIF6bJM9amNqYLJX4wu5fNNYuW2fgfw3dZuTeC2J1Hh8+avNa0MuwtF0uJIpye+nw==
X-Received: by 2002:a05:622a:5b0a:b0:444:8e78:6d25 with SMTP id d75a77b69052e-4448e786de1mr26277721cf.65.1718602946046;
        Sun, 16 Jun 2024 22:42:26 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f30f1d2esm43347471cf.81.2024.06.16.22.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 22:42:25 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id A58321200043;
	Mon, 17 Jun 2024 01:42:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 17 Jun 2024 01:42:24 -0400
X-ME-Sender: <xms:wMxvZo0x9rYvWqnmGzVfHtqzQ5UJdt3TQ9Y6Q36Ed4hJqAi7c9zlew>
    <xme:wMxvZjHjSVMPeJV9Fh2t8F8OIYvHuNFa4SMst9xAKDgu62fciHn6ROTTzOXsZ23rB
    mTq2Sgg257x3qwurg>
X-ME-Received: <xmr:wMxvZg4aIL80NG_trWxZvtFnfjdGvo6GULztCf7a9BROKbU-6Iv_-tOSzEn3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgedgkedvucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:wMxvZh0Y36WgBdy_3vUXxW_l0cXSwC1qF7IBDpgQfJkjnCOqU7xDaQ>
    <xmx:wMxvZrEWp6ygxMKl21Fr-OMTe3dZWwRrs1qvpZt6TjP_OHURD8YKaA>
    <xmx:wMxvZq9LmovzWkIscKjSOB3ZTFYsJvt-Yt9jLnOMu-azWM-iZOy1Cg>
    <xmx:wMxvZgkFowrjk3ULXLAerMXFmoV45SamdfPtX1UG5t5xgnhgwXH1uQ>
    <xmx:wMxvZrEH7HjeHWtZkpYbjttEVdIcmELQiMGL8pyCsJPmXC2K5Y_O5ORA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 01:42:23 -0400 (EDT)
Date: Sun, 16 Jun 2024 22:42:19 -0700
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
Message-ID: <Zm_Mu7C76jpMyRy6@Boquns-Mac-mini.home>
References: <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <79239550-dd6e-4738-acea-e7df50176487@nvidia.com>
 <ZmztZd9OJdLnBZs5@Boquns-Mac-mini.home>
 <c243bef3-e152-462f-be68-91dbf876092b@nvidia.com>
 <Zmz-338Ad6r4vzM-@Boquns-Mac-mini.home>
 <20240616155145.54371240.gary@garyguo.net>
 <Zm7_XWe6ciy1yN-h@Boquns-Mac-mini.home>
 <Zm_LTXm3wJhcQIwI@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zm_LTXm3wJhcQIwI@Boquns-Mac-mini.home>

On Sun, Jun 16, 2024 at 10:36:13PM -0700, Boqun Feng wrote:
> On Sun, Jun 16, 2024 at 08:06:05AM -0700, Boqun Feng wrote:
> [...]
> > > 
> > > Note that crossbeam's AtomicCell is also generic, and crossbeam is used
> > > by tons of crates. As Miguel mentioned, I think it's very likely that in
> > > the future we want be able to do atomics on new types (e.g. for
> > > seqlocks perhaps). We probably don't need the non-lock-free fallback of
> > 
> > Good, another design bit, thank you!
> > 
> > What's our overall idea on sub-word types, like Atomic<u8> and
> > Atomic<u16>, do we plan to say no to them, or they could have a limited
> > APIs? IIUC, some operations on them are relatively sub-optimal on some
> > architectures, supporting the same set of API as i32 and i64 is probably
> > a bad idea.
> > 
> > Another thing in my mind is making `Atomic<T>`
> > 
> > 	pub struct Atomic<T: Send + ...> { ... }
> > 
> > so that `Atomic<T>` will always be `Sync`, because quite frankly, an
> > atomic type that cannot `Sync` is pointless.
> > 
> 
> Also, how do we avoid this issue [1] in kernel?
> 
> `atomic_load()` in C is implemented as READ_ONCE() and it's, at most
> time, a volatile read, so the eventual code is:
> 
>     let a: (u8, u16) = (1, 2);
>     let b = unsafe { core::ptr::read_volatile::<i32>(&a as *const _ as *const i32) };
> 

^^^^ this line should really be:

	let b: (u8, u16) = unsafe { transmute_copy(&read_volatile::<i32>(&a as *const _ as *const i32)) };

but you get the idea.

Regards,
Boqun

> I know we probably ignore data race here and treat `read_volatile` as a
> dependency read per LKMM [2]. But this is an using of uninitialized
> data, so it's a bit different.
> 
> We can do what https://crates.io/crates/atomic does:
> 
> 	pub struct Atomic<T: NoUninit + ..> { ... }
> 
> , where `NoUinit` means no internal padding bytes, but it loses the
> ability to put a 
> 
> 	#[repr(u32)]
> 	pub enum Foo { .. }
> 
> into `Atomic<T>`, right? Which is probably a case you want to support?
> 
> Regards,
> Boqun
> 
> [1]: https://github.com/crossbeam-rs/crossbeam/issues/748#issuecomment-1133926617
> [2]: tools/memory-model/Documentation/access-marking.txt
> 
> > Regards,
> > Boqun
> > 
> > > crossbeam's AtomicCell, but the lock-free subset with newtype support
> > > is desirable.
> > > 
> > > People in general don't use the `atomic` crate because it provides no
> > > additional feature compared to the standard library. But it doesn't
> > > really mean that the standard library's atomic design is good.
> > > 
> > > People decided to use AtomicT and NonZeroT instead of Atomic<T> or
> > > NonZero<T> long time ago, but many now thinks the decision was bad.
> > > Introduction of NonZero<T> is a good example of it. NonZeroT are now
> > > all type aliases of NonZero<T>.
> > > 
> > > I also don't see any downside in using generics. We can provide type
> > > aliases so people can use `AtomicI32` and `AtomicI64` when they want
> > > their code to be compatible with userspace Rust can still do so.
> > > 
> > > `Atomic<i32>` is also just aesthetically better than `AtomicI32` IMO.
> > > When all other types look like `NonZero<i32>`, `Wrapping<i32>`, I don't
> > > think we should have `AtomicI32` just because "it's done this way in
> > > Rust std". Our alloc already deviates a lot from Rust std.
> > > 
> > > Best,
> > > Gary
