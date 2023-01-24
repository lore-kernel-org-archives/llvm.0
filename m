Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1ED29AB
	for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 18:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB102C433D2;
	Tue, 24 Jan 2023 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674585516;
	bh=TsH9ZYVr7F77egUw3aUTU+8IVwlO2olc5hJ5RHnht/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/0mF177Cuz36iVBj/t9EF83p69DWu1SGGMlE/aXElJWFNPBcK+L6GaHVpowvl926
	 aMzvGkDi2cn5hoi7C0uTecLyVS9JZ7aUAGLVtBuCeg/br+ZzQYlFD2TPdJQltNWihh
	 SQzJpQsF96lzr46o2wb9HYDs58BOTpGCBaoFnuufQONuYTnf+7RBTqXyPsUKqSBGkp
	 kGwdCGkfT0TmLOjlQn4e1hgQeFPS6BGl8KNe5AZbg8qWS6bq681LXZodoAs5b8Q8Ug
	 Sjp3BIanMKmO+2nfWv2rAO2fVPSN6eJfxVCOXexBluaWbj4ltlI/QQwvB6VtN1JdTi
	 x2IyXhG5WC7Bw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 5D3BD405BE; Tue, 24 Jan 2023 15:38:33 -0300 (-03)
Date: Tue, 24 Jan 2023 15:38:33 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>,
	Leo Yan <leo.yan@linaro.org>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Stephane Eranian <eranian@google.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH v2] perf buildid: Avoid copy of uninitialized memory
Message-ID: <Y9AlqSH4kBVddKqg@kernel.org>
References: <20230120185828.43231-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120185828.43231-1-irogers@google.com>
X-Url: http://acmel.wordpress.com

Em Fri, Jan 20, 2023 at 10:58:28AM -0800, Ian Rogers escreveu:
> build_id__init only copies the buildid data up to size leaving the
> rest of the data array uninitialized. Copying the full array during
> synthesis means the written event contains uninitialized
> memory. Ensure the size is less that the buffer size and only copy the
> bytes that were initialized. This was detected by the Clang/LLVM
> memory sanitizer.
> 
> Suggested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
> 
> v2. Avoids the potential for copying too much as suggested by Arnaldo.

Thanks, applied.

- Arnaldo

> ---
>  tools/perf/util/synthetic-events.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
> index 3ab6a92b1a6d..9ab9308ee80c 100644
> --- a/tools/perf/util/synthetic-events.c
> +++ b/tools/perf/util/synthetic-events.c
> @@ -2219,8 +2219,8 @@ int perf_event__synthesize_build_id(struct perf_tool *tool, struct dso *pos, u16
>  
>  	len = pos->long_name_len + 1;
>  	len = PERF_ALIGN(len, NAME_ALIGN);
> -	memcpy(&ev.build_id.build_id, pos->bid.data, sizeof(pos->bid.data));
> -	ev.build_id.size = pos->bid.size;
> +	ev.build_id.size = min(pos->bid.size, sizeof(pos->bid.data));
> +	memcpy(&ev.build_id.build_id, pos->bid.data, ev.build_id.size);
>  	ev.build_id.header.type = PERF_RECORD_HEADER_BUILD_ID;
>  	ev.build_id.header.misc = misc | PERF_RECORD_MISC_BUILD_ID_SIZE;
>  	ev.build_id.pid = machine->pid;
> -- 
> 2.39.0.246.g2a6d74b583-goog
> 

-- 

- Arnaldo
