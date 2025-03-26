Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A6253331
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743013652; cv=none; b=GIXvBQbkPXxoET3yyTObAHX1jk2GWlMSD341HExwkCuRntkBu6XWW2uqD0Bjs6w8H0btdIftZTJehLFK0yuILzhqgjF5mBAhhsIWp1hMu5Coh8FskzOLr8IV4MCz98tIMe/qYMRJ8Sl5ua+sZQrr6T8r4N3lJP5QWAvlpoI02wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743013652; c=relaxed/simple;
	bh=WmQEkXsfznu8w+rBf6ZgS1QtNrnadeHs+aER+P43DfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpEdXNv7vWjUnIweyIEzSOwq65/h5neZXeRSCOdrsiPZpSXaITuHmNOC5QqUkOpPj4wDXGF8RCcIEURVkAfO47CudT0Al+gVOqLJ0rRE5lTp6Sy5InXLSHq/jNzJI3qkx2HaJ+XGvXG0j+L0gpzqPPBATSTWGLBUqrblYxaBrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrE3+64P; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrE3+64P"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac25d2b2354so23369866b.1
        for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743013649; x=1743618449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwZ/kZVKA3ly+94BX9Iupd7sb0MCbfiMrJTL+cNfKIk=;
        b=IrE3+64P2QcuBkltJlFEGo93r5TSQaXqr9QlGDDHyb5cOj/6ZWzByVwmiD8reRIfYV
         FgetbFDVVlT7OVbVdJm9ev6dGCbwVIkMF52SigWHuxcfH9lkMJsQNq8UYGykEgYjFyAZ
         rM+SYnu9PO8oq/pP5/+7X/Mn940kEF84mlpwpeluA2cSkeLnXqQLb1tZABDVH2cg4nEq
         lpcSKxUxhSGCeW5y3GGHLQR/6U+m+Sbv8oKLxuGzK5mdkFSK3XWxfm+5O+sUDXgG10w5
         bSj0/MAiMPsUx9St4hO4v95rieNDGWDe8D8C7fiEL5brv4KFT6ouUBs3Dv9ZhBt9D11Y
         CChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743013649; x=1743618449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwZ/kZVKA3ly+94BX9Iupd7sb0MCbfiMrJTL+cNfKIk=;
        b=N9Xi4iuM3KqgJ13DXMss9ZREVTdfY0wM5mNrlob+BeV8BXO4rdHhrGi7F8zl3wHhkb
         32KUVIJFLzvLcUPZZFxp0x96kMqRVSdoMOEmjvOYRExz/26ftvMpGsrizsU1TQYGbYMC
         BAlqFZ6c1uAxmFN297/yt3JUOujPmY+E4SahbH0Uo1zBzXfwUZcwnO6d9IWEqHhfTztf
         7/cFvq/uRoFtdCieZ9UZ9BxG7dQu/IWrhcy0uyJ8gETSWJOR8wjlRnwpxWtKVCQfIuc9
         79PRlCZFsibkq0Ye3jHtKvKYyUN/kRMT3QEKya7tiZfrgPDhaBsez+2dUc2ShBQIma+i
         qi+A==
X-Forwarded-Encrypted: i=1; AJvYcCW5RDrw1HEZ7AX+0FeHFtMzb6xOW0WWCyxx2wbNMI8fJxYmIeKnNdhnIrp7LaSCabNcmx4y@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1WHXF8Q9nv5skQfE5pUfX/1xCcbTuWgNywd6moflnTtiZaPzy
	s93lFuUYtMDjUKRSv8UuTaGL4DEb1W7B6GRFMoqedeb6hdPQxC3z7IlWt87lY6LRjGGIj7nN2GN
	MrtsanpkmKzHRTj82p1UZbj4ZnSQ=
X-Gm-Gg: ASbGncuOGVtNFYQofuspP6ixddxB7onyhWenZSRd0h1an0tUqtTKoeRvjrgDFKeNt5M
	iFIwqcwt9FSu45dNovho1E3UzGUbUDxm5D2MJGZA+o23lgVpZpmGI3U+juXMJAMDrCUVHnhOOm7
	llcK1yDCjnoDsRa8wNBm7ZmoIajw==
X-Google-Smtp-Source: AGHT+IHEdBI95BIvNnCvD45NxkwA9Jfkjd2N/HbrhhEJ2QD36+kiqZsHBQL6YYQBJvkZKUHnv2ISqLpkZVcqd7Q0+Sc=
X-Received: by 2002:a17:907:94c5:b0:ac2:84db:5916 with SMTP id
 a640c23a62f3a-ac6faf0a6a9mr43494566b.31.1743013648829; Wed, 26 Mar 2025
 11:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-string-add-wcslen-for-llvm-opt-v2-0-d864ab2cbfe4@kernel.org>
 <20250326-string-add-wcslen-for-llvm-opt-v2-1-d864ab2cbfe4@kernel.org>
In-Reply-To: <20250326-string-add-wcslen-for-llvm-opt-v2-1-d864ab2cbfe4@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Mar 2025 20:26:51 +0200
X-Gm-Features: AQ5f1JpKCzAXQfQrm4wlizX6k3LQpGAsnw7BZMrTEbEqg_iMhTRlQx6b_DF8dWw
Message-ID: <CAHp75VfdNcQKCza0gYMg_hKAbZK_J3uSwZsoTS5-Bbt5_P5HPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] include: Move typedefs in nls.h to their own header
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> In order to allow commonly included headers such as string.h to access
> typedefs such as wchar_t without running into issues with the rest of
> the NLS library, refactor the typedefs out into their own header that
> can be included in a much safer manner.

...

While the below is the original text, we can reduce churn for the
future by doing the following change while at it (no need to recend,
maybe Kees can amend this while applying):

> +/* Unicode has changed over the years.  Unicode code points no longer

/*
 * This is an incorrect comment style. Should be
 * like in this example.
 */

> + * fit into 16 bits; as of Unicode 5 valid code points range from 0
> + * to 0x10ffff (17 planes, where each plane holds 65536 code points).
> + *
> + * The original decision to represent Unicode characters as 16-bit
> + * wchar_t values is now outdated.  But plane 0 still includes the
> + * most commonly used characters, so we will retain it.  The newer
> + * 32-bit unicode_t type can be used when it is necessary to
> + * represent the full Unicode character set.
> + */

In either case it's fine and not a big deal,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
