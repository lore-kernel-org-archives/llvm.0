Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D60A3200
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 19:41:23 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2e68c95e0f9so112975057b3.0
        for <llvm@lists.linux.dev>; Mon, 04 Apr 2022 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eAwv7CFZ3JOlEcNj8j8D2/v921PTmZNLQHl33SWwbZQ=;
        b=pMdBBCRgdJWrkxOB7Vi/srVNde9bJufkX4hVHEeS+pFF8yy6ccmz7kB+1UwHKEIDFa
         JDg37ysNC2VzPqSfgLQnu7iYkS3/sbzzt9U66P4qidAB+SU4mTF1PntYeWGtGxMrXI94
         c7VlnLx3YhtB0XEymV2HzG/wPESttE7jFSEYKhmWuLId0C4CdBpHGprn+S1rZ+skseYr
         R5O2AESDpF9Nha3NUhigFuCto1zYZ+Q5FUlSL9jPB/joOa9jbDMtEx1Y2YhBi+lkRwGp
         DyTmqM/Fr5UV5yGB2tMELqq9tO6uUup/Raugo78JKi2NLR+3NMDswAsxgK2+Xfgbv0HL
         ywZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eAwv7CFZ3JOlEcNj8j8D2/v921PTmZNLQHl33SWwbZQ=;
        b=G4tfX6ullXPEWK/LVH3wBuUKyOM88t2B4YGSvvOvMVmdOM5x2nfgwE+5rbGTGmc4mZ
         wDgKyfdA8yJNgyd3sUcDnjwVOE0XFzhuFdqY7dCTfJnK1zdifmDW/JaY82bZHwz1KNQy
         1CPfr4Idn00FO8SgU8hgY8SaqxgJBEENX0ljeCFZNZHYQXECmTCXHXiWc7XxgU1lhS26
         JGlbpWwNUdvDpwkXCuNE/Syrs/Sq6s7CAMb657ZH85mfqV2t7Yv09+VcnqXnSu2SdGnr
         dnSadM7IrIqEbI0xyH2F5zNqcJGDxrIZbIuoqhvcQxklfJoQY49vLUQv7xtEZVMi0LP3
         VK9w==
X-Gm-Message-State: AOAM532lGJGjdlsVxDtScfyOveEt23ZPVjV2mYTP4N1g1smJAq1pOito
	qQonqmzEr4WCFG3C0e+iCgtCTD4oJ0IGMMjteRf9fA==
X-Google-Smtp-Source: ABdhPJx7D6TDafv3kiS/i/Qp7m7WK4qbRCfugunFo5wbxlDRV34SM1qNDg9LlBTyO66YQQqmXk6cb/7CTestETLhn4E=
X-Received: by 2002:a81:3a4a:0:b0:2e5:a9e9:f43c with SMTP id
 h71-20020a813a4a000000b002e5a9e9f43cmr1490010ywa.243.1649101281897; Mon, 04
 Apr 2022 12:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220401201916.1487500-1-samitolvanen@google.com>
 <20220401201916.1487500-2-samitolvanen@google.com> <CAK7LNAQoJWUscyxXVnOQ9924MYZwaZGgfBYSzmjJxKH_UC0Pkw@mail.gmail.com>
In-Reply-To: <CAK7LNAQoJWUscyxXVnOQ9924MYZwaZGgfBYSzmjJxKH_UC0Pkw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 4 Apr 2022 12:40:46 -0700
Message-ID: <CABCJKudaQJ0_e290gD+rG8SwEembd33ua1MG-w2OKRq3es8Kjw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Change CFI_CLANG to depend on __builtin_function_start
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 2, 2022 at 6:32 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Apr 2, 2022 at 5:19 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Clang 14 added support for the __builtin_function_start()
> > built-in function, which allows us to implement function_nocfi()
> > without architecture-specific inline assembly. This patch changes
> > CONFIG_CFI_CLANG to depend on the built-in and effectively upgrades
> > the minimum supported compiler version for CFI to Clang 14.
>
> From this description, I think the straight-forward change would be:
>
>     depends on CLANG_VERSION >= 120000
> -->
>     depends on CLANG_VERSION >= 140000
>
> Any reason to avoid this?

I thought testing for the compiler feature was preferred, but I can
certainly just increase the minimum version number here too.

Sami
