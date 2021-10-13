Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC742C85
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 07:55:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUY9w-1mAGmZ0kJE-00QX15 for <llvm@lists.linux.dev>; Wed, 13 Oct 2021
 09:55:31 +0200
Received: by mail-wr1-f45.google.com with SMTP id k7so5135881wrd.13
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 00:55:30 -0700 (PDT)
X-Gm-Message-State: AOAM530++PrrY0rNyPe1boAmTg784DAvxN+A+TCVuBDmXk2xy1C3iqMv
	yLmHTdYxXgkNP3oIbnlETB0QMmgf4DCvo8pyncY=
X-Google-Smtp-Source: ABdhPJyiEJBpgNDpB6GmM5rJOFTTTfiFTaFUlnEWP59JJxhNZAk4i37kRw3Rf+g9OE/qnJqBSX5RUghnoccWBlIuMYo=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr11030180wmj.1.1634111730691;
 Wed, 13 Oct 2021 00:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211012234606.91717-1-ndesaulniers@google.com> <20211012234606.91717-2-ndesaulniers@google.com>
In-Reply-To: <20211012234606.91717-2-ndesaulniers@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Oct 2021 09:55:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3UBEJ0Py2ycz=rHfgog8g3mCOeQOwO0Gmp-iz6Uxkapg@mail.gmail.com>
Message-ID: <CAK8P3a3UBEJ0Py2ycz=rHfgog8g3mCOeQOwO0Gmp-iz6Uxkapg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: vdso32: drop the test for dmb ishld
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Christian Biesinger <cbiesinger@google.com>, 
	Simon Marchi <simon.marchi@polymtl.ca>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VWlSdWEPEdqCoKhSqkL3Qv7YLlO/cjkaBOvUAxuD0seaU9A1OCY
 w6BqIvo+JZXtSWzxbFcZql0rcz4c3UQwfiSJbE6PDwQzhczc8UZh1jb9uTlBzls3b5k9ibQ
 nSdb99QrnK9OLTtWyvx7fFYdN3taKMX7W7OF1YPeLJSY993ODeTZarJzk1gHBdjUVamI6jP
 m483JxURZwuZoChqIDFng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XVIcA5JuKrc=:iG8VrWI+t+i0szxnThcuwC
 N6Q1uuiBWjtfOsLdgY4d+QQ7rvgshpbBtQ9qwcEV4aFMkljcMTer0g9X0gMWpmoanZGzcNo6H
 XNH7LoOPrsMkcZH9MQRirtPxNPd9oDegTR5eIfCf32b0hgN6a1P5jmC3zhQj21ga8lP5UV13u
 b8We1GeNFPld7ViI3xCAQaYNJL6FnlEsDTa40lghzPrmChfCl0ZhyaVgIUZ6OEhJ3i+ENu/Ek
 N5DUuPLx9X2QtN0/9ofCjez8GBb9BmL0xwxCb7XXiQqH/ccjaHvmZfBTTJ+6NZGOJNOyT7pTy
 1Sn0j5ej8hXE7ZdBXAcWucFdg6JCNOJ5YNgBagPlogdJci4SpMb0WjgwAwen45oANFA/xW797
 3Ax+NjT2TUO4mVZRLyMm0lUkIpOAwCHMOpvNEgYrN1ZCNOe+PVGuBz7qLcNjEvouZaKk7WUu+
 7eafsDu5SXCFLY/GcS196DfvmkMB01k43ryaniulUm1jiHV42CzFgXaAiYMEojGlMbvHS0ito
 WpEi6JaNdRRVgnBZ+R4lBOqvGiIAAHvnfF9+DiFMeCtg+BAXTqOyI1fn7HnJ5kTs0aDqxJ2cA
 EIVVmyMMIZH9xv2QyjAny4Pb8HK6ijIsZE8guKOKl02MjqRicCXyZMQTNIwQ8MW4fcPCOwVrJ
 7CI+29C8OLaBTzfqp25PaAVnA9YcZ6ow2JsaZyYR1tWFQ/8cd+4hmomqS/eOxCnTIE6MLke2U
 MXw0DPkxxlZ0ew5Ui4CU9gvGwbUr4QXQmLJ9Mw==

On Wed, Oct 13, 2021 at 1:46 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Binutils added support for this instruction in commit
> e797f7e0b2bedc9328d4a9a0ebc63ca7a2dbbebc which shipped in 2.34 (just
> missing the 2.33 release) but was cherry-picked into 2.33 in commit
> 27a50d6755bae906bc73b4ec1a8b448467f0bea1. Thanks to Christian and Simon
> for helping me with the patch archaeology.
>
> According to Documentation/process/changes.rst, the minimum supported
> version of binutils is 2.33. Since all supported versions of GAS support
> this instruction, drop the assembler invocation, preprocessor
> flags/guards, and the cross assembler macro that's now unused.
>
> This also avoids a recursive self reference in a follow up cleanup
> patch.
>
> Cc: Christian Biesinger <cbiesinger@google.com>
> Cc: Simon Marchi <simon.marchi@polymtl.ca>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

This change looks good, but I think we should do the same for the gcc
version check:

> -#if __LINUX_ARM_ARCH__ >= 8 && defined(CONFIG_AS_DMB_ISHLD)
> +#if __LINUX_ARM_ARCH__ >= 8
>  #define aarch32_smp_mb()       dmb(ish)
>  #define aarch32_smp_rmb()      dmb(ishld)
>  #define aarch32_smp_wmb()      dmb(ishst)

gcc-4.8 already supported -march=armv8, and we require gcc-5.1 now, so both
this #if/#else construct and the corresponding "cc32-option,-march=armv8-a"
check should be obsolete now.

       Arnd
