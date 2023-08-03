Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9B1F937
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 17:32:53 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso395938241.0
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691083972; x=1691688772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72h1vSD+Gc7oxbDzRN4MWCfdaXi7NAc6IXTkZaqvVg4=;
        b=tTyyvMp5vOdRW2mdAvBQBi99WPmURpo41StkHq5tlTZ6bqF7oEAmRm3dz1zS7x3Z/C
         +cb+MrDauBBJXS2qfkcWaKseMq74s2AC1qmHfLxWsoHUIURILddgHVTLEGk/vB0Y1yn/
         M5Amrq/SY1zQmz0RoyWYcJmGA0UtYEyDUxU4Comj0sNgNLOLcWdI0O01vVDMsctFnW5W
         BTZdj/x8QTU4vUu1SWR/O8RlXHKeI8wpGpwBA2MxufltbuRJseCE6Db4274YxZhVx9Q9
         w365eX3RTokW5QbT07mKCGCkkTuSzqvPWisZNiu9pSy6QNE4fj5txB9hgkg6gQCCoBkp
         ozVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691083972; x=1691688772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72h1vSD+Gc7oxbDzRN4MWCfdaXi7NAc6IXTkZaqvVg4=;
        b=Wa1JAZsaWAPAKQ9W24NdSmXKQPF626o/xxPCrsH7Cja/NdqW0q+A6YnBfs2ounYJWo
         5PttjFaN1K6Av8XWvXLK5b1/0HLlzcB+jHfIIwpzmbYWvaIhzxhw6O4EiuRrliybu/yU
         BAlKyk3Cg/SAnZONj4+RaxMuLiOWgtZuxLWdN0fguFe37zOwtYNXw5kdbd83yiy9K6wE
         pzbwf94nYZ4R16Xe+DrNwsS+kPImceugCFwq9gDWdEB7fwxq+1RKGIMQCfB976a4g2zN
         rYR+NiOgixhxYkYnyF1cja/EDvgg1faac6wJLaX8FUUZ1Rg8facXNLvlH/S2f4zLcfQW
         vfow==
X-Gm-Message-State: ABy/qLZwzu5ZACsSfEwNBYQEgXshXOq13zxE8HZopDot45kmWvr2aMYV
	naTK1+YCQE1mn/xHWf6FR9i0qhK78ijyy1JGlyVrhw==
X-Google-Smtp-Source: APBJJlEv8LYxVtcN3IWdatxyUj8MBicI/X51xRQ5cbz+ciVkP5fj605ez5Ocv9nOXp/7M1O/S3ixeQGC38TDQz3Nk1E=
X-Received: by 2002:a05:6102:3bc2:b0:447:55e6:15e7 with SMTP id
 a2-20020a0561023bc200b0044755e615e7mr5333218vsv.11.1691083971886; Thu, 03 Aug
 2023 10:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@google.com>
In-Reply-To: <20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 10:32:40 -0700
Message-ID: <CAKwvOd=t=n+mo_73MSrHOC9GLHHvH_p4nAA4nZfmJULiH3GZ2g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/inst: add PPC_TLBILX_LPID
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 10:00=E2=80=AFAM <ndesaulniers@google.com> wrote:
>
> Clang didn't recognize the instruction tlbilxlpid. This was fixed in
> clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
> older, rather than using that instruction bare in inline asm, add it to
> ppc-opcode.h and use that macro as is done elsewhere for other
> instructions.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1891
> Link: https://github.com/llvm/llvm-project/issues/64080
> Link: https://github.com/llvm/llvm-project/commit/53648ac1d0c953ae6d00886=
4dd2eddb437a92468 [0]
> Link: https://github.com/llvm/llvm-project-release-prs/commit/0af7e5e54a8=
c7ac665773ac1ada328713e8338f5 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202307211945.TSPcyOhh-lkp@intel.com/
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  4 +++-
>  arch/powerpc/kvm/e500mc.c             | 10 +++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index ef6972aa33b9..72f184e06bec 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -397,7 +397,8 @@
>  #define PPC_RAW_RFCI                   (0x4c000066)
>  #define PPC_RAW_RFDI                   (0x4c00004e)
>  #define PPC_RAW_RFMCI                  (0x4c00004c)
> -#define PPC_RAW_TLBILX(t, a, b)                (0x7c000024 | __PPC_T_TLB=
(t) |  __PPC_RA0(a) | __PPC_RB(b))
> +#define PPC_RAW_TLBILX_LPID (0x7c000024)

^ missing two tabs.

I'm also having issues with b4 and my external mailer setting the From
header correctly.  To test up local modifications to b4, I'm going to
send a v2.

> +#define PPC_RAW_TLBILX(t, a, b)                (PPC_RAW_TLBILX_LPID | __=
PPC_T_TLB(t) | __PPC_RA0(a) | __PPC_RB(b))
>  #define PPC_RAW_WAIT_v203              (0x7c00007c)
>  #define PPC_RAW_WAIT(w, p)             (0x7c00003c | __PPC_WC(w) | __PPC=
_PL(p))
>  #define PPC_RAW_TLBIE(lp, a)           (0x7c000264 | ___PPC_RB(a) | ___P=
PC_RS(lp))
> @@ -616,6 +617,7 @@
>  #define PPC_TLBILX(t, a, b)    stringify_in_c(.long PPC_RAW_TLBILX(t, a,=
 b))
>  #define PPC_TLBILX_ALL(a, b)   PPC_TLBILX(0, a, b)
>  #define PPC_TLBILX_PID(a, b)   PPC_TLBILX(1, a, b)
> +#define PPC_TLBILX_LPID                stringify_in_c(.long PPC_RAW_TLBI=
LX_LPID)
>  #define PPC_TLBILX_VA(a, b)    PPC_TLBILX(3, a, b)
>  #define PPC_WAIT_v203          stringify_in_c(.long PPC_RAW_WAIT_v203)
>  #define PPC_WAIT(w, p)         stringify_in_c(.long PPC_RAW_WAIT(w, p))
> diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> index d58df71ace58..dc054b8b5032 100644
> --- a/arch/powerpc/kvm/e500mc.c
> +++ b/arch/powerpc/kvm/e500mc.c
> @@ -16,10 +16,11 @@
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
>
> -#include <asm/reg.h>
>  #include <asm/cputable.h>
> -#include <asm/kvm_ppc.h>
>  #include <asm/dbell.h>
> +#include <asm/kvm_ppc.h>
> +#include <asm/ppc-opcode.h>
> +#include <asm/reg.h>
>
>  #include "booke.h"
>  #include "e500.h"
> @@ -92,7 +93,10 @@ void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *vc=
pu_e500)
>
>         local_irq_save(flags);
>         mtspr(SPRN_MAS5, MAS5_SGS | get_lpid(&vcpu_e500->vcpu));
> -       asm volatile("tlbilxlpid");
> +       /* clang-17 and older could not assemble tlbilxlpid.
> +        * https://github.com/ClangBuiltLinux/linux/issues/1891
> +        */
> +       asm volatile (PPC_TLBILX_LPID);
>         mtspr(SPRN_MAS5, 0);
>         local_irq_restore(flags);
>  }
>
> ---
> base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
> change-id: 20230803-ppc_tlbilxlpid-cfdbf4fd4f7f
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
