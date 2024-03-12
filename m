Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFB6FAE
	for <llvm@lists.linux.dev>; Tue, 12 Mar 2024 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710231269; cv=none; b=D8edBRy/Fl+ls//wNZfye4O42IcxmxgBdDXTPpHeIzkpCK/3IRtu0WSDPtRdpAwLSxMIImfuMYrX7eOCzYXM4er9W05/Ek4hSOtxYOqU1OtgFYjLjKdDGdvGmUvYO7NPlFDbYhLU+j/tqBMRVqy6RHKhauG1ikPkqvYE0wLfxzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710231269; c=relaxed/simple;
	bh=l5xFhGVsetk+0ObCDpUtmxgAXl5fMAMrllmHzKtIzNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAlX9/c6+KUG0zeOYsDfZKAkKhGNk8dPxJxmq4yHMzK/b89IkeTKVThZcmMM2/JxFMgC9LcbOHpsc8nxX04CJVlPD004Qgqe2fQ24TxTR7mrbUj06geGRJdqdyIg08o2R594BdSXpAJpjAcNs8S5JjfIm4qkd/8e4HaclNmUEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SqOwWamh; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SqOwWamh"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso5700456276.1
        for <llvm@lists.linux.dev>; Tue, 12 Mar 2024 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710231267; x=1710836067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5xFhGVsetk+0ObCDpUtmxgAXl5fMAMrllmHzKtIzNQ=;
        b=SqOwWamhgCITd2upDi+Xq3Zt1g3KRy+JbF2JeNmQJBCozHdXCsjR+qntDp+8iFMBxX
         AuPJny8tiXPwP4wO/fqV9Ro1+qLHoTEGXSmXjDnDr79IM7Ry0eKeg5cOSou12s0hvURT
         deYYwGmFL2f5PdXZjQ0RCqDYwSUd9yJgewWxoJQrRzRjGYmmVkHl0sMFtZNY8q30lTa3
         LZSoRj3YuNYzL976aXfHaN5jK03mTp9LUQvYrN0A+T1NUXci+KpY38ND1FbnSoJEuEd1
         yliFpET6GCrWG6BeZvasmWPS7MNo36k5pblMjGQ/1bc6w5Wv/RegamahREY04tayHZDb
         6sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710231267; x=1710836067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5xFhGVsetk+0ObCDpUtmxgAXl5fMAMrllmHzKtIzNQ=;
        b=vOCnRkaIl9tzM8XNosIGMpYiu+kF23pXxcwu81jyVPBxrZzhrcIQ+4BTK7ICeKTBRL
         rUOKOI6YTP828kN859L+VZ4Gx7LElmAZl4NOaS3bG6UQnRDPW9QkVHYxjLxHQajhVXD8
         HM2SUA3HziDeAPiK5aT67EmEIjMnTqyN+QTH2eE+IpMwOJbrh3XPGGbxTnso0QMlWLkK
         tX3B6aYKlwES+fIL2HxC/BnYEcW0MvRRNhtNyMEHB+4iYkR+pVp63MUqXP+JCZDyrhw3
         x6fMuDitnvu465b1NvAFHF1f3UIzp4y4jeg0L9ResINnL6JrS4+gaJ0hQoyEilIXGLbn
         WgBw==
X-Forwarded-Encrypted: i=1; AJvYcCX0bJMWeP7P+AQ8Qj+rXf1qotn8d4n01HPA3Sd7wbTnmCAufmqUrQsIH7xqj148fWJ5deGE499WcLhRrsFyKRVBrEYjHw==
X-Gm-Message-State: AOJu0YwGsm4R82I1gFMXNK0tGUoHVCWMeKJBm2a8IxZN0vmZl93ARfa/
	BKEUivt7NaDSdTO/CxDU3Z3Z/kkRCBUqBD7G6lHmsZyMi1++QL1kI/yLUXkuiuM98o9KpGgfGcc
	komYs0yHjjuiNOrIxAeG5QS7ElPdqNa/Uk7jtNw==
X-Google-Smtp-Source: AGHT+IFylt66NwIibjBHxco3Sf7K4ytgZ+AeFybshdpJADuZ0tsNtqjcEqKmO30IbaSSqNNgomV81psR381BnasK9yg=
X-Received: by 2002:a25:a101:0:b0:dd0:97e8:74e6 with SMTP id
 z1-20020a25a101000000b00dd097e874e6mr6830172ybh.55.1710231266829; Tue, 12 Mar
 2024 01:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
 <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
 <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
 <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com>
 <CACRpkdaVkaM4ERUcK-3BqHK6O9hBtj4tEHZaQXbvW9Oh23c8Gw@mail.gmail.com>
 <CABCJKucJd-EG1yr6u5SvUW2Frxs3aBPCuo9TH83ba2chdkb7tw@mail.gmail.com>
 <CACRpkdZOsST_QtouokNgF0XRVSyoOJQr0cfAGTMjSCb7ezBLPg@mail.gmail.com> <CAMj1kXFHFBKbspu6yBg14KzLNv-jHHjHbnuYf1avZx8C9t6tsQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFHFBKbspu6yBg14KzLNv-jHHjHbnuYf1avZx8C9t6tsQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Mar 2024 09:14:14 +0100
Message-ID: <CACRpkdY32=uiRwQt44gkOtTRwKFrqUZzkVK_ezPVd1BBOwjhkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 8:25=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Tue, 12 Mar 2024 at 00:56, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> > On Mon, Mar 11, 2024 at 11:28=E2=80=AFPM Sami Tolvanen <samitolvanen@go=
ogle.com> wrote:
> > > On Mon, Mar 11, 2024 at 3:17=E2=80=AFPM Linus Walleij <linus.walleij@=
linaro.org> wrote:


> > +void v7wbi_flush_user_tlb_range(unsigned long, unsigned long, struct
> > vm_area_struct *);
> > +void v7wbi_flush_kern_tlb_range(unsigned long, unsigned long);
> > +__ADDRESSABLE(v7wbi_flush_user_tlb_range);
> > +__ADDRESSABLE(v7wbi_flush_kern_tlb_range);
> >
> > Then that works.
> >
> > The problem is that I also have to define all these function signatures=
 that
> > are never used in C and there are quite a few of them, if I start listi=
ng them
> > all and #ifdefining them for selected CPUs it's not going to be pretty.
> >
> > It can be done and they can be in a cfi-defs.c file though.
> > And it's better than __nocfi.
>
> Another option is to move the struct definitions to C entirely. For
> example, the branch below implements this for the tlbflush code:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=3Da=
rm-cfi

Hm that looks very nice IMO, I think we could go for that for the
tlb functions for sure, I will just steal your patch :D

The same can probably be done for some other vtables.

> However, doing the same will be tricky for the proc_info structs, as
> they have a member that contains a place-relative offset, and those
> cannot be easily emitted in C (similar to the SMP_ON_UP hack in the
> TLB code above).

Hm hm.

I might have to do the first approach and list all functions in a file for
those, it will probably be the lesser evil.

I'll take a stab at it and see where we end up.

Yours,
Linus Walleij
