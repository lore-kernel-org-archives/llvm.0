Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A63B437842
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620492; cv=none; b=aGtRsIjzeqanQGE0Egdqiyb+1p8628Ys+RnNtPQrHTZH9VGEkCf+5mFijRj9Rcu5D3nywIWyD+/dK+OwD+w7WZjr4IDrIQtdjhX7ix/tmRYJzqVvVJ63ixsQKV27RbdxGJ53x0cMkZBmWW1S2211REwrgpbL+JTbjAdy5iqieyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620492; c=relaxed/simple;
	bh=dCFp8azqbtjMnvLCWbCJTpVJiM5s5tHj5DD4OdLTAbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3Zo51Vln5LA09WW0APmYOsJcuGvtrUR/DFt8Q7LrrqEg3FJV5Ch10xOiwD+zEVXvx3vdBmSpRsYs54KPyM/uAygUOWaU0PFHu9KC9PpM7bdvhkmlnYzgXqKzmC5F/TdarmcBn5bCivB5rbuoE/fNTK2lEVVvuzreU7M8slFVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdkkD2rs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdkkD2rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07301F00AC4
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620490;
	bh=dCFp8azqbtjMnvLCWbCJTpVJiM5s5tHj5DD4OdLTAbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YdkkD2rsb1Y9B6pAe1+97frJrUSdrI9pUkkIQiEGLcPCjxQBEOaohGm1EMYDRRErF
	 HSdcB/p61C6TGoVXpDp2YsyHapcdnrxYybT0Q7qXzeCtyNDC6eXAFYA6l3828R6N7K
	 bXuGIsfHmv400yRtXz3XMPAxbI3+Pr/2z0yKg0Kk4HA0bfig9cfem23jHxkYY1sd9X
	 8YYa/twa4g5x2ZBzgv68ygJXs8YayaqPhUFvimNLgzUiCOAPC3506UMi6ow2q0MckE
	 IVc7DcHBg1osEkH4Ji0uwUOUQNw0lx9bHRTHJjPWjfQ2lvlFqPRQr8aNsfZ48YxqYA
	 mfi+85oBUjDeQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a74f25feso133957e87.0
        for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 00:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwJ0C1yOXXsSqLJAJzpq5OwamRuWpEsrQI0N8qNf54HYpw+nshJ7OVQuaqIzySXUeN6+uW@lists.linux.dev
X-Gm-Message-State: AOJu0YwL0pSKJZ089wfiPc7RPkdx3n146J18nRHDZzFR4UjHEDtE+xy+
	TDM7fYV2X6iEmaHFjGA4fPz5f1DqqXul4WpgY9vvIaF31HRTvKVVk7vJGEY4zwYiKj9DRXiqM9K
	bBo9TQ/QSKlOveAjD1IRwdPh01jQDwzs=
X-Received: by 2002:ac2:5b4a:0:b0:5b0:177f:beab with SMTP id
 2adb3069b0e04-5b28f9b8ab1mr2888376e87.44.1784620489665; Tue, 21 Jul 2026
 00:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715175223.make.153-kees@kernel.org>
In-Reply-To: <20260715175223.make.153-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:54:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
X-Gm-Features: AUfX_mzMwCV8Z7xeaNpPDzFxYqTYvhmmKEur1wOLmu4Wv6aUpsrNZUfEjvv8O44
Message-ID: <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:52=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> ARM32 GCC KCFI[1] violations currently show as generic "Oops - undefined
> instruction" errors, making debugging CFI failures difficult. Add a prope=
r
> KCFI trap handler similar to the aarch64 implementation to provide clear
> CFI error messages, including the call target and the expected type.

Reviewed-by: Linus Walleij <linusw@kernel.org>

> Clang and GCC trap CFI failures differently on ARM32. Clang lowers
> its checks to a BKPT, handled via the breakpoint/prefetch-abort path
> in hw_breakpoint.c, which cannot recover the target or expected type
> and so must report via report_cfi_failure_noaddr(). GCC instead lowers
> KCFI checks to a UDF (undefined instruction) whose immediate encodes
> the registers involved, so the handler can decode it and call the full
> report_cfi_failure() with the target and expected type.

Aha, that explains a few things.

The UDF is a better approach for ARM I think (Russell will know best).

As noted from earlier conversation the breakpoint usecase overloading
on ARM is a mess, and we would certainly like to avoid it if possible,
albeit I have a patch in Russell's patch tracker to paper it over.

Do you think that long term we could switch Clang to do what
GCC does?

Yours,
Linus Walleij
