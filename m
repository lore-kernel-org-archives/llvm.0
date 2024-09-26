Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAB2288DB
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727367093; cv=none; b=cN10W8H+SmaV24mz+8CpmSjijyELnWZtN0MhxxhvAa7Xf2fCod2WjxKcAi837Ho9oTRfWsFIN6fBoNb0a/fH9HqiYWSSyKyNGl9X71hije/RPpe5LfM9+dre5KCBIvmaOSoKbh9oyLqLrKNtaH4Yin2DENWdVedRJRz9GFNHqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727367093; c=relaxed/simple;
	bh=shJSHXjlK547ydVvMCQRSZN4pxzvR+ilNKJfQM11QHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAkVyAUaBI3Myk9KItRww+c6qAc0otJFNtyELkoy2byJCuF0mXzUwsTahvLfHjh+onjSudoLF4PDzYShHu0sa5eBX4Z+ybYjVHyv1Qtf0oygY5zeVIZRQo0VFXRpQ3nfKNeWBBULFIXL0eLqXLp+kfgb9KHhxJBN8lGcaeEP874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lp2NL7ks; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lp2NL7ks"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e09a36f54eso64679a91.1
        for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727367090; x=1727971890; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shJSHXjlK547ydVvMCQRSZN4pxzvR+ilNKJfQM11QHE=;
        b=lp2NL7ks3SU+4dMEODwHEHZGzCvOWiYy/UkYF6svPzlYG3ANyIclaBLUM59W4wG4+X
         ZEHNZzvfhGf7CbCaiZAgm4lBfRYWt2JGcR1IwyBLZym8Kr9fg9RfTSpKLognCuvtpmrv
         sW5i0w7dNuwN2UuoljvxnhAneuO37FxPdMJlNmAoQUN6EcWyKJFHj1sZ2w8XbfhNl28X
         8HlXZtyiScsAzdsd4ksi617s+bz6QruR3FA45AGVE5ZOwn7hclf4TywTefN6qBMhyy0W
         vofjmPIxpOztklDp9ABG2YlsvH+S2MBVNrbicu5swmvordBA1baXw8h4CaJPcUIE/VRh
         wsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367090; x=1727971890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shJSHXjlK547ydVvMCQRSZN4pxzvR+ilNKJfQM11QHE=;
        b=qVPMxGFy0fB+e3BuQv+19jtaenlmRpeQ823EWFGT9pyXRdy94oYfEV/kNrtY9ofLdT
         pDfiQLmGw6yI1aqJ4+nK8lWy2V1gt2fmknXyFJV7riMMqobSMYbT6qEn8F2Z8/4lO5aE
         ZszHUbhds+XpXcO8/FMUeYdh6IbHT38coxFs/KOaNnXN0iOyvn6tBWH7xPCAKLizSASQ
         TIvxrFDUGXUde7182XP2bovX2G2nwlJevSBZMJnmEscUr1yL6BiSi7kNG3h9QDeL3Ky8
         FKzyJpbDteegNIp2HIcp7pRM9wqVlvjWr8R1Nj4mWeZLe2VETHYuzpi6NBSg9g9ezUJY
         9Flg==
X-Forwarded-Encrypted: i=1; AJvYcCVRVUHo2sKom+AvfQRcL30nv3f/sdxcppBovieAG9aQ+Q2SguIJKf5BpPOjOtZKXvWF/K5H@lists.linux.dev
X-Gm-Message-State: AOJu0YwAz8c6TXGQ83dC5Di7F40NvqmFDOyqcNFwUTOlAO1oziNS1Hm/
	k4fQCdXjOAmPe+j3IYaJW52i0CDcoxz8XaciwW+HV7QeHkd1eNRKJLnjnEjG4+I3Kc+rwYZhTus
	i8lzwt0J+dmSrTzAGgsTPv03A2fE=
X-Google-Smtp-Source: AGHT+IHOPDH1wb+stuy0EfXx5p0HnQnqPFmeGMm37xP4Tf5VJjlZHx1w8z7puUade36nUeULNJZImKA1mSHvAcplnsI=
X-Received: by 2002:a17:90a:a78a:b0:2e0:876c:8cbe with SMTP id
 98e67ed59e1d1-2e0b8ee52a2mr104368a91.7.1727367090120; Thu, 26 Sep 2024
 09:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org> <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
 <20240926-plated-guts-e84b822c40cc@spud>
In-Reply-To: <20240926-plated-guts-e84b822c40cc@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 18:11:17 +0200
Message-ID: <CANiq72=ShT8O0GcN8G-YRE1CB8Z9Ztr-ZNcQ6cphHYvDGanTKg@mail.gmail.com>
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

On Thu, Sep 26, 2024 at 5:56=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Mixed builds are allowed on the c side, since we can figure out what the

I am not sure what you mean by allowed on the C side. For out-of-tree
modules you mean?

> versions of each tool are. If there's a way to detect the version of
> libclang in use by the rust side, then I would be okay with mixed gcc +
> rustc builds.

If you mean the libclang used by bindgen, yes, we have such a check
(warning) in scripts/rust_is_available.sh. We can also have it as a
Kconfig symbol if needed.

Regarding rustc's LLVM version, I wanted to have a similar check in
scripts/rust_is_available.sh (also a warning), but it would have been
quite noisy, and if LTO is not enabled it should generally be OK. So
we are adding instead a Kconfig symbol for that, which will be used
for a couple things. Gary has a WIP patch for this one.

> Yes, I would rather this was not applied at all. My plan was to send a
> patch making HAVE_RUST depend on CC_IS_CLANG, but just ain't got around
> to it yet, partly cos I was kinda hoping to mention this to you guys at
> LPC last week, but I never got the chance to talk to any rust people (or
> go to any rust talks either!).

To be clear, that `depends on` would need to be only for RISC-V, i.e.
other architectures are "OK" with those. It is really, really
experimental, as we have always warned, but some people is using it
successfully, apparently.

> Sure, I can add a comment there.

Thanks!

> In sorta related news, is there a plan for config "options" that will
> allow us to detect gcc-rs or the gcc rust backend?

gccrs is way too early to even think about that. rustc_codegen_gcc,
yeah, if needed, we can add a symbol for that when we start supporting
the backend.

Cheers,
Miguel
