Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F2612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:06:25 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 289L6MEL001045
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 06:06:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 289L6MEL001045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662757582;
	bh=vtdLXG6t3z02oyL9Z4xJ/HoU0JT/liNiaOARtmBE8QQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F32O9vhNDGLyzImoguALcl/Xwxoz5eAH6I/QiRNisY+rcMeHo4mndxsUDXdWFAoc2
	 h2d4+aV5slspzUodXnTi9R48uUBZ6k1lpQm50SdfrUknb7Fe81YTKQ4ovWb480M2QQ
	 vU4fk9nPAhLh2RKlxmaGbta0xsRmjJTIE5bT8h18xVEJHwKEvC3rDMGfK3AoPIYbGX
	 kre3MkBJMNbyLbC6I8IQ1dCniX8vhidgGS8Vr7wZuNISiNyB6M0fMt+Z9MSHEfq9Li
	 GTu9Vs3mLshBZbWYbnx1Ju5s/unhBjEIaJcxw/DLmrwW4WpqSE0HpQwDB6KWMb0TQm
	 +s0iJqRcb2z4w==
X-Nifty-SrcIP: [209.85.210.48]
Received: by mail-ot1-f48.google.com with SMTP id v2-20020a056830090200b006397457afecso1833033ott.13
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:06:22 -0700 (PDT)
X-Gm-Message-State: ACgBeo30swPFSJLMI5HfhGkJzPl0abkU9BSdUYMQrx8xx+j7+jD04gXO
	+UD0dvRRpufDmyfgPVE2MwUEcBaK30IeDOXDXh4=
X-Google-Smtp-Source: AA6agR7cZxQ2PtL23Q1mwQ2M7VBr2nkH4CHIxcd+zzfk3Li7Z5jY5tsgHCcaGowLE2oMowZwalEsCiHr29uL5Ciurpk=
X-Received: by 2002:a9d:4806:0:b0:637:cdca:f8d3 with SMTP id
 c6-20020a9d4806000000b00637cdcaf8d3mr6389077otf.225.1662757581581; Fri, 09
 Sep 2022 14:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com> <20220907045907.484043-2-ndesaulniers@google.com>
In-Reply-To: <20220907045907.484043-2-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Sep 2022 06:05:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqU4246yPxBr75464wbbnoxb-sLL+UO-fYrkhtFzPEqw@mail.gmail.com>
Message-ID: <CAK7LNARqU4246yPxBr75464wbbnoxb-sLL+UO-fYrkhtFzPEqw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] x86/boot/compressed: prefer cc-option for CFLAGS additions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 1:59 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> as-option tests new options using KBUILD_CFLAGS, which causes problems
> when using as-option to update KBUILD_AFLAGS because many compiler
> options are not valid assembler options.
>
> This is being fixed in a follow up patch. Before doing so, move the
> assembler test for -Wa,-mrelax-relocations=no from using as-option to
> cc-option.
>
> Cc: Arvind Sankar <nivedita@alum.mit.edu>
> Cc: x86@kernel.org
> Link: https://lore.kernel.org/llvm/CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com/
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>


01 and 02, applied to linux-kbuild/fixes.
Thanks.


> ---
> Changes v2 -> v3:
> * Reword commit message as per Nathan.
> * Pick up Nathan's RB/TB tags.
>
> Changes v1 -> v2:
> * Split off of v1 [1/3].
> * Use cc-option to update CFLAGS, as per Masahiro.
> * Add Masahiro's Suggested-by, Cc Arvind.
>
>  arch/x86/boot/compressed/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index 35ce1a64068b..85934204d905 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -49,7 +49,7 @@ KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS += -D__DISABLE_EXPORTS
>  # Disable relocation relaxation in case the link is not PIE.
> -KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
> +KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
>  KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
>
>  # sev.c indirectly inludes inat-table.h which is generated during
> --
> 2.37.2.789.g6183377224-goog
>


-- 
Best Regards
Masahiro Yamada
