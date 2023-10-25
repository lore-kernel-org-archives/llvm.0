Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8FD37153
	for <llvm@lists.linux.dev>; Wed, 25 Oct 2023 23:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjJ+N8Dp"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d81d09d883dso196430276.0
        for <llvm@lists.linux.dev>; Wed, 25 Oct 2023 16:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698275012; x=1698879812; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=61JSi82jmprMEy2wjLB3v55zpvhJh5bM0LopIsNdZBI=;
        b=gjJ+N8DpmOPab2E2Xg5B/7eHqpTlBCX9+ry0BjYcWngbE9Byzv+dGIhHFdQ/mfuGCI
         fTQt2PHp/5UOcnogzPh0OVaWehoD97/BN3y5iDRMB+j2PEtV63QOACjQ+1R/U48PY1OA
         SRhIgEitPqytTJ2rUCUoe0InWzRvm7XauuwOPCuoTzCH2Wto5aPAgMHFhSexivrfkdYm
         h54weDz//8t8quzJixzb3t9bAKkpz3+obxcQ7KkVSquoK9EsuU99sp18xVYojZ9t+jqT
         hyEZ3zLkdKSrhvjIuBSkgmYUtqfzY47ZOX/bd/By2zynWqx7dgHl1XgK+IRjnMss0Hgf
         5Nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698275012; x=1698879812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61JSi82jmprMEy2wjLB3v55zpvhJh5bM0LopIsNdZBI=;
        b=e2bcBbUC75hDwS3y8nB/vL/Jrgo/dfvGdus3lCXMHLgfUxyKxzUK40BAEH0hD+tdhC
         OXOhwFaceew6Nnt4sB9BwNvfuMaVnMQHRVcwQZtw9n57GwHhKWwSqKJx7ympOKfemVG/
         NzbYuC3Byz5xCQqd3HdNcLiiK2FeeQgivJ7CPJZpl1hhirerB262rUjqjlQz3AGR7qAz
         yVEfEpaYqhh5ONZmlOk3BAncgmC2dnQdHQz547xy9nFJJFVEZ5s989Sd7WPtJH/HvcHD
         THdHuw4Hi8XRGMKKIUeOmkQY5EhadO83DzN+fIBqFqP7I8NTV4PNxgmAWJYMVrc102ps
         N8tw==
X-Gm-Message-State: AOJu0YwF0iMa7s6hCtkh4dbdv4Ay1yFRjHQc9E8yUNktHKXHOJbF39gj
	uTcEUqrWoFAoLoFqVpEAjUI=
X-Google-Smtp-Source: AGHT+IHzO+kZQE6t+6SokT/XjMJiUdNBfvOO3vMCUbf3gh0kZ9vOkSrhSIeP9wvnukh1IIjW55IOtw==
X-Received: by 2002:a25:cfc9:0:b0:da0:68a0:7cc6 with SMTP id f192-20020a25cfc9000000b00da068a07cc6mr3923847ybg.17.1698275011722;
        Wed, 25 Oct 2023 16:03:31 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id m10-20020a258c8a000000b00d9a4aad7f40sm4722392ybl.24.2023.10.25.16.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 16:03:31 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailauth.nyi.internal (Postfix) with ESMTP id 15D0227C005B;
	Wed, 25 Oct 2023 19:03:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 25 Oct 2023 19:03:30 -0400
X-ME-Sender: <xms:wZ45ZXhrsAQv86EZB20iNdVStWugNJLSiSs8UqlV8WOzkdpe3iscVg>
    <xme:wZ45ZUCuQeq1Fm7OMN92dciAz3VWEIKPi3isoU5Jy_HhjiwzD_MfmO3hxdl73AXqq
    a9wQ14E2glff84OkA>
X-ME-Received: <xmr:wZ45ZXEJ5dqgov2_NYos_099EEN_Matr_EBjJtuXtODoXPxOeC9MHdFg1eE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledugdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekrodttddtjeenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeelgfegfeehtdeftedvjeffffdutddtvdduvddutdeigfffheehjeeutdeu
    keeuieenucffohhmrghinheprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
    hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:wZ45ZUT3D_EgD3vYO4rUAkdJ_hj7h1AKSYudX2jVrHUrRPsJrL5ACg>
    <xmx:wZ45ZUwk5yKED0_O9mfPn1S6DyCpCrQEmzr1U-03ZkU6bGSLR_qkHw>
    <xmx:wZ45Za5Y_WVxM_VIkdzobstZ76uBfYKYIPpNf_yGiTzqLqsPJg-8jQ>
    <xmx:wp45ZVRw4Nc-eD9_tWFDJqqPeb_AOUnatoLTu8HK250Oa41qsU7erA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Oct 2023 19:03:28 -0400 (EDT)
Date: Wed, 25 Oct 2023 16:02:45 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
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
	Nick Desaulniers <ndesaulniers@google.com>,	Tom Rix <trix@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Matthew Wilcox <willy@infradead.org>,	Dave Chinner <david@fromorbit.com>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [RFC] rust: types: Add read_once and write_once
Message-ID: <ZTmelWlSncdtExXp@boqun-archlinux>
References: <20231025195339.1431894-1-boqun.feng@gmail.com>
 <VEhpQqgTM0U-aNYRUQ89ICIHW9Eehr66yw92DrmBZcZOah2mLqlz24HxEwDwYPVDOnaigDiZDEVl5mWqZJxoAtRheqTMjzpxuTKe0sr1uZs=@proton.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VEhpQqgTM0U-aNYRUQ89ICIHW9Eehr66yw92DrmBZcZOah2mLqlz24HxEwDwYPVDOnaigDiZDEVl5mWqZJxoAtRheqTMjzpxuTKe0sr1uZs=@proton.me>

On Wed, Oct 25, 2023 at 09:51:28PM +0000, Benno Lossin wrote:
> > In theory, `read_volatile` and `write_volatile` in Rust can have UB in
> > case of the data races [1]. However, kernel uses volatiles to implement
> 
> I would not write "In theory", but rather state that data races involving
> `read_volatile` is documented to still be UB.
> 

Good point.

> > READ_ONCE() and WRITE_ONCE(), and expects races on these marked accesses
> 
> Missing "`"?
> 

Yeah, but these are C macros, and here is the commit log, so I wasn't so
sure I want to add "`", but I guess it's good for consistency.

> > don't cause UB. And they are proven to have a lot of usages in kernel.
> > 
> > To close this gap, `read_once` and `write_once` are introduced, they
> > have the same semantics as `READ_ONCE` and `WRITE_ONCE` especially
> > regarding data races under the assumption that `read_volatile` and
> 
> I would separate implementation from specification. We specify
> `read_once` and `write_once` to have the same semantics as `READ_ONCE`
> and `WRITE_ONCE`. But we implement them using
> `read_volatile`/`write_volatile`, so we might still encounter UB, but it
> is still a sort of best effort. As soon as we have the actual thing in
> Rust, we will switch the implementation.
> 

Sounds good, I will use this in the next version.

> > `write_volatile` have the same behavior as a volatile pointer in C from
> > a compiler point of view.
> > 
> > Longer term solution is to work with Rust language side for a better way
> > to implement `read_once` and `write_once`. But so far, it should be good
> > enough.
> > 
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://doc.rust-lang.org/std/ptr/fn.read_volatile.html#safety [1]
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> > 
> > Notice I also make the primitives only work on T: Copy, since I don't
> > think Rust side and C side will use a !Copy type to communicate, but we
> > can always remove that constrait later.
> > 
> > 
> >  rust/kernel/prelude.rs |  2 ++
> >  rust/kernel/types.rs   | 43 ++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> > index ae21600970b3..351ad182bc63 100644
> > --- a/rust/kernel/prelude.rs
> > +++ b/rust/kernel/prelude.rs
> > @@ -38,3 +38,5 @@
> >  pub use super::init::{InPlaceInit, Init, PinInit};
> > 
> >  pub use super::current;
> > +
> > +pub use super::types::{read_once, write_once};
> 
> Do we really want people to use these so often that they should be in
> the prelude?
> 

The reason I prelude them is because that `READ_ONCE` and `WRITE_ONCE`
have total ~7000 users in kernel, but now think about it, maybe it's
better not.

> Sure there will not really be any name conflicts, but I think an
> explicit import might make sense.
> 
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index d849e1979ac7..b0872f751f97 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> 
> I don't think this should go into `types.rs`. But I do not have a good
> name for the new module.
> 

kernel::sync?

> > @@ -432,3 +432,46 @@ pub enum Either<L, R> {
> >      /// Constructs an instance of [`Either`] containing a value of type `R`.
> >      Right(R),
> >  }
> > +
> > +/// (Concurrent) Primitives to interact with C side, which are considered as marked access:
> > +///
> > +/// tools/memory-memory/Documentation/access-marking.txt
> > +
> 
> Accidental empty line? Or is this meant as a comment for both
> functions?
> 

Right, it's the documentation for both functions.

> > +/// The counter part of C `READ_ONCE()`.
> > +///
> > +/// The semantics is exactly the same as `READ_ONCE()`, especially when used for intentional data
> > +/// races.
> 
> It would be great if these semantics are either linked or spelled out
> here. Ideally both.
> 

Actually I haven't found any document about `READ_ONCE()` races with
writes is not UB: we do have document saying `READ_ONCE()` will disable
KCSAN checks, but no document says (explicitly) that it's not a UB.

> > +///
> > +/// # Safety
> > +///
> > +/// * `src` must be valid for reads.
> > +/// * `src` must be properly aligned.
> > +/// * `src` must point to a properly initialized value of value `T`.
> > +#[inline(always)]
> > +pub unsafe fn read_once<T: Copy>(src: *const T) -> T {
> 
> Why only `T: Copy`?
> 

I actually explained this above, after "---" of the commit log, but
maybe it's worth its own documentation? The reason that it only works
with `T: Copy`, is that these primitives should be mostly used for
C/Rust communication, and using a `T: !Copy` is probably wrong (or at
least complicated) for communication, since users need to handle which
one should be used after `read_once()`. This is in the same spirit as
`read_volatile` documentation:

```
Like read, read_volatile creates a bitwise copy of T, regardless of
whether T is Copy. If T is not Copy, using both the returned value and
the value at *src can violate memory safety. However, storing non-Copy
types in volatile memory is almost certainly incorrect.
```

I want to start with restrict usage.

> > +    // SAFETY: the read is valid because of the function's safety requirement, plus the assumption
> > +    // here is that 1) a volatile pointer dereference in C and 2) a `read_volatile` in Rust have the
> > +    // same semantics, so this function should have the same behavior as `READ_ONCE()` regarding
> > +    // data races.
> 
> I would explicitly state that we might have UB here due to data races.
> But that we have not seen any invalid codegen and thus assume there to

I'd rather not claim this (no invalid codegen), not because it's not
true, but because it's not under our control. We have written doc in
Rust says:

```
... so the precise semantics of what “volatile” means here is subject
to change over time. That being said, the semantics will almost always
end up pretty similar to C11’s definition of volatile.
```

, so we have some confidence to say `read_volatile` equals to a volatile
read, and `write_volatile` equals to a volatile write. Therefore, we can
assume they have the same behaviors as `READ_ONCE()` and `WRITE_ONCE()`,
but that's it. Going futher to talk about codegen means we have more
guarantee from Rust compiler implementation.

In other words, we are not saying racing `read_volatile`s don't have
UBs, we are saying racing `read_volatile`s behave the same as a volatile
read on UBs.

Regards,
Boqun

> be no UB (you might also want to write this in the commit message).
> 
> --
> Cheers,
> Benno
> 
> > +    unsafe { src.read_volatile() }
> > +}
> > +
> > +/// The counter part of C `WRITE_ONCE()`.
> > +///
> > +/// The semantics is exactly the same as `WRITE_ONCE()`, especially when used for intentional data
> > +/// races.
> > +///
> > +/// # Safety
> > +///
> > +/// * `dst` must be valid for writes.
> > +/// * `dst` must be properly aligned.
> > +#[inline(always)]
> > +pub unsafe fn write_once<T: Copy>(dst: *mut T, value: T) {
> > +    // SAFETY: the write is valid because of the function's safety requirement, plus the assumption
> > +    // here is that 1) a write to a volatile pointer dereference in C and 2) a `write_volatile` in
> > +    // Rust have the same semantics, so this function should have the same behavior as
> > +    // `WRITE_ONCE()` regarding data races.
> > +    unsafe {
> > +        core::ptr::write_volatile(dst, value);
> > +    }
> > +}
> > --
> > 2.41.0
> 
