Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E13E8F5A
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ct2yt0LB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701672901; x=1733208901;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=DkI6Gqdi3oM5F1BCGG/SyVaLLGeuLY9c6+WsMZZX+HU=;
  b=ct2yt0LBod7DpN68pdzMxw7R/apgJ/tUkjHyv8brE7hBcNr2rnftldnl
   jb3JCP7nF2Okc9z3FV/Glvp9P5TCxMBYT5U/RzIz9d3SsQrPBkddyhMpn
   xKuyjZhay6i9xahY9NAfdUzSqHYgXHO2mSggqn2FLql2TuAkKUo4/tr2w
   VFCBWai5alOIxlF3co8l4aiQ2szSYHeQBF56/ckMMcYtzNMT55Y8+Qgcm
   KpBuTQ7JfsEq1yW7Hvtk3wqmEUndC0Erewlh/P6ZxRn1PA9MBKY0SwLtc
   Jd+74YmeTuhXFSJQ2wHSCnhUd5rasnwocxt8/sMCxb/YK2OpelWkPD034
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="573871"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="573871"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 22:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="888430244"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="888430244"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.44.211])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 22:54:55 -0800
Message-ID: <cc1f77b9-6a3f-4574-8d45-8c2ded43b589@intel.com>
Date: Mon, 4 Dec 2023 08:54:54 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] perf tests: Avoid fork in perf_has_symbol test
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>,
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 llvm@lists.linux.dev
References: <20231201235031.475293-1-irogers@google.com>
 <20231201235031.475293-3-irogers@google.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20231201235031.475293-3-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/12/23 01:50, Ian Rogers wrote:
> perf test -vv Symbols is used to indentify symbols within the perf
> binary. Add the -F flag so that the test command doesn't fork the test
> before running. This removes a little overhead.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/tests/shell/lib/perf_has_symbol.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/lib/perf_has_symbol.sh b/tools/perf/tests/shell/lib/perf_has_symbol.sh
> index 5d59c32ae3e7..561c93b75d77 100644
> --- a/tools/perf/tests/shell/lib/perf_has_symbol.sh
> +++ b/tools/perf/tests/shell/lib/perf_has_symbol.sh
> @@ -3,7 +3,7 @@
>  
>  perf_has_symbol()
>  {
> -	if perf test -vv "Symbols" 2>&1 | grep "[[:space:]]$1$"; then
> +	if perf test -vv -F "Symbols" 2>&1 | grep "[[:space:]]$1$"; then
>  		echo "perf does have symbol '$1'"
>  		return 0
>  	fi

