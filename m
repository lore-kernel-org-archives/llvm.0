Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062882D3A94
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630347; cv=none; b=hD3BxsrTiu5ju4L1oQPUmC+tV9tslbw2YlpKMqTQMcqAPDapFdROKkWJDqke1CR8iZdWDqdYFGr/dFqdmhjYQpIHByS2is63kUWvV0HXEvhQRew41fWfpPxaB+/s/1YBom2qUqcOQdrN59N/i4fMfTLkPPtxsFtjktSqQZ1SDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630347; c=relaxed/simple;
	bh=mKUAfa6GAdUfi2Bvssbgn4xEiZsMisIFcKKgtP5vijk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+6pSwIttWZtlm/vyngKdt/aKt0MwvdJ2Wcg53iWJLfa2XFkvt8lO6HpkgJ3CNnBXqID5w3NqVkUhHer8cajBPioozc/FlfH0XBnMT6OD/rIxjEpsLSauWYw1/gUvDRDPAiASKmUCNcZmXug18AWPOsTMKacFXHWihwD1bh0x5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAOay2hA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAOay2hA"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1242728e87.0
        for <llvm@lists.linux.dev>; Fri, 04 Jul 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751630344; x=1752235144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX2ezheHMTwCnwKIKFQeSSolcoT52guQ9m4zT7OdyqQ=;
        b=EAOay2hAaXRyT7tOcJYU6NWjwjQk26cRcRQcUP+rPGrQtgcwhZQjN2Db2V6q1Pjir3
         M/oTsjmgrm1swe+vsLlKp6vpGlFNBDQ6sxJMsw6DSyLPheFhXps3+N31EulMV+XFZ4Hm
         56qYRaRxGIpBBDczVzFAs9PbIqyagdBe2exUC/0zWsRyVvPIl+RG2a7cWqu9qDxf6Dqn
         D+dgvNI5hdzpcrO5ZPz8JO9jXWm/Bn2tVWApR+7ks4LzDTjqLif3hbvv27NPi/E2PsYR
         2QQ9PTJHK+4a4Y0APZ51G8fYpLrdaruUljFS6ekFUwCFYOLkh2/vGolOhr8D1FIVf2Xf
         RxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630344; x=1752235144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX2ezheHMTwCnwKIKFQeSSolcoT52guQ9m4zT7OdyqQ=;
        b=PW5OKGuVz7i9C70CI+lb7IA0Kern6QFdHzr0mBCL1oTGwfCqLODMxsMoJWYuLO6dNo
         TKTnpQbsXu//KMId2uOOtd5nW01fL6l6eioZAUZMc9HfqR+RLX/2a89RsXuduTqBg6lG
         FbSafAK0og+Wae8o+ABXDQC+4bnmLw2XMD15R2dG/f5iceGzq6UnAO9Q5MPtdcDxhvyl
         pOvDnVymCWh63fEmJzTWq/9tR3wnHNXd9LvHkE4v4BuplbUlJOGtd4G8zQj5xixbwR54
         kHmfg4AdXpvD9dIwmd6Bsw0sCxSo6vPjXGFCL/vom0k+8Oqdb6HuwNrVQ7pe7CvfzIhX
         O11g==
X-Forwarded-Encrypted: i=1; AJvYcCUSCm9N870ZahK0sq07/j1kAmX2FLLOLWhyqOm/uaRSNZR2RZ29zBtbQeHD5cU5wvucdrni@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ/+y3dXaM0W28e/xaX7YM6ebuEMW/rdn1911kDZRN8WcHsNxO
	In/WY+QALZxIOul5fRbS37LX8oTuh+Z6cCyBYFBNrMCvcfM3of2fHNumcjUSNl5hcYe+Uqp+zoE
	y+kecDYgDt1034aT5JFlOosg9k4rXNYc=
X-Gm-Gg: ASbGncsfDilTipF1ncQD4hn2wGMoqXdCbCVy09mtiGcmzYtFYIbeqxGa4JfUy33AjyD
	bkpo51RxFylmco3CfQ5sGqvWkoDiJvlxND0aGqv83lu2LCydWI/960u7r0JbQWyUx0qoKxhyyFq
	XE2PJLWxqEekC6kFqALO5oEMiV9MX3V2zr31SqVjyySpjsbSL9BIPloVcUtaIwR5mRrTAoko5jb
	W66zQ==
X-Google-Smtp-Source: AGHT+IFprJqElpi5vcjeJ23fLLN3WMzZLZ0CrkVny13pfXY112X2yXfPm/SOjbYZcibT+i59JoBTBmJ65qELc434iFo=
X-Received: by 2002:a05:6512:2528:b0:553:2868:635c with SMTP id
 2adb3069b0e04-556e60879d0mr712367e87.48.1751630343665; Fri, 04 Jul 2025
 04:59:03 -0700 (PDT)
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
 <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com> <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
In-Reply-To: <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 07:58:27 -0400
X-Gm-Features: Ac12FXwwR0QTbVNjts9p85kYh4knK1uvCt11R29enEo0nBiKI492OfZj839T-II
Message-ID: <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
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

On Fri, Jul 4, 2025 at 6:09=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Fri Jul 4, 2025 at 1:23 AM CEST, Tamir Duberstein wrote:
> > On Thu, Jul 3, 2025 at 6:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >> On Thu, Jul 3, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >> >
> >> > I don't understand, can't you just do:
> >> >
> >> > * add `rust/kernel/fmt.rs`,
> >> > * add `rust/macros/fmt.rs`,
> >> > * change all occurrences of `core::fmt` to `kernel::fmt` and
> >> >   `format_args!` to `fmt!`.
> >>
> >> Yes, such a split could be done - I will do so in the next spin
> >>
> >>
> >> > The last one could be split by subsystem, no? Some subsystems might
> >> > interact and thus need simultaneous splitting, but there should be s=
ome
> >> > independent ones.
> >>
> >> Yes, it probably can. As you say, some subsystems might interact - the
> >> claimed benefit of doing this subsystem-by-subsystem split is that it
> >> avoids conflicts with ongoing work that will conflict with a large
> >> patch, but this is also the downside; if ongoing work changes the set
> >> of interactions between subsystems then a maintainer may find
> >> themselves unable to emit the log message they want (because one
> >> subsystem is using kernel::fmt while another is still on core::fmt).
> >
> > I gave this a try. I ran into the problem that `format_args!` (and,
> > after this patch, `fmt!`) is at the center of `print_macro!`, which
> > itself underpins various other formatting macros. This means we'd have
> > to bifurcate the formatting infrastructure to support an incremental
> > migration. That's quite a bit of code, and likely quite a mess in the
> > resulting git history -- and that's setting aside the toil required to
> > figure out the correct combinations of subsystems that must migrate
> > together.
>
> So here is what we can do without duplicating the logic, though it
> requires multiple cycles:
>
> 1. We merge the two `fmt.rs` files & each subsystem merges an
>    implementation of `kernel::fmt::Display` for their types, but keeps
>    the `core::fmt::Display` impl around.
> 2. After all subsystems have merged the previous step, we change the
>    implementations of `print_macro!` to use `fmt!` instead of
>    `format_args!`.
> 3. We remove all occurrences of `core::fmt` (& replace them with
>    `kernel::fmt`), removing the `core::fmt::Display` impls.

That would probably work. We will probably see regressions because we
can't just replace `core::fmt` imports with `kernel::fmt`, so new code
may appear that uses the former.

I think this discussion would be productive on the next spin. The
changes in other subsystems are now almost entirely changing of import
paths -- perhaps that would be sufficiently uncontroversial for folks
to give their Acked-bys.
