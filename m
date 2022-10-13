Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D14429
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 20:54:08 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so2936718pjo.4
        for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GoFfFfDn3VQkpPm7uWehivLwKK9ykq+Mq5wgEF+ifbk=;
        b=Tp9qi0TuTxLiRmZJ73P8Jqkz5cFz3/ZraH6x6b8QsdXVOf6tJ4xob/q5yBhG3kqenY
         c/Dxlz2HSmhD+1ISeYTEjlw0e6LHvjCtbcKXEZ0jJrz0wqdDEmmC7GhKf9xSa0FDHnhZ
         OMZ02jj3XG8hcZuSleqn7zMtYT729WnP6KvFJNtEuaE9FYt71fAwfUBYrSLcHMcjWjNa
         LavgOyN5QbdnTuat00mf9C9ytjJ0hyHpsvkrms7qL2Zw1oBd3ICaYyB4LC+Aq+VZiJxG
         dRMYW7nYNzhs2zEI1HKxloCJDfo1c2nkExyMYAgo2iJ1rysvwEVQ0PB6ZIzjjuIRy+oe
         Eqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoFfFfDn3VQkpPm7uWehivLwKK9ykq+Mq5wgEF+ifbk=;
        b=25rUUl2fKqDP6LvB0c124cTY7N5fUGnhdIPUsIHqafKJF4D7HwLYSb+e7fy0w3bbqz
         d1TRa3xLB5w9TQ6rjPOqMkClZhmqpVOcR9Z4Soq4w7ZKulDLdtDSNVJJavZ/wEtL+Vvd
         I7FTr4WN/tLaCZF0ZnOWIA2Lxay9PWj1tErHGfoOaeYwsDOUSAKtS+A/+5m1bgUqLmy1
         uS7yanhCUVjkbrI4CZNFzVv2H81XYqXZ9UH/0qJpwHdvvxervJtZCANw0CC9+VAh1cht
         oetkiTlaPls3erDsOfe/i4Awl+0b0FxkZCRz6wG/paeRTBzvl+K5W6SPMcDEjBXXkffx
         C9IA==
X-Gm-Message-State: ACrzQf0NDBlbaWwOUNyOb/7iQHnCbO0baTcZfjJa1RNDQtkhA/Yv3OFw
	mg4wp3RYBnYZHDtwfO971YxJbHjSeFT/FWQr8Oq61w==
X-Google-Smtp-Source: AMsMyM66I+rqXcc4prQlLIG+LwbinW4pY3ihokxrORiav1V7qXz9FmyouE/WnDWoPn8qucVCvDJ2Ko9xoTY3Yt42WV8=
X-Received: by 2002:a17:902:b218:b0:184:710c:8c52 with SMTP id
 t24-20020a170902b21800b00184710c8c52mr1632657plr.95.1665694448056; Thu, 13
 Oct 2022 13:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221007203236.1750890-1-ndesaulniers@google.com>
 <Y0htZDJoTuQegVQR@dev-arch.thelio-3990X> <20221013204151.skzateatn2keencb@google.com>
In-Reply-To: <20221013204151.skzateatn2keencb@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 13 Oct 2022 13:53:56 -0700
Message-ID: <CAKwvOdmoXLvfgEWx740mw+Uqy3nfPM=a7ywVeOJ5XivGT=yRog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fno-discard-value-names to cmd_cc_ll_c
To: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 13, 2022 at 1:41 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-10-13, Nathan Chancellor wrote:
> >On Fri, Oct 07, 2022 at 01:32:36PM -0700, Nick Desaulniers wrote:
> >> When debugging LLVM IR, it can be handy for clang to not discard value
> >> names used for local variables and parameters. Compare the generated IR.
> >>
> >> Implicit Default (-fdiscard-value-names):
> >>   define i32 @core_sys_select(i32 %0, ptr %1, ptr %2, ptr %3, ptr %4) {
> >>     %6 = alloca i64
> >>     %7 = alloca %struct.poll_wqueues
> >>     %8 = alloca [64 x i32]
> >>
> >> Explicit -fno-discard-value-names:
> >>   define i32 @core_sys_select(i32 %n, ptr %inp, ptr %outp, ptr %exp,
> >>                               ptr %end_time) {
> >>     %expire.i = alloca i64
> >>     %table.i = alloca %struct.poll_wqueues
> >>     %stack_fds = alloca [64 x i32]
> >>
> >> The rule for generating human readable LLVM IR (.ll) is only useful as a
> >> debugging feature:
> >>
> >> $ make LLVM=1 fs/select.ll
> >>
> >> Clang defaults to -fdiscard-value-names to save memory when generating
> >> LLVM IR. For debugging purposes, the improvement in readability at a
> >> cost of more verbose IR is a cost we're happy to pay.
>
> A LLVM_ENABLE_ASSEERTIONS=off build of Clang defaults to -fdiscard-value-names.
>
> A LLVM_ENABLE_ASSEERTIONS=on build of Clang defaults to -fno-discard-value-names.
>
> See clang/lib/Driver/ToolChains/Clang.cpp:5030

Thanks!

I thought I recalled this; I was literally just rereading through
https://github.com/ClangBuiltLinux/linux/issues/1467#issuecomment-1046071624
again to understand.

That would be useful to include in the commit message, and is more
precise than "Clang defaults to -fdiscard-value-names to save memory
when generating LLVM IR."  Masahiro, would you mind including or
replacing that, or shall I send a v2?

I was surprised to find later in the day that I was running an
assertions-disabled (ie. release) build of clang, which I almost never
do!  Non-llvm-developers are more likely to be using release builds
than assertions-enabled builds of llvm, so this patch still very much
has merit.

>
> >> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> >Thanks for the patch!
> >
> >Link: https://github.com/ClangBuiltLinux/linux/issues/1467
> >Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
> >> ---
> >>  scripts/Makefile.build | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> >> index 27be77c0d6d8..d0e4f476dfee 100644
> >> --- a/scripts/Makefile.build
> >> +++ b/scripts/Makefile.build
> >> @@ -140,7 +140,7 @@ $(obj)/%.symtypes : $(src)/%.c FORCE
> >>  # LLVM assembly
> >>  # Generate .ll files from .c
> >>  quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
> >> -      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
> >> +      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -fno-discard-value-names -o $@ $<
> >>
> >>  $(obj)/%.ll: $(src)/%.c FORCE
> >>      $(call if_changed_dep,cc_ll_c)
> >>
> >> base-commit: 93ed07a23fd08b8613f64cf0a15d7fbdaca010fd
> >> --
> >> 2.38.0.rc2.412.g84df46c1b4-goog
> >>
> >



-- 
Thanks,
~Nick Desaulniers
