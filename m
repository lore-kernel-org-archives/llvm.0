Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9233C9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 21:24:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id b18so13501127lfv.9
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 14:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Owa61EB2fhSVa4P0/sBU1LyujwJ7QeNwAdTAvmWFj4g=;
        b=KbRmuMDVGYkdtKRW6O6Js0kP1T6ts1/z4yZgk4/gx3IQLRLgYYYqY1ebCgFeqrDXWw
         5s4K6LVhOclFmgiJn1M+aALKGBQa0aT0UfepywK/+p/WJLQdoZUdHLDCXe+UM9xvtcRp
         tcXph3RK4emRk+tA9fxu3FhQ4r9k9Fsda45Co8rwWCmj63w+TXhh2Ln/bBR1aiV3QpDR
         VPOe4VqPkeBKgzmVUzuwxlQUzAsIUjhmI1ToP7QhRVN9wg/cZtvfwj7afk26fhwvrfNr
         StVQJ7iRpKCbb1OQF1cXiE8kZP3gzS59Iu2BABQjs5bBvZgEJOYhdMqWYnEzuIz6bx+t
         WoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Owa61EB2fhSVa4P0/sBU1LyujwJ7QeNwAdTAvmWFj4g=;
        b=FYRnUf68t15+fdfoCwlSk0S4RsO7QhjrMt/lQwNURSEDkVMxK3MmC8eMYw2KQgZUR+
         Ryz0sQ16rcad6yr2imblhDzmNOGDuCOoUWEufUNjC6STA0/43Pph6/878LZBLcrECLlQ
         5N8g7s0DvB/ZppPhimDUAkaWd+MpY7YBvPBsaJcJIUiBVlGdzR8H43yGVEGbpX50l/D5
         SNXEZxik4Cd8UvonJz7sgF2BtpzZEhCdcxDqFoqjHR+InIr/Mc1agdcMoiTlUye1bZAp
         gvVj4gmSVk796uJaVaqJzrIGku0+OU//80yv9Hj2MY3+4SS6pfIGN8/ccs5l57mCxXUG
         GWaA==
X-Gm-Message-State: AOAM531x6PIqjj2SndlzQQtLAwMTfCToHBK6bB7qH9T/pDzXGYlmKzLX
	BnXr6uaXWDE4mwz5y4/C0JGGrJvaXGfHmUkJGkbxXA==
X-Google-Smtp-Source: ABdhPJxK5xkmBW9FyKBBl9LgAfAWaYIMBkGoWtYpc/dkYfo2hiduTQK6tFfXSZGKHsWGl/ewFZl0zXp+g5M24VmA7qo=
X-Received: by 2002:ac2:4188:0:b0:471:96f4:c1d4 with SMTP id
 z8-20020ac24188000000b0047196f4c1d4mr12374295lfh.626.1651613054879; Tue, 03
 May 2022 14:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429064547.2334280-1-aik@ozlabs.ru>
In-Reply-To: <20220429064547.2334280-1-aik@ozlabs.ru>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 May 2022 14:24:03 -0700
Message-ID: <CAKwvOdmFhua9b4=DS4QYJmKg=0kT3CtEjXgfo8fnifU2t-ttPQ@mail.gmail.com>
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy <sv@linux.ibm.com>, 
	Russell Currey <ruscur@russell.cc>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b66dd6f775a4..5b783bd51260 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>                 .if IHSRR_IF_HVMODE
>                 BEGIN_FTR_SECTION
>                 bne     masked_Hinterrupt
> +               b       4f
>                 FTR_SECTION_ELSE

Do you need to have the ELSE even if there's nothing in it; should it
have a nop?  The rest of the assembler changes LGTM, but withholding
RB tag until we have Kconfig dependencies in better shape.

> -               bne     masked_interrupt
>                 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
> +               bne     masked_interrupt
> +4:
>                 .elseif IHSRR
>                 bne     masked_Hinterrupt
>                 .else

-- 
Thanks,
~Nick Desaulniers
