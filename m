Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D71398
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 22:28:35 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id hf18so4586143qtb.0
        for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 15:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p4vPHezcqns5H5zIgUJrQDuXOxx8vW+2GI/XniqPKXY=;
        b=PGh4Lt256ABy+uKMNvKFCZYqMHSaoFIsILizTaxuqW8v2W40JkoEDj4amDlLKfMoBM
         bkI6fkUUw6EvC011mE63WoD9ZcQlCftnodmFvd/eGZ5yMUQFiZUW24B6DFQlJKW9faNT
         JfTgJuqVJn8d29LGGjnz9f/E8FkPF0jtopdJkPuAQ26LpycyzgOfA0ElOHDV9WVMaDp/
         6Z37Q8frdPEsUADsY8pyAYvT7j16DUmeytbNcnCt2AAnqhj5r7FNBar4Nk6LAe+tlHuD
         Yn1HhqAtogoKSSqhHpUU+FiXm0z81zKU/65kM47BC/53OD50gd1AlGF1BAr14qwneD94
         oKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p4vPHezcqns5H5zIgUJrQDuXOxx8vW+2GI/XniqPKXY=;
        b=rAQcCmv3FrXhG6d81/YQ47fTkGdPdJz2VyWvPBfGaMLiwT14o60eiTpdBj1uLT2PA2
         mrxBf5V18hfyzFm84SNOF0hsU+MhViCGZHy5C/vnrNd5pnnFaki+8NpB96M/lCQvnGcK
         68IoU3NRM4B38mL1FGyecYBslnKagzJVb0vKu8OQOiVd4VdhaTIZ3RbOoaWGQX21ugVk
         Jkb2AdiP/zeu0T1UQD+hSWC9zXl5Z4qAzqRsTJTAT6grfWJwf6T18FB8mNiq6Rx2NlsW
         FlZORFuODwzlEiuVxgedIFFvmR2jOope+Btwd2Oqxnyk+GXJseT5lBb6JK+4znud5Krp
         rTSw==
X-Gm-Message-State: AOAM531eUgg++xkPyY0IAqOVLA76alZsOYUwJKiyeU7WyiygJbu6Fo1B
	uf1K9jaZHIUuGku18tn9xVym3yhRF7/lmlzMWuE=
X-Google-Smtp-Source: ABdhPJxLbxZvxC4kXxb/pEOcql0BbXZM2OvmDL4EjeYtNDNOTFLqbM5n46/oJ+aBvzrOmAf37/pZSNjjSJq5z0vjVoE=
X-Received: by 2002:ac8:7d8e:0:b0:2f1:e909:7a1 with SMTP id
 c14-20020ac87d8e000000b002f1e90907a1mr25165903qtd.385.1651184913915; Thu, 28
 Apr 2022 15:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAEQFVGaUOQhCCceNzivzsR7XeNFrau48BuV-nf7CnSw7YauVoQ@mail.gmail.com> <CAEQFVGY6UwuV0s_926Mg=fWaApjYUJmqeK_E4ySpABkZRFwTLQ@mail.gmail.com>
In-Reply-To: <CAEQFVGY6UwuV0s_926Mg=fWaApjYUJmqeK_E4ySpABkZRFwTLQ@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Fri, 29 Apr 2022 00:28:22 +0200
Message-ID: <CAEQFVGavOWzTf5VNNNr39pHaaJW8W=6hiGDH1JmVTQ2kf5KqAw@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chih-Wei Huang <cwhuang@android-x86.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 12:23 AM Mauro Rossi <issor.oruam@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 10:16 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> >
> > > So I will report on x86 32bit target build attempt with
> > > android-12.1.0_r4 / clang version 12.0.7
> >
> > I have found that the parameters passed along with make
> > can improve a lot the build of kernel with aosp toolchain,
> > by using the following ones used with clang 12.0.7 shipped with Android 12
> > do not show the aforementioned 32bit building error
> >
> > CROSS_COMPILE := $(abspath $(TARGET_TOOLS_PREFIX))
> > KERNEL_CLANG_FLAGS := \
> >         LLVM=1 \
> >         CC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
> >         LD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
> >         AR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar) \
> >         NM=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-nm) \
> >         OBJCOPY=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objcopy) \
> >         OBJDUMP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objdump) \
> >         READELF=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-readelf) \
> >         OBJSIZE=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-size) \
> >         STRIP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-strip) \
> >         HOSTCC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
> >         HOSTCXX=$(abspath $(LLVM_PREBUILTS_PATH)/clang++) \
> >         HOSTLD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
> >         HOSTLDFLAGS=-fuse-ld=lld \
> >         HOSTAR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar)
> >
> > Having had this good result with Android 12,
> > I have tried the same approach with Android 11 (clang 11.0.2) and it worked.
> > I have applied the change it in our official kernel build rules for Android 11
> >
> > [1] http://git.osdn.net/view?p=android-x86/device-generic-common.git;a=commitdiff;h=43c43d0d1086672ec7fcea2f0fd91ad4a36ab16f;hp=368b6004e1362687b2add401d5f9a84e8ace370a
> >
> > Maybe the problem was induced by CROSS_COMPILE := x86_64-linux-androidkernel-
> > or CROSS_COMPILE := $(abspath $(TARGET_TOOLS_PREFIX)), and the rest,
> > act as a Workaround
> >
> > Thank you
> > Mauro
>
> Sorry, I need to retest, next weekend, the build with the method I
> mentioned, because due to a typo in pre-existing code a void
> KERNEL_CLANG_CLAGS set of parameter was passed to make command, while
> I have defined KERNEL_CLANG_FLAGS and none of that has been passed to
> make command.
>
> I will report next weekend about the results
> Apologies
> Mauro

As promised I have rechecked the kernel build with Android 11 prebuilt
toolchain (clang 11.0.2)
by passing all the parameters I have used with Android 12 (clang
12.0.7) and I am still getting the build error

  CC      mm/maccess.o
/home/utente/r-x86_kernel/kernel/mm/maccess.c:37:3: error: invalid
output size for constraint '=a'
                copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
                ^
/home/utente/r-x86_kernel/kernel/mm/maccess.c:19:3: note: expanded
from macro 'copy_from_kernel_nofault_loop'
                __get_kernel_nofault(dst, src, type, err_label);
         \
                ^
/home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:538:18:
note: expanded from macro '__get_kernel_nofault'
        __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
                        ^
/home/utente/r-x86_kernel/kernel/mm/maccess.c:37:3: error: invalid
output size for constraint '=a'
/home/utente/r-x86_kernel/kernel/mm/maccess.c:19:3: note: expanded
from macro 'copy_from_kernel_nofault_loop'
                __get_kernel_nofault(dst, src, type, err_label);
         \
                ^
/home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:538:18:
note: expanded from macro '__get_kernel_nofault'
        __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
                        ^
2 errors generated.

At this point I will proceed in testing the build with Nick proposed
changes in __get_user_size()
and report back

Thank you
M.
