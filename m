Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825DC12CD9C
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712252922; cv=none; b=R8MxpTi9HyUt89C4qtPUXw7ILWjH0imaSXUReuXMZZIPCtPOb6a3jw3mAQvRxAJEd4lrK73v8Yy0y1pBciLJ+VF9CAj3kbNUcDyMDV/WmHBOwmTjzEFoNZB45cCAXrssW/2fdjLjMypo+QOfopsZKr7w0WSgxbuukz8sy4FWCYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712252922; c=relaxed/simple;
	bh=vI4MrMdOzvU45Up4bUbJqH4cKKBdKrNwuFYQDyoAvgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHglQX8oReUijwvRo5Gj0XGMwe5qEGHKCr6/lSnpGbnXR1HsIxgLNS63ncyIoAh9+rXpdbTQH5JyFp8ST5125xD2ntVFyV6A1Nc9oHlB2XODNgdn12IHu6g/IjshrsZq9nwTtSM9CLK3A9Xdnu3BQcHuxWwmVQkYJzt+qkrjcbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQttLGq+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQttLGq+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a2f007a33dso482083a91.0
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 10:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712252920; x=1712857720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI4MrMdOzvU45Up4bUbJqH4cKKBdKrNwuFYQDyoAvgA=;
        b=fQttLGq+tXhvtI21OGNJaGB9wXoDr3/FgwrQkjcn21YTQpiZTyIOy+/BOM4vMMuyuD
         PBPzju8VnvWsdZROXLewXcpQipHPj70i4XhzmS5LrXaP9uUQWFH7b8yqvL/32BGLw6EA
         R3oAx1pSr5plZwm03DzEI4IRAjNrisjbfllTyriAEkZSheZrGp39IK8IgI/ZdzkqVtZB
         8fxTW8yK5y2G7E9pNb42PS+3fnAah8qiLqxaovCQeZrZ1uhXAd8vkiONLy5Oz99Wd0AR
         s+8J5I5EJpce80KP6cnzdI/0LEz9laJvCs3TanRFoLuBKMpjNSoe8/VByIwoSe/febA1
         rRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712252920; x=1712857720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vI4MrMdOzvU45Up4bUbJqH4cKKBdKrNwuFYQDyoAvgA=;
        b=ezrpq9voco8oDOeF60sb0OB/OFhHlusOATUXFAZcEVxlgalNULl5GMsHzL66QIboV7
         WXSyj8MiZNn/YQpct7wVO3bSFvApEkGgiI/VowHM2vPHo4xG8E8zNiLj2hyEn7BAoRD9
         N0WvKGzS3eggN6Cf6LB3vGofyN8CgnenyG7wozEjqzCAH15tNWmPSZN/L6lwfRzgbOIB
         YvmThCZAK/hn+6khuxJCm52vVQpM+vaIV3RXUQhX5yVo8baUrtje+qlVztfcjIhU7Ek3
         tvBY0c7jIUu7H1cLcpEQHWE/ND6dMfnTRa8SA1p36L/O6puaPV4HWvt+D+yyFTwnryxa
         B7IA==
X-Forwarded-Encrypted: i=1; AJvYcCXW/eDgZhx//soetgYQNdgI/7tJEeI7u8jubguDiqGe8wqzJdZeVrD+pnltSuUmSCsCy0J2STY4yvR+lg2iA41BASqjGw==
X-Gm-Message-State: AOJu0YwI7v7xb8qW4aUw6Od4foGcl7gBKML7y+NxOb59CZ19GWrmN1rd
	NdTMgPJ9REc0z8lIgPo6MAFBbv0fMiBeFDcCqwIsTkvZbUM2cy3zZcpiueNJ6X0ejaeq7QJfI2e
	OEfdQ1YV5H5/3iXpcfUl00Gy07GoX30rnPyreTw==
X-Google-Smtp-Source: AGHT+IHlscXTFbzvBDaANjdzeyYIU2Bzi1Z2mFW5dyNypC3v8GETs6/WUkm6FkEiMiVsMdRl7+HJ3JxRl5EHvirEJQY=
X-Received: by 2002:a17:90a:e604:b0:2a2:ba9:ba61 with SMTP id
 j4-20020a17090ae60400b002a20ba9ba61mr3674127pjy.34.1712252919635; Thu, 04 Apr
 2024 10:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
 <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com> <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
In-Reply-To: <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Apr 2024 19:47:57 +0200
Message-ID: <CANiq72k2HQHesGNaU3_yFZ7j8SKtWfZDAWdfoCDxo_bOEyn2ew@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Matthew Maurer <mmaurer@google.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 5:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> This patch is fine by me - the last patch needed for KCFI to be
> functional in Rust just landed upstream last night, so we should
> revisit this (in the form of enabling it) once we move to
> `rustc-1.79.0` or later. In case anyone wants it for local
> experimentation, I have a backport branch [1] which applies these to
> the 1.73.0 compiler and enables it in the kernel [2] (not upstreamed
> because the feature isn't yet in kernel's `rustc`), which Android will
> be using for the Rust binder driver. This patch will require a recent
> (last year or so) clang, as it relies on
> `-fsanitize-cfi-icall-experimental-normalize-integers`.
>
> [1]: https://github.com/maurer/rust/tree/1.73.0%2Bcfi
> [2]: https://android-review.git.corp.google.com/c/kernel/common/+/2930616

Thanks for the update, Matthew!

I guess the public link is:
https://android-review.googlesource.com/c/kernel/common/+/2930616

Cheers,
Miguel
