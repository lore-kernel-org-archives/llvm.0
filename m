Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A591280CE5
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815507; cv=none; b=DdJ2osyIgM7M2CJt8kfhDvRJFcA4LV1g+gSvQFqWp8DbOV/a2ucQGMFMeAIuAl9gEraJgksLCg1kpdzV0/Wft0jBTnThoWa5h65V9qzhnAR+i8Xmp3LtpSNPw3I3rzXSHDHYHhTtsSAuVroXDBJav7BlHl/aCNi+2hXmKvZMd/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815507; c=relaxed/simple;
	bh=rnUc1sSIJcJcXtlU0rQc91rWE99Qu6t+C8m+svSvM9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puK3vkZthAPFs88T77zN6n0luLYTYratSVQEPvxcVkE9DlL+UvvNoK0bzCJTWk/LVqAypzelTkPh+SNK57jN3HoruoMnCi2retB9oDADFYGmwbf+b5hFzQRps8ButufirdfGSrhJhqr0FrKGZGLkDhtFoGvoIJZu8t5lVzUYvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHMFRZj/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHMFRZj/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-26816246a0aso4728535ad.2
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760815505; x=1761420305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXwxLtFHklVqMldstrW5nXmaQWoQkEu+q+HBHCmmMZA=;
        b=dHMFRZj/AHAUT0wT5RclLujiW3/kN4d5sqH1XdPfPy4lHcEoChCJ5070hg/3rBT16i
         vt8fTqjhel50mPY0IuEGjuiIySwCydyLAFkDvhFTdyQEOcBOG7moHzYmVTBVC8gNz7Fc
         MqbjIozAE11gPIjeo3Uno9NpzkmmH1ULcn16bt1KRc89Q1HrKpjeqMWippjBfc3Z8AcQ
         vQdrLdrhhkVpua8krRN4AhftGcP4m6L0YX0xzw9DIeDMv/hiOhjf97b4XzFSmW3IJ2wg
         7UcRuTqzjoZRRI1YwxPk3gipGfW5pux5lg6OOj7NHb1yLrx1nQjHIcY8m+7rzHqqwBfC
         pk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760815505; x=1761420305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXwxLtFHklVqMldstrW5nXmaQWoQkEu+q+HBHCmmMZA=;
        b=istTBRUCIDCpfnxEJnaY+cXDFlOcGING/t7XkS0ttIFjRbHACISWBLoHNtjMX7VKI4
         OevWOGsZNr9W/OZ+Uu+pGQ7tj4mVVfGPS92QDLugL5zwtdV7vU0TlEFP1+De55b9EU8b
         mXfkWo7U5+/SmUf4oEL848kNsruo1kVzBHj4BYjMzur5aunJVRBsdpHtNE1k6Fz3MbKM
         fA6Jvdkfhgx6qh5rT/znoZNMfS6unRx7FnAekYxQ6Lr9gxtlbRs/yi/PXSohbujs/xzq
         ad8J6bPRKse+s5Ofls0ftsfzALwtacOpQrI+ghFtFLtmQ14xR5zw9zQFmMNoP8jKdUQ6
         z/KA==
X-Forwarded-Encrypted: i=1; AJvYcCWRYK0Dtwh7xzp8/gC9fcu0GI15mNoA3GtmH08DeA1JoCEIQa/PJsdMccJjFc5c5jaN+WE/@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt0n3tbaJW0pBzHCGF/JNUuduTbrVUGhcCrNeee3gUnmtxrr76
	f/1p4MjeU9jA9JVxZM0ZRVzB8RoLTLwfktg7mtS8lQ65T0j+mep2cGu9af9/h4wuSB/1P2M7m32
	hL38AqNQZ428x6VCeVFbfCg++ze//An4=
X-Gm-Gg: ASbGncv/szO8wMkU2QPm3ErZmdmDl1v7xeIvH3LOBoO6ihS8cXf77Axv2uqA6vILSrG
	ZxSzU6hjReiaZwuwDQroyFSlME6hzT0v6sVO94MXo8IJLTDVa1kvBLxs/hJYr1ESvvqO2ZIbjib
	oy4ElaKlx57IUAO75pzbHD9hSNQiX6x69Y/UuydDJWHd9UX0PPLHf1FNYATRLybm+reWhIV6uIZ
	SZmsrUimlYYDI2/k6BGKE1k5mTGoIXvaPAD4vVhcBee2pRVV56oU9galBxXRaN+MBTphIoKtmxm
	CmiDKm94HJgD/k3FJRr9qwxNMML9TmcadJGlI9XPmFyJioK0tj9kpoE02gUKTxHRxpDmCtaJMy0
	SUkM=
X-Google-Smtp-Source: AGHT+IFynbxdq4PbDoeu2y7E7pruyAv8MSoOFKgcS5qR5uKUe2l/9/1aikoejnUdjk1VE9ieyNLSjxDynifGmomPS5w=
X-Received: by 2002:a17:902:f550:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-290c9cfec04mr58829965ad.4.1760815505098; Sat, 18 Oct 2025
 12:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Oct 2025 21:24:52 +0200
X-Gm-Features: AS18NWDWZ6CTzqAcsRkSpKjdzes4UGFhB9PPk5gEXsERGZ6zM8JBbanNnhdHiYY
Message-ID: <CANiq72n8m0JKjJMZ8Nk8B=GG5kcsSuc2YKp4=r2XJJgREoZZkw@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 00/16] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
	Tamir Duberstein <tamird@gmail.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:16=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
>
> This series is intended to be taken through rust-next. The final patch
> in the series requires some other subsystems' `Acked-by`s:
> - drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
>   look?
> - rust/kernel/device.rs: driver-core. Already acked by gregkh.
> - rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
> - rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
> - rust/kernel/sync/*: locking-core. Boqun, could you take a look?
>
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vador=
ovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks for trying the kernel.org account -- it seems it worked!

No more throttling to deal with anymore :)

Cheers,
Miguel
