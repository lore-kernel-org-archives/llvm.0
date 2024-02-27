Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63891F9D6
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709030816; cv=none; b=VCdonL00/mAfg5dP8GZOK5pFFD2hSu75rkNJ39UoSMGtLIzbnidDwEynMJHBcEO3EOUe8QEE/g3HfGEAAASc2QSegb+1F7Ikzg4d+cfdM25CAogy94o4cYkblG/MAESDnuGUPSKPgrk3z4pxiyFn+FTltsJpV5Mw2AXzz5ebc60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709030816; c=relaxed/simple;
	bh=XHyReOttpij5I54r5x4WgZ+cIyUHaBfTMin6OfRWlGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/bRKfKIRC7H3Tv8z7J7dXq7GXmFw1282UuNk2O7suUbFEwpRrL1B6KkqDj0fCmbbO/YXp9DRm6P9FpZouKhnm7BygNbEtUIgW8QEsmuLqOh5n7CHOzo2oodEW032+PY7Ga5qDsZN1KKBhevVvFXBjdF3DMcLNR7SnGt4n6XovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQ/xzVEQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQ/xzVEQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29a6dcfdd30so2790818a91.0
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 02:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709030815; x=1709635615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHyReOttpij5I54r5x4WgZ+cIyUHaBfTMin6OfRWlGU=;
        b=OQ/xzVEQY6v/O4iUWfDboAYs8ipVHOKclYPcWS9MtVaNiAsheMQFbTzec2+PPwrNyn
         g444RSUgi1/Osyj9VI1eZhhtAvjn4QHKTwI6NYt8HQAs24wrdKQ+rEQxOipkXskVLLJ7
         G8A70UhumigLb8lJWve4s99ke71QbzOIXkQMNOiQ9IBsNFdxNcYqN51hMUCdyP8AxlaN
         evjcHEdx4KtX1OzDDYAGAgZPSt3I0Au8pKMpvSgw03mjr3NqteR75E2q/o8kKladtDUM
         8K2tnw0K3ND8WjiJO89XtHK/IW0Psa+lPx9ATtM389dYsVOEWsIwiRH22Euo5KTVsYzX
         Rn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709030815; x=1709635615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHyReOttpij5I54r5x4WgZ+cIyUHaBfTMin6OfRWlGU=;
        b=Hcg9wsx4G+KkZffl8vuCjffhlhmvUYPYSdNIDz6IXHIaOdLWc3bfDWwq7PjfgbxK6t
         0iJjF05mpyKe+/OnffBH5nkiO6CbZVbVT0HDj+d5BZalNEfxhHlI9ECsNCGdaYmYMAkX
         M7oUmFT4y6TlJgrt35yWz+dzl17yRkTNkuCCKd2wAG/h9PZ3KnynpLkut/RvYraGQMEy
         xugI7wxaq0/eF/q8q5BCByZpVaT/5MDxO/nNFC9yTruLyubGXlYs97uIFaM98A06XHPe
         hh7BkgSUTAJ5bcgRc1jwZiGnkpunNZh/5XEdxMxEf3zMYHN6epk8P94OuNL+1v5jiV/i
         oozQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlS+0OpJA362TJ9g+S6lLo0VsZMtSRQRgDlt2rjIXEM40gOJk56hGyAZt942sBMV/7eqTQazdCxuR7wTRD/3oBKtTxbA==
X-Gm-Message-State: AOJu0YydB0GR9KSj7gF70tUtTobd0T51/Wdeo6Tcioh1xa88XCk3Z0Ij
	LuPmDM0fVdGmGsbV9C+zhtsoD+xjXfQws0ItBI4yEXdlN1HUcY3eFGB0z2DGG7oihgbNm0aZKyW
	rgiriBEDK+puNad/0d75qRLeGbuw=
X-Google-Smtp-Source: AGHT+IHM+6rRS1JfIDKhTWqLKrWosGlB3CKAX90C0/Xd3mVu0FyLDdjQsn5XBbm5H/3r+xFgrsAmb7KF3ofv00QMlG8=
X-Received: by 2002:a17:90a:e018:b0:29a:ce5f:4da1 with SMTP id
 u24-20020a17090ae01800b0029ace5f4da1mr3644307pjy.8.1709030814815; Tue, 27 Feb
 2024 02:46:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com> <20240227-resolved-deceit-4a59a6af5b71@wendy>
In-Reply-To: <20240227-resolved-deceit-4a59a6af5b71@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 11:46:42 +0100
Message-ID: <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:17=E2=80=AFAM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> Sure, I'll take a look.

Thanks!

> Nah, I think that is silly. Either this goes in as-is, and there's
> fixup done by Linus, or the thing should be converted to match arm64,
> assuming that that is possible.

Ah, so you are going for 6.9 too? I can give the series a try on my
side in that case. When do you plan to apply them?

Cheers,
Miguel
