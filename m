Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD77F
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 04:19:20 +0000 (UTC)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QgFF44CfmzLq5B;
	Tue, 13 Jun 2023 11:59:52 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 13 Jun
 2023 12:02:55 +0800
Date: Tue, 13 Jun 2023 12:02:41 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Ian Rogers <irogers@google.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung
 Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, Changbin Du
	<changbin.du@huawei.com>, <hw.huiwang@huawei.com>
Subject: Re: [PATCH v2 0/2] Fix srcline addr2line issue with the ',' sentinel
Message-ID: <20230613040241.phh6xxrj2orxt25p@M910t>
References: <20230613034817.1356114-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230613034817.1356114-1-irogers@google.com>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected

The problem is fixed, thanks!

Tested-by: Changbin Du <changbin.du@huawei.com>

On Mon, Jun 12, 2023 at 08:48:15PM -0700, Ian Rogers wrote:
> addr2line makes it hard to detect when inline output has finished. To
> detect it srcline issues a bogus ',' symbol and expects to see a
> filename:line of "??:0". For binutils addr2line ',' gets turned into
> address 0 and if there is a symbol there then the sentinel isn't
> detected, this problem has been occurring with kernel binaries.
> 
> The issue was reported by and debugged by Changbin Du <changbin.du@huawei.com>.
> 
> v2. Incorporate feedback from Changbin.
> 
> Ian Rogers (2):
>   perf srcline: Make addr2line configuration failure more verbose
>   perf srcline: Make sentinel reading for binutils addr2line more robust
> 
>  tools/perf/util/srcline.c | 93 ++++++++++++++++++++++++++++++---------
>  1 file changed, 73 insertions(+), 20 deletions(-)
> 
> -- 
> 2.41.0.162.gfafddb0af9-goog
> 

-- 
Cheers,
Changbin Du
