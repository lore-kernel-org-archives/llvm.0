Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70752D9499
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 23:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585045; cv=none; b=OA6O20SfYLaVeGgy/Ojy7+7U0MrXvENIBLAFTwvEJbvvcq3mG1G5UbI9qU5XXEbr9u4T4h2hPNBawrvraPuozixbfPN2C4R15FO8JTvX+fhGih1EaQMl8pumSItvnv+HsEmcVeYg9rYWLyL/AOHRmKefPsqq/FadHuXGLI2LuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585045; c=relaxed/simple;
	bh=nJsInj/KQx9EGZtnfCPTimlBjeCBkdNYOhqpDUWoVDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBxl8owFfTYp252jN9lEq182f4ZnQvcgBNTYAGsFe1D/WnmpHOVof2UUQ5zceV/fmZ1+GHCFrJzgn1yH+07br1Ll7g/AhdEZQpLP7ZBf6ybbPgf9AeKEWapsbnKk91YT8YWlxVSQLcG2EULEtU6ZR0hkSV5fOiX5EOLLXcnhMoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNewV8kw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNewV8kw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so3814341fa.0
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751585042; x=1752189842; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtvbM0ZJbl7PRtVkId0uy2JLD6jAbUhYMSmm1BPeVlY=;
        b=kNewV8kwT72CU6s1gGf2aV6iVSw9u/TU8u/vm+sQ7c9T7MUTvnvKlmIc8YnU865t5C
         1L2uGYqV60iD1eqSKpCtPvz6EZoDEcYmPzw5XnCsrrzw43TqZ6uhdyip+SnsbGg4t/lh
         AslqxmhNWDZZ5iWmEcAEXkJrSGtUPCofvgTZuMAQtmXhx+x+Pue1aymaK+LNxsr7cDf7
         /skwCr2Vnxn4SCihgrTzdOYb3jhFhgYlVBmg3DxBhDn1bzrs8j9CjFj6/mG6Izvr19pE
         jaWyBOnZ6aKyPr4wJJe/0ofRBBTpBBr8jfNmI+JjQmuU4S+LqYKNZVMETSXEGkhL1Hpg
         rBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585042; x=1752189842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtvbM0ZJbl7PRtVkId0uy2JLD6jAbUhYMSmm1BPeVlY=;
        b=OHzixSVPkuGotmtCDjs6469ixywXgdVeSyZ2G01pa0BTVCpcBaWGu4CLQ6g151dPSR
         EjjYkoqca4rQiaEEgB7qVlXOcoJqDT/ED+sC+U38gTcoDUJQQrelhVJnjqNMhhY1jqys
         Ay8dMxSQ0vOKps2X2pS5w3LDht/bRbGyvWJwJi4p8vtWoWVi44YbzrhIbaL+uOfmKr+B
         6LWWuJU+leMlnJyQn3HE53Vxx32xrwsKcdtuideZ3bSvY/BD+87fivZmXjK4RP2S6spU
         UWc4MLj7xOrwCC9vA/Z0E75C0KZgEUYtmZffxuw/K6Oz1zGY8c1b67fc1D60ygbhifbx
         o1dA==
X-Forwarded-Encrypted: i=1; AJvYcCXe2v07atLjMx+7NuKb2qjazoOW+v/57OPjZ5q00XK2tML3V9BmSs8w0FjALANhI/GrhQCU@lists.linux.dev
X-Gm-Message-State: AOJu0YyqJuR1rJU2hn8N9KaWGpzYNZm+onaPFLYgSr/tp1JZeFvHA4C0
	L3sbZUNd0371N9dSQOooHPQa9UdxQujP8fDQM5NpUXYhtLzCpPvIai34G+HgtQ8tGh4CUI6vE8d
	90/5sIptdlLMbb2AnBNQiKf4M+fa7oCY=
X-Gm-Gg: ASbGncuV/ClyaXBVQkWZE8eBsXxd8yuuvY87Tlpb0MpAkvRtys+H8V73d73gRZdUhw6
	Wa5Qz+zAfy8pyxe1U9+9HQQER16+Opaj0+7dU10Mpq6LSbmtHlTmMNWcf1f338p7w378II606n+
	3jrKDkCSLFBYXEWfafkLLY5V5f8TGGxx2FlCz2Qgqk1n8+RFV8gGNjn7kgkJTNOgh7lvZkU2kHD
	mdVl+mTy9i3IWdn
X-Google-Smtp-Source: AGHT+IGEPG+g+OxH8rOfSaGvbFyeTmDB+1fQ7xPcfMGDOeGLeCcig+uAF9z9wcJ3Z5LOomVIJicrX6bQd17nnYWnOI4=
X-Received: by 2002:a05:651c:2155:b0:32a:604c:504e with SMTP id
 38308e7fff4ca-32e5f62cdfcmr641231fa.38.1751585041586; Thu, 03 Jul 2025
 16:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com> <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org> <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org> <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
In-Reply-To: <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 19:23:25 -0400
X-Gm-Features: Ac12FXySgZtzHdWG_UZyVlFR27yExYl4PiFasz3P6nXfOoJ_ZKfjtj833w6aTPo
Message-ID: <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
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

On Thu, Jul 3, 2025 at 6:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Thu, Jul 3, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
> >
> > On Thu Jul 3, 2025 at 8:55 PM CEST, Tamir Duberstein wrote:
> > > On Thu, Jul 3, 2025 at 11:08=E2=80=AFAM Benno Lossin <lossin@kernel.o=
rg> wrote:
> > >> On Thu Jul 3, 2025 at 3:55 PM CEST, Tamir Duberstein wrote:
> > >> > On Thu, Jul 3, 2025 at 5:32=E2=80=AFAM Benno Lossin <lossin@kernel=
.org> wrote:
> > >> >> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > >> >> > Introduce a `fmt!` macro which wraps all arguments in
> > >> >> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This=
 enables
> > >> >> > formatting of foreign types (like `core::ffi::CStr`) that do no=
t
> > >> >> > implement `core::fmt::Display` due to concerns around lossy con=
versions which
> > >> >> > do not apply in the kernel.
> > >> >> >
> > >> >> > Replace all direct calls to `format_args!` with `fmt!`.
> > >> >> >
> > >> >> > Replace all implementations of `core::fmt::Display` with implem=
entations
> > >> >> > of `kernel::fmt::Display`.
> > >> >> >
> > >> >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > >> >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/2880=
89-General/topic/Custom.20formatting/with/516476467
> > >> >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > >> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > >> >> > ---
> > >> >> >  drivers/block/rnull.rs       |  2 +-
> > >> >> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> > >> >> >  rust/kernel/block/mq.rs      |  2 +-
> > >> >> >  rust/kernel/device.rs        |  2 +-
> > >> >> >  rust/kernel/fmt.rs           | 89 ++++++++++++++++++++++++++++=
+++++++++++
> > >> >> >  rust/kernel/kunit.rs         |  6 +--
> > >> >> >  rust/kernel/lib.rs           |  1 +
> > >> >> >  rust/kernel/prelude.rs       |  3 +-
> > >> >> >  rust/kernel/print.rs         |  4 +-
> > >> >> >  rust/kernel/seq_file.rs      |  2 +-
> > >> >> >  rust/kernel/str.rs           | 22 ++++------
> > >> >> >  rust/macros/fmt.rs           | 99 ++++++++++++++++++++++++++++=
++++++++++++++++
> > >> >> >  rust/macros/lib.rs           | 19 +++++++++
> > >> >> >  rust/macros/quote.rs         |  7 ++++
> > >> >> >  scripts/rustdoc_test_gen.rs  |  2 +-
> > >> >> >  15 files changed, 236 insertions(+), 28 deletions(-)
> > >> >>
> > >> >> This would be a lot easier to review if he proc-macro and the cal=
l
> > >> >> replacement were different patches.
> > >> >>
> > >> >> Also the `kernel/fmt.rs` file should be a different commit.
> > >> >
> > >> > Can you help me understand why? The changes you ask to be separate=
d
> > >> > would all be in different files, so why would separate commits mak=
e it
> > >> > easier to review?
> > >>
> > >> It takes less time to go through the entire patch and give a RB. I c=
an
> > >> take smaller time chunks and don't have to get back into the entire
> > >> context of the patch when I don't have 30-60min available.
> > >
> > > Ah, I see what you mean. Yeah, the requirement to RB the entire patch
> > > does mean there's a benefit to smaller patches.
> > >
> > >> In this patch the biggest problem is the rename & addition of new
> > >> things, maybe just adding 200 lines in those files could be okay to =
go
> > >> together, see below for more.
> > >
> > > After implementing your suggestion of re-exporting things from
> > > `kernel::fmt` the diffstat is
> > >
> > > 26 files changed, 253 insertions(+), 51 deletions(-)
> > >
> > > so I guess I could do all the additions in one patch, but then
> > > *everything* else has to go in a single patch together because the
> > > formatting macros either want core::fmt::Display or
> > > kernel::fmt::Display; they can't work in a halfway state.
> >
> > I don't understand, can't you just do:
> >
> > * add `rust/kernel/fmt.rs`,
> > * add `rust/macros/fmt.rs`,
> > * change all occurrences of `core::fmt` to `kernel::fmt` and
> >   `format_args!` to `fmt!`.
>
> Yes, such a split could be done - I will do so in the next spin
>
>
> > The last one could be split by subsystem, no? Some subsystems might
> > interact and thus need simultaneous splitting, but there should be some
> > independent ones.
>
> Yes, it probably can. As you say, some subsystems might interact - the
> claimed benefit of doing this subsystem-by-subsystem split is that it
> avoids conflicts with ongoing work that will conflict with a large
> patch, but this is also the downside; if ongoing work changes the set
> of interactions between subsystems then a maintainer may find
> themselves unable to emit the log message they want (because one
> subsystem is using kernel::fmt while another is still on core::fmt).

I gave this a try. I ran into the problem that `format_args!` (and,
after this patch, `fmt!`) is at the center of `print_macro!`, which
itself underpins various other formatting macros. This means we'd have
to bifurcate the formatting infrastructure to support an incremental
migration. That's quite a bit of code, and likely quite a mess in the
resulting git history -- and that's setting aside the toil required to
figure out the correct combinations of subsystems that must migrate
together.
