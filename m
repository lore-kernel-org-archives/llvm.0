Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC81F03D5
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751657973; cv=none; b=bB5jPKLs4oVyUrpRdl6GctCQ7iMOrYIuVzPwxFcqLqNMKCDZ91UOvppTJJFQISURivDJU+l+cRE2y+Ri80DcrdJTVdnUv3HDd1sUqBsFs/F4/RPGo9lyUB8E7bWR8FdsY737GiWrqE/WNcgsD8Nq4c/+4zoDP+o/t5v1YmcNfEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751657973; c=relaxed/simple;
	bh=ty9V8JMAdvvmDv0P0k4PGgC/jV1j8pI2d1WXBXRtpJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZ/IV4rgiavEdPXn/WiOxNcdii4rhQAQRTOnUeG51Pmce/PiJNm8a2f8Tc1ILrQF+Qg37bWBgiP9N7VmS1O17fl7HlnOKvdQeShHGTstME/zZhayJNROYQo65NC6FlR3+8x6xpxLo4fWFiUSZgrCQcTRxoAsgdWEwhr7m7Ph64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vvx2+klM; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vvx2+klM"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so12431951fa.1
        for <llvm@lists.linux.dev>; Fri, 04 Jul 2025 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751657969; x=1752262769; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaN1iXlsiktU/ZIaAdJUYYtsPKiTgtwWPQpDE5mPO2Y=;
        b=Vvx2+klMfW6w/QqDuyoL/orwQ60MMi4bGvKhTqx9rYbyr3Dxfg8+TbKGuI1E/6L6aD
         A1lE6/fTJCfqlFjSwGmCoOJgj2DHh+gOWHruWeJ4qozNCTmL2dysnRCx8PzmxJUzTDW8
         ZSM6nrQL/9s9iQfm+alW0y+3u7/azimsUrIGE8z3I/JROYAnR0yqxJ+pmvUnCoqMEtbU
         tpKRKpHQOlI+CMxMTyiCh+4k8oB/FssA75b5t0eZusybvGBp6jzgd+gDyWo61cnBkEFz
         0vskRR/0ZPQSB4l3Tp6ENSQIWGWSQtnj/8gCL2jJlIrkxfjzOu5bs0QJe+UTjtAo9Uwg
         62Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751657969; x=1752262769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaN1iXlsiktU/ZIaAdJUYYtsPKiTgtwWPQpDE5mPO2Y=;
        b=SXZMSleIarrVfNjsZlAg2fXxzzdD9DL76miZIpRD+aF/HjkxD6nmO4uldAsBBMfeI/
         iddiLPFh6YOD3Yj0tFvL3Lx2i1RfHVKGSkJVv87VKC8qpIKwyhVWpiSuRe6ZZwwD/h9P
         Rlq6x+QN9s60L7A0m2lCoGwSBGUvEsUDAsDLYXnaRMZl4lMLqFaeOrDiGXeh+1xzuOjH
         IVXbNiVIbS6HEcZmpIVLskA4CgyxCJ4VFUvvmbvIMBV74ouxzoCo8iBg6NQEVlCjdVg7
         mJxj7fWjTmUBj7vthDjuF4h4MVIUz4CiGwTWGoHwX5nz97Br5kXEgFyhnfqzSRiLe/JE
         kB6A==
X-Forwarded-Encrypted: i=1; AJvYcCWXMY5zBXUOKslxxyT6DaNWMYx1G1QiYuQHDhY2h174GC3FpV+M0fcNovOyopfvaahLmM7N@lists.linux.dev
X-Gm-Message-State: AOJu0YyNbVWBw1dgGStibE9WRWQadT1NADvjW2oWpDn+Qz+6GAJiA5oO
	HhRkPnSPGAd3v9fkmxbXI5kW0L1RMEuERztIB1r/EOFxdmSzUQ3pBnJR5SuYWjbv1tIYZvWFI+N
	51F/IeaWxraiNBASUfEiTMuVvvatqok0=
X-Gm-Gg: ASbGncvnEhpOQNZ4qFgq3ud9dCjMAEzKPIk9ncpyfZzPjhaiWL7jO/HpxowPArw9HjZ
	8gLuGLK8VQ37+4LnfnUykzF7IM8kQnJHy1bbG3g+rG3+F233PtDmrJ2mXtMbJHIWJgK+Vkz9GBv
	kuuWo8Mi2fiFgVuZjS/3/HArzBELdJr49Nu82tyI6LELgaoFMN/k54dpHX+vIZnFRXzrEakWGX1
	t3Jlw==
X-Google-Smtp-Source: AGHT+IEUCasNpOjrLiPTdba+G1DzRMt5tyZu55jlQh+AX9oNhtSkPC1M27OuhbpRgJbummxXICHmkFV1J91gViP7ObU=
X-Received: by 2002:a2e:b88f:0:b0:32a:6c63:92a with SMTP id
 38308e7fff4ca-32f03639f57mr13413521fa.22.1751657968994; Fri, 04 Jul 2025
 12:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-3-29f7d3eb97a6@gmail.com> <DB3AFTUC22W1.39C4DMWSENZGB@kernel.org>
In-Reply-To: <DB3AFTUC22W1.39C4DMWSENZGB@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 15:38:53 -0400
X-Gm-Features: Ac12FXzIFREDgXqCwrv6XJgEObqPEvHKICa5en-HTCiFL74MHyUAIu3tq-_u52g
Message-ID: <CAJ-ks9=Q2+zmBzq36aYnePmRm2b5NL3buMXP36FpmnJ+UU3FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] rust: replace `CStr` with `core::ffi::CStr`
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
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
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
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_panic_qr.rs |   2 +-
> >  rust/kernel/auxiliary.rs        |   4 +-
> >  rust/kernel/configfs.rs         |   4 +-
> >  rust/kernel/cpufreq.rs          |   2 +-
> >  rust/kernel/device.rs           |   4 +-
> >  rust/kernel/drm/device.rs       |   4 +-
> >  rust/kernel/error.rs            |   4 +-
> >  rust/kernel/firmware.rs         |  11 +-
> >  rust/kernel/kunit.rs            |   6 +-
> >  rust/kernel/miscdevice.rs       |   2 +-
> >  rust/kernel/net/phy.rs          |   2 +-
> >  rust/kernel/of.rs               |   2 +-
> >  rust/kernel/prelude.rs          |   5 +-
> >  rust/kernel/seq_file.rs         |   4 +-
> >  rust/kernel/str.rs              | 394 +++++++++++---------------------=
--------
> >  rust/kernel/sync/condvar.rs     |   2 +-
> >  rust/kernel/sync/lock.rs        |   2 +-
> >  rust/kernel/sync/lock/global.rs |   2 +-
> >  samples/rust/rust_configfs.rs   |   2 +-
> >  19 files changed, 140 insertions(+), 318 deletions(-)
>
> Is it also possible to split this? First rename the existing functions
> on our CStr to match upstream & then you don't need to do the rename &
> removal of our CStr in the same patch?

Yes.
