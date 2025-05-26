Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E919CD07
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748298626; cv=none; b=jjAauo9v9+/q7rnWrjk8K/tZOqb+uiJQ9oVFDCQ1A0VHpb+q1u0zdAc4ddtlWcclsYzrNISjQmfvNICjx+w0LFofk4EnyzygEUFLXEmcpOd1Jf7UijDrLjD38Jk5bw4uZ5qsLCt/WL4Nce3eCea4AZR2UmQ4KwuqdXazrtfLtcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748298626; c=relaxed/simple;
	bh=P7IpezzEQW0J+xvr79pZ7xwPmXCfC2utnBP44H5MHuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNeYaYPDbveNfjoS72xn5ElAZH5jMYNRWoAXpJS6BrFrVtAomR8JhOXhG/qVgnNnMMW1At7Bf9VF70kMswyJAREV6LygdHBOtbCSqiYErO7L5+vXvlqw8/8OY4NwKsl1YBALS6vsQcmZjBnE+udp8LXqDgF+quFpOABfRpi6LHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zic2pVCZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zic2pVCZ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-31062172698so26343851fa.0
        for <llvm@lists.linux.dev>; Mon, 26 May 2025 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748298623; x=1748903423; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeRtQfopGgqdSMrju5Mssh4B08QuGYql7A9ITbZgjgA=;
        b=Zic2pVCZMQWo+lms5pAFfyUy2Aq3kEjG6TTyVU9iIVHND3U4kocsAe/Yc+RaXZ4tit
         H3zWKRM46ws6y3y1RHT9Kuayse44ZbcdS3tX6r4CmrPBXgwON+agbqQqF5pSPfBUUAsN
         2FsoV4rVUblovqs9Xd0Olr27GioRM6cOa0TrOG9FTL4Itaf+mwOJKb48GJ/LZuOfqp52
         9lESaQHUDC5de6pKx8hzvm6JXldBqcbc5YP2qoCluCBuT80rgl7TDVEOGy2cr7GSNC70
         Yp8+K0yP8YLqSXomK/Mlo97yoJ9yUYVStp9jZRrffMADdRb9/vGr+L5OVaH5I1RbgoKv
         SD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748298623; x=1748903423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeRtQfopGgqdSMrju5Mssh4B08QuGYql7A9ITbZgjgA=;
        b=qVa6pgm5c8QYnOvdTrwgCVV8rNyFnA4FgODLyKMGQYDz2MpW9P7pE7r31akGk7PvIE
         Hoff8hrIyhdnQk4asmwJZIAMglblDUHzDmZZklYlzDWjsTnFhuK9nu6wyoJueEWEhrHh
         cgcSCXTFRI2L/6M5mbOVQx5EJwkpEFELStlQtk6tmxCjUlbBR/ddDMern6tAoYZJ1wtE
         vtRmTZCTqPgsGUoEsMGE/xQWNUoOGnRM49eOMw0SNJ9Toe/mmE3FrUadOvgN3hZ1R4tb
         MYsUk2ZSIcuP4eqzk8y9WPeQ8W9NNSNJi1fBOJ2jWehQdTgt5lQIlVszfU3CmOdaaMN8
         Bz5A==
X-Forwarded-Encrypted: i=1; AJvYcCVQt4omxdB9BDJ0fxiCKbcouHJDXIVpZFFF58uhjJqOao0cpBZmCISK8dvQSkINTIhup7qf@lists.linux.dev
X-Gm-Message-State: AOJu0YwGE1AV41F9xb4cCuDrRrEz6rJai9xsbfhykccNRfu/zHv2S5ay
	tA7IInthTHSiqO/Cy/ySyxPoXMY12ARA267xiXOeSJmF1qJvc0COrPWaaOY5Quzdp6YjO36Ut/s
	0250f6N4Ltv5oYjlWpTl8CkEii/pqODc=
X-Gm-Gg: ASbGnctX3isn8ZdkJ06o0d0HybDCHXd6J2ryFgCpK2yq4kcVBzwADRsZ3TFcXDiTf5L
	2JkY4d5lPsKWKfYA8jBNzERzmCZe207c5oA9tCNpU7XPN4kE/xt3XJ18o6GX4iJe6OMNoYhVc9Q
	+TIdijn1V5WnBewEJKq6InZseHTHbAOxbPMj1qL3HjtGXdmcdNmyJxnT2/zJ6paT7P7mw=
X-Google-Smtp-Source: AGHT+IHobXPM6nV57q0LkxjWMI5y+a9fqFFRAaaAVdT/IiyU5kBtoHLbzkKYgFh6GOZFHTnYbitctcnCYMHIu3rZzy0=
X-Received: by 2002:a05:651c:1b11:b0:32a:6bef:7587 with SMTP id
 38308e7fff4ca-32a6bef7741mr3018881fa.20.1748298622556; Mon, 26 May 2025
 15:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com> <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
In-Reply-To: <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 18:29:46 -0400
X-Gm-Features: AX0GCFuvvdq9fWPFcsB31U1UA0LVEWVFnDG5B-zpmEiF_aWL5P9UrGYE0gqlG8U
Message-ID: <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > +macro_rules! c_str_avoid_literals {
>
> I don't like this name, how about `concat_to_c_str` or
> `concat_with_nul`?
>
> This macro also is useful from macros that have a normal string literal,
> but can't turn it into a `c""` one.

Uh, can you give an example? I'm not attached to the name.

>
> > +    // NB: we could write `($str:lit) =3D> compile_error!("use a C str=
ing literal instead");` here but
> > +    // that would trigger when the literal is at the top of several ma=
cro expansions. That would be
> > +    // too limiting to macro authors, so we rely on the name as a hint=
 instead.
> >      ($str:expr) =3D> {{
> > -        const S: &str =3D concat!($str, "\0");
> > -        const C: &$crate::str::CStr =3D match $crate::str::CStr::from_=
bytes_with_nul(S.as_bytes()) {
> > -            Ok(v) =3D> v,
> > -            Err(_) =3D> panic!("string contains interior NUL"),
> > -        };
> > +        const S: &'static str =3D concat!($str, "\0");
> > +        const C: &'static $crate::str::CStr =3D
> > +            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes())=
 {
>
> Why is this still our CStr?

Good question. I'll just revert all the changes here, I don't need to
touch this.

>
> > +                Ok(v) =3D> v,
> > +                Err(err) =3D> {
> > +                    let _: core::ffi::FromBytesWithNulError =3D err;
>
> Is this really necessary?

No. Reverted in v11.
