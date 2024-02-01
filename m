Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7A7E0E3
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804635; cv=none; b=hn2Gq9zCLeIsrY8o85++4sQkQKr3EqiAoH/o34Q06BnjdYP7Q4K8m5LEAXh3OLm7gV8BMu2v4qv9zRvwZ4fbtwMoM/uHyDBMng3XZA9cELr0GlE/dYwSD2QEBYezuNhTHk8V89uguuaSG4QJT9en9Gac5Mf3aW7V3Xbcak7tvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804635; c=relaxed/simple;
	bh=r6HuU+nMuZPxOqccbs5Of8zd1RTaXx42PjFB7lXu1/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PS3MnJfIqZ+BFcYF8Qd64uUHNIUHFbkkJKZDVTCV2YZmKkJIFFSpW/xNiPl166VOhK3BHIu5wLYrLcLwIoxE1FcbLreMUwF5Zz17vnFEARngCnVnL+SmhXHEYplgStVAwpLW6JK4n8a7iUGqKyJ3LswJaD0QncC92zx0KZUiK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=135uFvSW; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="135uFvSW"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4676a37e2c4so482062137.1
        for <llvm@lists.linux.dev>; Thu, 01 Feb 2024 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706804632; x=1707409432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6HuU+nMuZPxOqccbs5Of8zd1RTaXx42PjFB7lXu1/I=;
        b=135uFvSWkD9oU9XxDhQhhAbo3gGqZLfql8VyT8gjsjCmqfsO0U7VHG8EEltoAI0yi6
         RpViFTkbFEGh8qBTRB1Dol69OMASyWccyOyqZeuPcHGVHH5n70sHKSs3yPiWZVkULMoa
         zpUkGpb9zuWtON4ccfk6WK3++GpCx29U0yehOaGqxyQ7Gz7IcuL8nHjEeyIofxFHjg5Y
         GS9CmUAJJHm/DMjI7XyVssUZ0hxRRx0f619qhIA6LflFzPj/0/JS5retmnAYTaezQb9a
         fzIB3kTMbLA/ayZcwks9Aa1DcLzZ8dMycemTl9PH/bCI+1iJQptan9YGGIMPZUU+vwWG
         yCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804632; x=1707409432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6HuU+nMuZPxOqccbs5Of8zd1RTaXx42PjFB7lXu1/I=;
        b=Vql3ll7OcSgpw8StHa40MktfMuTjRiZ3+zaIhaULSmbLcTTsVXgdWwqEcde0cT14fY
         al3XNpSPKDIgd6IkaCb8E0t7pnc49zaSctRQkeGoT5tUXZ3FFLgJtatPC/Z5oAXtNv0q
         mnSJJYEtt4pTVj9CnQuK5shwUzC18ZEL9jcalmx3h3XreggQLecAg4YG14vAi1BpNDpd
         UBYCN2MErrclBu9NqC9vkBYtOveGKGq2CJGTfHy3Rd5c0MSFlQbZYhPo3bea7H3MMXbZ
         Kw8S6Q7OLUbsAuhAvB2mgEbfzFC/jzxHMJeHaeA+CLi/ZZeZh/eR0vToopqVK73fe5+v
         dO9g==
X-Gm-Message-State: AOJu0YwBtFT2mERCZTw8gekLZMWmhDkiNfm0dRzUpzqN4eutAGNuRtFI
	ApSpdwcOwHRZ1DPyFwieNQ2FJZEtFZYLxImkKm/PalIrL/rU8GIZvS1tvS7Nc/qBfiin7v2C/mn
	1rtXkI0CkLdoYVij6TuRVfCauToiO89WRNSov
X-Google-Smtp-Source: AGHT+IHZLNoTy9E7TayTesZ1prle6Vi1TuRcJ9benAaEiMnkjqKwtoceCYTAuIKDKKFkE7hFgE89TvCQ3nXaE5/5lg4=
X-Received: by 2002:a67:fad9:0:b0:467:9f70:e137 with SMTP id
 g25-20020a67fad9000000b004679f70e137mr5119440vsq.34.1706804632143; Thu, 01
 Feb 2024 08:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
 <20240129180502.4069817-22-ardb+git@google.com> <20240131073156.GHZbn3bILaWLEluzp-@fat_crate.local>
In-Reply-To: <20240131073156.GHZbn3bILaWLEluzp-@fat_crate.local>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Thu, 1 Feb 2024 08:23:41 -0800
Message-ID: <CAGdbjmJi_b0jt4-noJEdVFvQ80BOBULmHic8D-uGsNn4m9rTyg@mail.gmail.com>
Subject: Re: [PATCH v3 01/19] efi/libstub: Add generic support for parsing mem_encrypt=
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, Conrad Grobler <grobler@google.com>, 
	Andri Saar <andrisaar@google.com>, Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 11:32=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Mon, Jan 29, 2024 at 07:05:04PM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Parse the mem_encrypt=3D command line parameter from the EFI stub if
> > CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy, so that it can be passed to the early
> > boot code by the arch code in the stub.
>
> I guess all systems which do memory encryption are EFI systems anyway so
> we should not worry about the old ones...

There is at least one non-EFI firmware supporting memory encryption:
Oak stage0 firmware [0]. However, I think Ard's patch seems simple
enough to adopt in non-EFI firmware(s) if needed. I merely wanted to
point out the existence of non-EFI memory encryption systems for
potential future cases (ex: reviewing more complex patches at the
firmware interface).

[0] https://github.com/project-oak/oak/tree/main/stage0_bin
