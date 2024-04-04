Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832911643A
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712241233; cv=none; b=L5C00iozZHhFkT/sbmMfVVQrdNihXLHopfYQJQXFsuhpa5Vr6z695SFj5KqXsqqVTOg+kmNCsGDxOfu2UAH0n3rzOLEkWT/PC/D0Ny7xyhnvgBArAjKYhQUqp/WP+I5hUPh9Vgu+G7vD1QYuTjBx2Pnxloc2U6pfJwNBl5js7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712241233; c=relaxed/simple;
	bh=jpF7tTa5Sd3tDtJxZDaT9Swi8PyGNUK+y0VMQ7cXB4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwmMJC81yJEXc3EE5Ft69wU/v1npaeWQNv14lc83bfj2q907UtptFuEGl4DqNtGQM4U6SXSmRtubAp1miOpc7cDGo06CXKo0c9fKFQUmEkW6ssQiiLKDfBZx0ZJWWUX+vvB6xbEYEQBcg5AbDdudE20jscu8ra9BN7M4uLaltd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cONwlH6A; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cONwlH6A"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5dc949f998fso804072a12.3
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712241230; x=1712846030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpF7tTa5Sd3tDtJxZDaT9Swi8PyGNUK+y0VMQ7cXB4o=;
        b=cONwlH6Ax9hOG5L4jfbD5fwgfrgZ7xq08xPK4B4Zu3hGkfdsaEokDBtN/poNDziVz2
         IILsLmfonl5NWu1gjANB8zTHsyuCB42l/amaX6qZ7D+AHUxXMqFAzEHBc8q3ktNC8xIH
         jRiRS6hpDjrgxiiG4LXIah22UzTau6jcrb4kTfW6NCQmur0krWHPMlvxH81HfHKDx0xA
         X4+KDI1MepeVZ274EvmNUBQPg6J5leugbG4kdRh2z/MWoc5K2YmFw/M41ehdqVH1J6Bs
         fJkRW6ztD2Kd0rULY6SwM7R0JrcEWxs13nDRAn+VKQeSR3yhIrrOwsKjHk/usnQg4SR+
         C1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712241230; x=1712846030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpF7tTa5Sd3tDtJxZDaT9Swi8PyGNUK+y0VMQ7cXB4o=;
        b=Dg4+s1dC3B72k3wxB402nzMW7WqRO4Q8VEQnEirt+doCGzdG0OVCRKonHjOPt+6E99
         vMiNPgS/V681F3R9HjVB9y2sZsWzRKk/NSkcs6gcvcwP70zWgkDet2IMw7FvkmSvS+v/
         BYIbzXLtLgSeydHxlmlwIH58c7CEWfBHeFagXJVEfnKKkArGz7yYuVK563OyDZeHtWyF
         LNJHWR1utdpyxuWYGGCkYiby78jvl1Tg6Y1HOVHw8Ys54vcpUXODzL1s+xNHZxQjKh2t
         /x8Z1kbQ6alZgXIMYgvI0o7QS0lMzOcs3Cph2sNKx+UKMZpVuPqp8SBeOq2Ey05JfjMd
         TtDA==
X-Forwarded-Encrypted: i=1; AJvYcCUXX+dbjxE8HcsXRGtY5xuCz9g60NdHeo8eDgTGmseL7o6JXhBf5SdQrGZoeaVNV1vvk94N2M9SEa6Zxs9CQ7ClUCBtJA==
X-Gm-Message-State: AOJu0YzWb0l69qW5K1b/ISb2gg3/caLIlJxXnYnxFSeLX4IEntcAt11l
	PkRb732wtAqts45hASWHqJX1kzLpX4utL5cD7KtL/4tmGqDUzd8ug2sQIC/rUwRGZ2qEVzmLUex
	H9r2LVr05AikbWvDr2yvQSnhmXn8=
X-Google-Smtp-Source: AGHT+IG20eNpSzNkxnsgTkafpuA97Ew4OmO4JnqBaV5mNVNvOzgcdHEwHOPWG79O1UTpYlFkEm87j6CqNJkr6GVC/L4=
X-Received: by 2002:a17:90b:f18:b0:29d:dd93:5865 with SMTP id
 br24-20020a17090b0f1800b0029ddd935865mr2399668pjb.46.1712241230437; Thu, 04
 Apr 2024 07:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
In-Reply-To: <20240404-providing-emporium-e652e359c711@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Apr 2024 16:33:08 +0200
Message-ID: <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 4:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On RISC-V and arm64, and presumably x86, if CFI_CLANG is enabled,
> loading a rust module will trigger a kernel panic. Support for
> sanitisers, including kcfi (CFI_CLANG), is in the works, but for now
> they're nightly-only options in rustc. Make RUST depend on !CFI_CLANG
> to prevent configuring a kernel without symmetrical support for kfi.
>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> cc: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Sending this one on its own, there's no explicit dep on this for the
> riscv enabling patch, v3 to continue the numbering from there. Nothing
> has changed since v2.
>
> CC: Miguel Ojeda <ojeda@kernel.org>
> CC: Alex Gaynor <alex.gaynor@gmail.com>
> CC: Wedson Almeida Filho <wedsonaf@gmail.com>
> CC: linux-kernel@vger.kernel.org (open list)
> CC: rust-for-linux@vger.kernel.org
> CC: Sami Tolvanen <samitolvanen@google.com>
> CC: Kees Cook <keescook@chromium.org>
> CC: Nathan Chancellor <nathan@kernel.org>
> CC: llvm@lists.linux.dev

Cc'ing Matthew & Ramon as well so that they are aware and in case they
want to comment.

Cheers,
Miguel
