Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54357898
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613950; cv=none; b=o+GwAovlknmKMBsDBvUAOXKzJQl06CLl8+0WYxmwcD2oePmFHzEJO6L9/Ee2lAWDCfzr64D5aT5p64oVjnTiFlwivfn+hU0+SDlPO3NKf6VY9gpyygcd1gYcAxV2lU8OtVWH3AXC+FyLfAR+n9n1VsVyBl6gvzUJ5KGPsEzmMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613950; c=relaxed/simple;
	bh=r80pgj3QFbTktAetFx0H5LmLPNjoxM8DCqn2DdwtWew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGFCg7NBnR8swd3bI/pIWSQMvyAhUnfvPkkCZZ7AEmbWY0goc66oFCh8sFhhK69o4jc2bmrkJ/gA/zLDCF7VVm9DCxeO3anZ9SxSH39UnPOOoEGcq1uEKJkxUVATT3aaHWamDe28Vf7CUtlN/l9QcyE9gaEZTlRRnDYSa1PCOd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaLw+AMe; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaLw+AMe"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so636852276.1
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613947; x=1712218747; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQACXLXxHKHify2dS9VLj0xCy7QCedGZDn1QCoUtsYg=;
        b=AaLw+AMefyW3F7BbenCeDJ24xlBuANVskP7DDkTt3IIdiYpj3w69/gK3fMVEwFAvsf
         hGGXpYBfWBlHGWCvqMeDVu7TIguU7s8ZGF/5pTbfOjXW4Ykn86LCCLAPmsIC8wZOap05
         wJ3hA7QhRb3PLdFV8TFqqDdl0D7snAcu1ZfMKp4FTzmRkH78iBQ+eZhGMfv5Biu0+17D
         XHUAMbDaf8rR2jH1pBDSpg2QYxUP9Oll50Fffo9mu8DkSSBPE6O8Xmot9cjNl5wN4BvJ
         qF1jCcc1lHji0KG4ogOjIXQGSxWBZzs+isfQEJCyTW7bGq0xizBvSCGW03rB9eyA9wJf
         +Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613947; x=1712218747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQACXLXxHKHify2dS9VLj0xCy7QCedGZDn1QCoUtsYg=;
        b=GwuK4IJ0O373SSDWK+4CzKmAYpY3aV/O0/YHdwz4Awb4hi9cFgShEOhV31JqBYL91p
         CK3sMezTpRUW1m1cCGqQYKx11BN7Dh+c4KlIy5MBNp+mfakJlYp0ApDxXCs8EW5o8CVZ
         pfv632E//+kg2K7/eJUZTNyjiPIjc/E0I2gUsAi0h5c4OWwwWMAcq18wdiAbRXNWYkEf
         I3NvxkQZUFLYPcuEfBNuRjmJPkMggztenNqWxd5v5Vb9sFRrO40s/KTwBlPxqdNZuRti
         PGF17IwMDTufM1leaeAuU1drHAqdO2StoRmOc79UlKQzMFIG3WzxjeRW5WbzXVFtcnyU
         pqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVQVbmqcOt8LOV45RluAWxps/u6SYeTve5IwaJGOziF7LFLMMCWHWU9pmD3SGiYD0hBy5/mrHe5L5FHn4vcYzPoDsdFg==
X-Gm-Message-State: AOJu0YxvsqYyHGRxWnnbdGzeQYSWX5Dr5ux2GUD1Ibmpz3OubYzYZNTQ
	tateJ5RUIdJW05qUOBerTXL+LwnuRqY6teoJVNX/79oGcg/BHqXuR/5g3cHq9biZo2/Bk1Eihbp
	DoAuJe3t8tS+DmVXcmvEYGWG+TSrAnXhRcilXCw==
X-Google-Smtp-Source: AGHT+IHU4QPh8j6WjLxBO0Q1jU4zSZIz+7BvpCPbz75nc+GA5gV2bCJNJ/wBDDNXRDwWahNJQiUQK/RJ5ZGOaTCySE0=
X-Received: by 2002:a25:3d84:0:b0:dc7:497a:fd63 with SMTP id
 k126-20020a253d84000000b00dc7497afd63mr2329705yba.3.1711613947304; Thu, 28
 Mar 2024 01:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-7-224a0f0a45c2@linaro.org> <CAMj1kXE_DoxrxXaeLG7SoD=PgJ0JQ=-wyQEjBLzzrtRXsHjy7g@mail.gmail.com>
In-Reply-To: <CAMj1kXE_DoxrxXaeLG7SoD=PgJ0JQ=-wyQEjBLzzrtRXsHjy7g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:18:56 +0100
Message-ID: <CACRpkdZbOTAj3_qfppaurRYZVLuLoACZyn-_PsXo0j-a6Nj1ng@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] ARM: page: Turn highpage accesses into static inlines
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 1:15=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Mon, 11 Mar 2024 at 10:15, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > Clearing and copying pages in highmem uses either the cpu_user
> > vtable or the __glue() assembler stubs to call into per-CPU
> > versions of these functions.
> >
> > This is all really confusing for KCFI so wrap these into static
> > inlines and prefix each inline function with __nocfi.
> >
> > __cpu_clear_user_highpage() and __cpu_copy_user_highpage() are
> > exported in arch/arm/mm/proc-syms.c which causes a problem with
> > using static inlines, but it turns out that these exports are
> > completely unused, so we can just delete them.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  arch/arm/include/asm/page.h | 36 +++++++++++++++++++++++++++++-------
> >  arch/arm/mm/proc-syms.c     |  7 +------
> >  2 files changed, 30 insertions(+), 13 deletions(-)
> >
>
> Are you sure this patch is needed?

It's not needed, it was a development artifact from fixing the highmem acce=
ss
before fixing cache and TLB flush. The highmem code did a bunch of that.

Posting v4!

Yours,
Linus Walleij
