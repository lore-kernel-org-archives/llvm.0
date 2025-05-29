Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A471219303
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748557333; cv=none; b=pY9IXLYcsem3PCgXPCj/ZTIvSJxgPdgKoxX7CzdAzLgxmo6BGx+78YOCVIvbfQE9BtHjui0gL8qrdK78zDWQwv8ivOBckOHDOGQm7QcOOJTpNyQ/TSXYrez18EzQlzc8jOU9CXiH3+bHqFq7khrNrnGTnCOZgaP5xiwOHNxIWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748557333; c=relaxed/simple;
	bh=h+uxh98nAg0a8/1S0TuqkdF8yPeO03QyPmf3K/bLIm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajpTsAtsPNY2AJtdnuqYJBouMU1tjYFF0Z7nZR52qLq2j65ti2yDJfDcw6lcj+n5h6O9cGvfWFzKJF2Mi2lD/ACfsz8oo2aiRHo+vy/2SM2JXQ4cRc7ZSCGtS4+WbfGe8IHozTCeyUG/vQvOxkoXcucBvLzNLXpWom10g0OaPxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBeEptZI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBeEptZI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso269202466b.3
        for <llvm@lists.linux.dev>; Thu, 29 May 2025 15:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748557330; x=1749162130; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzt/MQxcUpDWFeSkaHOplUQ43G4Uz/X3hb9h5NpZQYg=;
        b=KBeEptZIJmSQusjNBYFJiDWONhh8Dy3HlrEU2x2RBzd3tjiyz05N0qtql3nqQLS2c3
         yMyn+rw+TvxoR3SfaM84VacrG/0J6pZ6YBnw2bH15Jwyy1yJhrjJQ+cy0WOPLzwpRZQX
         ANofWIIgKWR/l/hcYjUsZ28tKvh6cxFq/w1zLlBvo8iHaTjSyB4APFcq/atWwKp7VCH7
         8+7a9lKUaewx4N6Z7rfkBg7d21kMVd2GHA01dEjD0UvV931nX7pMQLSK8DL2BymmMTgn
         rA8OhYe/4g7+1vpCAa/sSc2+v2mUZ0tTaGXTC5R0HNUY8VI1XuOMD/9D3YrM1KrbLHjm
         CHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557330; x=1749162130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzt/MQxcUpDWFeSkaHOplUQ43G4Uz/X3hb9h5NpZQYg=;
        b=IjvcE8GEgj92/vf3C/AyMIrhfLWAR0c/FpGw9xYb7WE3rMShi1lqPmt8VfhqtPbbrb
         gwHsuUnWv9MyHsUIzHGP+gH1IKO03SvDYwoemsQoANc9QwPApJgpaIN+FCNSn9NcA6Mi
         sXEmfNHwYNyec7qQXnSjmCt2RDB514OF1FDIMwJZ+ov5yhEOMj5nZ84spbvLip9QoVuV
         DIiIKEaXRU38QZTtQutpAZQrBGEJrdlmRwl78a9pX3JsEARxAP8x4KWHgms+4ym8n+w0
         EbOLqYrjGJ9sgXWRvDYcr1jmbDYffL+SzBHmPrI4MTvtONBQF7AbXOOFoYlcJmjQqKDR
         iIRw==
X-Forwarded-Encrypted: i=1; AJvYcCXIyJ9znq/4bMZlw4VR9uU+04U5lQJD1SPEKH7+tSVaBJcw7P+PqGPLO2hDDeu6jSVpgci0@lists.linux.dev
X-Gm-Message-State: AOJu0YwTEViUdFZFv486frrwjYEza6KMyZE6MmpNf4zP7Kbb+1DV637B
	Wdo+HQtnx/HDc44n9yjV6n2oij4EBEd1pp+UtWonVvHbxEGsSVnbZE5X8mHFNrwFfnQBbXZJYkn
	9LgltjEJdrz4npl9uMwAc3wxaYce6qZs=
X-Gm-Gg: ASbGncu1Il1g1ihS84resXWfxbFiuUWvGFa6vkA9f75m3lnDashzlzJx0X2ZcPzngBU
	rMDb5M9sZx5ui9kTjnXO3F+n9PwYxOZsU+/plK1f8H7fqgIr8+3A9WV92BPDDsPmtKavbHtwq7O
	dKifNbjdcA/F/ykwYbJPROzQFrA1+C4TYeKqMYIC5lmtAqgSI9RDpJr+U4RWwRA2zvAg==
X-Google-Smtp-Source: AGHT+IFIWF7by3gTs9nskHKuDrd5DhLirM+9vmkqnyJc8DqSb/t3iOg3xoZJQ/VvsEAFPlJfLOTUIKCA5jn+ma8BioI=
X-Received: by 2002:a17:907:72ca:b0:adb:229a:f8bd with SMTP id
 a640c23a62f3a-adb322fcfebmr110658666b.29.1748557329539; Thu, 29 May 2025
 15:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com> <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
 <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
 <aDbnLzPIGiAZISOq@google.com> <DA7WJYNAN5AI.2HE6B953GR16A@kernel.org>
In-Reply-To: <DA7WJYNAN5AI.2HE6B953GR16A@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 29 May 2025 18:21:33 -0400
X-Gm-Features: AX0GCFuFM8jRq3YcmcHlgxg8fSyonDU9gdfdyymDZiM0nf24_ZjIqY6KX4ZOh1M
Message-ID: <CAJ-ks9nmxdSKtEuzT=yBU-WEuZXBupr5N6tainzrk=w3U_enXw@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Michal Rostecki <vadorovsky@protonmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:35=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Wed May 28, 2025 at 12:36 PM CEST, Alice Ryhl wrote:
> > On Mon, May 26, 2025 at 06:29:46PM -0400, Tamir Duberstein wrote:
> >> On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.o=
rg> wrote:
> >> >
> >> > On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > > +macro_rules! c_str_avoid_literals {
> >> >
> >> > I don't like this name, how about `concat_to_c_str` or
> >> > `concat_with_nul`?
> >> >
> >> > This macro also is useful from macros that have a normal string lite=
ral,
> >> > but can't turn it into a `c""` one.
> >>
> >> Uh, can you give an example? I'm not attached to the name.
> >
> > I also think it should be renamed. Right now it sounds like it creates =
a
> > c string while avoiding literals in the input ... whatever that means.
>
> Yeah that's a good way to put why the name is weird.
>
> > I like Benno's suggestions, but str_to_cstr! could also work?
>
> Hmm, I think then people won't know that it can also concat? I don't
> think it matters too much, the macro probably won't be used that often
> and if someone needs to use it, they probably wouldn't fine it by name
> alone.

What do you mean by "it can also concat"? This macro by itself doesn't
concat, it takes only a single expr. The example in the docs
illustrates:

    const MY_CSTR: &CStr =3D c_str_avoid_literals!(concat!(...));

I think str_to_cstr is ok - I'll do that in v11.
