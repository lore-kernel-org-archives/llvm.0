Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE01D90DF
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094012; cv=none; b=BzSn5YTehoSGEAEFcGo+cevEYwL/agOMT7A9dYxHbxHmo3f7cOYUH121GukDRvNe739sba3EYkbXpz8pHfbxV3fPuxk7a3wE7WzPk1vsjd+EgyDFmyjVcP/Myghm7NcL7X4YsdkCuBuoxMaVE5/dvdTInBWGhKccvkn4RHWOFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094012; c=relaxed/simple;
	bh=TUhe462rpaRw+ttM19CVeBJRmw0ypfG6fuqRpsFUOwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gsol30BLr/lFyxS/owqyggvPZwXu3zypFrQUupnltYUmGYPmtc7cdcFli2maV2Iy3LxaFZ72MQ1leci0QRdYD4TOJWxOwEx0AYBxIpywuFfNJapHhu+ONTYzJyABbaH41knXSNWfa1T88BZEAOspCOKwtMm1hvsvGP1I5N5Red4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXXL476p; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXXL476p"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3325cb38a78so57542211fa.3
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755094008; x=1755698808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC1R/DK6yBDoppBpO/ANc/qcnsSJV5b088uYsuMvfZQ=;
        b=FXXL476pMcZoNZJf6gmU9M5+Q1y/5Bde3A4rj99oiLxfgeIRuXaZP5UR5cfvosgJwy
         UcF0LlqV/trDNY4gf6QB6L1FPFxMjU6hVpjLZY5q/wOK/20CXTuRaEfBSnCqjR9YMNfA
         Ds+8EP1oVmDpFRBx/4NlA80bgFxQ/e1S1kunpLHsiGmtltZONh6xu+yA75R+hWFUJUAS
         gfaSRAywOPeuZf51v2ptVBiCpxQvRRG8o7a15b15C53IdcppXtTmiBrKHNAQ3wa6s+PC
         rczQYazbcje7APFtb/ewlbcL4uFRIOlB0UmWNxwKX2kocegEwvr87QPrcpbNC3gHm+6j
         Rs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755094008; x=1755698808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC1R/DK6yBDoppBpO/ANc/qcnsSJV5b088uYsuMvfZQ=;
        b=FEveoT58mW2As5LTg2tzhgx3JOBYOxLThnWTXIW9ML4fmcrBE70ErHUHslcY3ziV0D
         kPwkUrUlsfLIDswyQwCGCXhO+xogLidDUzGwooipzxoa25QaZ3ZYfxtIPLd/PHbcmn33
         xVVdfwbiqt3PzbetaoZibmsD9gX7LCESLVqSJxncl0biLze+NvammqhQmwzXVdbJXRcF
         RkxmRpgl/MUwK7uYTsfeKrzcwl30Jr/2DqxU6hEMFHEJEeIJ7MSfhIae4Q6MuehkffHS
         Cs36L4oB3J/+HwAxWAAIVmkykANTY56Tp3f8Vpzgvse5AllFTjOVUbsxGGR0IQjIddlf
         15+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw2epwTXHkJR1QZ86Z1R90UvQJKkpqB6WeXGoX37YhLJ8V61cexojvqwnZI710p6CWc30B@lists.linux.dev
X-Gm-Message-State: AOJu0Yz61W/zQZsebqMAn7P0KfeSkCAAw+yTHueebU7L6FDIhWshqoys
	GYk13+UrcoLVv7RVxd2W0xDO59VzL9nwibH+odqgWMO8vBZLGVe6ltXgRDYE/5fYsyKwoNKn3on
	j8luc6ihhFcWo6YjT2YBqwLkTsynSZLo=
X-Gm-Gg: ASbGncumLM4QxR88QGTL2EYY2BCdApeo1yM7Wuf4g9IPYQjxsasffsJbK4mUC0WfrR7
	GCvqqBrStadWJKLcBewVYE2ffmK+BKzWXT3xbA5AEhrOFfuqVSYdfhPBXfmywIycFJQugZJcueB
	BR5zSWaJhmaK1QhMJ85yGcs1qzSPNT/P4LnUmYxJ4vpYvNd3pHI6vMtJIrLkif9TJ9+ZffALvAl
	rx43f8Zf/DsGSLhBhkRxYoJlIMJKo4RI9NIWJnV8gKQocFH2t+k
X-Google-Smtp-Source: AGHT+IGlYVXCrZspPz79gXKuhsIHFH9IVC5K+raTW03wdtr4jWtw7isq+6fZau0gAWPODEszswwvfFB6ygab/7W9Pfo=
X-Received: by 2002:a05:651c:1503:b0:332:1de5:c4f7 with SMTP id
 38308e7fff4ca-333e9426d4amr8531731fa.6.1755094007760; Wed, 13 Aug 2025
 07:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com>
 <20250710-cstr-core-v14-3-ca7e0ca82c82@gmail.com> <DC0A9UKTPH05.2O2V0B2KHMIW8@kernel.org>
In-Reply-To: <DC0A9UKTPH05.2O2V0B2KHMIW8@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 10:06:11 -0400
X-Gm-Features: Ac12FXw-kWPtM3xN5Aaz38o05b4WDpB1DVGRJgZzy_fHeBatARY6MtIVInkMea8
Message-ID: <CAJ-ks9n4V-PEDhkTv6SXj_Oh6LB4LdsNi8Nnv_6JbT7dhvnh2w@mail.gmail.com>
Subject: Re: [PATCH v14 3/3] rust: replace `CStr` with `core::ffi::CStr`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 3:50=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Jul 10, 2025 at 4:53 PM CEST, Tamir Duberstein wrote:
> > `kernel::ffi::CStr` was introduced in commit d126d2380131 ("rust: str:
> > add `CStr` type") in November 2022 as an upstreaming of earlier work
> > that was done in May 2021[0]. That earlier work, having predated the
> > inclusion of `CStr` in `core`, largely duplicated the implementation of
> > `std::ffi::CStr`.
> >
> > `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64 in
> > September 2022. Hence replace `kernel::str::CStr` with `core::ffi::CStr=
`
> > to reduce our custom code footprint, and retain needed custom
> > functionality through an extension trait.
> >
> > Add `CStr` to `ffi` and the kernel prelude.
> >
> > Link: https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f=
8e43f1d8d5c0860d98a23f [0]
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Thanks!


> > ---
> >  rust/ffi.rs                     |   2 +
> >  rust/kernel/device.rs           |   1 +
> >  rust/kernel/error.rs            |   2 +
> >  rust/kernel/firmware.rs         |   9 +-
> >  rust/kernel/prelude.rs          |   4 +-
> >  rust/kernel/seq_file.rs         |   2 +-
> >  rust/kernel/str.rs              | 395 +++++++++-----------------------=
--------
> >  rust/kernel/sync/condvar.rs     |   2 +-
> >  rust/kernel/sync/lock.rs        |   2 +-
> >  rust/kernel/sync/lock/global.rs |   2 +-
> >  10 files changed, 106 insertions(+), 315 deletions(-)
>
> > +/// Extensions to [`CStr`].
> > +pub trait CStrExt {
>
> Should we make this trait sealed?

We can -- but is it harmful for someone to implement? I think probably not.

>
> ---
> Cheers,
> Benno
>
> >      /// Wraps a raw C string pointer.
> >      ///
> >      /// # Safety
