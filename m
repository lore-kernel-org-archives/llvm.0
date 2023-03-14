Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77A93C24
	for <llvm@lists.linux.dev>; Tue, 14 Mar 2023 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678796504; x=1710332504;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RuyzWY5XFbFQK+dZMnLdmca3l4H11rbmQtGEfO/KEF0=;
  b=kyYOgTmOCGQ8quRPqsPYm1Vlnr8pva+EH7S6bfxiCeAfwOV0TAq5PoYg
   /vW/JGk1UB0Qikk22NiJMqMKvoCwBL7HWaD1VzvYEhzh+9EvXDhrhUSd4
   H74PJNQsMMrt+nSBclnaW0xgTNSbXqVxT3IeJzV8aqBd2gmTLj22/Uu6E
   MQk1X5oL5bP4faKXvHs7+6I3ftbKQg6c3MF27zsLEjkWctBejZweX8S0j
   9mxg6jPfc8fnuFuHROSJxlsw7H6Px2nf45zya65JsezVQRKKbTj8hv7F7
   E5SIhnYpXONcF4MT9Y1ezORkzz8UceOSo+upfNVGLNhSrfkFGhGxrcu6C
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402273921"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="402273921"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 05:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802836234"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="802836234"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.221.17])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 05:21:29 -0700
Message-ID: <86250a33-940f-4dce-fa6f-4331be7d806b@intel.com>
Date: Tue, 14 Mar 2023 14:21:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v1 00/13] Perf tool build improvements
Content-Language: en-US
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Quentin Monnet <quentin@isovalent.com>, Andres Freund <andres@anarazel.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Pavithra Gurushankar <gpavithrasha@gmail.com>,
 Yang Jihong <yangjihong1@huawei.com>, Leo Yan <leo.yan@linaro.org>,
 =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>
References: <20230311065753.3012826-1-irogers@google.com>
 <ZBBkWDFdBDC9Spt9@kernel.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <ZBBkWDFdBDC9Spt9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/23 14:11, Arnaldo Carvalho de Melo wrote:
> Em Fri, Mar 10, 2023 at 10:57:40PM -0800, Ian Rogers escreveu:
>> Make the default build options a more preferred set, such as making
>> BPF skeletons default and failing the build if jevents or libtracevent
>> dependencies fail. The binutil dependencies are opt-in given license
>> restrictions. abi::__cxa_demangle demangling support is added so that
>> libiberty, from binutils, isn't necessary for C++ demangling.
>>
>> Some build/test dependencies are fixed and the code cleaned up.
> 
> I'll continue fixing more stuff, like adding NO_LIBTRACEEVENT=1 to
> things like amazonlinux devel, that still doesn't package libtraceevent,

FYI I'm currently testing a patch to allow python scripting without
also requiring libtraceevent

