Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B094681
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 15:36:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id bn33so13875128ljb.13
        for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 08:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frSkO8LINr4fIYviWk98zCOOmU6Ew1V0tF2nZHNwdSA=;
        b=M/KSRgcUcJQvDr7kv37lS/FPE1C7EbhTDrVDDTHUGdFcWeTMm1zdyz7dfRaZjKSNeJ
         R26kPb8JFoIXs7POF8i38ksSux8OlP8OXdhXJlM/MIglrSReWnjFtEs2LDnRVN23UF8S
         pHVJVBM1yWymWPM/QFPzJ6kd2xvPT6e9/dJs07TmM/omaRNAtgFb1WYxL3pOsmO3Hr6b
         mx32ykTgWBKQu+5zdxVRH9Xn1wM+ivrsi75SfnhLUP3/wB7WVI3Br2cdwOBciYXtZUZB
         Y+SGKQxXcAAUdavWfKJeKi30cyXlCNdzpZ4myP8VydIPvoGrdmxVEaj0z23T6CV4UVaf
         948w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frSkO8LINr4fIYviWk98zCOOmU6Ew1V0tF2nZHNwdSA=;
        b=SyakF4nynS4UkTvw1yw13tfHGiPDTo09cxovgddBXfQlbmersMTGQwIwczUMyWRX7p
         r4QRF79QuwzOuwleyltQDsQrQZ0FNM04fBq/refEUaZDOHgpU8FqzDx/FdPNKkiIm1UG
         phMkXUAOa8dl+mUfOg2YAc7uji4uY+QeiTLk4x4Qu7svCQptDWQmhY/k+D0Eg+WeEj/0
         KM5fQSJGw8WRYa1Bjlyxa+QJq6zK2/gmeAe0F1Ai+a9AkaWftNne7MmU70lvmfnJc35L
         iCpPjsfHEp0QgBjQZ6wjVigom84HUqraTdgLZxPa/e43TjQx86yH5IefB6pzca4A6BzD
         qcMQ==
X-Gm-Message-State: AJIora8mWJ6xiiJDDVnVvVRwLvrAX1+wp0hxGzu46jlpYActzgLEwahy
	hvtgOiLSLbhrxabk38OqCXdlwxI0pR0VqdhM2L0Y1g==
X-Google-Smtp-Source: AGRyM1t+27L+bFm9l7VHdmsBQUhxdg6zV9GyjGmpFKagRo+a2ORoV22JAC3XRC1j3aZr33+QHwqiqju1MiSuDlA2XKc=
X-Received: by 2002:a2e:8609:0:b0:25d:6af0:63b5 with SMTP id
 a9-20020a2e8609000000b0025d6af063b5mr2153523lji.360.1657726588005; Wed, 13
 Jul 2022 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713152436.2294819-1-nathan@kernel.org>
In-Reply-To: <20220713152436.2294819-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Jul 2022 08:36:16 -0700
Message-ID: <CAKwvOdkXdAXBTLipv5A3vaTe_dRPvtCDJobi=tHR9oSJab9oBw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 8:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   arch/x86/kernel/cpu/bugs.c:58:21: error: section attribute is specified on redeclared variable [-Werror,-Wsection]
>   DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
>                       ^
>   arch/x86/include/asm/nospec-branch.h:283:12: note: previous declaration is here
>   extern u64 x86_spec_ctrl_current;
>              ^
>   1 error generated.
>
> The declaration should be using DECLARE_PER_CPU instead so all
> attributes stay in sync.
>
> Cc: stable@vger.kernel.org
> Fixes: fc02735b14ff ("KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2: https://lore.kernel.org/20220713152222.1697913-1-nathan@kernel.org/
>
> * Use asm/percpu.h instead of linux/percpu.h to avoid static call
>   include errors.
>
>  arch/x86/include/asm/nospec-branch.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
> index bb05ed4f46bd..10a3bfc1eb23 100644
> --- a/arch/x86/include/asm/nospec-branch.h
> +++ b/arch/x86/include/asm/nospec-branch.h
> @@ -11,6 +11,7 @@
>  #include <asm/cpufeatures.h>
>  #include <asm/msr-index.h>
>  #include <asm/unwind_hints.h>
> +#include <asm/percpu.h>
>
>  #define RETPOLINE_THUNK_SIZE   32
>
> @@ -280,7 +281,7 @@ static inline void indirect_branch_prediction_barrier(void)
>
>  /* The Intel SPEC CTRL MSR base value cache */
>  extern u64 x86_spec_ctrl_base;
> -extern u64 x86_spec_ctrl_current;
> +DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
>  extern void write_spec_ctrl_current(u64 val, bool force);
>  extern u64 spec_ctrl_current(void);
>
>
> base-commit: 72a8e05d4f66b5af7854df4490e3135168694b6b
> --
> 2.37.1
>
>


-- 
Thanks,
~Nick Desaulniers
