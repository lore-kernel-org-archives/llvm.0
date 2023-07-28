Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2447101D9
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 08:57:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FA95D75;
	Fri, 28 Jul 2023 01:58:29 -0700 (PDT)
Received: from [10.57.0.116] (unknown [10.57.0.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03EA73F67D;
	Fri, 28 Jul 2023 01:57:42 -0700 (PDT)
Message-ID: <c44279fa-9c7c-fe18-8040-677ed3eb1a95@arm.com>
Date: Fri, 28 Jul 2023 09:57:41 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/6] perf build: Add Wextra for C++ compilation
Content-Language: en-US
To: Ian Rogers <irogers@google.com>
References: <20230728064917.767761-1-irogers@google.com>
 <20230728064917.767761-4-irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Kan Liang <kan.liang@linux.intel.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Rob Herring <robh@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
From: James Clark <james.clark@arm.com>
In-Reply-To: <20230728064917.767761-4-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/07/2023 07:49, Ian Rogers wrote:
> Commit d58ac0bf8d1e ("perf build: Add clang and llvm compile and
> linking support") added -Wall and -Wno-strict-aliasing for CXXFLAGS,
> but not -Wextra. -Wno-strict-aliasing is no longer necessary, adding
> -Wextra for CXXFLAGS requires adding -Wno-unused-parameter clang.cpp
> and clang-test.cpp for LIBCLANGLLVM=1 to build.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/Makefile.config | 2 +-
>  tools/perf/util/c++/Build  | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 14709a6bd622..fe7afe6d8529 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -333,8 +333,8 @@ CORE_CFLAGS += -std=gnu11
>  
>  CXXFLAGS += -std=gnu++14 -fno-exceptions -fno-rtti
>  CXXFLAGS += -Wall
> +CXXFLAGS += -Wextra
>  CXXFLAGS += -fno-omit-frame-pointer
> -CXXFLAGS += -Wno-strict-aliasing
>  
>  HOSTCFLAGS += -Wall
>  HOSTCFLAGS += -Wextra
> diff --git a/tools/perf/util/c++/Build b/tools/perf/util/c++/Build
> index 613ecfd76527..8610d032ac19 100644
> --- a/tools/perf/util/c++/Build
> +++ b/tools/perf/util/c++/Build
> @@ -1,2 +1,5 @@
>  perf-$(CONFIG_CLANGLLVM) += clang.o
>  perf-$(CONFIG_CLANGLLVM) += clang-test.o
> +
> +CXXFLAGS_clang.o += -Wno-unused-parameter
> +CXXFLAGS_clang-test.o += -Wno-unused-parameter

Acked-by: James Clark <james.clark@arm.com>
