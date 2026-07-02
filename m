Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E138E5ED
	for <llvm@lists.linux.dev>; Thu,  2 Jul 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988899; cv=pass; b=Xx+nBRDcm5jZ3N+Q7xwnQWK0knEizEP51kRj4o+ZOIhbraOKc0AVwP0zrkDNEqUiQvF7pa/j2TLob9E9uCbC4n723b6pM8NF5yrmxjgZrfHjZONLCanCbQGtEi/2PhoaGoo32vZzMMBFm95xlAoAaLgaZtlc7ZrKph/Q1+MozgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988899; c=relaxed/simple;
	bh=Qo2gLaRVxyjo6/LnpT6J8yUi3lOTAWBwaBJRq6rWaSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mK52BkcTCKkBugzqtCCCteVPg3NES+B4MhoCmzcKUI6kiNcSmCrwJrTJntJYJfUCUnoe3fqy6lXASRPC3ZP3o2AjWbu8ee2jYLyIK10Ajxf89By8ZJg1zM7g7+OO5ZXtmXYx4dW0AKiF+FVpWBRNxA/ErZGaOUsbQM80kwJ8wGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/HXsCS0; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/HXsCS0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c125ba77577so182448466b.1
        for <llvm@lists.linux.dev>; Thu, 02 Jul 2026 03:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782988897; cv=none;
        d=google.com; s=arc-20260327;
        b=Xv+RJa1m5FpEH93KqaibWVjpAziiK4ngVWnqRbJgPHT5DFU4cKajtNcvUou0kxq2M0
         8y0Ut3o2/7J2x8Md6OOHCc3hf1vYIiJ9d1LonMC4pQ0xTC7nuow9h5vCWXUyUISMXJR3
         QmbsIEoBmykfnfor84EGieJBGyJDO7H+PCMPHMtRJQ+Zdh3qqDdFljrmA5iz17QjqSse
         3PchrCIWH7bAm7nHd5sP8JR1tLUZaDpKp8SfnN/SDDRaPfaXIruoG8/a5Fl780QsVRIE
         4sJq+35im3ZUy92mKCfOQFeIBBCjwj453RTioKsLG7U3gqJ8fTefzrVpSqDKwswtq+5H
         +viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iW6Uteu0ZN7gd7BtzBpEyG+F6j2x/qPuh1/micWO6sI=;
        fh=PIuKMamWcwwlqIH0Ovu+2AvdTINKKC2vjZmX6Qy7bN0=;
        b=hjYvB4Y/ALp0TSyxL/B6bu7CaqPNe7Gzp19Y8f5h9FFFzBWKYax9RGjdqVfpPk/GKw
         fqYQNC+cMkwaMIK0e2kvMm8WtELpoqzAWb1jwlTnrmqWqzPO/KbK73RPtp3kHXH4pndN
         Bks4/FEPUX8p6wvIGRjEkQKAJeMM38YXK8NrdnaUuf4/WWAu5M2HB9/gWQpua1hKvfnB
         yNnU+qwmdTOSX7760UCsgvbEXmvYMSfb5RYv4QRANIZ+RiOzZVodTLCSJ5G/hLKg0gNd
         htwcplVZBtkOOJXdYBAee0YOqG1IEVlEKKgnWQ0Y3gAE4wDWlPOkBXVjrpVNa181J7bC
         x/gA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782988897; x=1783593697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW6Uteu0ZN7gd7BtzBpEyG+F6j2x/qPuh1/micWO6sI=;
        b=q/HXsCS03lqLMjcx3zb+e8wW8kdlrh3AmzP3pzPqfR6q02SgZe/c4J7rBswhA2W4bj
         TWk79oRmaupV2QJJdyJu4+QIW3P7jqH2dg6TilS9osjG5Lq/eQIYGpkVMOU8eRbJUc6w
         +XXTM8FmJwzX7L6NWgD2ZWf0mxvk6K5NWEGgq7EkVWnJeOrcbnXFNIhMp/vAWPiCIVYK
         YdLYO6b2Yu6yRZRS8nYBLj6rCIsA7KrdFjW79C33XnFj3Wep5UlPY9FVy201PyG2jYeX
         +zYbtrSRmoD6umm5HJVqAF/4TRQMHCl8Ak508pwgAJdin6RGEt+mt27jXSgLBcPDoAvl
         Sddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988897; x=1783593697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iW6Uteu0ZN7gd7BtzBpEyG+F6j2x/qPuh1/micWO6sI=;
        b=Tp9moMKDQnMRcBGPRoBd3iH3U6dmErX0H7ALtK+re8vvrA8PYzETF9drxfqBOFDjjU
         M2ioEeDu8BtfmirTOqYi0vuel68W7BiawA8cPNFaaeGywLMAvaPOYAQY3wcjt9g5R6K0
         YPeDSewsXajN2kXtFlJs/KjuGqqBgPV4W65yP1p5oHmiwx9Iw5xyYxMHsfq0C/3WSCkA
         /yYznIR0m7yR/3FHO+cWE1/PqnIp1m3mCCKau6ivc1rZSteDZWIKe41cvBvbL5f9xjQ7
         QHKlsTXRAB7nd1CV0ym16d5anCj9PXaoHFNDvDPHUmPc8NBL69qPiP8BCOcZbfRUA7tn
         YReg==
X-Forwarded-Encrypted: i=1; AHgh+RqsyJG38mthXeRUqNVkp68mm57RThaFs8t1mFJAEm8wtlaChM5jOYJA9e/61lAapbW7PYBs@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ5/7Ey+y4w8Xalw2NQtVlXVrsILaNYeHXz5pk8+YaCowEoUoi
	3Nmh2LQeikI75gjympWhFO7aEkpSx8BTmG8VWYiyMussodgKNIxFvoAtT6Qy/elBQBHMnqv3hFk
	9jlvlESrjxRTyQw108WysAtiuCoSMfB4=
X-Gm-Gg: AfdE7cm9ULbrTkf5Wt/oFWaruPASeWZWrufAl/oH7L0H9Niv4bJJrMQN3SckN8It5PE
	XkLacGjlayhIwCf7D981e0tvEcz40xKigS+V8mr4Qaklh++qWP/ZW57/3cCEpPRS09ZUjfuJBMQ
	UTjVt18VGltqK5lQldByZMUl1PaFFIiqdOMsNYD5lHso8m9cYIkJJruXOpH2tUcuu+g4UlHW6I2
	pnEqPi9fcKwFK7414FSl2zLKYNBAUMcKXcrhkM66e/qkeGdS5mQ0Wlk+wfdhZ2JPsJdrf2MPgoZ
	vAScbHm33xeV3ChOuhcZFiraicZkpUOOqoeNzmQYb1V0a4NgWU6BKOPxFoN4vCpv+lu/PqSU+co
	Tfq3qwuQpzQ==
X-Received: by 2002:a17:907:d13:b0:c12:4246:885c with SMTP id
 a640c23a62f3a-c12ae4c1ac0mr230918066b.26.1782988896224; Thu, 02 Jul 2026
 03:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125151.352632-1-voytikd@gmail.com> <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
In-Reply-To: <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Thu, 2 Jul 2026 12:41:09 +0200
X-Gm-Features: AVVi8CdWTC8XLxLBFm8MIu8uFvj9ZbNvSsxiOLz9IYJiRO6ZeYdwjrxweBG2v-0
Message-ID: <CAAX90H0V-=Gy1FyBT9qop2=RvhBxbOPLu6+DYpPH2pTehT=nRw@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
To: Borislav Petkov <bp@alien8.de>
Cc: linux-toolchains@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankur Arora <ankur.a.arora@oracle.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Thu, Jul 2, 2026 at 4:54=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Wed, Jul 01, 2026 at 02:51:51PM +0200, Dmitry Voytik wrote:
> > This patch fixes broken builds with defconfig + CONFIG_KMSAN +
> > CONFIG_DEBUG_INFO_*.
> >
> > To reproduce the issue before the fix:
> >   make mrproper
> >   make LLVM=3D1 defconfig
> >   ./scripts/config -e CONFIG_KMSAN \
> >     -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >   make LLVM=3D1 olddefconfig
> >   make LLVM=3D1 -j(nproc) vmlinux
> >   ...
> >     LD      vmlinux.o
> >   vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack s=
tate
> >   vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base re=
g -1
> >   make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255
> >
> > objtool in verbose mode shows how the frame pointer is omitted:
> >   make LLVM=3D1 OBJTOOL_VERBOSE=3D1 -j(nproc) vmlinux
> >   ...
> >   b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
> >   b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
> >   b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
> >   b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
> >   b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_un=
rol
> >
> > After the fix, the frame pointer is back:
> >   b15a37: 31 c0                       xor    %eax,%eax
> >   b15a39: 48 89 ec                    mov    %rbp,%rsp
> >   b15a3c: 4c 89 f7                    mov    %r14,%rdi
> >   b15a3f: 48 89 d9                    mov    %rbx,%rcx
> >   b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+0x=
817>
> >
> > It seems the issue was introduced by
> > commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")
> >
> > The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
> > positioned.
>
> Why?
>
> Where does it say that the current stack ptr dependency needs to be the f=
irst
> asm input operand?

Very good question. My uneducated guess - bugs in clang.
Out of curiosity, I compared (see below) what clang and gcc do when
ASM_CALL_CONSTRAINT moves around, and it indeed affects generated
code, which is weird.
I might just be holding it wrong, like optimization must be on, etc.

> If that were the case, we have a bunch more of those bugs around the tree=
.

At least, it makes objtool happy for the defconfig + KMSAN.

> Anyway, + linux-toolchains.

Thanks for looking into this.

Comparing clang and gcc:

// clang asm_clang.c -o out
// gcc asm_clang.c -o out
// objdump -d --disassemble=3Dmain out

#include <stdio.h>

int func() {
    return 42;
}

#define __stringify_1(x...)    #x
#define __stringify(x...)    __stringify_1(x)
# define __ASM_FORM_RAW(x, ...)            __stringify(x,##__VA_ARGS__)
# define __ASM_SEL_RAW(a,b)    __ASM_FORM_RAW(b)
#define __ASM_REG(reg)         __ASM_SEL_RAW(e##reg, r##reg)
#define _ASM_SP        __ASM_REG(sp)
register unsigned long current_stack_pointer asm(_ASM_SP);
#define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)

int main() {
    int output_val =3D 0;

    __asm__ __volatile__ ( "call func\n\t" : "=3Da" (output_val) : :);
    // clang v22.1.6
    //   1142:    e8 d9 ff ff ff           call   1120 <func>
    //   1147:    89 45 f8                 mov    %eax,-0x8(%rbp)
    // gcc:
    //   112f:    e8 e5 ff ff ff           call   1119 <func>
    //   1134:    89 45 fc                 mov    %eax,-0x4(%rbp)

    __asm__ __volatile__ (
        "call func\n\t" : ASM_CALL_CONSTRAINT, "=3Da" (output_val) : :);
    // clang v22.1.6
    //   114a:    48 89 e0                 mov    %rsp,%rax
    //   114d:    48 89 c4                 mov    %rax,%rsp
    //   1150:    e8 cb ff ff ff           call   1120 <func>
    //   1155:    48 89 e1                 mov    %rsp,%rcx
    //   1158:    48 89 cc                 mov    %rcx,%rsp
    //   115b:    89 45 f8                 mov    %eax,-0x8(%rbp)
    // gcc:
    //   1137:    e8 dd ff ff ff           call   1119 <func>
    //   113c:    89 45 fc                 mov    %eax,-0x4(%rbp)

    __asm__ __volatile__ (
        "call func\n\t" : "=3Da" (output_val), ASM_CALL_CONSTRAINT : :);
    // clang v22.1.6
    //   115e:    48 89 e0                 mov    %rsp,%rax
    //   1161:    48 89 c4                 mov    %rax,%rsp
    //   1164:    e8 b7 ff ff ff           call   1120 <func>
    //   1169:    89 c1                    mov    %eax,%ecx
    //   116b:    48 89 e0                 mov    %rsp,%rax
    //   116e:    89 4d f8                 mov    %ecx,-0x8(%rbp)
    //   1171:    48 89 c4                 mov    %rax,%rsp
    // gcc:
    //   113f:    e8 d5 ff ff ff           call   1119 <func>
    //   1144:    89 45 fc                 mov    %eax,-0x4(%rbp)
    return 0;
}


> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
