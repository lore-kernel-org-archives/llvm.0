Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEAC8814
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 20:20:28 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id e10so13550289pgc.9
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 12:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1qSjE1VvRbPXJ5r4XzLx17PZDp1t5KVaqJ2AEZ4GlVw=;
        b=AmJStk62XZYs69MWgzxpuT3vfBxY5afaIrLoL2S3wdmRvqZKn1U7IArJ0cOBbT1/LJ
         yeB7Ho2R7AARXi8kR04Z05DcOPCPEgwc8arHXeKzhkS0nYj7zAVXBQ6lYKXz/OTKxvfg
         LVueMMpxoG+2m+0WmnPol0DvGoizDs28jcHpmCiUVtdrSMOIuxlnC+OC+U0k9IB54Ppc
         HzEaIAYvXP5Fgcgd/S2Nkx8oZsex69KmExFmjB6U9GORX7KPjQ+fDBjy8fmHxVTcdfRa
         hGsTrKUUfGTLYW9d7eUUjqvGTxRVBBEIDisgw9N3KSMsalvOSxUdZFk+xkos+CLcL3za
         h3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qSjE1VvRbPXJ5r4XzLx17PZDp1t5KVaqJ2AEZ4GlVw=;
        b=RC5DWSxlupzE7Ozwj6TffIQJl2Vp6iUIOxuSfi2foiFntPSR7CznIT5LX98gMh6nKm
         Fih3bdD0dHE1ng7C5QX1cZQ1qVgh0PuTeABGGcDedhlvvtlBAiatq6tciB7QC2uIIkdO
         eMp+jyUc+BU5TamUNuaew1Oh+HGUPKve4igURZLwIwa0r57M0Vx2bK9QMtqna98DZ5WS
         Z/VU2MUYrlbn2vySIdzNvhqsdl4oBMMipuW6Jx2LCb2gEPp8QX718f4pyE4tpk2eS9HG
         igQ0t0YzkTz7RC/FfrzkNq5ZK9sDQiasGFE+XJxyA6guunjl5Phx/b1o0w6ItMJBoil5
         HAVQ==
X-Gm-Message-State: AFqh2krmqGsArDCh3Y5c+YCpUdUiPqS3JdryR61rJSbgNrXLHMs1gT7d
	LgMI0gKQVsbOVSGa4DBRkf32XDlZcCgsdMlAPMo7XA==
X-Google-Smtp-Source: AMrXdXtC9yOgGx2bPJjD3/ghQwCgSCmI+XBzfxXEggijGen8Keatcg5FP0p4b0Ro+YZ+NeNni44s2PGBb4AAfetsW8M=
X-Received: by 2002:aa7:914e:0:b0:578:202d:a33a with SMTP id
 14-20020aa7914e000000b00578202da33amr4164118pfi.23.1673554827750; Thu, 12 Jan
 2023 12:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111-arm64-kselftest-clang-v1-0-89c69d377727@kernel.org>
In-Reply-To: <20230111-arm64-kselftest-clang-v1-0-89c69d377727@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 Jan 2023 12:20:18 -0800
Message-ID: <CAKwvOdmJtg2=D64hgxBLkQbabVSPTtn8VLxEvbuRf064sm5NAg@mail.gmail.com>
Subject: Re: [PATCH 0/6] kselftest/arm64: Build fixes for clang
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 11:52 AM Mark Brown <broonie@kernel.org> wrote:
>
> This series provides a few small build fixes and Makefile tweaks which
> allow us to build the arm64 selftests using clang as well as GCC.  I
> also fixed one minor issue I noticed in the MTE Makefile while doing the
> updates there.
>
> To: Catalin Marinas <catalin.marinas@arm.com>
> To: Will Deacon <will@kernel.org>
> To: Shuah Khan <shuah@kernel.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <ndesaulniers@google.com>
> To: Tom Rix <trix@redhat.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks for the patches! They LGTM! For the series:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> ---
> Mark Brown (6):
>       kselftest/arm64: Fix .pushsection for strings in FP tests
>       kselftest/arm64: Remove redundant _start labels from FP tests
>       kselftest/arm64: Don't pass headers to the compiler as source
>       kselftest/arm64: Initialise current at build time in signal tests
>       kselftest/arm64: Support build of MTE tests with clang
>       kselftest/arm64: Remove spurious comment from MTE test Makefile
>
>  tools/testing/selftests/arm64/fp/assembler.h        |  2 +-
>  tools/testing/selftests/arm64/fp/fp-pidbench.S      |  1 -
>  tools/testing/selftests/arm64/fp/fpsimd-test.S      |  1 -
>  tools/testing/selftests/arm64/fp/sve-test.S         |  1 -
>  tools/testing/selftests/arm64/fp/za-test.S          |  1 -
>  tools/testing/selftests/arm64/mte/Makefile          | 21 +++++++++++++++------
>  tools/testing/selftests/arm64/signal/Makefile       |  8 ++++++--
>  tools/testing/selftests/arm64/signal/test_signals.c |  4 +---
>  8 files changed, 23 insertions(+), 16 deletions(-)
> ---
> base-commit: b7bfaa761d760e72a969d116517eaa12e404c262
> change-id: 20230111-arm64-kselftest-clang-f734b6b0c057
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>



-- 
Thanks,
~Nick Desaulniers
