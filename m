Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B455101D9
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 08:56:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069F2D75;
	Fri, 28 Jul 2023 01:56:56 -0700 (PDT)
Received: from [10.57.0.116] (unknown [10.57.0.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84E1A3F67D;
	Fri, 28 Jul 2023 01:56:09 -0700 (PDT)
Message-ID: <1a5da775-6a04-1be0-f808-6059250b8d35@arm.com>
Date: Fri, 28 Jul 2023 09:56:08 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/6] perf bpf-loader: Remove unneeded diagnostic pragma
Content-Language: en-US
To: Ian Rogers <irogers@google.com>
References: <20230728064917.767761-1-irogers@google.com>
 <20230728064917.767761-2-irogers@google.com>
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
In-Reply-To: <20230728064917.767761-2-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/07/2023 07:49, Ian Rogers wrote:
> Added during the progress to libbpf 1.0 the deprecated functions are
> no longer used and so the pragma can be removed.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/bpf-loader.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tools/perf/util/bpf-loader.c b/tools/perf/util/bpf-loader.c
> index 44cde27d6389..8f4c76f2265a 100644
> --- a/tools/perf/util/bpf-loader.c
> +++ b/tools/perf/util/bpf-loader.c
> @@ -32,9 +32,6 @@
>  
>  #include <internal/xyarray.h>
>  
> -/* temporarily disable libbpf deprecation warnings */
> -#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> -
>  static int libbpf_perf_print(enum libbpf_print_level level __attribute__((unused)),
>  			      const char *fmt, va_list args)
>  {

Acked-by: James Clark <james.clark@arm.com>
