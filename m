Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E52C80
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:15:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id i24so29651790lfj.13
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nNs+G0jVD2dj+3QPCBepQC7w71O0qpj+2enPjKIhfHo=;
        b=bb3x+Vj+uVIsxGXCp/tCicQgGOOTKP0OfRO57tDFOuoQtwrTfQsKCmS4Dn98dBUHnL
         IsDY1cOB29uxQCGfA3SzIQojrPsGf2lvtFN2djaHlxgWSV1BPUlifpG4WoPVDJPfIvnH
         2Sj/poRRd3zSkPly80whiTnHAWTBZGXnYuum9q4ZGl2kUj9N0hILg0xGyJOA5o0CQB7r
         fKiJkRDoPsOnwJG2HT1vvNAK0pwDnQj3E54mNCNmEPRKnnzjxD/OB9ZeXoSfxYAhi0ec
         vrhhQvq2n5KrZ3bNBNm4/w8HFP1m7PKB2UuGM9excovNE1ufpulANm00q110V3jOH43K
         j1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nNs+G0jVD2dj+3QPCBepQC7w71O0qpj+2enPjKIhfHo=;
        b=vau0hJ3EQsbl1331gnee9Xllc8LM3ujcLDqD3b5yNz6KyNL96si94DT6wtb+lnHUE8
         hc92dqHhejAI6JpmAIeOKYbbCSEmYKBU4sLXFPl7jDWYgE4lvXBocace1He9dEhYtax4
         AUBYm9FA/yNRVOcLVt9ufZTIo4q4SzU7xLKjiO8g25ClAO9d1UxhHnnQIpR7i58EW+fu
         Y+3vfv7hIJJRQHjsKo690MQd2umtGzDln8S8c0dBixWzUb9CbfhbzKiGtc/soDHmLYum
         BtdjoXcbCR857hOnndIrPu2PQajelQ4GnWXrHuWtZFRCtnUU7fnsl4eADzhD6Ktr+uAX
         V/zQ==
X-Gm-Message-State: AOAM531dHWxn3DjtDUNsYHNS/P8f8lMYY5xyBeMruPNUEeS9/ww/ptHc
	hN97kWX67GqZTL7dPmd2ZKcQ/LT5cd60wsmYP2XG5w==
X-Google-Smtp-Source: ABdhPJzw201p0Me8UoPJUf744ySbtQZUgFia2EVV686wg86DCCgGVrC7sAVDFcRLxkbXWJScchfCQIH9656aZEsjSLY=
X-Received: by 2002:a2e:8695:: with SMTP id l21mr7244959lji.339.1634235321228;
 Thu, 14 Oct 2021 11:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014024424.528848-1-mpe@ellerman.id.au>
In-Reply-To: <20211014024424.528848-1-mpe@ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 11:15:09 -0700
Message-ID: <CAKwvOdkcWCFEWxjwPcABA=6qWas+wuVcdDS=T1Oh-j81fYxxFg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/dcr: Use cmplwi instead of 3-argument cmpli
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> In dcr-low.S we use cmpli with three arguments, instead of four
> arguments as defined in the ISA:
>
>         cmpli   cr0,r3,1024
>
> This appears to be a PPC440-ism, looking at the "PPC440x5 CPU Core
> User=E2=80=99s Manual" it shows cmpli having no L field, but implied to b=
e 0 due
> to the core being 32-bit. It mentions that the ISA defines four
> arguments and recommends using cmplwi.
>
> dcr-low.S is only built 32-bit, because it is only built when
> DCR_NATIVE=3Dy, which is only selected by 40x and 44x. Looking at the
> generated code (with gcc/gas) we see cmplwi as expected.
>
> Although gas is happy with the 3-argument version when building for
> 32-bit, the LLVM assembler is not and errors out with:
>
>   arch/powerpc/sysdev/dcr-low.S:27:10: error: invalid operand for instruc=
tion
>    cmpli 0,%r3,1024; ...
>            ^
>
> Switching to the four argument version avoids any confusion when reading
> the ISA, fixes the issue with the LLVM assembler, and also means the
> code could be built 64-bit in future (though that's very unlikely).

Thank you Michael.  We've definitely run into a few cases where GAS
allowed for various short-hand forms of various instructions (a fair
amount of recent work was around 32b ARM and THUMB parity in LLVM).
LLVM's assembler is mostly generated from a high level description of
the instruction formats, so it's not always as flexible as a hand
written parser would be. (There is a mix of hand written arch specific
parsing, but most of the parser is arch agnostic, and all of the
instruction descriptions are described in an LLVM specific high level
language called tablegen which generates C++ that is used by the
assembler, but also the disassembler, the compiler, and even the
linker if need be).

Link: https://github.com/ClangBuiltLinux/linux/issues/1419
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/sysdev/dcr-low.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/dcr-low.S b/arch/powerpc/sysdev/dcr-low.=
S
> index efeeb1b885a1..329b9c4ae542 100644
> --- a/arch/powerpc/sysdev/dcr-low.S
> +++ b/arch/powerpc/sysdev/dcr-low.S
> @@ -11,7 +11,7 @@
>  #include <asm/export.h>
>
>  #define DCR_ACCESS_PROLOG(table) \
> -       cmpli   cr0,r3,1024;     \
> +       cmplwi  cr0,r3,1024;     \
>         rlwinm  r3,r3,4,18,27;   \
>         lis     r5,table@h;      \
>         ori     r5,r5,table@l;   \
> --
> 2.25.1
>


--=20
Thanks,
~Nick Desaulniers
