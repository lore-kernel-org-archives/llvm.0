Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABBC1110
	for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 11:04:36 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-03.nifty.com with ESMTP id 2ADAuhX3016254
	for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 19:56:43 +0900
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2ADAuO8P031089
	for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 19:56:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2ADAuO8P031089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1668336985;
	bh=3lroTYPLdZ6KmdOa3X3ieElkYRU7E3cRWhwiDGRC/Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=18aZ2rTZHW9oTU4OQxpFCkZjlhxe4veXDF72vap54B3WXMgdflt5Ca1XR+/TjqOb6
	 2u5maIrPa1V9hkbhybKNgqyWNEZS0bUXvQF521Tj9QfD0fAAb6FcSyiwvYtjS8r0lP
	 czebhTVTMocHmTrh8zJ8g+VcJEpLaGleGYD7WMExjyWNR6f5gKV8mrA2waShFMU3SC
	 6FTurlG8q+cFFmzl2mtnPNRYH3b002xGn7vVh51KkGIes5gOZtcm8WF8fdql1EOo9N
	 1Q1jK+JduYE2ILgGm0uDhOXRUXde1bnxsJvJoobOcgNQi29vr/RbaV53wtPEYgOx1t
	 teA+/uVC8/9dg==
X-Nifty-SrcIP: [209.85.167.180]
Received: by mail-oi1-f180.google.com with SMTP id q83so8897062oib.10
        for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 02:56:25 -0800 (PST)
X-Gm-Message-State: ANoB5pmBwHYgNIQ2+LYFtc+jzLiNoU2qsJGWvARa0y27XmQ2+YLWDMWn
	4ypBrTAOkKdqb6Mi0K9Q2BS7FrUJYPQsNi9+A8o=
X-Google-Smtp-Source: AA0mqf7lS2bqisgYU1s4FVkKaHvvwU217yoaddBFVyl3nCpq3flH/juqwqhZbsDEDwuOFbLRjBbagcSxAyOL+lYmoLI=
X-Received: by 2002:a05:6808:208c:b0:354:94a6:a721 with SMTP id
 s12-20020a056808208c00b0035494a6a721mr3937365oiw.194.1668336983486; Sun, 13
 Nov 2022 02:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUW83H0H-oQkE5vyURWu6bD-OGYpTsNMwU1if5r=7+tpDA@mail.gmail.com>
 <20221110195932.377841-1-ndesaulniers@google.com>
In-Reply-To: <20221110195932.377841-1-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 13 Nov 2022 19:55:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATtt9Ot5D2rJLC=gpvBFEE70Vct+gX4UKw13F7=UqO1XQ@mail.gmail.com>
Message-ID: <CAK7LNATtt9Ot5D2rJLC=gpvBFEE70Vct+gX4UKw13F7=UqO1XQ@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile.debug: support for -gz=zstd
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Fangrui Song <maskray@google.com>, Sedat Dilek <sedat.dilek@dhl.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, Nick Terrell <terrelln@fb.com>,
        Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Miguel Ojeda <ojeda@kernel.org>, Isabella Basso <isabbasso@riseup.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 11, 2022 at 5:00 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Make DEBUG_INFO_COMPRESSED a choice; DEBUG_INFO_COMPRESSED_NONE is the
> default, DEBUG_INFO_COMPRESSED_ZLIB uses zlib,
> DEBUG_INFO_COMPRESSED_ZSTD uses zstd.
>
> This renames the existing KConfig option DEBUG_INFO_COMPRESSED to
> DEBUG_INFO_COMPRESSED_ZLIB so users upgrading may need to reset the new
> Kconfigs.
>
> Some quick N=1 measurements with du, /usr/bin/time -v, and bloaty:
>
> clang-16, x86_64 defconfig plus
> CONFIG_DEBUG_INFO=y CONFIG_DEBUG_INFO_COMPRESSED_NONE=y:
> Elapsed (wall clock) time (h:mm:ss or m:ss): 0:55.43
> 488M vmlinux
> 27.6%   136Mi   0.0%       0    .debug_info
>  6.1%  30.2Mi   0.0%       0    .debug_str_offsets
>  3.5%  17.2Mi   0.0%       0    .debug_line
>  3.3%  16.3Mi   0.0%       0    .debug_loclists
>  0.9%  4.62Mi   0.0%       0    .debug_str
>
> clang-16, x86_64 defconfig plus
> CONFIG_DEBUG_INFO=y CONFIG_DEBUG_INFO_COMPRESSED_ZLIB=y:
> Elapsed (wall clock) time (h:mm:ss or m:ss): 1:00.35
> 385M vmlinux
> 21.8%  85.4Mi   0.0%       0    .debug_info
>  2.1%  8.26Mi   0.0%       0    .debug_str_offsets
>  2.1%  8.24Mi   0.0%       0    .debug_loclists
>  1.9%  7.48Mi   0.0%       0    .debug_line
>  0.5%  1.94Mi   0.0%       0    .debug_str
>
> clang-16, x86_64 defconfig plus
> CONFIG_DEBUG_INFO=y CONFIG_DEBUG_INFO_COMPRESSED_ZSTD=y:
> Elapsed (wall clock) time (h:mm:ss or m:ss): 0:59.69
> 373M vmlinux
> 21.4%  81.4Mi   0.0%       0    .debug_info
>  2.3%  8.85Mi   0.0%       0    .debug_loclists
>  1.5%  5.71Mi   0.0%       0    .debug_line
>  0.5%  1.95Mi   0.0%       0    .debug_str_offsets
>  0.4%  1.62Mi   0.0%       0    .debug_str
>
> That's only a 3.11% overall binary size savings over zlib, but at no
> performance regression.
>
> Link: https://maskray.me/blog/2022-09-09-zstd-compressed-debug-sections
> Link: https://maskray.me/blog/2022-01-23-compressed-debug-sections
> Suggested-by: Sedat Dilek (DHL Supply Chain) <sedat.dilek@dhl.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---




Applied to linux-kbuild.
Thanks.




> Changes v2 -> v3:
> * Fix scripts/Makefile.debug as per Sedat.
> * Update commit message as per Nicolas.
>
> Changes v1 -> v2:
> * Remove `depends on DEBUG_KERNEL` as per Nathan.
> * Rename Kconfigs as per Sedat and Masahiro.
> * Add note about renamed Kconfigs to commit message.
> * Add more help text to DEBUG_INFO_COMPRESSED_ZSTD.
>
>
>  lib/Kconfig.debug      | 29 +++++++++++++++++++++++++++--
>  scripts/Makefile.debug |  6 +++++-
>  2 files changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 29280072dc0e..7c28a8fba02e 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -312,8 +312,21 @@ config DEBUG_INFO_REDUCED
>           DEBUG_INFO build and compile times are reduced too.
>           Only works with newer gcc versions.
>
> -config DEBUG_INFO_COMPRESSED
> -       bool "Compressed debugging information"
> +choice
> +       prompt "Compressed Debug information"
> +       help
> +         Compress the resulting debug info. Results in smaller debug info sections,
> +         but requires that consumers are able to decompress the results.
> +
> +         If unsure, choose DEBUG_INFO_COMPRESSED_NONE.
> +
> +config DEBUG_INFO_COMPRESSED_NONE
> +       bool "Don't compress debug information"
> +       help
> +         Don't compress debug info sections.
> +
> +config DEBUG_INFO_COMPRESSED_ZLIB
> +       bool "Compress debugging information with zlib"
>         depends on $(cc-option,-gz=zlib)
>         depends on $(ld-option,--compress-debug-sections=zlib)
>         help
> @@ -327,6 +340,18 @@ config DEBUG_INFO_COMPRESSED
>           preferable to setting $KDEB_COMPRESS to "none" which would be even
>           larger.
>
> +config DEBUG_INFO_COMPRESSED_ZSTD
> +       bool "Compress debugging information with zstd"
> +       depends on $(cc-option,-gz=zstd)
> +       depends on $(ld-option,--compress-debug-sections=zstd)
> +       help
> +         Compress the debug information using zstd.  This may provide better
> +         compression than zlib, for about the same time costs, but requires newer
> +         toolchain support.  Requires GCC 13.0+ or Clang 16.0+, binutils 2.40+, and
> +         zstd.
> +
> +endchoice # "Compressed Debug information"
> +
>  config DEBUG_INFO_SPLIT
>         bool "Produce split debuginfo in .dwo files"
>         depends on $(cc-option,-gsplit-dwarf)
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index 332c486f705f..059ff38fe0cb 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -27,10 +27,14 @@ else
>  DEBUG_RUSTFLAGS        += -Cdebuginfo=2
>  endif
>
> -ifdef CONFIG_DEBUG_INFO_COMPRESSED
> +ifdef CONFIG_DEBUG_INFO_COMPRESSED_ZLIB
>  DEBUG_CFLAGS   += -gz=zlib
>  KBUILD_AFLAGS  += -gz=zlib
>  KBUILD_LDFLAGS += --compress-debug-sections=zlib
> +else ifdef CONFIG_DEBUG_INFO_COMPRESSED_ZSTD
> +DEBUG_CFLAGS   += -gz=zstd
> +KBUILD_AFLAGS  += -gz=zstd
> +KBUILD_LDFLAGS += --compress-debug-sections=zstd
>  endif
>
>  KBUILD_CFLAGS  += $(DEBUG_CFLAGS)
>
> base-commit: 1767a722a708f1fa3b9af39eb091d79101f8c086
> --
> 2.38.1.431.g37b22c650d-goog
>


-- 
Best Regards
Masahiro Yamada
