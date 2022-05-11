Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A773208
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 21:36:06 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-d39f741ba0so4386728fac.13
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPq2AbbbZIM39erlXhLvSJXeCk2n871q31CGu/Ibwec=;
        b=ehW/kiZNsk24rzrHmeW5h7Ia8WjxcfH2YRCchxhJDVe8O2xTTTacmlzvxq0Zrrnijj
         auX3m8zQqjN+DE94aAxSWA1hJUNw1QaGcb59b7WwKVmnYSttb5W+MQMAXNiqLcJQuzd1
         SRLYJK4u1YVdJPFejj5zqZYRYVzYy3Lkn4MxWbNv9NKf0K336OHXGmrN5RXTMClSYKWx
         PMlX+d1x+tOsKCSfir7spBJLf+kmXNwUHaKVrBY05O2DNNMzx9fzrKLs5qJ+28dQwxwB
         13WyPUGa5mf5R5PzMElgpK2qDGirPRjlpFjJe3H1rfotgga+vWJSlG7HI9JWUyb6vmNV
         qkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPq2AbbbZIM39erlXhLvSJXeCk2n871q31CGu/Ibwec=;
        b=6upJoRy1sQ2t7nHPU+npSNFpKFjIudblws97fz/oBpZmaR4F12c6Thsybx22t/Hybt
         fyqNMNyN+PqV/FpJYrPLeWxI2xSPRjPVXVvHt46pky9dzF5oGeomuNlNpBa0SPZktkRy
         N+UwqPQ+Td8ICX7C2agy4WOCWBNYB7U6J/D81sWWzQ+hQcQo1subFGdBfJz7d+MrsGKJ
         bVqYredU76KjVklaxb+IOqxGD8im8eM68Wz9EgSt4RqAWgeZ+x4gHdleNXPBv1C/t+Mv
         mrNcwCWRYqk4LUbv9go4rWSZ/VAj963P1t0x3U7QCGrb9uwFgtNVYak3VG9jjDSayMdV
         XF9w==
X-Gm-Message-State: AOAM531OhUiSLLfL6mFMb0Z6k0W1Z1r4OyZSODGhsfYepLxluIZxVZtE
	EhmPs6WKhIFTsejWrmmFXjnh3xechDDuQ4z43Spxnw==
X-Google-Smtp-Source: ABdhPJzOekQzpQE4AytFB7X33FNub2z2DKztqYSBZow0H7kBktl/OX9nt2UdjSVTlSmSUsOf1rDgp4Gt5jsqyoVOmZk=
X-Received: by 2002:a05:6870:c598:b0:ed:a1c0:f810 with SMTP id
 ba24-20020a056870c59800b000eda1c0f810mr4054919oab.289.1652304965462; Wed, 11
 May 2022 14:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr> <20220511160319.1045812-2-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220511160319.1045812-2-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 14:35:54 -0700
Message-ID: <CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 9:03 AM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> For x86_64, the current ffs() implementation does not produce
> optimized code when called with a constant expression. On the
> contrary, the __builtin_ffs() function of both GCC and clang is able
> to simplify the expression into a single instruction.
>
> * Example *
>
> Let's consider two dummy functions foo() and bar() as below:
>
> | #include <linux/bitops.h>
> | #define CONST 0x01000000
> |
> | unsigned int foo(void)
> | {
> |       return ffs(CONST);
> | }
> |
> | unsigned int bar(void)
> | {
> |       return __builtin_ffs(CONST);
> | }
>
> GCC would produce below assembly code:

Thanks for the patch! LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> | 0000000000000000 <foo>:
> |    0: ba 00 00 00 01          mov    $0x1000000,%edx
> |    5: b8 ff ff ff ff          mov    $0xffffffff,%eax
> |    a: 0f bc c2                bsf    %edx,%eax
> |    d: 83 c0 01                add    $0x1,%eax
> |   10: c3                      ret

This should be the end of foo.  I...actually don't know what's at the
end here. But I don't think the region from here...

> |   11: 66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
> |   18: 00 00 00 00
> |   1c: 0f 1f 40 00             nopl   0x0(%rax)

...to here is relevant.


> |
> | 0000000000000020 <bar>:
> |   20: b8 19 00 00 00          mov    $0x19,%eax
> |   25: c3                      ret
>
> And clang would produce:
>
> | 0000000000000000 <foo>:
> |    0: b8 ff ff ff ff          mov    $0xffffffff,%eax
> |    5: 0f bc 05 00 00 00 00    bsf    0x0(%rip),%eax        # c <foo+0xc>
> |    c: 83 c0 01                add    $0x1,%eax
> |    f: c3                      ret

Weird, so I just tried this:
```
$ cat /tmp/x.c
#define CONST 0x01000000

unsigned ffs (int x) {
  int r;
  asm("bsfl %1,%0"
      : "=r" (r)
      : "rm" (x), "0" (-1));
  return r;
}

unsigned int foo(void) {
  return ffs(CONST);
}

unsigned int bar(void) {
  return __builtin_ffs(CONST);
}
$ clang /tmp/x.c -O2 -o /tmp/x.o -c && llvm-objdump -dr /tmp/x.o
--disassemble-symbols=foo
...
0000000000000010 <foo>:
      10: b8 19 00 00 00                movl    $25, %eax
      15: c3                            retq
      16: 66 2e 0f 1f 84 00 00 00 00 00 nopw    %cs:(%rax,%rax)
```
but if we make `ffs` `static`, we get:
```
0000000000000000 <foo>:
       0: b8 ff ff ff ff                movl    $4294967295, %eax
 # imm = 0xFFFFFFFF
       5: 0f bc 05 00 00 00 00          bsfl    (%rip), %eax
 # 0xc <foo+0xc>
                0000000000000008:  R_X86_64_PC32        .LCPI0_0-0x4
       c: c3                            retq
       d: 0f 1f 00                      nopl    (%rax)
```
Which is very interesting to me; it looks like constant propagation
actually hurt optimization, we lost that this was a libcall which we
could have optimized.

As in LLVM does:
1. sink CONST into ffs; it's static and has one caller
2. delete x parameter; it's unused
3. now libcall optimization just sees a call to ffs with no params,
that doesn't match the signature of libc.

Your change should fix that since we don't even call a function named
ffs if we have a constant (explicitly, or via optimization). Filed
https://github.com/llvm/llvm-project/issues/55394
-- 
Thanks,
~Nick Desaulniers
