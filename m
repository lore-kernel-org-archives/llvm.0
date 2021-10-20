Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FC72
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 19:50:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y15so58621lfk.7
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=SCSQCzJKJCJ5UPfG3Jle+VeUiDw9CvEgcdUHHriwjfc=;
        b=Nr6n+b/sZ4jQ5MqG2acJXweduVdQ0op8hh7aTVP9Dy2O9wva4nT7DjCiiDBJYKioaA
         oraCRmZ0i5d1StlW33nVMu1d48xxGYICN2SpcfmTP2NRwNsm+qIsvrOoC/3qjKrq1dRK
         NPV6MccOVHQxusmsDZxtppZlLPF6AkDdp6A4pixhh1ugEsqStJp1ZgfqYkHSt3cbBnYb
         hrkDBgceoSApZwXvdRcOt1Hh42VFbPEgACpGFkd3CHOlNdMAE4Nm0gz6OrU3bSSJ7XAY
         77R23XCwJWzet/lL88ivWwIdBFV01BVBZldhdjLJsDtcKdy2m4N0/C+WoB5hn2/lLzFr
         OpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SCSQCzJKJCJ5UPfG3Jle+VeUiDw9CvEgcdUHHriwjfc=;
        b=Q12eiiIEcKfNCv5LFsd4yuj6DthaUE/IHZQQ+1H1bJsLPiTN7nIe9uEOEYr/dFbF8K
         geA8D0TyTIj/+Ek1yz9lw//Bh4JeWsHArOGSlrBsfsFCX3HNmSUITl3+OxxApIHTJ8Bx
         XPqMIOEuTL6hF3/LL9gRrQkiF8vIwZXnEeZz3LN10XdVGDqc6FDp7QRISjalvFjeJLr4
         az9HvqF5OIjJjejs5T0Otr4H+Bfkg55SB8WhE6UosA16XyjyHkMWtMteiA7FIbCSGBdi
         AbVwOAKegthxBUOl75OM46wrnejqCsS8B+b12XvuAjXs5zFOn77bH1BYR7Pqa9s7Vvmj
         NmtA==
X-Gm-Message-State: AOAM533wxHEhuGY2nbZAXxVfm5nIQ86OnIXXqx39+1fYx7kwZU1rcjpJ
	ird8plo8tyUG0QdmOrqTq5zJT+EljaxSrcccJ4ogNxLSVsU=
X-Google-Smtp-Source: ABdhPJzW3ULi4jAh2lyd7tqFtxFKj7Ec/xLtUatavlHgP/a1JRQI/5iNUyszUJEU9mxc/D4f26UaTqpdo1j4VXfW5ag=
X-Received: by 2002:a05:6512:1103:: with SMTP id l3mr1250472lfg.550.1634759455599;
 Wed, 20 Oct 2021 12:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Oct 2021 12:50:44 -0700
Message-ID: <CAKwvOd=_r6b_E2J6CNPYUgnrj2Y-BP1uV=jRDb+C7ORMRjjtgQ@mail.gmail.com>
Subject: Oct 20 2021 meeting notes
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

- Lots of patches around `-Wbitwise-instead-of-logical`, Linus not
thrilled with note diagnostic.
- (Nick) [eliminated](https://lore.kernel.org/lkml/20211019223646.1146945-2-ndesaulniers@google.com/)
CROSS_COMPILE_COMPAT for LLVM=1 arm64 compat vdso.
- (Serge) [fix](https://reviews.llvm.org/D112059) for
[LTO+FORTIFY](https://github.com/ClangBuiltLinux/linux/issues/1477).
- arm64 `.cfi_negate_ra_state`+PAC [LLVM
patch](https://reviews.llvm.org/D111780).
- (Nick) thinLTO+CFI .cfi_jt fixup [LLVM
patch](https://reviews.llvm.org/D107934).
- (Ard) arm32 [IRQ
stacks](https://lore.kernel.org/linux-arm-kernel/20211017131723.4034662-1-ardb@kernel.org/)
and [vmapped stacks](https://lore.kernel.org/linux-arm-kernel/20211018141615.682070-1-ardb@kernel.org/).
  - regression in next `__eabi_read_tb`
- (Nick) working on [propagating tail
calls](https://reviews.llvm.org/D107872) for fortify.
- 32b [unwinder
fixes](https://lore.kernel.org/linux-arm-kernel/163369614818.636038.5019945597127474028.stgit@devnote2/)
for kprobes.
- (Miguel) [mark](https://lore.kernel.org/lkml/20211014132331.GA4811@kernel.org/)
`__compiletime_assert` `noreturn`.
- [MPE](https://lore.kernel.org/linuxppc-dev/20211014024424.528848-1-mpe@ellerman.id.au/)
and Nemanjai looking into LLVM_IAS=1 for ppc.
- (Rasmus) [switch container_of from BUILD_BUG_ON to
static_assert](https://lore.kernel.org/lkml/20211015090530.2774079-1-linux@rasmusvillemoes.dk/).
- kasan excessive stack useage, [interesting
case](https://godbolt.org/z/P3qb4nGYe) fron Arnd.
  - `-fno-sanitize-address-use-after-scope` and
`-fsanitize-address-use-after-return=never` (gcc's `--param
asan-use-after-return=1`)
  - large padding for small locals?
- LLVM bay area meetup tonight. 5pm CBL round table.
  - ppc & s390 assembler, kasan stack useage, ARC + m68k
- atom cpu tuning is bad; leads to frequent register exhaustion.
(TODO: Nick, talk to Intel):
https://github.com/ClangBuiltLinux/linux/issues/1483
- rust tentative clang flags removed from rustforlinux kbuild modifications
- https://github.com/ClangBuiltLinux/linux/issues/1315: argument
unused during compilation: '-march=armv6k' #1315

-- 
Thanks,
~Nick Desaulniers
