Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC87E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 20:16:50 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id fu47so467324qtb.5
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLHeaalh6dfdayvcQE0b5mK+oKlzrD9mgi0CWXNrW4w=;
        b=K7wZbIFenzarkUNmK/wsSXUGNNxk2Fv5MBs3F7uMxEidV2BsCkOeJ2Mo590KoPen4G
         IhXA6VV83ax4QhQRnEEviEbZecQFuQaoWNidMtS8SzIehGwGoq52yGkuKlbSIm0c657F
         Wylkg9AyUaTehPOepUDaYUT0AiHTcKWexP/kGC4y9pqDYhq8y3GPnOGc9uUJTZ0EvYxK
         LXh7PrKVRKre/nV+EHPFoWhPQ/3qXqjfA5Fd6Lah8hM1a5I19D7r/jhXpOHedKhsKiQH
         /lch49tvtBl0nNsibKAGXHWU63Y97kOtjBITkhFLOilWsJjDfMqRBbw/2rVgW59Z8FTi
         Ia3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLHeaalh6dfdayvcQE0b5mK+oKlzrD9mgi0CWXNrW4w=;
        b=wUvZQF9WpuROqc+pjFAqa87UJQSg+biDKEkpVf3PyxQ67KshAthRSDSZFogIp9HBEP
         ixQEYhsQwESanLg+UPFlfh6w3WY0Bt58reBKUa+kYHgvYpBrYc0HY66Ibc7f1eTsUbas
         0RfwLmzvqXE2gL4ut6Xt5/YNXcE2TrAWU7MSifVLLfiXoD3KEp1rNqp9Yw0HzJO87BiV
         Cn/cIT2HzQXlR0o7TqkMjB2XTfOrai00Z2PK8KuswcEwedbkzrrdW/5pLMnlM9cYyiq/
         LMj59ZXVvSaPi5z/bSgSCBk9MT+qoKJecTC2Em+z/qdwbM8Xcb/sgLXThsl+4S8Ar6FO
         nfHg==
X-Gm-Message-State: AOAM532ILVyrBb2oFEbUZOxJgn288Mflpkz5gIfGdmyDfRdv01AqiK7l
	286AHgYCzsavwjJbr7ibiJOl2b7WgTapR/WBn7q6kYUHlerY/w==
X-Google-Smtp-Source: ABdhPJx2tmrH/rrb63j6EjLuPLXuNAaTzAaGgB3lytBhqeH9OIiMe0Vs7etyB+c6cnPIAiarsCBYhMqgAfzF0jpNUV4=
X-Received: by 2002:a05:622a:60a:b0:2e2:7b2:ba74 with SMTP id
 z10-20020a05622a060a00b002e207b2ba74mr16836914qta.293.1651004209201; Tue, 26
 Apr 2022 13:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com> <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
In-Reply-To: <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Tue, 26 Apr 2022 22:16:38 +0200
Message-ID: <CAEQFVGaUOQhCCceNzivzsR7XeNFrau48BuV-nf7CnSw7YauVoQ@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chih-Wei Huang <cwhuang@android-x86.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

> So I will report on x86 32bit target build attempt with
> android-12.1.0_r4 / clang version 12.0.7

I have found that the parameters passed along with make
can improve a lot the build of kernel with aosp toolchain,
by using the following ones used with clang 12.0.7 shipped with Android 12
do not show the aforementioned 32bit building error

CROSS_COMPILE := $(abspath $(TARGET_TOOLS_PREFIX))
KERNEL_CLANG_FLAGS := \
        LLVM=1 \
        CC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
        LD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
        AR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar) \
        NM=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-nm) \
        OBJCOPY=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objcopy) \
        OBJDUMP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-objdump) \
        READELF=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-readelf) \
        OBJSIZE=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-size) \
        STRIP=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-strip) \
        HOSTCC=$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
        HOSTCXX=$(abspath $(LLVM_PREBUILTS_PATH)/clang++) \
        HOSTLD=$(abspath $(LLVM_PREBUILTS_PATH)/ld.lld) \
        HOSTLDFLAGS=-fuse-ld=lld \
        HOSTAR=$(abspath $(LLVM_PREBUILTS_PATH)/llvm-ar)

Having had this good result with Android 12,
I have tried the same approach with Android 11 (clang 11.0.2) and it worked.
I have applied the change it in our official kernel build rules for Android 11

[1] http://git.osdn.net/view?p=android-x86/device-generic-common.git;a=commitdiff;h=43c43d0d1086672ec7fcea2f0fd91ad4a36ab16f;hp=368b6004e1362687b2add401d5f9a84e8ace370a

Maybe the problem was induced by CROSS_COMPILE := x86_64-linux-androidkernel-
or CROSS_COMPILE := $(abspath $(TARGET_TOOLS_PREFIX)), and the rest,
act as a Workaround

Thank you
Mauro
