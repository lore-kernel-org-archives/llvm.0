Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309851A28D;
	Sat, 24 May 2025 23:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748129262; cv=none; b=olXIaWY2eILJp8rIoSoL2FAsHZt8zCjIB9hWkHCINKHzsprLfFelHsebTL/rGo2Fk6r4gxSMMo+uaZjF8sjoHZV3ZNPimGAp54t+HsV+vuUQOmNFntni0alqVhUQQhp2LlA/RKHMVrjBHzKNdep/HR0i4tGsXMyhtP2peWw19QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748129262; c=relaxed/simple;
	bh=ezmHFIem3dhKgLy8o493wtgw6r/n0DlQ67DFPqd/Its=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcMJweXxv2UzStr9lm46oMy2sfGi718WsB59rL7bGtTmBuDkW0/Z9Sz2Pa2FYCPz75b6sq9jRcdK41PwD+ndCSddum7NpI6TMOzHD6pwMqKitsWyM43z2jNwrfttXgIRY6oOLeoz1NkxB9Ljp3LK9Ia1XbND1SGYxSbNHCn5RWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpOaQ8Qw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpOaQ8Qw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3292aad800aso13686981fa.0;
        Sat, 24 May 2025 16:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748129258; x=1748734058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV+V8Qzb9gSlnjOTQlr2mwatu9Ty+EtJqGPhaeuIXoM=;
        b=GpOaQ8QwT8jMbI4HC7Hgj2GdCQWfd6H8HDEeC34wa9OXpG6/H9MfGfbj0EU9js4dS9
         6dktWbaPlrb9pHS18SScUT8mjodY5iqiIwRmUGTvHkdm2Ig5aH1/1sPKRsGxQZIS5VfR
         fd6kVEj/fbWdW7N/+bClSyvSgPwNnqq7a1DZ92D3CpHj5Ro5PR7BcmGqD3HipM25F6ko
         /pMRv/7Cb16nKYlSwb/7+3zs8nvDQWXyxNoAiezjLZvhtpE35onx0Wxa67l/DpmDjWM9
         LJB09SFZLT1BoqTBVwgwsJml49fyc0wXYOuL2/xSjDm+l9pDq9jlIclEj22G2+wbX4Gd
         85Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748129258; x=1748734058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV+V8Qzb9gSlnjOTQlr2mwatu9Ty+EtJqGPhaeuIXoM=;
        b=UV8S4FyGeFHsgK/m5YozpCHoG24JzE3dgdBMd8AgGTgx+pQpFZKuVPe9rpzdxUI5Pb
         rVw2BEhluFhIh9YO+mrXBv9+Dek47tsFhhaY3ls+n5zydDvN0fG58KJ7WFp63FnY/kcx
         bnpNMvUubB4kXdUue5wdPYu1nUZaWb+NPHiTqvVmpCE2ay6x5WWSQMqZC0lGP1T+gN3g
         ciHnG6c6cnipZx/bz3v5dX6mBHlyaCqTBjy0MtqCE7sQkPPX9n+LRhOKX0heu7vGxloN
         fASim/ifS0yiAQyBZdXQ+f03CYcp85Wofwx5YGrd7ebgHv2lrRW3yDJlUrwLkW0MdiQ7
         7/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUQtpB+daz+RdL8jMJ4HcImeAUXCHOwnR80pS4wuDvnV/p0kccld+y6asg/0bKgai4bNMnyskRvtkzJb/kjHw==@lists.linux.dev, AJvYcCVgaipRjrFkDp98vdVoPdYoU+cz04k9ooGeUUKKwZYp5oXEztlnAMBzCCX6sbMFBuzigslq@lists.linux.dev
X-Gm-Message-State: AOJu0YzJAKcQwgZy+Snps6pAUDsS8xsWGCZCOiuy1Mv2cweErlvO2A0e
	cEFZI4B4KtNaCmzixWPvuQBn5EqLtDy8YdlqpqyV9FGVcfyOpu1gsggCwldKfq/n941vUVRcaLA
	GK3d6YfT/fY2AHeipAJulr3GwSh+lBSE=
X-Gm-Gg: ASbGncukh/glJhTFB8ePW/GfBw/z1zDM/xV+11z5jPbByuieobN3LxGOtcDPExuZl8W
	F713zYuS6dtKHyFO1My41dVoozeDf+kVGF9/tfNgASIsZkaIep0/zSKmvDjA0uQuHjQq/KFrYEF
	0oIIv0ZZdaldXjLj12TI/p4le4+leszhMCuVv5adfPpiQUOIQVQM36tzNTCyqgjGa+/+o=
X-Google-Smtp-Source: AGHT+IGpbFzMWO2HYS2R7VOxGXCbOO6Vt0RMkTju+FyNamsE/py/IUH/HlbLv1fN+iSBstHHz26Lv09D7tkXoyE4818=
X-Received: by 2002:a05:651c:1463:b0:328:d50:d7cc with SMTP id
 38308e7fff4ca-3294f814d6bmr26348331fa.20.1748129257917; Sat, 24 May 2025
 16:27:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com> <202505250501.xjOH8Kco-lkp@intel.com>
In-Reply-To: <202505250501.xjOH8Kco-lkp@intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 24 May 2025 19:27:01 -0400
X-Gm-Features: AX0GCFtu1aVaigA_WnYxF2FTXecIWij-XuiG91OS5eXah3l4AzBu4rtw-LrIf9c
Message-ID: <CAJ-ks9mH7uzwcvKCbzirASpsnvkxFZJcKt=_EYyo6AX__Gz=jQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rust: support formatting of foreign types
To: kernel test robot <lkp@intel.com>
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
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 5:52=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Tamir,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on cbeaa41dfe26b72639141e87183cb23e00d4b0dd]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/r=
ust-retitle-Example-section-as-Examples/20250525-043544
> base:   cbeaa41dfe26b72639141e87183cb23e00d4b0dd
> patch link:    https://lore.kernel.org/r/20250524-cstr-core-v10-2-6412a94=
d9d75%40gmail.com
> patch subject: [PATCH v10 2/5] rust: support formatting of foreign types
> config: riscv-randconfig-002-20250525 (https://download.01.org/0day-ci/ar=
chive/20250525/202505250501.xjOH8Kco-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250525/202505250501.xjOH8Kco-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505250501.xjOH8Kco-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ***
>    *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang =
>=3D 19.1
>    *** may not work due to a bug (https://github.com/rust-lang/rust-bindg=
en/pull/2824),
>    *** unless patched (like Debian's).
>    ***   Your bindgen version:  0.65.1
>    ***   Your libclang version: 21.0.0
>    ***
>    ***
>    *** Please see Documentation/rust/quick-start.rst for details
>    *** on how to set up the Rust support.
>    ***
> >> error: expected identifier, found keyword `use`
>    --> rust/macros/fmt.rs:110:40
>    |
>    110 | ) -> impl Iterator<Item =3D TokenTree> + use<'a, T> {
>    |                                        ^^^ expected identifier, foun=
d keyword
> --
> >> error[E0405]: cannot find trait `r#use` in this scope
>    --> rust/macros/fmt.rs:110:40
>    |
>    110 | ) -> impl Iterator<Item =3D TokenTree> + use<'a, T> {
>    |                                        ^^^ not found in this scope

Oops, this isn't available in 1.78.0. I'll fix this in v11; it doesn't
change the approach taken in this series, so I'll leave this as-is to
let folks get eyes on it.
