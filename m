Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099BC145B00
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041707; cv=none; b=iKzYjvVO2y65HnCwEl5JGMjm8zsA8mqcS6PBv7GsgIyMh7pT6EvwCFqqsuD3aFJRs2uulIADrEMHpX8v6VOnJXK3VfepVWY+v92H/lF+mVE4Cc/DBB7WdQ5KrOGAqZMRCD6e0vwJ1RHpOLGoC5My7uC1ufqMDLKGIqYz8jnyyJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041707; c=relaxed/simple;
	bh=h1aaVq0SJsg0SD7AfSj9yzlfTwgIKG1Oc7BNMEotesI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQk8DKxa1rgxE2dE9Vu9zbyKHBoscnxyG6aZJTTV3Bon1zCa9R2TDTRI4dhUF3/82gRAC1qoj1ubkbS8clsDJqeTK54lL/2jQLAEs6cePCijFdVldKbdQCHZ4LOPDEMdHJtPXQE+dFJ8IOL8XEdz9evKOBMa5jIkw9UYqt+lsyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XOqa4CUy; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XOqa4CUy"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-60935a128f2so1612457b3.3
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709041705; x=1709646505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1aaVq0SJsg0SD7AfSj9yzlfTwgIKG1Oc7BNMEotesI=;
        b=XOqa4CUyb3oTZRG8iTy0gAlzmlcSkPVYkXwAYdqrn2hOBN/kNtSFtCzfPq39hUpIZ5
         7ZC1PPtF2LKKnuN1ZbG43v6oTyxyjeHHTgh/NgQqu3XVPWY0+4QPYNucg6OfBueXhlMh
         OM9l9MH2hQL2oweQGPQ0l5vRNZSC+A6DT24UT2Rbx69gxJY6+K8OUmydBBUVvdUGYC7F
         sY4M335qBLRYRB2NultAzK+KkETR5CoA/IL/7g78Y8QpYEQUaZ2WAZyXak3s6xiFQhsJ
         j0ml/GZebO3CrRxVWDmt6EXugK8wsdKJAfY/suhb8gvkOiAcuJyAgG8rhlGfdakRU6g9
         L+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709041705; x=1709646505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1aaVq0SJsg0SD7AfSj9yzlfTwgIKG1Oc7BNMEotesI=;
        b=J8m3RaQDZD62kmaYaK/emugDk2p1SLqHujBKc9cvZP2MuUGIktttisvB0yVc0bus3Q
         t3uL3kwe/kh2e3Cr5Bn1RoMRdD0M6OzzyLUE7XF1ICYmm3KHn0PSawJgYWq03UKEHmiS
         dWncCwgaLs5NIq3zpTrGXJ7+c4vLjWHdtJIxXCUuyVFzPKgcucbgKT9IzMCwmYNei0G/
         TaVX/AoGr/Sx5l7YqXR/UzeDWvjGqNeCRCvN0W2fogg2XRgFfx4y5iLdj5qH66GXga2g
         bcFuSjLblQvjOzGtOradBJLJPuibL0/MhN+3YyErcDlnkS4NApWV9Lyg2PQcax3lIjfe
         0+1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrxilFGTc8fSyO2ybkwVLxRPb9R8F3jFS3qOPf0ONI7VF//JEIchECHt+RRTejmPuiBN8TezDbkA4TYBzMkfuygOuLAQ==
X-Gm-Message-State: AOJu0Yw/eLr0n1etzvppFyUpS4vQ3RFGMCnG4QNv792GelWAXwW9/0KU
	/jv6jbMxJCe6I0GJPQ1ypvzjTlpikQk+zbiZUm9rUamgHoY31FuSHNShZ5miB1IwfwjQm+1rObZ
	zxp/V0g3IsFTOa3ioph/GshSBC1BMQxsQjKdzq4ivG9Xq3bSV
X-Google-Smtp-Source: AGHT+IECo8XjQ/j3xbS0h6t2n7dUNMkw9ykUl0Xr27IRODNzEjEtKS4Dd6yGd5iRedFTE57FH6I6kXRoKtLe676P5C4=
X-Received: by 2002:a81:4113:0:b0:608:e6f4:4e14 with SMTP id
 o19-20020a814113000000b00608e6f44e14mr2083538ywa.47.1709041705050; Tue, 27
 Feb 2024 05:48:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org> <202402261703.695B87E6@keescook>
In-Reply-To: <202402261703.695B87E6@keescook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Feb 2024 14:48:13 +0100
Message-ID: <CACRpkdYZsBQwUCEKsspkZ=M0Goo9omMH=LM=pWyOJ0U1WtySYg@mail.gmail.com>
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
To: Kees Cook <keescook@chromium.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 2:06=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:

> On Sun, Feb 25, 2024 at 09:08:09PM +0100, Linus Walleij wrote:
> > This is a first patch set to support CLANG CFI (Control Flow
> > Integrity) on ARM32.
>
> Yay!
>
> Is CONFIG_CFI_PERMISSIVE=3Dy expected to work with this series?

I enable that and what happens when I trigger a crash is that the
process shell is killed and I return to login prompt (busybox).
I guess that is expected behaviour for permissive?

> I wasn't able to build with CONFIG_FTRACE=3Dy; I got this link error:
> ld.lld: error: undefined symbol: ftrace_stub_graph
> (FWIW, I'm building against v6.8-rc2, maybe I need a different base?)

I get that too, from the buildbots, but I'm clueless about what it is.
All of it is in generic code, nothing ARM32-specific, maybe some bug
in v6.8-rc1 that was fixed (I wish...) Sami?

> But yes, I can boot and prototype mismatches are caught. Whee! :)

Sweet!

Yours,
Linus Walleij
