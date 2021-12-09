Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717168
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 21:16:45 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id m27so14409520lfj.12
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n/PRQqohZJZoWPfeAL4/gTv4y1kA/vUHTgUSzu+kjUk=;
        b=g4y37LIT8HPOzLKutUXtaDJvUeJ0+/CGyv38hQvAw62juFYmPp8xY81qmdfR94ekL1
         zJ01fAhqXrPsyVAyF4Rmu71FEe7b28kHRnIAs2gPOubcJVu4C+S4OAM5l5NsTVl1nUNo
         0geMJEqdhmk9vQoyehfiLCCzsf/vPPpjohT2YtqD+4MZUylekERGXpzLIRlt0a9eGNCv
         KmdCs4oTnEFlZcz8/j+4GFmLlTedEmnaISi73JDXUTgJvBbOnsFbIJm7FedBs7yGJ+pb
         B4qRT10iZ7dD3pd3uO4PQnPTq3oVMAcH4oq7NgGzrPRyFYEnuVNDFoz/NHO+Fejw9b/e
         9Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n/PRQqohZJZoWPfeAL4/gTv4y1kA/vUHTgUSzu+kjUk=;
        b=8JgeLMAhjan2OJyfAoWlHvMs768uaQrFYoASHa/dmycJQHs37ItcsoNAddgX9GMDU3
         jo8tKjeSsfAbtVRRLqR6LlWRp+R4e5Q8YRrElFZp9JYw9mplc1nHUDHCqrBg/3068JCQ
         IzE/3DtQrzvFvKGR6hj+HZriwPKJueSqtmE6AHgnFvOGDg5TRCe+qOiqNemCAqpNNC6H
         k/0qNtDkaqXGXEa9gKNum8e8t/jTEywr5e75Xnj3RYBiMpmbPvHoMDCH/17kPggnjgh3
         51LExvzg0t9rw4RFEYyUoUKRCW/gA+02Nha12fmirh10mOorEZC0BJook2EzD1MBbMm4
         77Bg==
X-Gm-Message-State: AOAM531Oee39MpCjBkGHYsColreJroarOa5XuRM0NGMaZIVZeEAbdvtl
	ubKe4gXJeGPZnNJMHTzWrUvFVoszkqDUc/TXcmBGvQ==
X-Google-Smtp-Source: ABdhPJzkqPmVslx+nMihnzHioqa5Jxg3UR3GK3CFA0GryeYJKVH2W5AracL5avcjGmE6Wnoa9W0q6oVMoXkEqKZl8SM=
X-Received: by 2002:ac2:418f:: with SMTP id z15mr7863545lfh.213.1639084602937;
 Thu, 09 Dec 2021 13:16:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com>
In-Reply-To: <YbHTKUjEejZCLyhX@elver.google.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 9 Dec 2021 22:16:16 +0100
Message-ID: <CAG48ez0dZwigkLHVWvNS6Cg-7bL4GoCMULyQzWteUv4zZ=OnWQ@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Potapenko <glider@google.com>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 10:58 AM Marco Elver <elver@google.com> wrote:
> Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> default since dcb7c0b9461c2, which is why this came on my radar. And
> Clang also performs auto-init of allocas when auto-init is on
> (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
> allocas.
>
> add_random_kstack_offset() uses __builtin_alloca() to add a stack
> offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
> enabled, add_random_kstack_offset() will auto-init that unused portion
> of the stack used to add an offset.
>
> There are several problems with this:
>
>         1. These offsets can be as large as 1023 bytes. Performing
>            memset() on them isn't exactly cheap, and this is done on
>            every syscall entry.
>
>         2. Architectures adding add_random_kstack_offset() to syscall
>            entry implemented in C require them to be 'noinstr' (e.g. see
>            x86 and s390). The potential problem here is that a call to
>            memset may occur, which is not noinstr.

This doesn't just affect alloca(), right? According to godbolt.org
(https://godbolt.org/z/jYrWEx7o8):

void bar(char *p);
void foo() {
  char arr[512];
  bar(arr);
}

when compiled with "-ftrivial-auto-var-init=pattern -O2 -mno-sse"
gives this result:

foo:                                    # @foo
        push    rbx
        sub     rsp, 512
        mov     rbx, rsp
        mov     edx, 512
        mov     rdi, rbx
        mov     esi, 170
        call    memset@PLT
        mov     rdi, rbx
        call    bar
        add     rsp, 512
        pop     rbx
        ret

So I think to fix this properly in a way that doesn't conflict with
noinstr validation, I think you'll have to add a compiler flag that
lets you specify a noinstr-safe replacement for memset() that should
be used here?
