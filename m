Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1FF8F6B
	for <llvm@lists.linux.dev>; Sat, 15 Jun 2024 01:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718415196; cv=none; b=KjBtwc6FVfh1dlP3LFoMRuN0kC/Buq0wuj8gfhJQGdPOmWQE64XuNoU8w7TGPdzU9S47gEIc8ETLrG3lzndY608YGKaJox5xcUPX4xZbDFeWSViApSTKYRqhOhl0hwclBN6H+nOOMfigpyDDZZnD0Bgtv81VYFec43vF48x4PAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718415196; c=relaxed/simple;
	bh=CN3bPCf2Y3zAyQDEccKddE9q4bieNSMv8+8LxuB+vW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCWXSyRWgQCXaKR0qbyaCoYFoSDDjUiOkQj4cJPjfKBnE5RbOfk43rsHGDPa6qxlLNP70bOTpfoUEDytNHju4is7BTCgzSf+0Vd+29Fw4LJy/Y8cMk13aYaHZeDoOEA0UXsfaJKK4guVZ8xvrvOhMF9F0mBrdEXGH/M9/ueazhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYHUC6PI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYHUC6PI"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b064c4857dso13427006d6.2
        for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 18:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718415194; x=1719019994; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl32RvA7/8lBmewSY1/SnN35QBeCzByhM9oh3NCck0A=;
        b=AYHUC6PItpWHrz8sstWEr1iXWY4r36GktA55fbev+ZOs6cBSBo3dxXC9dFaHA+s6f0
         4XlHV3S6oR5XeLhPSFCyMGkTkMcksy+Rj/8FnOqVNBWTM6/ZofFXBOdf3ygZeOwBZe/S
         aOTdyEIKxwo3VAzIZvWIXXwRN0I0/eT2F3SxTKjA2HxUZB7SWcQ+OO23fJb+GmkpdBfG
         f31Tr570jRbuZb1Q5KEfx3PO3uJaGHOqwX74LibCgN5t32tV5L7HyaN4agPihTqyui1P
         HF62CzJkLJzwMjf4JIp9Zh4oIZelTYsvVVEypAw8sqzhYQBzgrv6Mc7RSrhqnvq3Zc5F
         1OGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718415194; x=1719019994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl32RvA7/8lBmewSY1/SnN35QBeCzByhM9oh3NCck0A=;
        b=ZsEd6nsImYd6eDMtx3A7DL1bBg+C4CgGv73h3E7nHLowzC5Ym9QkkF/jn4uxtHgoaF
         Gq6CCyRWlFBS6yKhoju6q7Z/2Ff+gg/WkRE2d4q4Of54i8teXGrqqDfEtARH9h30I5l0
         VqnKl4trcwBIHoZ/YcTKpEpFPg1ZQj4of5TbcZi42FouAnGU2rQUi2HgIikKGXT7RiQ4
         lReq6dV5rYXmY1bpxzITz1e4MOTf8Y27PAtQMqMRNs29hCtLqKysWUJfz72aTFbDpEBI
         qZ6bfKPkiVcgdM8FpCo8tQ7O0Gh5EPsg6oNrN27ApOwJpDSptJJHfVxavYBtmnWczAc3
         O0fA==
X-Forwarded-Encrypted: i=1; AJvYcCXn2LDE+0F8/D3M1vfM0hhAUXFs7Dg9MOTvD1aRak5hKcyzni1laaZ1MAAlnnkIWNQ0r2BFlFpJ/BPRogKopoc40C3Bhw==
X-Gm-Message-State: AOJu0YzXaEVlkJOjoEEWJa6VYQx1qPqTVbNbVih5xu6DxF2hXVCZozr6
	POmgraVEGRH1jUUO/T7YLFZaKHw82yKjURhjzPcqwfYGG91YS6hu
X-Google-Smtp-Source: AGHT+IHusve5yBDJq/XFnwBg2V+Vmg3WpZo51eIFcVWMMwJppFqQKmZbR+WS7jABk1wBgQwKzARILQ==
X-Received: by 2002:a05:6214:d89:b0:6a0:c903:7226 with SMTP id 6a1803df08f44-6b2afceb0edmr56977236d6.34.1718415194197;
        Fri, 14 Jun 2024 18:33:14 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c466ccsm25109666d6.71.2024.06.14.18.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 18:33:13 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfauth.nyi.internal (Postfix) with ESMTP id EDBEC120006A;
	Fri, 14 Jun 2024 21:33:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 14 Jun 2024 21:33:13 -0400
X-ME-Sender: <xms:WO9sZrGDr3M9yJFFMDoJ9j5Em_vWw7Drv280-eBlQPYlaGibXhk7gg>
    <xme:WO9sZoU0Lh_J7h98Ni7BCJSipSjkE79tfSc73niyD67_cguKhlcsfeVenWb8t-u-h
    yuGF_T6nI7bcjG9xw>
X-ME-Received: <xmr:WO9sZtIy2IE4IrSCLJE-CbjiLFfxbL50KUD0MwBMBdmWuo6y-YKAHiz8sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvtddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefh
    gfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:WO9sZpG7McGJkiOf07Tr-3bcCX6gtcNCY-_kz4IWIdQ7KlQF9108Lw>
    <xmx:WO9sZhXnoNQAVua7VD6hOEsSalo_sw-exhJbV4h5kcn1tRLo-5zLuQ>
    <xmx:WO9sZkPeYdZl3MTjaltPRlg_9lw9L8mZWGB8tIUwJXcfhjb8PXKxsQ>
    <xmx:WO9sZg1mvadWOpGtoMoXTNjr030u-nHef8kJ9mJXaflX8OWj7oBbxQ>
    <xmx:WO9sZmXuAPjCCB3tzBS3vywJ9xRo7cfLWsePgDuHS0zIFlOc4x47UqJ7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 21:33:10 -0400 (EDT)
Date: Fri, 14 Jun 2024 18:33:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
Message-ID: <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home>
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
 <20240612223025.1158537-3-boqun.feng@gmail.com>
 <20240613144432.77711a3a@eugeo>
 <ZmseosxVQXdsQjNB@boqun-archlinux>
 <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
 <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>

On Fri, Jun 14, 2024 at 09:22:24PM +0000, Benno Lossin wrote:
> On 14.06.24 16:33, Boqun Feng wrote:
> > On Fri, Jun 14, 2024 at 11:59:58AM +0200, Miguel Ojeda wrote:
> >> On Thu, Jun 13, 2024 at 9:05 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >>>
> >>> Does this make sense?
> >>
> >> Implementation-wise, if you think it is simpler or more clear/elegant
> >> to have the extra lower level layer, then that sounds fine.
> >>
> >> However, I was mainly talking about what we would eventually expose to
> >> users, i.e. do we want to provide `Atomic<T>` to begin with? If yes,
> > 
> > The truth is I don't know ;-) I don't have much data on which one is
> > better. Personally, I think AtomicI32 and AtomicI64 make the users have
> > to think about size, alignment, etc, and I think that's important for
> > atomic users and people who review their code, because before one uses
> > atomics, one should ask themselves: why don't I use a lock? Atomics
> > provide the ablities to do low level stuffs and when doing low level
> > stuffs, you want to be more explicit than ergonomic.
> 
> How would this be different with `Atomic<i32>` and `Atomic<i64>`? Just

The difference is that with Atomic{I32,I64} APIs, one has to choose (and
think about) the size when using atomics, and cannot leave that option
open. It's somewhere unconvenient, but as I said, atomics variables are
different. For example, if someone is going to implement a reference
counter struct, they can define as follow:

	struct Refcount<T> {
	    refcount: AtomicI32,
	    data: UnsafeCell<T>
	}

but with atomic generic, people can leave that option open and do:

	struct Refcount<R, T> {
	    refcount: Atomic<R>,
	    data: UnsafeCell<T>
	}

while it provides configurable options for experienced users, but it
also provides opportunities for sub-optimal types, e.g. Refcount<u8, T>:
on ll/sc architectures, because `data` and `refcount` can be in the same
machine-word, the accesses of `refcount` are affected by the accesses of
`data`.

The point I'm trying to make here is: when you are using atomics, you
care about performance a lot (otherwise, why don't you use a lock?), and
because of that, you should care about the size of the atomics, because
it may affect the performance significantly.

Regards,
Boqun

> because the underlying `Atomic<I>` type is generic shouldn't change
> this, right?
> 
> ---
> Cheers,
> Benno
> 
