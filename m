Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4023BCD0D
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650516; cv=pass; b=J3wZmuekGEUUXX7ayo/8Rx9QHazx107EROBiE7C4X18sSXkHw3uPpfz6Eg+I+mgx4pafhxJTclQXLuGyoQde1LkF1+V/0Gxq0Co3NAWFEsLGQ6pnB25tEJT5iWafEkJa9pUfoHUn+A7emw5yAck3yW4CnbKIrn6YuFb8dZs1oZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650516; c=relaxed/simple;
	bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhBB+leHIf7I8fNaAVbQrnqofcLiwZJRYIIcXpTPILC8E925SC/VhczORCzNO6Qs1H4JaB46zVgjCP8AKKEoA40+EWRibNAiiQRHxkDpOaKvecIsqwRE5I/qJSUS31AFz/NHRso4tYS20SuLsIoNMI7AmqTI1FqPgu0w8IyLr6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkIOMV1T; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkIOMV1T"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so863513266b.0
        for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 09:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784650513; cv=none;
        d=google.com; s=arc-20260327;
        b=RygYYbhIg1abd6t1T0iBMftEjMuVnYLSaFfVpJMsGgP67btdZKHoZYa/25iwoqmw8Z
         AxYUUzxxViL42mw3icHE5V8PQ07yGMZ4KtjonJrNYJwn7kptFugTaLGwljEKbkHVFc3Z
         BC6tqRrkyjPQFJNeUhK9TcXcLB4qOKSIODi6okU3NwHnJykH8JBA1QTfML0k4cPRrw0b
         CfvRZqd2XK8fCGx54vY0iJOdKIHjhVvegR4Vy0YS04oTb2jyP1Bhr8vWGnCS5/ekSvFl
         k5tthjy/qLuCOWUSijDTkGylmMVaGr3Cra/09AXJlpIJMAh59PVSAIRCmZuENfXYKkMy
         rr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
        fh=ToVNY34EPVNW1oJgBRAQPcu1URLVOBi1QiVuHV4qrdM=;
        b=dBHrXid0EQlp8mbrbthqSoX5RNEVU/QdY4u2v6gTrgzAhssDPpXqMO2qEZPdGjWZSv
         tDHDWE8fLq3rg7SkSKu38OLYoSubENzAujTy9Sh2R0cFqFUslDgFPcIyuvJu/PKuiSZK
         D1aFJNUs9l8l/1QEkQWdR18bG51ZtHyuMuf78cuNfNMcBWYyDpb42ScUyHKb8Uj5XXHD
         Q6a8hMTvaffUOJAJxSrB5DraVxo0/iY1XwGV6dHCHg6klcXDNTFO/j3YRfCXeF7Pd828
         5WsGzshLv1+s9oI3nDBg611pKcxx+JwpCOo6nRHIR+wWp2WJKOC27pC1L0U9/QqD/ZkW
         MGcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784650513; x=1785255313; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
        b=IkIOMV1TbLaDlwU1wWsDVJlCoWB6hmCbqsyiWI8K0gBkUnGO4t96a1oGxMhSw0KJuC
         LkqMnpuKB+0gFMztAgvE90tae91aP1jZNi2OgNi5IEx2sqqQb5L+t06ahv4mdCZfjdvg
         gQ7CuHHBkASHN66GXLy7tCQr6rGyDhZ9McjQoYp3dDewdzWnnPRhMedDfWnL3g1vR8L5
         LlwmPcfaZnvXDJWORAOdp9prWIJWCaFoDKsTwG4mcfpymYhg9kIkEtw2rYnGMoKL/4z/
         hIKYQlRK22ZvDRKkKdJV45ePnTP9FlwS0p4KMBQG//r7j5q11uk5rJOTRQc5FSbUufed
         IIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650513; x=1785255313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jNF/wdr5AnCE3efKH/glvasNKose7c8fAIiOsTYCr0=;
        b=OMkhXBMe7XviwUTPZeaYYePZQqxlI2zT+3SpfDkk23qPRrRLEgDfGe6hEgAeYc7U9T
         xeDPhva1UIWDuGGQSxYxtrpB9FSvWJPFPm1WS8qxd7wT6QUBvMN27PWWD5X+ZhWWN6UV
         Rg3VmkH5cy96Nue9H1UUJRxhnaquD4oMhCi8SqVyZw+6dbFV+UIMZiLVaKGOnWe6kcrT
         yNQjoXRs+ZYwtxHKDTtZc0Dkyl8ki4kxQIgDHaSPKduUxq0yD2WrBnGV+h+eaYjMLU+V
         W5PQ4EPxIuo/mrL2DbVrfBRxdoEtwSRecsERKxwP9Hzdl9FhqInlypOKu1r8KK/AiISZ
         em5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq3i+vqJDF0rbJlplNkqqnwVP53O07gixqxDUKs0MeA9kRVHM5NaoKMM00WZWGvG6tDIl9/@lists.linux.dev
X-Gm-Message-State: AOJu0YxkMuO8ShwiWsFvSlpIwC+HXffLpUNznmW/KghOHC4M4bTTLwU2
	fmr9B76Yr73w7FnUBp5OcRKgMe8p4QuxbMhAS1nOaGHrY/sQaGCN7zSIRpOHhrR9FlN78JqW0GY
	k0WHFUdTs0y+S8bblEavqKVC1riccreAfr9Lbwofw
X-Gm-Gg: AR+sD10WtkNyYLyPGoP49p82FIsk8NHWKaxl3wxk269oUoF4AnVqRPMu4ldKposvpTh
	WtFOjqLg2Mmqs0Vtv6nGgbnx6ze8VqmtKfxaOzVW7ZBhqNqoH8Zxi0aWTlF0B0nxUfNSZw+GqwR
	vg9DekseE3sLz5PyfRAVg6BAaqsmpEHoSbKNj27vmAito1UtswzViYbrkFHOGk3RZvONre3PHsn
	T8SOzcIVLoCti24t97wUKcfvDYfaOc8HNI1SjPtxiBCqCXX+J3NhPidm01HmQIt/RAPFuxuLV9K
	/7TPbZRCaOKBT3u/lMJExqhF5ADCHyS47wk/eE749Gh2Omu7+upS/Xn9MgvxF3yAlRJGPv/UEw=
	=
X-Received: by 2002:a17:907:94c8:b0:c16:9ca5:e547 with SMTP id
 a640c23a62f3a-c16b487d78fmr786880666b.62.1784650512817; Tue, 21 Jul 2026
 09:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715175223.make.153-kees@kernel.org> <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
In-Reply-To: <CAD++jLk549ZcSjpRN0G27i1C-n-k-dOpmgvfZBgmHQ5s0F6dJg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Jul 2026 09:15:01 -0700
X-Gm-Features: AUfX_mx5hRFHlWZYNWCg31sOkuFqVIIRwEEvjRv3_jo_QY0cIF7eQh978jRBuUo
Message-ID: <CAKwvOdk54Fi3SHxTNA0sLQn1toDuc8uK4b0nbKYsrB42_gTjVA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
To: Linus Walleij <linusw@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Zhen Lei <thunder.leizhen@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 12:54=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Wed, Jul 15, 2026 at 7:52=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
>
> > ARM32 GCC KCFI[1] violations currently show as generic "Oops - undefine=
d
> > instruction" errors, making debugging CFI failures difficult. Add a pro=
per
> > KCFI trap handler similar to the aarch64 implementation to provide clea=
r
> > CFI error messages, including the call target and the expected type.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> > Clang and GCC trap CFI failures differently on ARM32. Clang lowers
> > its checks to a BKPT, handled via the breakpoint/prefetch-abort path
> > in hw_breakpoint.c, which cannot recover the target or expected type
> > and so must report via report_cfi_failure_noaddr(). GCC instead lowers
> > KCFI checks to a UDF (undefined instruction) whose immediate encodes
> > the registers involved, so the handler can decode it and call the full
> > report_cfi_failure() with the target and expected type.
>
> Aha, that explains a few things.
>
> The UDF is a better approach for ARM I think (Russell will know best).
>
> As noted from earlier conversation the breakpoint usecase overloading
> on ARM is a mess, and we would certainly like to avoid it if possible,
> albeit I have a patch in Russell's patch tracker to paper it over.
>
> Do you think that long term we could switch Clang to do what
> GCC does?

Yeah, I think that's reasonable.
https://github.com/llvm/llvm-project/issues/211032
https://github.com/ClangBuiltLinux/linux/issues/2176

--=20
Thanks,
~Nick Desaulniers
