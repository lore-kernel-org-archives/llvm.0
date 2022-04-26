Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1F33C3
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 22:23:54 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id t11so6954381qto.11
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3No90dqXzqGebhP/0h9vOyY/9m+kxq7kflcvmFzRGOc=;
        b=JWVu0VEnrDH+PxlYAJZ2ROsVMxktd5OAVrxB81PTnV3p6c6drq0lGW6GOj6Jyvtd0V
         1a7rtypWBi7kRe2Vwis5pWg3DIVlyDjBxfK8MzpG1UigE9VOiRiLa//wyPei1E9Pgf15
         UQSO7Q3tPM9F08kcDgRkojxK6Q8IpFK3TZTlD8kNS1HDElagfmovxvCQZI3cAfdqomqY
         whHph8WOCMEr6FcYm6W9VTnKM0WC/xGf4rPEottyyxbbWuAWP7TftVZsP3M1j9owpsMP
         SgoifkYX4U1bAdz7n2izJUjEKU57ArZB0clQbveZhqoykBmWAwnuDm4Wcl7qv93/ebSD
         o5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3No90dqXzqGebhP/0h9vOyY/9m+kxq7kflcvmFzRGOc=;
        b=giiIvX1wOYmlCh+seh1usR6gnUPJOpfhuRYVtXf0VGB4vRXEB+YIZCKKFhAV8j5J0K
         Y/9zj4NaZGPQa5O/Te4s1dlJHx3+1f/zBZEN+kNN1sa05kM9jFlguA9+DakAejR7cKJP
         VRDamYpyCiTOsitqVtsV7HAMrkqmeQy46OW2MW8OQBbyRdMfvZKd/1wMaf6m+ak6izZg
         3fxD8zrKNHS6RxfWjOGd4Kit3niSf10XH9rXBZuZ0b+gtVzDfC2iy2jUvtFA51l0rj2i
         0v8UiFsnUxkq3KSsz/S0577aq7B2/yxOgIY6a6XbHPeua8Hb2fxTY1W4gsWNt/DfVfOQ
         k3iw==
X-Gm-Message-State: AOAM532cwU0lsAIFAvSLQL+YvC1H8z5julSszAmzgRKxrbMzFX6i/CLq
	+ilVROuNKK/IdaxR/IIEeezx7HZksWZlDqv8r/Y=
X-Google-Smtp-Source: ABdhPJw7I6nibsWYK7C8SgD1vwdXtbYe+VivVRvzQR4x4avQPbr62942MNagk1g9Fdt9mZd4bKFusSOA6k9lPnlnsbg=
X-Received: by 2002:ac8:660d:0:b0:2f1:e2ff:c5a3 with SMTP id
 c13-20020ac8660d000000b002f1e2ffc5a3mr16906193qtp.245.1651011833849; Tue, 26
 Apr 2022 15:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com> <CAEQFVGaUOQhCCceNzivzsR7XeNFrau48BuV-nf7CnSw7YauVoQ@mail.gmail.com>
In-Reply-To: <CAEQFVGaUOQhCCceNzivzsR7XeNFrau48BuV-nf7CnSw7YauVoQ@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Wed, 27 Apr 2022 00:23:42 +0200
Message-ID: <CAEQFVGY6UwuV0s_926Mg=fWaApjYUJmqeK_E4ySpABkZRFwTLQ@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chih-Wei Huang <cwhuang@android-x86.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 10:16 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
>
> > So I will report on x86 32bit target build attempt with
> > android-12.1.0_r4 / clang version 12.0.7
>
> I have found that the parameters passed along with make
> can improve a lot the build of kernel with aosp toolchain,
> by using the following ones used with clang 12.0.7 shipped with Android 12
> do not show the aforementioned 32bit building error
>
> CROSS_COMPILE := $(abspath $(TARGET_TOOLS_PREFIX))
> KERNEL_CLANG_FLAGS := \
>         LLVM=1 \
>         CC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
>         LD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
>         AR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar) \
>         NM=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-nm) \
>         OBJCOPY=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objcopy) \
>         OBJDUMP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objdump) \
>         READELF=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-readelf) \
>         OBJSIZE=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-size) \
>         STRIP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-strip) \
>         HOSTCC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
>         HOSTCXX=$(abspath $(LLVM_PREBUILTS_PATH)/clang++) \
>         HOSTLD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
>         HOSTLDFLAGS=-fuse-ld=lld \
>         HOSTAR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar)
>
> Having had this good result with Android 12,
> I have tried the same approach with Android 11 (clang 11.0.2) and it worked.
> I have applied the change it in our official kernel build rules for Android 11
>
> [1] http://git.osdn.net/view?p=android-x86/device-generic-common.git;a=commitdiff;h=43c43d0d1086672ec7fcea2f0fd91ad4a36ab16f;hp=368b6004e1362687b2add401d5f9a84e8ace370a
>
> Maybe the problem was induced by CROSS_COMPILE := x86_64-linux-androidkernel-
> or CROSS_COMPILE := $(abspath $(TARGET_TOOLS_PREFIX)), and the rest,
> act as a Workaround
>
> Thank you
> Mauro

Sorry, I need to retest, next weekend, the build with the method I
mentioned, because due to a typo in pre-existing code a void
KERNEL_CLANG_CLAGS set of parameter was passed to make command, while
I have defined KERNEL_CLANG_FLAGS and none of that has been passed to
make command.

I will report next weekend about the results
Apologies
Mauro
