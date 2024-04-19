Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5C2AF01
	for <llvm@lists.linux.dev>; Fri, 19 Apr 2024 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713561954; cv=none; b=IJiL3lblDrnkfSDXY3naPgH4DCMZbw94xEfDEfdsTJa+Aw7VVNHt8TyE9fIEo+yMmINRgSyVgj/ee7+Dei3L//bspi0ihfBYpLwb45C8Xo43l8zuY6nxvpQlbH9C8mQ2bGWEKbEHbbqyYhc5kPlmlxDAwDOm6yO2b5NjgA75S7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713561954; c=relaxed/simple;
	bh=vdPqvjvp0I55H/kPKaC9POdMg/dILXclWjR6OVGkHwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYlEIFFhSym1D1HXWe8dJi9A3gXErp2XYGRp/dGDwnvNh4rYiJlDIewVg6g80EMJlT3PACl9KgWniEBBAFXoEIQsFykJgJWgI3Bb12h3s9rA5Y0yqqTsq5shVjmYDHnPwMWdIZjnhbGVWrDX7yNCwBUBVsmElyn3PmdAFqDCxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUEyqaqO; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUEyqaqO"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-47ba916248dso908822137.0
        for <llvm@lists.linux.dev>; Fri, 19 Apr 2024 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713561952; x=1714166752; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEu4wbiT412MBnzFpbDu6wJ2Weav8pvJrIlVBHck39g=;
        b=xUEyqaqOifemFNXWRbdUkfuNOg/VrhKK+CkqPgct0SbYqjuJ+e4hcqshL7JMCYQ3ik
         QdbrWhobKNLxQ59kLjPVNroqfLTetWbeQ48ElHZMhHB50/dFoGumU1/HE5mp8E8NtJIX
         vYD18GY/b6y4ql0TSS1owpM+sWqC5Ebrdu5prUG5LN06BIRZ9NGF5CR3RI+MXJNZ+uSr
         AerWYVqsK7eu6IxRMU+UEFPxsh0ym3x2ot5GHYEKqBNPNi6Svc3vVq9q5nzpPBARKCGt
         gB6q7PrM1byg4gPPHVn35Or+0V8mAepsi1unq28VswFRauNQi0JtJ7jlACwzfVw9PTup
         IZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713561952; x=1714166752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEu4wbiT412MBnzFpbDu6wJ2Weav8pvJrIlVBHck39g=;
        b=XnNDBgVQANsQPGjkAWf6UD4Ds/CuTOnWKoedfL83YeyHBpCdqqQ7fH/om15Um+RvUj
         tYXPZZt20lIFLA1NlPuupLyhCQNcwHG9HICyc9k5Z9eEMknhC/7bcTHlo1iA2Icg2CDk
         Shw8/habhchFjzml+J31uoDjTdkVMM+J8XXI6HtCxqfYr/iLkX/MtMYjKjoRwRx6oHNg
         PeXvydA7eLBEHBIub7R90z5HAjK3lXfuPV3h8Ss+nDBoObWOkCjJZn5IgDeRmk4n87sB
         UsTcNaOwPWwK9Gj2NBON0kTvx+RQ3PzLOav4DVwQbucH85JCXMnptaVlsfqE+6Pilj55
         6kFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ecZRihFMxJCx863J5gwORGVkxKzXlZDBkVMCYkEwZuvK48BV2ZGakL+tB81X/a5kD9ZkfpDhfMynnzvXfhaHLWBYpg==
X-Gm-Message-State: AOJu0YxnwwsXD+d71hzBz3Ub6aSa0IKcK6maez8+spl6ZLAZY6fwnOhZ
	nWRZZLdR9QsbNJhspB7qJdwxkZwBaJsUr8/qVpKK62M6fh98lzj/A0wklYNLMIQlwpBJGjgfg89
	YxJGHG5lQ1wCuq3muWnwEFey7MxYfjGT9uUGd
X-Google-Smtp-Source: AGHT+IFP+dDpW3y5utmSn9SXuAHfPkyXxr+l0bDP3AP8COYLPC/sOLeXnUzy1SzNuk0GIFzWeOuJOWpb8b4rYiRqb3c=
X-Received: by 2002:a05:6102:c07:b0:47a:472a:a5f1 with SMTP id
 x7-20020a0561020c0700b0047a472aa5f1mr4787821vss.0.1713561951522; Fri, 19 Apr
 2024 14:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
 <20240417-arm32-cfi-v6-10-6486385eb136@linaro.org> <CABCJKufKoDOrPUpKFXBnoNEuQ8gJ7d1zHn=H-gtLoLX=02viUA@mail.gmail.com>
 <CACRpkdYZWXO2Z9qAQX7Q1Y9S+crNi=81g-+W207PtrYXfgmdvw@mail.gmail.com>
In-Reply-To: <CACRpkdYZWXO2Z9qAQX7Q1Y9S+crNi=81g-+W207PtrYXfgmdvw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 19 Apr 2024 14:25:13 -0700
Message-ID: <CABCJKueFBC98v1aA2R=Z=Tqj=kvRb6FGW8CUYGv9-d5WUrMxGg@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] ARM: hw_breakpoint: Handle CFI breakpoints
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 5:56=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Apr 18, 2024 at 6:13=E2=80=AFPM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
>
> > > +       switch (report_cfi_failure(regs, instruction_pointer(regs), &=
target, type)) {
> >
> > Nit: To make the error message a bit cleaner, you can use
> > report_cfi_failure_noaddr(...) instead,
>
> OK, fixed it!
>
> > and maybe you can expand the
> > comment to explain why target information isn't trivially available
> > right now?
>
> Sure, but I guess I would need you to explain it to me so I don't get
> it wrong :D
>
> Is it correct to say:
>
> "TODO: To be able to properly extract target information the compiler
> needs to be extended with operand bundling lowering into the 32-bit
> ARM targets, and currently no compiler has implemented this."
>
> ?

I think operand bundles are specific to the LLVM implementation, so
they're probably not worth mentioning. I would just mention that the
reason we can't trivially figure out the target address and the
expected type hash when handling KCFI traps on 32-bit ARM is that the
current compilers don't generate a stable instruction sequence for
KCFI checks that would allow us to decode the instructions preceding
the trap and look up which registers were used.

Sami
