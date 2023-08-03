Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878A6FA7
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 18:48:48 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-63d3583d0efso8151116d6.1
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691088528; x=1691693328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tbNHE93nYjXEA/O+xALVAEDc6FnXESddWS3lWiWLV0=;
        b=6VFzvdxm3YrleojZUDMcow5FlyLkuGEPWo7uL1Sub4U4LzVMQhi5UpSPEaYtXxQig6
         R78lgZrOqqK6yg0QQv/JfRTYg+AsYws7jCkd8Bg1iujIIi9/A8JGaIKa3nySYUYxYXMD
         fDeqWcFIbb7KgTxygJUFLUFd9FltJ7Sx1WpUt7PJDnRkqFqEAYX3UY0X49kRyzwn5sdP
         I37qBWtWNXQq7xllL7dbKsCaawao2B5L/YEZK2kvud+xkjOMxt2YCSPKhd52vD+CcmjX
         qsvwDpR8y8XyjjIEENEG/wD83xbRHVmg+fosa7E0VP5fHwabw7hE0ggbCtQWbEI9pBLv
         f8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691088528; x=1691693328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tbNHE93nYjXEA/O+xALVAEDc6FnXESddWS3lWiWLV0=;
        b=PJM/S09U0N5LLsoN6TCgsbe21Y1KRTl0PJJLSRcaGVGB8AsQI3dt/MnqBPH7MlQ1+B
         Q6N2cow2BLenvKej/slLEJlyQagxhFrHA+K2yo0kF+Q5WJQqbjyjO30YMwPRdA63PSe1
         D+NPeAD84dX4P2OP6nSLwDtRQf4i3yGp2mfVhXLAuWLiroVpSfhjE4TYUhltwtBx4d7u
         Vyljm0Am7OZYlqfqiZVIKs3UrkYmFCZFl8mZSd2YnCjHqSYaWVqkd3O0ocY0dcAZBpen
         1THJPCVd4o5vqPO7mSvVIcEM7HTGMwBvC9dFmYK9Y8QLeNTsSvWGi7l/wMyvDKqwVIpx
         J2Qw==
X-Gm-Message-State: ABy/qLbLzwog/KaK4ruFc8S130ZUiCBPBPOn/6NRoFf+umN3KUcym2ox
	mC36JiAxM8OYsc2Y8OkWDEIZnt1nI+THOuD99S1teA==
X-Google-Smtp-Source: APBJJlHVHOlFaAc7QLzwJ5MQyhcxQ7uez6gZPgXw7RdtP68eZ2qt3tpg4x+z+Z2XW9dTV2WAxlrUtvM5KRnWu0hSBto=
X-Received: by 2002:a05:6214:3011:b0:63d:a05:256a with SMTP id
 ke17-20020a056214301100b0063d0a05256amr21855102qvb.8.1691088527629; Thu, 03
 Aug 2023 11:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com> <31b387c5-c6a4-2911-b337-b7af6a15c29e@csgroup.eu>
In-Reply-To: <31b387c5-c6a4-2911-b337-b7af6a15c29e@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 11:48:36 -0700
Message-ID: <CAKwvOdm7ftWse5LVwM_0b_Zk_H-qavXsjsSyUmd0onZzvYcasw@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 11:47=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 03/08/2023 =C3=A0 20:33, Nick Desaulniers a =C3=A9crit :
> > Clang didn't recognize the instruction tlbilxlpid. This was fixed in
> > clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
> > older, rather than using that instruction bare in inline asm, add it to
> > ppc-opcode.h and use that macro as is done elsewhere for other
> > instructions.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1891
> > Link: https://github.com/llvm/llvm-project/issues/64080
> > Link: https://github.com/llvm/llvm-project/commit/53648ac1d0c953ae6d008=
864dd2eddb437a92468 [0]
> > Link: https://github.com/llvm/llvm-project-release-prs/commit/0af7e5e54=
a8c7ac665773ac1ada328713e8338f5 [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/llvm/202307211945.TSPcyOhh-lkp@intel.co=
m/
> > Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Not sure why you changed the order of #includes , nevertheless

Habit to sort; can drop if maintaining git blame is more important
than cleaning that up.

>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> > ---
> > Changes in v3:
> > - left comment @ https://github.com/linuxppc/issues/issues/350#issuecom=
ment-1664417212
> > - restore PPC_RAW_TLBILX previous definition
> > - fix comment style
> > - Link to v2: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v2-1-21=
1ffa1df194@google.com
> >
> > Changes in v2:
> > - add 2 missing tabs to PPC_RAW_TLBILX_LPID
> > - Link to v1: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v1-1-84=
a1bc5cf963@google.com
> > ---
> >   arch/powerpc/include/asm/ppc-opcode.h |  2 ++
> >   arch/powerpc/kvm/e500mc.c             | 11 ++++++++---
> >   2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/inclu=
de/asm/ppc-opcode.h
> > index ef6972aa33b9..005601243dda 100644
> > --- a/arch/powerpc/include/asm/ppc-opcode.h
> > +++ b/arch/powerpc/include/asm/ppc-opcode.h
> > @@ -397,6 +397,7 @@
> >   #define PPC_RAW_RFCI                        (0x4c000066)
> >   #define PPC_RAW_RFDI                        (0x4c00004e)
> >   #define PPC_RAW_RFMCI                       (0x4c00004c)
> > +#define PPC_RAW_TLBILX_LPID          (0x7c000024)
> >   #define PPC_RAW_TLBILX(t, a, b)             (0x7c000024 | __PPC_T_TLB=
(t) |  __PPC_RA0(a) | __PPC_RB(b))
> >   #define PPC_RAW_WAIT_v203           (0x7c00007c)
> >   #define PPC_RAW_WAIT(w, p)          (0x7c00003c | __PPC_WC(w) | __PPC=
_PL(p))
> > @@ -616,6 +617,7 @@
> >   #define PPC_TLBILX(t, a, b) stringify_in_c(.long PPC_RAW_TLBILX(t, a,=
 b))
> >   #define PPC_TLBILX_ALL(a, b)        PPC_TLBILX(0, a, b)
> >   #define PPC_TLBILX_PID(a, b)        PPC_TLBILX(1, a, b)
> > +#define PPC_TLBILX_LPID              stringify_in_c(.long PPC_RAW_TLBI=
LX_LPID)
> >   #define PPC_TLBILX_VA(a, b) PPC_TLBILX(3, a, b)
> >   #define PPC_WAIT_v203               stringify_in_c(.long PPC_RAW_WAIT=
_v203)
> >   #define PPC_WAIT(w, p)              stringify_in_c(.long PPC_RAW_WAIT=
(w, p))
> > diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> > index d58df71ace58..7c09c000c330 100644
> > --- a/arch/powerpc/kvm/e500mc.c
> > +++ b/arch/powerpc/kvm/e500mc.c
> > @@ -16,10 +16,11 @@
> >   #include <linux/miscdevice.h>
> >   #include <linux/module.h>
> >
> > -#include <asm/reg.h>
> >   #include <asm/cputable.h>
> > -#include <asm/kvm_ppc.h>
> >   #include <asm/dbell.h>
> > +#include <asm/kvm_ppc.h>
> > +#include <asm/ppc-opcode.h>
> > +#include <asm/reg.h>
> >
> >   #include "booke.h"
> >   #include "e500.h"
> > @@ -92,7 +93,11 @@ void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *=
vcpu_e500)
> >
> >       local_irq_save(flags);
> >       mtspr(SPRN_MAS5, MAS5_SGS | get_lpid(&vcpu_e500->vcpu));
> > -     asm volatile("tlbilxlpid");
> > +     /*
> > +      * clang-17 and older could not assemble tlbilxlpid.
> > +      * https://github.com/ClangBuiltLinux/linux/issues/1891
> > +      */
> > +     asm volatile (PPC_TLBILX_LPID);
> >       mtspr(SPRN_MAS5, 0);
> >       local_irq_restore(flags);
> >   }
> >
> > ---
> > base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
> > change-id: 20230803-ppc_tlbilxlpid-cfdbf4fd4f7f
> >
> > Best regards,



--=20
Thanks,
~Nick Desaulniers
