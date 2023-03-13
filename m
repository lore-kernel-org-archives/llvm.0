Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09228838
	for <llvm@lists.linux.dev>; Mon, 13 Mar 2023 19:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D36C433EF;
	Mon, 13 Mar 2023 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678736278;
	bh=jQi+PcG9SAfmGUTaLTv603Vpq8uAn+L4RzhgHyvuiig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2SFcGprrSjv0cTpRZfKeQdx7abce/yNw5R+ZVX+rWeuJ8cXml22yTmTdYTt/f98d
	 uPu6Gz6PTVoqEC3ODp3SPKsebrenq2+tTNQ70T7u93my7rltHaKhEYv7koQYPQnyhK
	 jT5N4Vy8GA5plz95q9lOI6VtAus6U0cCRHLtx4o4TAtzMRYwYpSBbM8T3qUYKdpawm
	 3ERoghniuFKnwI4HZHbHJGBfs+/sfXhlhjsJYJ9Q9l23DGH489UG7kmilJ/ZTMLbEW
	 lVqa5aR2Kmky7rJbUVdTDVracaKWPVhs+vaC4IkYDbPNZ0VWF/jtfZv2sqFUZhCAoO
	 k4XBI0gYA2lSw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id EA6BE4049F; Mon, 13 Mar 2023 16:37:55 -0300 (-03)
Date: Mon, 13 Mar 2023 16:37:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Roberto Sassu <roberto.sassu@huawei.com>,
	Quentin Monnet <quentin@isovalent.com>,
	Andres Freund <andres@anarazel.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Pavithra Gurushankar <gpavithrasha@gmail.com>,
	Yang Jihong <yangjihong1@huawei.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Leo Yan <leo.yan@linaro.org>,
	Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>
Subject: Re: [PATCH v1 07/13] perf build: Make binutil libraries opt in
Message-ID: <ZA97k8ZP4lAC0tia@kernel.org>
References: <20230311065753.3012826-1-irogers@google.com>
 <20230311065753.3012826-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230311065753.3012826-8-irogers@google.com>
X-Url: http://acmel.wordpress.com

Em Fri, Mar 10, 2023 at 10:57:47PM -0800, Ian Rogers escreveu:
> binutils is GPLv3 so distributions cannot ship perf linked against
> libbfd and libiberty as the licenses are incompatible. Rather than
> defaulting the build to opting in to libbfd and libiberty support and
> opting out via NO_LIBBFD=1 and NO_DEMANGLE=1, make building against
> the libraries optional and enabled with BUILD_NONDISTRO=1.

So now I get this:

⬢[acme@toolbox perf-tools-next]$ perf -vv
perf version 6.3.rc1.gace4d44d094c
                 dwarf: [ on  ]  # HAVE_DWARF_SUPPORT
    dwarf_getlocations: [ on  ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
         syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
                libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
            debuginfod: [ on  ]  # HAVE_DEBUGINFOD_SUPPORT
                libelf: [ on  ]  # HAVE_LIBELF_SUPPORT
               libnuma: [ on  ]  # HAVE_LIBNUMA_SUPPORT
numa_num_possible_cpus: [ on  ]  # HAVE_LIBNUMA_SUPPORT
               libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
             libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
              libslang: [ on  ]  # HAVE_SLANG_SUPPORT
             libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
             libunwind: [ on  ]  # HAVE_LIBUNWIND_SUPPORT
    libdw-dwarf-unwind: [ on  ]  # HAVE_DWARF_SUPPORT
                  zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
                  lzma: [ on  ]  # HAVE_LZMA_SUPPORT
             get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
                   bpf: [ on  ]  # HAVE_LIBBPF_SUPPORT
                   aio: [ on  ]  # HAVE_AIO_SUPPORT
                  zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
               libpfm4: [ on  ]  # HAVE_LIBPFM
         libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
         BPF skeletons: [ on  ]  # HAVE_BPF_SKEL
⬢[acme@toolbox perf-tools-next]$

Shouldn't we have, right next to libbpf that libstdc++ feature status?

- Arnaldo
 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/Makefile.config | 25 ++++++++++---------------
>  tools/perf/Makefile.perf   |  2 ++
>  tools/perf/tests/make      |  2 ++
>  3 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 2557654d8e29..5756498248e0 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -882,7 +882,7 @@ ifneq ($(NO_JEVENTS),1)
>    endif
>  endif
>  
> -ifndef NO_LIBBFD
> +ifdef BUILD_NONDISTRO
>    ifeq ($(feature-libbfd), 1)
>      EXTLIBS += -lbfd -lopcodes
>    else
> @@ -905,6 +905,7 @@ ifndef NO_LIBBFD
>      $(call feature_check,disassembler-init-styled)
>    endif
>  
> +  CFLAGS += -DHAVE_LIBBFD_SUPPORT
>    ifeq ($(feature-libbfd-buildid), 1)
>      CFLAGS += -DHAVE_LIBBFD_BUILDID_SUPPORT
>    else
> @@ -915,32 +916,26 @@ endif
>  ifdef NO_DEMANGLE
>    CFLAGS += -DNO_DEMANGLE
>  else
> -  ifdef HAVE_CPLUS_DEMANGLE_SUPPORT
> -    EXTLIBS += -liberty
> -  else
> +  ifdef BUILD_NONDISTRO
>      ifeq ($(filter -liberty,$(EXTLIBS)),)
> -      $(call feature_check,cplus-demangle)
> -
> -      # we dont have neither HAVE_CPLUS_DEMANGLE_SUPPORT
> -      # or any of 'bfd iberty z' trinity
> -      ifeq ($(feature-cplus-demangle), 1)
> +      ifdef HAVE_CPLUS_DEMANGLE_SUPPORT
>          EXTLIBS += -liberty
>        else
> -        msg := $(warning No bfd.h/libbfd found, please install binutils-dev[el]/zlib-static/libiberty-dev to gain symbol demangling)
> -        CFLAGS += -DNO_DEMANGLE
> +        $(call feature_check,cplus-demangle)
> +        ifeq ($(feature-cplus-demangle), 1)
> +          EXTLIBS += -liberty
> +        endif
>        endif
>      endif
>    endif
>  
>    ifneq ($(filter -liberty,$(EXTLIBS)),)
>      CFLAGS += -DHAVE_CPLUS_DEMANGLE_SUPPORT
> +  else
> +    CFLAGS += -DNO_DEMANGLE
>    endif
>  endif
>  
> -ifneq ($(filter -lbfd,$(EXTLIBS)),)
> -  CFLAGS += -DHAVE_LIBBFD_SUPPORT
> -endif
> -
>  ifndef NO_ZLIB
>    ifeq ($(feature-zlib), 1)
>      CFLAGS += -DHAVE_ZLIB_SUPPORT
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 283ee4f56234..a35bc995d5d8 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -128,6 +128,8 @@ include ../scripts/utilities.mak
>  #
>  # Define NO_BPF_SKEL to disable BPF skeletons
>  #
> +# Define BUILD_NONDISTRO to enable building an linking against libbfd and
> +# libiberty distribution license incompatible libraries.
>  
>  # As per kernel Makefile, avoid funny character set dependencies
>  unexport LC_ALL
> diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> index deb37fb982e9..c2f74ed43418 100644
> --- a/tools/perf/tests/make
> +++ b/tools/perf/tests/make
> @@ -68,6 +68,7 @@ python_perf_so := $(shell $(MAKE) python_perf_target|grep "Target is:"|awk '{pri
>  make_clean_all      := clean all
>  make_python_perf_so := $(python_perf_so)
>  make_debug          := DEBUG=1
> +make_nondistro      := BUILD_NONDISTRO=1
>  make_no_libperl     := NO_LIBPERL=1
>  make_no_libpython   := NO_LIBPYTHON=1
>  make_no_scripts     := NO_LIBPYTHON=1 NO_LIBPERL=1
> @@ -134,6 +135,7 @@ MAKE_F := $(MAKE) -f $(MK)
>  endif
>  run += make_python_perf_so
>  run += make_debug
> +run += make_nondistro
>  run += make_no_libperl
>  run += make_no_libpython
>  run += make_no_scripts
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 

-- 

- Arnaldo
