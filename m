Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD192877F7
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618459; cv=none; b=N1rqZkzGOKQZ8j+9YvwWLmNbeKbX+C95lC8dc4Z0OF5p8ZuuoBzlUyYwm2k5bxtpOoGIUQuSaHpObnteL2ClnMkO6Y74O6C1hsj+BkxStFw9KNL1TfZ2b67u+syFnjnrSuxBa4bPJaNCapKOy8mYs2eNHOUGWQx6ToKxiB9WRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618459; c=relaxed/simple;
	bh=pMXtGRROxYPlLPH4DHRGNMDWd5KHAZVN6SCVZ3OapRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiPan4aDiXnC1JMj6vB8OFug2du3/P6h+eUpegUV2BJHkPd/qjQkhTgq8IGGNegnlsjjI87/ts5NjCHQPON1sBzL4nGfFC/QX9dsCSo9T0WIgOkBStKTDBf5s8Zr9wpYkllZd5X0wvL8Ij/SGfAwY9wybMr0B4aSDVtdOeAA89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg0OKir7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg0OKir7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313067339e9so113909a91.2
        for <llvm@lists.linux.dev>; Fri, 04 Jul 2025 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751618456; x=1752223256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHSEKYsU05H6zm689vQoHx3pYIDxa35XkhfzWTQQ1co=;
        b=Pg0OKir784/F5gADqGuBvKDhWSm3zkte4BH/nvQCWeVuYq7TuDuOWDWIw4EXl/tO5l
         Z27bE8+Kpjv+qUpZBRfM1S316p1pe4kGKLj8J1+mdus99VvvkEVB9YWtak95vQGCHIq+
         7MPF5FuPDK3GRPeHZt3tsl/dCclCisEUymDVYtH5apgHWbEFEk1O4Co87NchyMrVamIh
         hT8OB3cEuTxKayaJZUkcfRz0vxw/TETdCXs7fTddG0RlxURDZWvtBp2gkYvvdLvSocG5
         cKNCkSjED8eE0KN+A8WqwBjjI86oH48ixw5v4CpV455M7jVSSv1UEN8cJ+F/o5ddIMM2
         EcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618456; x=1752223256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHSEKYsU05H6zm689vQoHx3pYIDxa35XkhfzWTQQ1co=;
        b=gtY8E5TAyGfNWnI/5d8Cc+TowSZhOYijzEvv689md+ECy1V/U9YMEjQwC6xFvIMvnz
         M0nqKs4MWFvaeceFixEYTQAOjGDdDI2RtNkaoTTPXQ6qqERgXvzQHPv/IUswRKC6fMlK
         ZJlI9+Xs2sLbbjI8stTWQ66zz+DkFYuZKCTMvluvrjiC3KLHRT21IKWPOIq13e06EqwL
         WI3QvPuXjNqpcnU6ua4BCzi9aEIn+dLrBbZhrkyfeO49Ak3/g8WzjtlNfLkni0xgwT/r
         PpWnMgHTpNi/qMlVoTVaACyJa79hFBCpqWue6ts4a6KhwZHbjEMkxHSPfoA6d4327Pbu
         7BDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYNpeqHaYfI3wuOVaDUg2SVDYgvrDSY876sczenISGz3SdPT5JOp5EV2h+cxGcH0R5ghUe@lists.linux.dev
X-Gm-Message-State: AOJu0YyjGifvJmt8DPpLPmNz0wCOSiTmSQpbtczQ5JX2T2NnLhIH9xJG
	mdQfDkscMAkUvJY06EWx0o7HQcrEQoVAWks9ItrfavDK6WkNoofPTuFykssG5yFq3safHD/8Zxd
	fZeABVMRPbi02gWqBfKFKNtM2yKuun9A=
X-Gm-Gg: ASbGncsBvvNKfRmz1Tn/l7Lk5TNtkyYL7Qf2/0NRbRpM6EVrrlbS4A4jJu6qypXu5wv
	ndpZy1IBRI+KxjvWSq+QH+1VRfu1xC9dXJPnA4xzf2rrne7MYijiuv1uneczPtDnssPzR20zofN
	A5uyrOE4BjUjNusEbbg1sGgT0sXuhQ7HktoYH8dVSVVpY=
X-Google-Smtp-Source: AGHT+IFMfEXuJ43kSXsdtdWY5bcekIDLYN3gAjscsQDNZrtLRLqrsSS7+psigrvCXRqkKZzl+hRlwyHYKmZ9GwWepBk=
X-Received: by 2002:a17:90b:1dcc:b0:311:c1da:3858 with SMTP id
 98e67ed59e1d1-31aaca78c4dmr1037960a91.0.1751618456422; Fri, 04 Jul 2025
 01:40:56 -0700 (PDT)
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
 <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch> <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
 <CAJ-ks9mkC3ncTeTiJo54p2nAgoBgTKdRsAwEEwZE2CtwbAS7BA@mail.gmail.com>
In-Reply-To: <CAJ-ks9mkC3ncTeTiJo54p2nAgoBgTKdRsAwEEwZE2CtwbAS7BA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Jul 2025 10:40:43 +0200
X-Gm-Features: Ac12FXwGbZyrddKNNViyoD8x6yBVbP3kVI8pI2AlPxz0BjAZk4Lec5cu34XzXTU
Message-ID: <CANiq72kta=Wk=3764A5SzxB6Mq=sJfm9DyMZXFC91ojUSj1TeQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Tamir Duberstein <tamird@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Benno Lossin <lossin@kernel.org>, 
	Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
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
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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

On Fri, Jul 4, 2025 at 12:46=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> There's also a tactical question about splitting by subsystem: are
> there any tools that would assist in doing this, or is it a matter of
> manually consulting MAINTAINERS to figure out file groupings?

As Andrew mentioned, you can use that script, though I recommend not
fully/blindly trusting it.

Sometimes you will want to adjust things, e.g. sometimes things may be
related even if in a couple different `MAINTAINERS` entries, or you
may want to adjust the flags the script provides to filter, or you may
want to check `git log --no-merges` to see who is recently applying
patches related to that area, etc.

It is essentially the same process as when you send patches.

For instance, taking the diffstat above, and ignoring contents (i.e.
assuming all lines could just be freely split and without considering
other splits discussed to make the patches smaller first and reducing
the flag day changes), I could have done something like this:

    drivers/block/rnull.rs       |  2 +-
    rust/kernel/block/mq.rs      |  2 +-

    drivers/gpu/nova-core/gpu.rs |  4 +-

    rust/kernel/device.rs        |  2 +-

    rust/kernel/kunit.rs         |  6 +--

    rust/kernel/seq_file.rs      |  2 +-

    rust/kernel/fmt.rs           | 89 +++++++++++++++++++++++++++++++++++++=
++
    rust/kernel/lib.rs           |  1 +
    rust/kernel/prelude.rs       |  3 +-
    rust/kernel/print.rs         |  4 +-
    rust/kernel/str.rs           | 22 ++++------
    rust/macros/fmt.rs           | 99
++++++++++++++++++++++++++++++++++++++++++++
    rust/macros/lib.rs           | 19 +++++++++
    rust/macros/quote.rs         |  7 ++++
    scripts/rustdoc_test_gen.rs  |  2 +-

And then those long lines may hint that it may make sense to split the
smaller tweaks in the last group into their own patch, so that it
mirrors what is done for the other smaller groups. Thus possibly
leaving the feature being added into its own patch, which would be the
biggest and the one that would take some discussion. And the others
would be the small ones that are easy to Acked-by or Reviewed-by or
simply take (if independently possible) by other maintainers.

And so on -- again, this is speaking generally, and it is just a dummy
example, not intended to say anything about the current patch. And
sometimes things may not make sense to split too far, and it can be
more annoying than it is worth for everyone involved, e.g. when we are
talking about trivial conversions that could take 50+ patches that
could be automated instead and then applied by a single maintainer.

So it is a balance.

Cheers,
Miguel
