Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A18157E87
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727368184; cv=none; b=UfD2d117snMoB6jkk2v1qI/DqcSXD8cpUIyckKkhrX60SNO1106qT/7ZGksRouW45kf7SjBqTwbsMKsqK1A7LkiraSSTm/CVHqZAUSpOxPjvAewVIt3V1llWgzMoCAGJwXtJbS0mh9AK/7MZpLmdQ78jBuD6B3BAQ52SHRf4IGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727368184; c=relaxed/simple;
	bh=enYKeiYzEZuiXlgCfHWUHkKt206E3RtoQkmTSzufcAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfg+gobqWIf+bkQYR5GjRyxsWaidg8WL68r9Kb24ki+h+EDtHclazH+EJN0heiElU9PlUZ2pHOIAQM8j2JkfXrue6K2K7PYEHzVpxTPso4zbkvexlaWIohTF+wPpJuV5ezRBF7RWgP/WTj6bGdCMmHJC/FtYW6mBOdue/3imNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXDS3Pep; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXDS3Pep"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b2ee7629fso677195ad.3
        for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727368182; x=1727972982; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enYKeiYzEZuiXlgCfHWUHkKt206E3RtoQkmTSzufcAk=;
        b=GXDS3Peput0B1nLuAgxkabTBOfmPq3EnWQIyNHDc4048wg8WMf5NKdbaFOJcESLLBm
         iogG0hjNHSd8TAb2LkSOa5g/1LVUPsw2+toS3KYn7MEbXoZEbOJM4GhCR41e/J5zff5s
         Q3ebxv05ZHIYmgVihDiF4+VSnkHNduPJdVYvTLOnBfTekjHFd7lCP0ziGXmhteZAtz9W
         7HfkRbFZeJSfBkIMr7Dvhkn5uZLG9ll0hwLI/oLKUe0nFFjyUjfraJMGskChQh4q5jNX
         oiMLz3Mt6MWdZbrfiSsGS0ddn4oLUceTNqYRPLdbRxNkjXolYEPvhrYECIy0nEIhEjLb
         jTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727368182; x=1727972982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enYKeiYzEZuiXlgCfHWUHkKt206E3RtoQkmTSzufcAk=;
        b=Bukj6e6et89sFF3uEwEeUiZmmvQbgFZjCWV2OltDBFGZVlGmPCU2OGw0oYFN9LdnS8
         ZYeU+Js4SMZZigRFcO2G44t5ySIiDIEX4pLRqHKQHU/1YhxdYCIdf7XysDDtj5l7YdxG
         61n7N7nZWpUSupoY9Cgh9rucaAO7LAi3UqnNW7iDYGpLXs+MEqEW9HiO5+93h2gDCASm
         xD/N4sgmxnKpcThcJUbo/y81iEm3rG74NXYVgPRl14ly8qWZZKc2KYdYv2kEEh1OsbFV
         cnvlI9wkFr75DrTArGuho94XUknE2dSeCUBYWlExBcTazCgBgWkagoWEqtUBoFn20fgM
         xHAw==
X-Forwarded-Encrypted: i=1; AJvYcCXtcrwqANq2VJbZzI0xGgre2whEB0RHxNbX6BMk8atj3T21vySTORSiZhjah5loozW53kev@lists.linux.dev
X-Gm-Message-State: AOJu0YxQLsJ+gShI+GkAtWRZD5svBc3Klug+ki4fpnPmyPNogbPGi7Of
	/0NqK09wadwp2XZ+JF0xnP8aHLYfsM1whlNBwvlGc3iOB8EA0GT6eQJzzug+cpKT/ySjyn501a9
	HrhiltImYueGpPeJSXbWp2gFX0Ss=
X-Google-Smtp-Source: AGHT+IFWnPCIvNcird/b9jtNo2ic1qoJxCG4l3sNzelSgtW5Pt3GkMD1EioV4GRyG3deDzQmsovWpn69wT7w++8wlz0=
X-Received: by 2002:a17:903:191:b0:20b:9aa:efca with SMTP id
 d9443c01a7336-20b36adbadamr1866825ad.9.1727368181789; Thu, 26 Sep 2024
 09:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org> <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
 <20240926-plated-guts-e84b822c40cc@spud> <CANiq72=ShT8O0GcN8G-YRE1CB8Z9Ztr-ZNcQ6cphHYvDGanTKg@mail.gmail.com>
 <20240926-battering-revolt-6c6a7827413e@spud>
In-Reply-To: <20240926-battering-revolt-6c6a7827413e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 18:29:28 +0200
Message-ID: <CANiq72=JNS8eaQXJYCTNw8vNymD-0A-g4FmagyLkaH7L1DqhwA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix building rust when using GCC toolchain
To: Conor Dooley <conor@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 6:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> No. Things like clang + ld & gas.
> I don't care about out of tree modules ;)

Ah, other tools, not just the C compiler, I see -- that is why I
mentioned out-of-tree modules, because otherwise I was not sure how
you would get mix the C compiler itself, i.e. GCC and Clang.

> Yes, just for riscv. The logic in our Kconfig menu is currently something
> like
> select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> so that would just become
> select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG

If that is what you think it is best for RISC-V, then sure, up to you -- th=
anks!

Cheers,
Miguel
