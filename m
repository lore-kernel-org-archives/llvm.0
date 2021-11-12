Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B65368
	for <llvm@lists.linux.dev>; Fri, 12 Nov 2021 15:36:03 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id r8so11629143iog.7
        for <llvm@lists.linux.dev>; Fri, 12 Nov 2021 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L6/KQ1RFxJPQ4chq26FdZA+80ab2qqgCfkSi6AoO2sM=;
        b=NKtAXmwald5E66M/zVscXACD4q1FMAJhx1nlyseZ50GgN+Bw+kDCkkay5O09Ug3x/K
         5k/sp05EECQxr04ywYgZqmFoegzqJ4T1YiRsyLK+1AuDxyngV1KX3jJXCzglBuE/g7As
         apzoHZcnmgGHxqswXB2vcTFM2plomMPL7TU1UL1bIzMptaTF4teerdDKV732rsWxcm3D
         MbQ6QZjaVu7+9KUQhzFNTLN4MYZxMo7j4E+CnNqmwV7+BSQIJICHA3hHQzHtktvCuPKU
         dIZqleP5yDVLNr+/ild/d/D7nVMaAt+80LTXASQ/9t4W34NYurDEfcZo7tkdjlMzZmW+
         jOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L6/KQ1RFxJPQ4chq26FdZA+80ab2qqgCfkSi6AoO2sM=;
        b=XiaThsQdcu9hU9uBZ4Wo4R3+kLDgDfIR1wQPh98loEV2W4sTxEoRYw8Nr7OeyrHC20
         z0sxkbhoLs/aVqY2MzUNTp/8SfgDJfksjPiSdBBEuhq1kvNmrE4jxMislLYxd4kqP0gj
         +3LUrwpxW7XrpLxwNRaSZssou8U1M+z5jv2BJUWd9+3oLVPsE5paoM0qinngJ+dlX78n
         jf8svNn1OCpE3EMczphUyVRj8tjixJMs3xccslfm792T5HpbvcljUJZhIvu1z1hycEvc
         B4H5UQgF/5OXA1ZOZIQQlhQc35S4HNTb5JWhWUFTCkgm5MMtzjEtx836JGJnmtNoAz+q
         LmBw==
X-Gm-Message-State: AOAM531msdC0JZ86+6c+9+ps7uLDh8lTPqXqssyQhW3Uo3OZ8K0m7zva
	zbDAGz8WLN+glZJKgMMouVgiMSbqyAjsc4WTCVRjFQ==
X-Google-Smtp-Source: ABdhPJzjOBZfnEL1w9tiRLgepxRohZjmF3gM9Boh2m0xIc20HfSmCkou7fsiaE50e1kIKnIXtoawisgKa6a88Sh1K4s=
X-Received: by 2002:a05:6638:2055:: with SMTP id t21mr12599294jaj.90.1636731362002;
 Fri, 12 Nov 2021 07:36:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1fcb636d-71ab-12e8-aa7f-c7ca4f89a5ed@intel.com>
In-Reply-To: <1fcb636d-71ab-12e8-aa7f-c7ca4f89a5ed@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 12 Nov 2021 07:35:49 -0800
Message-ID: <CAP-5=fXv7oxrxBnHqXNAdwK4ULPUcAVR5aFh1RV1NsTX3JuYxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf clang: Fixes for more recent LLVM/clang
To: Ma Xinjian <xinjianx.ma@intel.com>
Cc: acme@kernel.org, alexander.shishkin@linux.intel.com, daniel@iogearbox.net, 
	jolsa@redhat.com, leo.yan@linaro.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mark.rutland@arm.com, 
	mingo@redhat.com, mpetlan@redhat.com, namhyung@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org, sedat.dilek@gmail.com, 
	philip.li@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 12, 2021 at 2:34 AM Ma Xinjian <xinjianx.ma@intel.com> wrote:
>
> Hi
>
> We build perf with clang also recently, but unlucky that failed with
> following errors:
>
>
> ```
> In file included from /usr/lib/llvm-7/include/llvm/ADT/STLExtras.h:21,
>                   from /usr/lib/llvm-7/include/llvm/ADT/StringRef.h:13,
>                   from /usr/lib/llvm-7/include/clang/Basic/Version.h:20,
>                   from test-clang.cpp:2:
> /usr/lib/llvm-7/include/llvm/ADT/SmallVector.h: In instantiation of
> 'void llvm::SmallVectorTemplateBase<T, true>::push_back(const T&) [with
> T = clang::driver::OffloadUnbundlingJobAction::DependentActionInfo]':
> /usr/lib/llvm-7/include/clang/Driver/Action.h:579:61:   required from here
> /usr/lib/llvm-7/include/llvm/ADT/SmallVector.h:313:11: error: 'void*
> memcpy(void*, const void*, size_t)' writing to an object of type 'struct
> clang::driver::OffloadUnbundlingJobAction::DependentActionInfo' with no
> trivial copy-assignment; use copy-initialization instead
> [-Werror=class-memaccess]
>       memcpy(this->end(), &Elt, sizeof(T));
>       ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /usr/lib/llvm-7/include/clang/Driver/Driver.h:15,
>                   from test-clang.cpp:6:
> /usr/lib/llvm-7/include/clang/Driver/Action.h:549:10: note: 'struct
> clang::driver::OffloadUnbundlingJobAction::DependentActionInfo' declared
> here
>     struct DependentActionInfo final {
>            ^~~~~~~~~~~~~~~~~~~
> cc1plus: all warnings being treated as errors
> ```
>
> llvm version: 7
> rootfs: Debian10
> kernel: v5.8 v5.11 v5.15
> reproduce:
> $ cd linux/tools/perf
> $ make LIBCLANGLLVM=1 ARCH= EXTRA_CFLAGS='-fno-omit-frame-pointer
> -fsanitize=undefined -fsanitize=address'
>
> Would you please kindly point out what's wrong with our steps? Or can
> you give us your command to make perf with clang?

Hi Xinjian,

As the bug is in LLVM 7 there is little we can do in Linux perf to fix
the issue. I haven't got LLVM 7 on my machine to test with, but I see
the same problem with LLVM 6 - both of which are of course quite old.
My workaround is to add to the make command line
"CXXFLAGS=-Wno-error=class-memaccess". My full command line is:

make -C tools/perf O=/tmp/perf DESTDIR=/tmp/perf-install  DEBUG=1
LIBPFM4=1 NO_LIBBFD=1 LIBCLANGLLVM=1
LLVM_CONFIG=/usr/lib/llvm-6.0/bin/llvm-config
CXXFLAGS=-Wno-error=class-memaccess

I know Intel is keen on testing. Related to this code are the BPF
tests in "perf test". I frequently see flakes on these tests that
count the number of times a system call is called. The flakes are an
under or over count by 1. The over count by 1 I can explain if during
the test another process happens to use the same system call. The
under counting is harder to explain and is possibly an indication of a
data race. I'd be happy for any suggestions to fix these flakes.

Thanks,
Ian

> Thanks
> Ma Xinjian
