Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C9285C8D
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773498; cv=none; b=P2O0EoXtgHq9jbDlf/5lq3fglNu4j6Yb+zIAHcue9or8wUzszqGl4CA6VTwrgJYdefTz1UMYuF/2NrVLqBKMQJoARd3ATzW2xmanCGyLMOwBHid/4/xA53U9uC9sgxwCha7laV5fNDa5WCJFQ82SEbR+bma/srnAJTwflJELpYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773498; c=relaxed/simple;
	bh=tbNDizQJ2zyUA7wsvDpvh0QyrNwTk3QKIZUW3QSZmP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYJVIK8QE1i7X/EYHp1J0a7HfbFde67qoYqHlsMASCexhejfY9XnL/iXgad7tSZh4ZJ90sUnJQ99Z1zZIf6b5JW+wASu4szWVQwNvz1pN8u+GKGiKNuSBIikzf0TUgwTBxmrY0YNajP8oMoLb0dykkNk6YkFygI/vNmIoRmKvhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHTgmIau; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHTgmIau"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2681645b7b6so17305ad.1
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759773492; x=1760378292; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3x04bgHMffZUkhfD5CkZWiF7pEEXN8/PUcw8ocaPMU=;
        b=WHTgmIauHabAMkpnVvgqaa+dB8tjymGgowIAiQm8TRUfav4w9hFKQd4qOytnPT2p/a
         TGQF/ylZqy00L73vPnRTDZuvaXxs9V1TqwOU21G0FIP87MjGsDv9Iau9i/+GuEn9tl55
         5jXadYVGjmgjCFOmOImhVVS3GSfwaD/5ISx456l4Fhb9ajLz/5kYs+QQfGeAGuz5rQSx
         B0pegQYgpeMWwEO0zud5QTrul0dr+AOd44aUaMcYV075xsq+ss4eCNbAM3XjVuZOKEvn
         KPdbpAj2V8lvH1qNWU58qc7NzZ4GbUczGPPvEAg1VjJUqxjJtwWKIxUNX9BKhhueKfLJ
         J/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773492; x=1760378292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3x04bgHMffZUkhfD5CkZWiF7pEEXN8/PUcw8ocaPMU=;
        b=Os/Q20ldUj2qWROdwWGODgoq7wFB23ShRHmIVQCnQFkuJWYRIFBe7HbW7kkO7l6xQA
         GUm5EJJYyHJJdGqbhj9cn1p2f8OC95E/JwE+kxjwcN69q+0KvfWwWUVIwuepqdCvqVCm
         aWeaNp+7z/OqbcS7SzzLJ3ms8iaIvGlNpPDqLcL89Avzy3u6pf5ljxjadRTZUDlxlg/y
         mO3iVcIpUu3ZKlLcTb1ApE74wNE3qCs4noBO4C4LVVMHfIewMI5NhcTjrVqSYd3804Nv
         XXmFX+qXKo7xP3Ju3wPJ8YMZIFqbDVyeOQX7/iHh1fYBQf/5kwSj3QVGd5hUpdiAaxDU
         bZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb9C8/OfbiHqX9fnEL1wtg8K9CXJtAehXBFPI1ttlCuoMVJbJ0Z2/9SVZaqToExmzs4mBb@lists.linux.dev
X-Gm-Message-State: AOJu0YzCA/TfGsBCwTv2tt36EzBq0AiByWlkvF0iNEdyHpPxCVBZ7KvO
	jjlLOHp9Imp1cdKBlTTAiO2mylmi1KTmmrXBeUlksVAQFnXE1qD1aqaKL9zuyYZFbJDEz/IdydF
	UTBBiNoCu9LybuA6uxyq+pYF+Mzc5plAB8FbPTTkX
X-Gm-Gg: ASbGncv1LCxaizxkYxrpp18CtOx1B6pmbXM9H80LbPON5kZRTloONw5Pka1eo0dad7m
	EmGEeEYxktk7P1wuheYE0oEvaxN2iHJylhRJgH/+iJATmuRfjGKVbfE/QAvSvINC8mvTVxNBp4b
	nrf7mUgI9uvpocW7NE+VKit4fbSCZBE8TvZ38pKS2X0N17qtwe4ldTlLowJbYG2MINynh3bNf9W
	EZpmkE6vzaNjPCmTDbu4IaSHi4q9BAB+lZBPNQitgQlxYQvBe5XegZpZ3aZxHNe+0Bn
X-Google-Smtp-Source: AGHT+IGYbPJl2j5l0oAPa/RC3IlbC1VYYkiNWl9DSNPXXtvE5lHDEm0dfVWKAW4BAHdKzLB9eH4R7T7iaJJRtOAAJ/w=
X-Received: by 2002:a17:903:3d07:b0:268:cc5:5e3c with SMTP id
 d9443c01a7336-28eca40ef40mr362585ad.10.1759773491707; Mon, 06 Oct 2025
 10:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Oct 2025 10:57:59 -0700
X-Gm-Features: AS18NWB_eZWaxb9LRqFQD6gCk5f127ECpR9TL09do_aPGYIscYin6JqKzL8Qe-E
Message-ID: <CAP-5=fWiivp_zFdos_4VC7RUuzd5NqYrtLH2DR2LKj9Qp9h5BQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] perf build: Support building with Clang
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 9:21=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> This series adds support for building perf with Clang, following the
> discussion in [1]. Because the Android NDK uses Clang by default,
> enabling Clang builds naturally covers Android as well.
>
> The series is organized as follows:
>
>   - Patches 1~2: Fix two bugs found with Clang.
>   - Patches 3~7: Correct CROSS_ARCH, Disable thread safety analysis for
>                  perl header, and dismiss Clang build warnings.
>   - Patches 8~9: Enable Clang in the Makefile and update the
>                  documentation.
>
> Testing:
>
> Tested with linux-tools-container-builds [2], which based on Arnaldo's
> build test container but with several fixes for cross building with
> Clang:
>
>   - All clang native builds on x86_64 have passed.
>   - The cross builds for arm64/mips/mips64/mipsel/riscv64 have passed.
>
> Only a pity thing is I cannot build successfully with clang for
> ubuntu:20.04-x-powerpc64el (in below log, it only builds with GCC).
> The cross config does not work well on Ubuntu 20.04 due to failure
> "No gnu/libc-version.h found, please install glibc-dev[el]". I confirmed
> that powerpc64el cross build can make success on Ubuntu 24.04, the
> failure on Ubuntu 20.04 should not be caused by perf build.
>
>   Subject: tools build test for http://localhost/perf/perf-6.17.0-rc6.tar=
.xz
>
>      1   201.44 alpine:3.16                   : Ok   gcc (Alpine 11.2.1_g=
it20220219) 11.2.1 20220219 , Alpine clang version 13.0.1 flex 2.6.4
>      2   154.82 alpine:3.17                   : Ok   gcc (Alpine 12.2.1_g=
it20220924-r4) 12.2.1 20220924 , Alpine clang version 15.0.7 flex 2.6.4
>      3   136.07 alpine:3.18                   : Ok   gcc (Alpine 12.2.1_g=
it20220924-r10) 12.2.1 20220924 , Alpine clang version 16.0.6 flex 2.6.4
>      4   150.21 alpine:3.19                   : Ok   gcc (Alpine 13.2.1_g=
it20231014) 13.2.1 20231014 , Alpine clang version 17.0.5 flex 2.6.4
>      5   143.50 alpine:3.20                   : Ok   gcc (Alpine 13.2.1_g=
it20240309) 13.2.1 20240309 , Alpine clang version 17.0.6 flex 2.6.4
>      6   146.08 amazonlinux:2023              : Ok   gcc (GCC) 11.5.0 202=
40719 (Red Hat 11.5.0-5) , clang version 15.0.7 (AWS 15.0.7-3.amzn2023.0.4)=
 flex 2.6.4
>      7   147.19 amazonlinux:devel             : Ok   gcc (GCC) 11.3.1 202=
21121 (Red Hat 11.3.1-4) , clang version 15.0.6 (Amazon Linux 15.0.6-3.amzn=
2023.0.2) flex 2.6.4
>      8   117.92 debian:11                     : Ok   gcc (Debian 10.2.1-6=
) 10.2.1 20210110 , Debian clang version 13.0.1-6~deb11u1 flex 2.6.4
>      9   121.54 debian:12                     : Ok   gcc (Debian 12.2.0-1=
4+deb12u1) 12.2.0 , Debian clang version 14.0.6 flex 2.6.4
>     10   128.64 debian:experimental           : Ok   gcc (Debian 15.2.0-4=
) 15.2.0 , Debian clang version 19.1.7 (7) flex 2.6.4
>     11    96.47 debian:experimental-x-arm64   : Ok   aarch64-linux-gnu-gc=
c (Debian 15.2.0-4) 15.2.0 , Debian clang version 19.1.7 (7) flex 2.6.4
>     12    72.89 debian:experimental-x-mips    : Ok   mips-linux-gnu-gcc (=
Debian 14.2.0-13) 14.2.0 , Debian clang version 19.1.7 (7) flex 2.6.4
>     13    73.31 debian:experimental-x-mips64  : Ok   mips64-linux-gnuabi6=
4-gcc (Debian 14.2.0-13) 14.2.0 , Debian clang version 19.1.7 (7) flex 2.6.=
4
>     14    71.69 debian:experimental-x-mipsel  : Ok   mipsel-linux-gnu-gcc=
 (Debian 14.2.0-13) 14.2.0 , Debian clang version 19.1.7 (7) flex 2.6.4
>     15   151.92 fedora:35                     : Ok   gcc (GCC) 11.3.1 202=
20421 (Red Hat 11.3.1-3) , clang version 13.0.1 (Fedora 13.0.1-1.fc35) flex=
 2.6.4
>     16   146.99 fedora:36                     : Ok   gcc (GCC) 12.2.1 202=
21121 (Red Hat 12.2.1-4) , clang version 14.0.5 (Fedora 14.0.5-2.fc36) flex=
 2.6.4
>     17   139.58 fedora:37                     : Ok   gcc (GCC) 12.3.1 202=
30508 (Red Hat 12.3.1-1) , clang version 15.0.7 (Fedora 15.0.7-2.fc37) flex=
 2.6.4
>     18   142.00 fedora:38                     : Ok   gcc (GCC) 13.2.1 202=
40316 (Red Hat 13.2.1-7) , clang version 16.0.6 (Fedora 16.0.6-4.fc38) flex=
 2.6.4
>     19   140.18 fedora:39                     : Ok   gcc (GCC) 13.3.1 202=
40913 (Red Hat 13.3.1-3) , clang version 17.0.6 (Fedora 17.0.6-2.fc39) flex=
 2.6.4
>     20   139.38 fedora:40                     : Ok   gcc (GCC) 14.2.1 202=
40912 (Red Hat 14.2.1-3) , clang version 18.1.8 (Fedora 18.1.8-2.fc40) flex=
 2.6.4
>     21   136.26 fedora:41                     : Ok   gcc (GCC) 14.3.1 202=
50808 (Red Hat 14.3.1-3) , clang version 19.1.7 (Fedora 19.1.7-5.fc41) flex=
 2.6.4
>     22   135.38 fedora:42                     : Ok   gcc (GCC) 15.2.1 202=
50808 (Red Hat 15.2.1-1) , clang version 20.1.8 (Fedora 20.1.8-4.fc42) flex=
 2.6.4
>     23   127.55 fedora:rawhide                : Ok   gcc (GCC) 15.2.1 202=
50924 (Red Hat 15.2.1-2) , clang version 21.1.2 (Fedora 21.1.2-1.fc44) flex=
 2.6.4
>     24   180.17 opensuse:15.4                 : Ok   gcc (SUSE Linux) 7.5=
.0 , clang version 15.0.7 flex 2.6.4
>     25   169.40 opensuse:15.5                 : Ok   gcc (SUSE Linux) 7.5=
.0 , clang version 15.0.7 flex 2.6.4
>     26   167.36 opensuse:15.6                 : Ok   gcc (SUSE Linux) 7.5=
.0 , clang version 17.0.6 flex 2.6.4
>     27   154.82 opensuse:tumbleweed           : Ok   gcc (SUSE Linux) 15.=
2.0 , clang version 21.1.2 flex 2.6.4
>     28   145.89 oraclelinux:8                 : Ok   gcc (GCC) 8.5.0 2021=
0514 (Red Hat 8.5.0-28.0.1) , clang version 19.1.7 ( 19.1.7-2.module+el8.10=
.0+90583+7e562d96) flex 2.6.1
>     29   139.68 oraclelinux:9                 : Ok   gcc (GCC) 11.5.0 202=
40719 (Red Hat 11.5.0-5.0.1) , clang version 19.1.7 ( 19.1.7-2.el9) flex 2.=
6.4
>     30    40.17 ubuntu:20.04                  : Ok   gcc (Ubuntu 9.4.0-1u=
buntu1~20.04.2) 9.4.0  flex 2.6.4
>     31    20.83 ubuntu:20.04-x-powerpc64el    : Ok   powerpc64le-linux-gn=
u-gcc (Ubuntu 10.5.0-1ubuntu1~20.04) 10.5.0  flex 2.6.4
>     32   127.75 ubuntu:22.04                  : Ok   gcc (Ubuntu 11.4.0-1=
ubuntu1~22.04.2) 11.4.0 , Ubuntu clang version 14.0.0-1ubuntu1.1 flex 2.6.4
>     33    92.25 ubuntu:22.04-x-riscv64        : Ok   riscv64-linux-gnu-gc=
c (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0 , Ubuntu clang version 14.0.0-1ubun=
tu1.1 flex 2.6.4
>     34   126.64 ubuntu:24.04                  : Ok   gcc (Ubuntu 13.3.0-6=
ubuntu2~24.04) 13.3.0 , Ubuntu clang version 18.1.3 (1ubuntu1) flex 2.6.4
>     35   130.95 ubuntu:25.04                  : Ok   gcc (Ubuntu 14.2.0-1=
9ubuntu2) 14.2.0 , Ubuntu clang version 20.1.2 (0ubuntu1) flex 2.6.4
>
> [1] https://lore.kernel.org/linux-perf-users/20240715143342.52236-1-leo.y=
an@arm.com/
> [2] https://github.com/Leo-Yan/linux-tools-container-builds/tree/fix-risc=
v64-cross-build
>
> ---
> Changes in v3:
> - Fixed build failure with musl lib.
> - Disabled thread safety analysis for perl head.
> - Link to v2: https://lore.kernel.org/r/20250930-perf_build_android_ndk-v=
2-0-2ea440b7ef01@arm.com
>
> Changes in v2:
> - Dropped the patch for dismissing warning in bpftool.
> - Refined the document. (Ian)
> - Link to v1: https://lore.kernel.org/r/20250925-perf_build_android_ndk-v=
1-0-8b35aadde3dc@arm.com

For the series:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Leo Yan (9):
>       tools build: Align warning options with perf
>       perf python: split Clang options when invoking Popen
>       perf build: Correct CROSS_ARCH for clang
>       perf build: Disable thread safety analysis for perl header
>       perf test coresight: Dismiss clang warning for memcpy thread
>       perf test coresight: Dismiss clang warning for thread loop
>       perf test coresight: Dismiss clang warning for unroll loop thread
>       perf build: Support build with clang
>       perf docs: Document building with Clang
>
>  tools/build/feature/Makefile                       |  6 +-
>  tools/perf/Documentation/Build.txt                 | 15 ++++
>  tools/perf/Documentation/android.txt               | 80 ++--------------=
------
>  tools/perf/Makefile.config                         | 33 ++++++++-
>  tools/perf/Makefile.perf                           |  2 +-
>  tools/perf/scripts/perl/Perf-Trace-Util/Build      |  2 +-
>  .../shell/coresight/memcpy_thread/memcpy_thread.c  |  2 +
>  .../shell/coresight/thread_loop/thread_loop.c      |  4 +-
>  .../unroll_loop_thread/unroll_loop_thread.c        |  4 +-
>  tools/perf/util/scripting-engines/Build            |  2 +-
>  tools/perf/util/setup.py                           |  5 +-
>  11 files changed, 70 insertions(+), 85 deletions(-)
> ---
> base-commit: c17dda8013495d8132c976cbf349be9949d0fbd1
> change-id: 20250915-perf_build_android_ndk-500b53bea895
>
> Best regards,
> --
> Leo Yan <leo.yan@arm.com>
>
