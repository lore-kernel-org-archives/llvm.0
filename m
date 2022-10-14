Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B3A20F8
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:31:32 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 29EDVA5W012218
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 22:31:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 29EDVA5W012218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1665754271;
	bh=eoO4dT7/oE91n2LdemDyH/9TSUzar9QMEDiS2eiitmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ATiYKVcA4e0RZgOhzHxW9xgv1sxtWf++e8DH9R3JQ9uLDt6a3cqaZoN5roh7LV38L
	 qgMxVuPIN+uLvryPk8kqgft94DHItd8JK/4cBfo4f38am5XZag4ZX3aPC6P9fLU6Wf
	 RyiUHQSE5WpfCHdmrW5Vzl8MEPpqEGxoA1emP1xX6RlColJpIZ6bpBwORCZNlZXem7
	 1x806h4Zn5I7RJXxuhG05CmDvDULTSe/8zuZPIu+zLTkKnIZgE05dLLMizSVNwmLdD
	 PktZd95AeD2TFiywRCpw/tSSlcTZJSyw0Yw8h9J894NiwgLCyCziyZPfMKrWzDgVtD
	 pBlntivHho8kw==
X-Nifty-SrcIP: [209.85.160.48]
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-136b5dd6655so5856076fac.3
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 06:31:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf34AVDspXfi/Zd9ND/RkMK4BhbjZoaYi7yWSO/hdQAGqfXv3XXu
	mDtXFbwZCSLMmaqyTlN/7JJ7umB3j0CP+LXh9FI=
X-Google-Smtp-Source: AMsMyM48rOk4RS1W8P1kWSTh8sIj+I5oTEn0bZai5fiS3d4C6lV+k5+G6w/5CYS/6+156Yhy0F/Kb6wcoz3pZhGxiuw=
X-Received: by 2002:a05:6870:8a09:b0:132:554d:2f3d with SMTP id
 p9-20020a0568708a0900b00132554d2f3dmr8390681oaq.194.1665754269746; Fri, 14
 Oct 2022 06:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221007203236.1750890-1-ndesaulniers@google.com>
 <Y0htZDJoTuQegVQR@dev-arch.thelio-3990X> <20221013204151.skzateatn2keencb@google.com>
 <CAKwvOdmoXLvfgEWx740mw+Uqy3nfPM=a7ywVeOJ5XivGT=yRog@mail.gmail.com>
In-Reply-To: <CAKwvOdmoXLvfgEWx740mw+Uqy3nfPM=a7ywVeOJ5XivGT=yRog@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 Oct 2022 22:30:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT7yY3VL=so0+h=fsefT2QXsKHn4KjCFJ5VtGGkvSRjLg@mail.gmail.com>
Message-ID: <CAK7LNAT7yY3VL=so0+h=fsefT2QXsKHn4KjCFJ5VtGGkvSRjLg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fno-discard-value-names to cmd_cc_ll_c
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Fangrui Song <maskray@google.com>, Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 5:54 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Oct 13, 2022 at 1:41 PM Fangrui Song <maskray@google.com> wrote:
> >
> > On 2022-10-13, Nathan Chancellor wrote:
> > >On Fri, Oct 07, 2022 at 01:32:36PM -0700, Nick Desaulniers wrote:
> > >> When debugging LLVM IR, it can be handy for clang to not discard value
> > >> names used for local variables and parameters. Compare the generated IR.
> > >>
> > >> Implicit Default (-fdiscard-value-names):
> > >>   define i32 @core_sys_select(i32 %0, ptr %1, ptr %2, ptr %3, ptr %4) {
> > >>     %6 = alloca i64
> > >>     %7 = alloca %struct.poll_wqueues
> > >>     %8 = alloca [64 x i32]
> > >>
> > >> Explicit -fno-discard-value-names:
> > >>   define i32 @core_sys_select(i32 %n, ptr %inp, ptr %outp, ptr %exp,
> > >>                               ptr %end_time) {
> > >>     %expire.i = alloca i64
> > >>     %table.i = alloca %struct.poll_wqueues
> > >>     %stack_fds = alloca [64 x i32]
> > >>
> > >> The rule for generating human readable LLVM IR (.ll) is only useful as a
> > >> debugging feature:
> > >>
> > >> $ make LLVM=1 fs/select.ll
> > >>
> > >> Clang defaults to -fdiscard-value-names to save memory when generating
> > >> LLVM IR. For debugging purposes, the improvement in readability at a
> > >> cost of more verbose IR is a cost we're happy to pay.
> >
> > A LLVM_ENABLE_ASSEERTIONS=off build of Clang defaults to -fdiscard-value-names.
> >
> > A LLVM_ENABLE_ASSEERTIONS=on build of Clang defaults to -fno-discard-value-names.
> >
> > See clang/lib/Driver/ToolChains/Clang.cpp:5030
>
> Thanks!
>
> I thought I recalled this; I was literally just rereading through
> https://github.com/ClangBuiltLinux/linux/issues/1467#issuecomment-1046071624
> again to understand.
>
> That would be useful to include in the commit message, and is more
> precise than "Clang defaults to -fdiscard-value-names to save memory
> when generating LLVM IR."  Masahiro, would you mind including or
> replacing that, or shall I send a v2?




Can you send v2, or provide the entire new commit description?
Thank you.








>
> I was surprised to find later in the day that I was running an
> assertions-disabled (ie. release) build of clang, which I almost never
> do!  Non-llvm-developers are more likely to be using release builds
> than assertions-enabled builds of llvm, so this patch still very much
> has merit.
>
> >
> > >> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > >Thanks for the patch!
> > >
> > >Link: https://github.com/ClangBuiltLinux/linux/issues/1467
> > >Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Reviewed-by: Fangrui Song <maskray@google.com>
> >
> > >> ---
> > >>  scripts/Makefile.build | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > >> index 27be77c0d6d8..d0e4f476dfee 100644
> > >> --- a/scripts/Makefile.build
> > >> +++ b/scripts/Makefile.build
> > >> @@ -140,7 +140,7 @@ $(obj)/%.symtypes : $(src)/%.c FORCE
> > >>  # LLVM assembly
> > >>  # Generate .ll files from .c
> > >>  quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
> > >> -      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
> > >> +      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -fno-discard-value-names -o $@ $<
> > >>
> > >>  $(obj)/%.ll: $(src)/%.c FORCE
> > >>      $(call if_changed_dep,cc_ll_c)
> > >>
> > >> base-commit: 93ed07a23fd08b8613f64cf0a15d7fbdaca010fd
> > >> --
> > >> 2.38.0.rc2.412.g84df46c1b4-goog
> > >>
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
