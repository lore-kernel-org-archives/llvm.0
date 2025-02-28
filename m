Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070F1D61B9
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778166; cv=none; b=VGtPZj1yZSGnCBBjgHhLrzoBV5sb2kqr+ELRLUnM/okdEHkPK4XVmATxogjzIAk86+/aih1BhCKpMe/qOiO4c9FYr6z2XVt6WgMdt90oyJOBvh4YV4rXAsBDlNcHdllOaQWInqCGlSUnszOgIJjzhpqKJrBPnDMkKnTMlVxDx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778166; c=relaxed/simple;
	bh=kJMrEkhqRpc6VjDVs3fPZ28tdnuiN4UBff7uK9dxTl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgYqfNZDFIJL3efavNAle74Lo1xRiVMqB+9SpY273wx5a15hgJfXzoVJSUHQo9XGjT2h6pLWzpYTeP3wSacVbWxIfekhIevw7KK2z2WiARkHMGd1fnzBSwvlG25ynAtzQsSTHfBwQRSmcsbTh9NrULT/oeYmijDZg2SVdUBk9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RUatYRq1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RUatYRq1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb79af88afso476339166b.1
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740778163; x=1741382963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqzqyLpyoLT4MnMSiO5M/cbMqW2N1A2UktCSpw8Wecc=;
        b=RUatYRq1iE5/bch1yEMaKMYak4Up7UkOBfhU6S+A2O8mFG8+uXdomcfE/oNjhz9I3z
         IrGOqoM1pJ/9vHbG7rv+G2z26+tpKnI63mDWTgUCzdctf46/mrIjQOS+JthBuURLO3kt
         pPqJ58tdvgSJytUsjZWXWTpCn1AuZiLdmTapGRU/BLqjsFiUIqAlG6w46+2XHxnZH0H9
         nEuj1yXOegiHvKXrIcYTkKBRxet/E/ce44/xjOR/o/6UdwGfng+jslpuQXx9CbqPaXyJ
         klvqVPlDGrcJDK6XvBqC9HWVkG4UqhczvMnecDznJM4npua8RlQBR0MgOlB2Lu8OvivV
         8F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740778163; x=1741382963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqzqyLpyoLT4MnMSiO5M/cbMqW2N1A2UktCSpw8Wecc=;
        b=ZV8rO8FkC/6CWMl3K26CE8e9NHeSRdHt77ZET/uysBI3+2zT0K3OraU7iMB1OvUumq
         hRylk0pF9+lZw6nYbevVYaZpJrNlHyN4Xv0HxCz1ktVlHXb51cJTBtqBMAVPLUKVTkZP
         kgKR7yB4NH7JBn5XLkAtDvi+jTf6KsUqn6aV+Z7Jo2FT9ku0+7sqa7Ai0F3yZRJ+5Gyj
         qsXIZ87SvHtzZpS2uITdPD4w+zJJmrF8bvrf2Z0orR1/H8v7hCaR1ljEFoUOpM9GhMZ9
         mT238Xh5z3m/duncwdKjEEZrQ4AmohvjgQ8MjGF2lL6Y104TzLLgsONAJn8LXRvFOE0q
         eV1w==
X-Forwarded-Encrypted: i=1; AJvYcCWfs9V7gVvvNfMooBJh6qWcWOTcKI9aFRGZHX1JbX+Zfjj9CMCxnUR2w24cedEgimFwi99z@lists.linux.dev
X-Gm-Message-State: AOJu0YziUjmwlSuktuEmYbw9bWWRXwEe9f+PHnvoRBT8V31ngfd94oLo
	hHkNEyoTctfRpc3tJ12aIu9zao9ch3CM0P/xYZL40z2LaKYoBfHWJuEUMTgRmV/Vib1gLdbEmLY
	DvK7p3/vyQxoWBPryGLlNYDaNgHbWwsxsC6E=
X-Gm-Gg: ASbGncu91ZQMpzYrJUmqsXM4J8OprHwfnHoNfsyY5vMOPPYsLt2Oo7QSy0Z2J+qjIjN
	nDMmX5MR4uNf3N71dvO3syR5/b4M+JzuZhjzcCJqGCmqAo+MdBay5DpK+xtkuaJIfnpJGnCkBeX
	rIx2yT
X-Google-Smtp-Source: AGHT+IHelEGE+Ufz9+A2TmH66Wlq+3MH2jgktN1tokY0omf7FSH344duWOuLActep5LEcffLSDmvVh9lPxUEywsplNI=
X-Received: by 2002:a17:906:3097:b0:abf:489b:5c77 with SMTP id
 a640c23a62f3a-abf489b5ea3mr139416866b.31.1740778162964; Fri, 28 Feb 2025
 13:29:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
 <CAGG=3QVkd9Vb9a=pQ=KwhKzGJXaS+6Mk5K+JtBqamj15MzT9mQ@mail.gmail.com> <20250228212048.GA2812743@google.com>
In-Reply-To: <20250228212048.GA2812743@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 28 Feb 2025 13:29:06 -0800
X-Gm-Features: AQ5f1JrI9-xg8yMWBknx8JPMjZcjjoD-wwtXnx_7ejGcNBpiyVaHSJIt4DfOzmM
Message-ID: <CAGG=3QXR8WNZhYTRT_cF76P+NkRNiK7Wd+8rpVc=2JVNrhXZEw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/crc32: use builtins to improve code generation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-crypto@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:20=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Thu, Feb 27, 2025 at 03:47:03PM -0800, Bill Wendling wrote:
> > For both gcc and clang, crc32 builtins generate better code than the
> > inline asm. GCC improves, removing unneeded "mov" instructions. Clang
> > does the same and unrolls the loops. GCC has no changes on i386, but
> > Clang's code generation is vastly improved, due to Clang's "rm"
> > constraint issue.
> >
> > The number of cycles improved by ~0.1% for GCC and ~1% for Clang, which
> > is expected because of the "rm" issue. However, Clang's performance is
> > better than GCC's by ~1.5%, most likely due to loop unrolling.
>
> Also note that the patch
> https://lore.kernel.org/r/20250210210741.471725-1-ebiggers@kernel.org/ (w=
hich is
> already enqueued in the crc tree for 6.15) changes "rm" to "r" when the c=
ompiler
> is clang, to improve clang's code generation.  The numbers you quote are =
against
> the original version, right?
>
Yeah, they were against top-of-tree.

-bw
