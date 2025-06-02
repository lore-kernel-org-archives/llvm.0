Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED91EEA9
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861396; cv=none; b=H8jIwK5rdG0oYqTT2d4ntm+zqPbGw4TJ5AzPQD8Qm1c1cLwLZP3/G2iCD/aOmc3bj+Z26bmMp83tCm5+uAanXFlsdcL/dUD39CohOyDdZ/+XWQ7ycynfEgHxvwdh9eKfvzxCsCs3WEQQaHwDLaO8al9XXv0xhK15mi5TIKc3Hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861396; c=relaxed/simple;
	bh=9WaAM0DFviW3Ug8kMcuL6hIx12rSZL33x0znJQdobt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTmGrYBSM0zf/tjZQ54/hR63r4+pVbon48KCoaKXgHkHy5YPp4iVpmyUULqDUEFlZzuLB3Sv5OU9LRKCsSiQjoJMQzLawR9/M3Z5ZN+n5VhjaZBGd4+Io/svoZJd3Q568uHzCDyQdFNTP9Lwqvypph/8RsAPUAMIODu1YSNTVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOUfKffL; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOUfKffL"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-31062172698so41507441fa.0
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748861393; x=1749466193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsxbXe8qRFrC4RTDRdhQf2KM3tIF4wckI+MuVJmqklg=;
        b=bOUfKffLUJJwTGQ4rLE4lvTgN31JygJPtXv5rx/MHpriu0XaywnzL4FHsmr2kLXBbV
         9CeYzhDDjWUWijFRShG107ty41kOAd5/CZKlsKe+hWEqxJDgRcdr1IRCc1ZCeW7pCyN+
         0k/HuDSe56mp1J4E4beDBu9nvoVJWMf5Ds01W2H0ES4YNtjzoceI69jjv6Nmqt68ZlEl
         UUkJphGiXXyg9j6ZKE+33D+ayNy1otKrFpjjTZ+I+RJdTXEQf3UUCNcBO/b/hSb8xcxs
         tlxLZFZS+YFr4QQbPwbhF4pRpKINlr5KsnKAgsdqe8ny42MyMy256Yigdaoijw9BouoO
         Pp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748861393; x=1749466193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsxbXe8qRFrC4RTDRdhQf2KM3tIF4wckI+MuVJmqklg=;
        b=e9gYThPv3LP9wuTb6y/s907Peqa93dTIxmV5AwLOkHO4t8oElnRyww4AYboG0ks3eB
         k39JfM1SeFSHlu6E8tu1NbbYkthuaaInuKBfzfhJ18+cHU2XDY3INMQBY8xdOyI+Ps0g
         A4PneI1pL40B0WwzNJSqxbwAAiOFk55yE0IUjE/FiU/Mh07JDUhMAssTKAncVEt3Tf17
         VOiKtoFvLLz2ffN/X3s3BHi2iplhMZLSGw0eWnIqlKkVWXuW2s/8QPhf7qmRg3KIoonb
         y9nJBrO42AVYBo21Dab2fE1A0qmubR9+8Be8o0mx+yyJ+6Ku/Zr1aUHB+CtYlSDCxtvC
         hx5g==
X-Forwarded-Encrypted: i=1; AJvYcCXzvdv6TbjwVQIQdVibNAzKNVf+c+W2Gk034i/5YtS01TdfH+aQO9H7bmCUhz6wDgzInHU4@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7mUwHocKsfnf/74WvnIconWTbREgk2BTY/dmzDtNRdHBOeaZe
	X8s49QXw9Iku260EG+auhWJifzy8lob5/UffkRim8o/Wi2x4zn5+yuQzwdO9FYlZs5M4Ic5TCwl
	03Czss7g4MQySihlb2godTg+L6Ugs/ds=
X-Gm-Gg: ASbGncvrF8o1kIrZj8YidSCx6/BxxF5Kkxqq7jpeXtmOagGDXaVPx7D2nTeos7f8uaK
	zD7mGQXgRZVlu7tdpdknfCMyVf3+K8+Dr2uUj+l8j+7Wnpi6KQGUquDpKiStfoLA1kyQjitoYR4
	tcMrfzCbyy3rWbPuR6R285FtgSh9U2cYpWsqApTrFrGn+IdrgQdncWs1WIz3pvs6eHza0=
X-Google-Smtp-Source: AGHT+IF5DWduxzl0/XGIjOoG2XZtzGtCfUO0aae++aWVjLV4gjiYEpeAaDYwqvBq64IuoR3CqF43l9YblyYjyY9SlHs=
X-Received: by 2002:a2e:9a0d:0:b0:32a:6a85:f294 with SMTP id
 38308e7fff4ca-32a9ea8fcabmr18219761fa.35.1748861392393; Mon, 02 Jun 2025
 03:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
 <20250530-cstr-core-v11-3-cd9c0cbcb902@gmail.com> <aD1k4rRK8Pt5Tkva@google.com>
In-Reply-To: <aD1k4rRK8Pt5Tkva@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 2 Jun 2025 06:49:16 -0400
X-Gm-Features: AX0GCFuWGPYle2xpajsjX9J5Dr7DqqKyrlmViDc69KiPl9rdFF48mQDz9UTJ46o
Message-ID: <CAJ-ks9nx8fbm5J1yKfg4a1OOgBepu0LFFjdtomE=j4Gkszj=fA@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] rust: replace `CStr` with `core::ffi::CStr`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 4:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Fri, May 30, 2025 at 08:27:44AM -0400, Tamir Duberstein wrote:
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
> > C-String literals were added in Rust 1.77, while our MSRV is 1.78. Thus
> > opportunistically replace instances of `kernel::c_str!` with C-String
> > literals where other code changes were already necessary or where
> > existing code triggered clippy lints; the rest will be done in a later
> > commit.
> >
> > Link: https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f=
8e43f1d8d5c0860d98a23f [0]
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > index 2494c96e105f..582ab648b14c 100644
> > --- a/rust/kernel/firmware.rs
> > +++ b/rust/kernel/firmware.rs
> > @@ -4,7 +4,14 @@
> >  //!
> >  //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmw=
are.h)
> >
> > -use crate::{bindings, device::Device, error::Error, error::Result, ffi=
, str::CStr};
> > +use crate::{
> > +    bindings,
> > +    device::Device,
> > +    error::Error,
> > +    error::Result,
> > +    ffi,
> > +    str::{CStr, CStrExt as _},
> > +};
>
> Did you not add CStrExt to the prelude?

I did, but I didn't add the prelude to all files I had to update. This
one, like others, doesn't import the prelude.
