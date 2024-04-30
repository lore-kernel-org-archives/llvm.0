Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4C211C
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714463000; cv=none; b=tt3apcExDm+dWdQZ7N8ICD9CcbXL5p3N7qmkky/E3w6FhXLUneb4nxbr3yfPVM+FNAjMc1RTfjrTiX4gQbkYRBKgEHVkimPLkt1gPRsGZQHHdfy3dpx9EGDKCbp5HlXC5kON/TZfxq+S1IuoB5MQ+trRRbun9vEwAgvld4uWJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714463000; c=relaxed/simple;
	bh=yjTq744XG+xd4Ij+L64VO/TxOb+TrssCjODwQdWjIq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mklgrOU2pwzP6KTWgEUNlPLsjVveAtuCNCCHAC6/mSNYoy0lHC2kjMsF4NEOOs4Xhf2p0q/3SdsdZ5K5Vg3VYS41NjJ9GAIiD2zHijQTXhErK+BtFw2lsvVuJklEx06MmLsgWgSxzfBZ3EfOr/aaSavSfeV6qme6aYZeGhbmqtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FA8AGOK0; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FA8AGOK0"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so4072520276.1
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714462998; x=1715067798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NszbcoAQ30ZH7/EMbiZgqr9KpGwFzHafUx+WVdhSWAo=;
        b=FA8AGOK0LUjUvGDxtz/Ba+OgDjre4nJj2QKgv07eXPiZO6TDIlHYAcRQxoZ8j9TS+y
         QRENGP4UEfiidsSZSCuxlT/MqVRa48ChZe1xBzM2KqH1vjxLQULr1pFIHdLXUXKDQaN3
         oYJ5KOZs8JWpSUKkcX3bq8eTntN6nWxGx16W3OcGcQ59vveIEz+UyClCkOFft4QAWBlr
         CnFYzHxP1azmTM3uVNyXRov+K8JXDqGQz0BObuYxpzsDlz0OJIo81C2RBqhBt1/Hj7mz
         gavpqxlXma1N75M2OS0ppG6kjsBfWZL74chhT2BKhs+xc+l6TdxMWORyU+qc//eUkkd1
         K6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462998; x=1715067798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NszbcoAQ30ZH7/EMbiZgqr9KpGwFzHafUx+WVdhSWAo=;
        b=TYXRF/Ye3cW+0JxIUTE8UfbMU8igXKHXGwErtZCcqA8LMAM087hRi8CNfnDkVohzvC
         lgKp7RV/OAOmvgcgyLrSjSjetJSznHsGcFRFSVj3qynZvmRnALagjMQB9UFqSDWNdxvA
         VPqFo47d4UEVxO8vLxMcc/yTTS76A1v4TilGtVEQlYFArOgX2bwkCV1Rgr+JQGmAxSUi
         +xxJgoXp9Mq7ZBpewGnlIqX3bQ0hKDUPCWDZVh9xEW/k/iS6Zn7Q/Yvfkzr/bfAcsnQy
         cXOz47yAI65W/ecc284YcW/JlaTnSKRDUUfNvsKU1ldmXW6MOag2Oa7sLB3j0v3DpWv1
         rZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUe4IVorIQ84mHjMLqDDCFGJDUxKA7/MumGaSwNBo30DbC9EiBdG44n/YybGeslB/rBK8NTPZdmRXgSykJqEvOvfJbJiA==
X-Gm-Message-State: AOJu0YwvroPP0t0o2vvr7UygsdiaFqzc+zEwdLBINcPugJMHl7bBxjPl
	dWpdNKt+G7pAWZM3Idg3loBaSoKDcKxAlP5BjDIg8oLPKbjsW5FEbOoalU0csQ9gs8faq44ynNg
	N0SoU0Cot+EMTag+PBZoFz0z38A43JmbF0or1Jg==
X-Google-Smtp-Source: AGHT+IE8xgcjb5bWipUUBEmSCmJJJwyXIW9br/gqh3zFpvI+OPz0mXc4WE3xroIvYIQ2LUGVPB59xLBbkxFIU+hOnWU=
X-Received: by 2002:a25:abc1:0:b0:dc2:3a05:489 with SMTP id
 v59-20020a25abc1000000b00dc23a050489mr1282825ybi.14.1714462998516; Tue, 30
 Apr 2024 00:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
 <Zi+e9M/f5b/Sto9H@shell.armlinux.org.uk> <CAMj1kXG_oLtPMEhnnpQjJUSgFnJv-rP_yC-BNJRr+aC5eycnWA@mail.gmail.com>
In-Reply-To: <CAMj1kXG_oLtPMEhnnpQjJUSgFnJv-rP_yC-BNJRr+aC5eycnWA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Apr 2024 09:43:06 +0200
Message-ID: <CACRpkdaA_i9mBdgGoWXvsdUQHQeVLS1tFmhU+fjCty1QKjucfQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] CFI for ARM32 using LLVM
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 4:54=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Mon, 29 Apr 2024 at 15:22, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > I've applied this to a separate branch, and it should be in
> > linux-next by tomorrow.

Neat, it's nice to have some baseline for this.

> > Can we make these branches conditional on the use of CFI?
> >
> > Didn't Ard mention there was a way to do this using symbol aliases?
>
> Yes, but only if the prototypes are identical. Not sure why Linus
> decided to keep this separate, but 9386/2 implements this for
> flush_user_cache_all() vs. flush_kern_cache_all().

Yes I did it separately for bisectability.

> we could emit the branch instructions only when CFI is
> enabled (as in that case, SYM_TYPED_FUNC_START() expands to something
> that prevents a fall through)
>
> E.g.,
>
> --- a/arch/arm/mm/cache-v4wt.S
> +++ b/arch/arm/mm/cache-v4wt.S
> @@ -108,7 +108,9 @@ SYM_FUNC_END(v4wt_flush_user_cache_range)
>   *     - end    - virtual end address
>   */
>  SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
> +#ifdef CONFIG_CFI_CLANG
>         b       v4wt_coherent_user_range
> +#endif
>  SYM_FUNC_END(v4wt_coherent_kern_range)

Oh it's a bit ifdeffy but I'll make a patch like this because I
can't think of anything better.

Yours,
Linus Walleij
