Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB2421322F
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441449; cv=none; b=lvlw4yyoJ5bpPullfAZ+TX/CjI1ygFcc++LpvWVYmWmFLIaZvrjrEqwtT3smonjaeoca/o+y4KP5Rafkag/MgBWw2GPXUtKZ3pDn6pEV77phkEiT4S79VqbQRIcaCBdno6Ys5ui+ncqwLEXGon/2JQzsYL3YKB3bL/+Tr6YhVwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441449; c=relaxed/simple;
	bh=SH5cP+3YWmXs8/zc7fXq9BP075bBVMwRnqEHsDoMzq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYF43egu2qr9kEwlc55+Wij9uDd6wJJbH3DI8IcFEj1NJ25jOPkm+xbASfXCCytTyYROyQVwaB4OJgTbsZy9Ow7IUfImE/dgFxDdaRXrUEO7LN6dl02nUYhdyoSL7VjrcUNaqR7jJeQIG8xe+hNV8lptqPMY7GEnBr4gtodTIgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFBoPNYw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFBoPNYw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso42670761fa.3
        for <llvm@lists.linux.dev>; Wed, 28 May 2025 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441446; x=1749046246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH5cP+3YWmXs8/zc7fXq9BP075bBVMwRnqEHsDoMzq4=;
        b=lFBoPNYw0S1LmIGGUPntwfCkcJXOGH7inN7aUAkeYGgGVhrGCEYCdT5oOgNvQou2Ih
         MFqeSwjYDNuhI9nY0T06XgOjdnsUaTGfHWy10SFLlLOBFDizm12KfFymQJPTBXVkPIpF
         /J7tAR/YBy2qDCBPSNGy/kuKPR1zX4v3e+1VNSK1vQiExvrBE+L2Hopyi4eNwXMHPP/v
         YDvNXrvDfDAeEPTXnMaPCrdBq0ZylAUznjhOksjTrPz+ijuUlxdokfb/AEbgQFKCO8jM
         2xyRsHxlfUXaPh2J9eHoKhV1aNq9uPuG1vpEmqNwkB5w1IvxaF9mgEO9ENf8v9q4qYUM
         nqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441446; x=1749046246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH5cP+3YWmXs8/zc7fXq9BP075bBVMwRnqEHsDoMzq4=;
        b=c0J9B5jRd1wJD1dRhCUd+4T2gVpQJF5i7/bLNx7k2EByaVQi9WvP0Mz92nSAvsLdRu
         bEW0h0y4Vf4ueYEoWBSDT3wBh+qfYud8m3DjZgA33WyxdwWeMxjEkket20f1753Dk+5X
         SWJpdhRnfZ0RMXXyRQDG3ztqPink/M0O+5ynW8uFxloQmcrHMPayaVnqNR5g0+okPW5r
         J6i+RCwnm+OWGoVgQJ6qdJSurPVQkX59LqubFa2eS6jaX1dAf5TyZGCZ2gr9EepNca6Z
         pfiqV5mQUTxNc8Abh+xgr9Q/nZWNesEpEGQZx2Xnf00vBnPmnhHt3YI1qAyZ5frfFQOk
         RZGg==
X-Forwarded-Encrypted: i=1; AJvYcCXh1hM8grzA3s+QXmZ1sxAeLYh0uDCIcO6Omxm7BHlXgIXIpoNTcYOhVJ7lbtdkQ+R0Nhcn@lists.linux.dev
X-Gm-Message-State: AOJu0Yx10+ijmnVd8BLmywqQWEM1s4x1vg/sv38GXCzhrjLfgyXIDFVD
	wwbED9lWWCsAMrOfVMIa83AKWK+pONd9sXt+5CKhZHXAyhxm6587CQTOdtAHGps+tnwbJ8JV4fT
	0maHx0ZvNQj22esbQpFKf1DdS884fodU=
X-Gm-Gg: ASbGncsJs7q/tajaRZQnRlPiYkX0XTMMPGbZ5pkXbhJbhblPSHV2UTzAm0S7kfIFfju
	T6p0n70UbjntPEi0T2jRkdrB0Rja2e0m768eEuHT2BMXNyPUCQ4K7LvSHE66CL/CQFiG8jdTuCM
	oq3kOyILedKxwkJ5TfZ1JdPWFqEZeEyKnVf2pgVJwNZ4VieblG
X-Google-Smtp-Source: AGHT+IG3dTRzhOJeaA21sQ8Cl6CUs5QffL1O5Hi46hlWsg6xnHSKewHgYxirdmC8QSEO4fDwgYnRgzhaJUbQ8K+6RKc=
X-Received: by 2002:a05:651c:1469:b0:32a:7122:58cc with SMTP id
 38308e7fff4ca-32a71225a60mr20885251fa.6.1748441445644; Wed, 28 May 2025
 07:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com> <aDbniZzL1ZOSnfVi@google.com>
In-Reply-To: <aDbniZzL1ZOSnfVi@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 28 May 2025 10:10:09 -0400
X-Gm-Features: AX0GCFtCzkUkdNofO07GNzu_PibpIwzD2C0rC3Syu4m48_lWgFYSC9rhS2sdGcs
Message-ID: <CAJ-ks9mcPd+-tFRuhxVGrYRPFEtJa3nQTdkvTtzLppqitVfaLg@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
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

On Wed, May 28, 2025 at 6:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sat, May 24, 2025 at 04:33:00PM -0400, Tamir Duberstein wrote:
> > This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> > have omitted Co-authored tags, as the end result is quite different.
> >
> > Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vad=
orovsky@protonmail.com/t/#u [0]
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Overall LGTM, thanks! Left a few comments on individual patches, but I
> can probably give a RB when those a fixed. :)

Thanks for looking! You say a few comments, but I only saw one. Did
some get lost?
