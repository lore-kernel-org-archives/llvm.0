Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643161A23AA
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742897594; cv=none; b=X9EG6p+ht4jRBPJxwNT3QJ455EYB02mNwo2PGC8hFHMqAyVYyTowdz00NzFNZwR0R0mv9vHDQxM+YYYQWKXccagCITHt6PaXXSVmQpWW/9XjXHH2OBb9XbbTNLLZzJMqKcCg8XVeJAw9tkDF9WJH0hS201zgL81VfUK4vcy1tdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742897594; c=relaxed/simple;
	bh=EsU90UIiG95rJav2ydFFuzd10jY7lOEUJhuV6bJUvE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpaBHolAQxewLwuZmFp8PgqztioFAJ8UmhbAExJAegPr0GiZPPx5fCd25+PMQwzebRyx4oDfkeQ9ib8Aumb2TiP/pqvIhkyB8DwMg0DK1bJoq3Vb0X+AE+b6bNYM2H9/wNNHAYDdXYwhOiA8bNDXgtBBi/Yvgn0lUg/NIMj+m2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPrrMkgN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPrrMkgN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc3b5so12632325ad.0
        for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742897593; x=1743502393; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEDq1UJUqtq05PctL877nPjaHHGlNyms9RQr2/wNvlE=;
        b=aPrrMkgNn1WuSlUzjHR9JG+b1pqZM6rxGXNFdVqC/pFjDKLu8TZRLsJO7T4FSD81qe
         aurO7JjvbnNDmre7nSwXF/yNDDKGgITVHRORiKhhQp7kgw2TpzQFtq7oN8wqTUP6CHIB
         bsplY2kq8mxTVNxvCAnwfH6CUyiRS+W49EQLOjwWx8gn+gxQILBMgRFCulL1GA1Plg4p
         zNUXc0t8vIMuzjqANUQuDjKMhtbWfVv46UySs+ynpislSHA7HRndMJPhRQVZZrMRVTwI
         rEQwRwLmBXcixdBta33QhphiD9WKaEH2cyv/xTPUp22bJACZQXPqR18PRiTVNn/03o2r
         udsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897593; x=1743502393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEDq1UJUqtq05PctL877nPjaHHGlNyms9RQr2/wNvlE=;
        b=lWDobDG52uus6zUQuRlVf030MV23Px1PEA06WmBwEBpiTD3lmQQlysUQNfcSWIRIUf
         O60EW1ZnKdxh2ER8jP8K1hRZo8DhcMfuTiEzVnkJACYnhbLi3gmVNcqcxUnqHntDohD/
         4L59S7S9k2TFY/OOn3Crq/aRCU6vGITd89tKnV71/yP7dBM9jsgdEBOhq2oVz2m8nDD0
         9nQwBZbjlVdnlrhtJJx6TI9Asf1DMgF6PtKUcKvw6csE798hRitxv1vdJmwWUKoEx5qZ
         oY8vlbW1eGMoPFsCByZtULArUdmFfxttCZRQTb3F6SCntqeqW/UHX3ejgJ8AUmd1LShf
         QPmg==
X-Forwarded-Encrypted: i=1; AJvYcCUP+KLDfxG5bIYzP4FhpmCOqxPtHVVYvV6RawKF+uriL+qhNnr2s73/QuRAqxpcuTdPj1l6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwzk3MnAfGsWu6e0HhLbn7okb4ZFJc1QMhiAjJvs7o2o8/mnXu
	biESqlA+wcTxpUAL9DeGVDyEf3gmO9p6gEekMiLPz5GZBuXdz+2aVXNESHT8lhsyI8zs85labut
	p5bnsdFpUSqSFbEZzzi1h5UYlUsg=
X-Gm-Gg: ASbGncto3GtNTxNnDJcnHoYiKeaCFGua7FvBNL3fLGVisXF0EaEnkhSgoZvWEV/Xyeo
	TwWxi57Xdj6YTKFj50PLl5QXyxaQr+vKqSBmIpgwulvu2gCP9Hj67X6Xy5hQzyKiIC+xBghBU+k
	KzCaB7+EJJ0SNuA/N5e3jh53fBFw==
X-Google-Smtp-Source: AGHT+IGNIu/26kDQcyv6aovbIEaxRmM9jIjrb8hE/W/g3KOwMrnzrKUZGYd3te7lujLCPoR0R3YJ3Fd4QcZ+SvYxRao=
X-Received: by 2002:a17:902:ec84:b0:224:10b0:4ee5 with SMTP id
 d9443c01a7336-22780ba2e0emr81920905ad.0.1742897592462; Tue, 25 Mar 2025
 03:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324061835.1693125-1-kunwu.chan@linux.dev>
 <CANiq72=KjT8HRJA0NStHeqm-9286gay496CU8edNALPQ9_N+ww@mail.gmail.com> <52e7d34e-cf86-40d6-a294-b318df98d72a@linux.dev>
In-Reply-To: <52e7d34e-cf86-40d6-a294-b318df98d72a@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Mar 2025 11:12:59 +0100
X-Gm-Features: AQ5f1JqyCfGL5XbhQM2bU_PPn0fepDdpk4JpK1BPHHTum3dXPrHhVO5NorHN1DI
Message-ID: <CANiq72=iMaEOALbh8EBrgEc5t0KQ2BTPADro3vmBtEM75pO3aw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: optimize rust symbol generation for CondVar
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 4:02=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> Thanks for the kind reminder, I'll follow this next time

You're welcome!

> Now, the default '-Copt-level' is 2 when define
> 'CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE',
> and in  KBUILD_RUSTFLAGS the  '-Ccodegen-units' is 1.
>
> So if the config not change, the result should be the same.

I don't think that is true, because there are a few `rustc` versions
as well as LLVM ones that we support, so how inlining happens (at both
`rustc` and LLVM levels) may change even if the configuration is
essentially the same.

And, of course, then there are other non-compiler-related kernel
config options (i.e. not compiler flags, but other stuff, like `cfg`s)
that influence which and how gets emitted and thus the inlining
decisions.

Eventually we should have pure GCC builds too, which is yet another factor.=
..

To be clear, I agree with Boqun that having to write `#[inline]`
everywhere is not great. Rust 1.75 already started to tag small
functions as `#[inline]` to try to prevent the proliferation of the
attribute, which is good (i.e. which is what triggered the message in
Compiler Explorer).

By the way, one difference is whether it is `pub` -- the `notify()`
isn't (unlike the others), but if it were, then we would have needed
the `#[inline]`, from a quick test.

Thanks!

Cheers,
Miguel
