Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF513EFEC
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043380; cv=none; b=YxgiTjy29JpK++iEMDYwzkfSB/YRUXEy2avK0SIT4ZLDLtu3VZrSpczBmjERsTVPUmio+2bmg+X1Au9osd6t28TmiTsvE0LU109OzEqX98ADCj65qjcQQ0P83oeJ3753cHU9ENfGQ9Y5cCzvCqcJ1eb0Bontbs2B08PGfB9FKYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043380; c=relaxed/simple;
	bh=Z3hUKKiK3QIBtHUd3vabPKO3jfRtA4JWp2ZQKBgRtM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYlQuhknQtmTbulB/ushRN9A/vFl9LMzRMhScI9R6ZezIFjIbHRr4jfdVRwC8d3xKShzfbVI1F2JoaVCxz3q1CXi7VLeQ7Cf2fyh7u8CqHwzXm5JIxtGVFZI9Z+ZtT+zPKgajo1LV334O3GG55xMrQMICDKCQbvASJE6nn9tWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HESUrU/C; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HESUrU/C"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso4130648276.3
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 06:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709043378; x=1709648178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37OpJtzRdoBMsIDzWELabjsljH5T+mpBOqjG/6fmT08=;
        b=HESUrU/CqZpfMxECKf6USuNYdj5+yw83eOpSegBf0OWAVguLNEfY0N3RSIt4Ud3g02
         5vWqhrYweYOAekj21nGkYrvJ4gnLV+CDwgwaEzHlv/t4cLf0ILdAqCQlyMoPgCKTzGab
         P5Chxk7lTcTmiAIlJv72duKZ3Wa8WjH1WMLZfi0c896TWk9KwCyqI/kRXiP/a9D5Dx8e
         7nVosnS3n4PPO81xC5mRRCbW8t8R0u/wAeR/yUBRNDio7fPfkURHYfXV/HZEk7jwBIYl
         VYFQ0rOwHOAIjAojXFPcFQi886Bjz6UteYKSN5xz4YvDf4z65ykHxOGT6VXgU4jbn4g/
         UKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709043378; x=1709648178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37OpJtzRdoBMsIDzWELabjsljH5T+mpBOqjG/6fmT08=;
        b=BjYqllU28Q0w79gYKmw/Zomz8Zu5UdrQJglF0Zncx0SIIPjpj3lg8oG2PfPLptdSU6
         wAu+/AOIagsVK/pCpTqt7q2DGfnem/7UUtl6jIZoMqj7AdNZToQQiT7cIzPJaBVGDTq1
         wunqQ3yNjwpwXmNvtFDwp4+hX0Gt5/Qc7ZESz+qXJS5jbG6lsstnUs1iHK/f5DdpT2ad
         /88zidDSBbbVMZ+5yMCRl1eUri5UbAs3j7gHn2vx3mASMzinEF6+g6ph5jU1pLsWAKBX
         xNkMBeTLO3ZgUBdnGaOWtCgtF8Td7SioYfqzdLOFdk6oL5Gwog4EFjvhjH9IfdBPZb+8
         GWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP8TpLFNkw6N4lq3m1f0G+nZ3ZMebt/x/TlLrmYrG+M0jPUMvhzw+0CW9djRduD/bqSaAlyXysZLf1BNMEecfj9JkejQ==
X-Gm-Message-State: AOJu0Yxi20NcHEx6JfosC1lbzC2Rv9dhJAYI8NRM5NdYXC5SHCmqAfHn
	2Hr/MU2PXg3ITfcvE+fSnnwkRLDsGY9S82VNIyMcMfGQ3t7ddA2C7GEKiGeDLGemT5ppY5RUkMF
	H9Ftt4SOCLL7+fecHUVTp73G803ckQNkJRblWWvVTU5J9xUPzOSU=
X-Google-Smtp-Source: AGHT+IF2GJ/UAV1bQYvAr1q5bqsB2XwREi/Q6ZFqg1o28SqMeoS5PfA+iCApt9A1ZyN/sJo88OlBdA0pdoMJAbr1ajg=
X-Received: by 2002:a25:b92:0:b0:dcc:aa1f:b418 with SMTP id
 140-20020a250b92000000b00dccaa1fb418mr2330922ybl.1.1709043376268; Tue, 27 Feb
 2024 06:16:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org> <20240227042103.GA902845@dev-arch.thelio-3990X>
In-Reply-To: <20240227042103.GA902845@dev-arch.thelio-3990X>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Feb 2024 15:16:04 +0100
Message-ID: <CACRpkdZWDiUZ8B1TDjPhRT=TPLw2FCcuEq4PtH04RVv4jnyAvg@mail.gmail.com>
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 5:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> I went to take this for a spin in QEMU using the virt platform. When
> booting via EFI using edk2 in a manner similar to [1] but with 32-bit
> ARM virtual firmware (which I implemented in our boot utility scripts
> at [2]), I get a panic on boot even with CONFIG_CFI_PERMISSIVE=3Dy:
(...)
>   [    0.247907] PC is at efi_call_rts+0x30c/0x330
>   [    0.248158] LR is at efi_call_rts+0x1c/0x330
(...)
>   [    0.257986]  efi_call_rts from process_scheduled_works+0x298/0x3d0
(...)

> It is not immediately obvious what EFI runtime call is triggering this,

Not to me either...

> I assume that has something to do with the lack of traps due to the
> generic implementation. I'll see if I can dig more into this tomorrow
> but don't hesitate to jump in too :P

I think it's Ard Biesheuvel territory, he's always on top of EFI stuff :)

What I see is that efi_call_rts() calls
arch_efi_call_virt_setup/efi_call_virt_save_flags/
efi_call_virt (dispatch to arch_efi_call_virt)
/arch_efi_call_virt_teardown

arch_efi_call_virt_setup and arch_efi_call_virt_teardown
is there. So the default becomes arch_efi_call_virt from
include/linux/efi.h which is:

#define arch_efi_call_virt(p, f, args...)       ((p)->f(args))

CFI is not going to like that because it just dereferences this random
function pointer and calls it, I suppose?

I *think* that in arch/arm/include/asm/efi.h we need something
like...

#undef arch_efi_call_virt
#define arch_efi_call_virt(p, f, args...) \
        __efi_arm_wrapper((p)->f, #f, args)

Then __efi_arm_wrapper() can be a static inline to call the
function f, with the right arguments, tagged __nocfi?
The details beats me, I'm not good with variadic functions,
but if the solution is not obvious to you or Ard I can try to
dig into it.

Yours,
Linus Walleij
