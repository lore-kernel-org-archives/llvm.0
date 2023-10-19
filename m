Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180FC140
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIHRFoj0"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5840fe01176so123951eaf.1
        for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 15:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697755939; x=1698360739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw+NhNs7Kd8Sn7Jgw+a43o7ZL5jXRR/xNu8rKmPPZ40=;
        b=YIHRFoj0YWgVqKHh7c8sW7BHAL5ZCfHKP5v3WRFein0e7lib38KK4UgZrlwDVGp2xR
         GRJlNUKrC66ND2Pg8/KHkP13JPBK9rrb2/65oFL+J9/WBGcOEnxzyFrjlP1nud6ErTwL
         O2gNE41tNPgugJOU3dRauX1WJkwdMvVfITRKAZCzMQveiH6G5WEB5HpvqvhqtkIsMMel
         KLw/hKWnop/7xspU7eGX9urZX4qwASIkHloRHGBgTcpfpzJuvfZkNx/eYc+M3GKOsOF1
         FvgL6vuFJqhEinROWkzQ0UNG/ZuW7rYKLv429jUOtaYWEJJTEHrghcVpdywuK8iF65vD
         hKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697755939; x=1698360739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw+NhNs7Kd8Sn7Jgw+a43o7ZL5jXRR/xNu8rKmPPZ40=;
        b=tRdjw4Ve9SkVXWI7Hd/8OeBt1pvMIqgpa0ytSR8qLt3Utbl2cwxeOdBr/u+kLGIwnA
         DfhMsCx7RwTpz+ajQW3eVvvQtPmGsggU6TCunqUer6hRhSi9mw5eFsG7pdlgocv+q6TI
         uzmjAvUNybfA8NYqvi2p7hpi0KTHUbB2jt4dhzfdrjVb6EoiUzNkZA0hrRJm/IKFhif7
         Av8YwVLtEvqundMCB1hy7Xg0GS38FwxSlm39m+ZztqcFkEed8bqUDPUmZCZ9mObcraUl
         E8pECmUhI6DxniQVguB/EEbv9roQwNNlPdLiY5WsMwTb0QLE01Yp4lNmhKFG5K496O1v
         Q1yQ==
X-Gm-Message-State: AOJu0Yxo0ix8TCmYO3/pkfdWFT7mE9h8WF8gBMR4rhR2FTRY7L7SvS5i
	WNVN3EW0Yb8vHPL7bK1Ft1I=
X-Google-Smtp-Source: AGHT+IFYnyvkEDIVfG+6uXEDLM3MsKx6hhZ2KQYVQfuI264k9/7LuO5GxhihGAcLJrxNg6KXaIO4ZQ==
X-Received: by 2002:a05:6358:724e:b0:166:dc89:8c92 with SMTP id i14-20020a056358724e00b00166dc898c92mr108490rwa.26.1697755938799;
        Thu, 19 Oct 2023 15:52:18 -0700 (PDT)
Received: from surya ([2600:1700:3ec2:2011:b14a:c750:3938:f592])
        by smtp.gmail.com with ESMTPSA id x26-20020aa79ada000000b006be5af77f06sm289689pfp.2.2023.10.19.15.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 15:52:18 -0700 (PDT)
Date: Thu, 19 Oct 2023 15:52:15 -0700
From: Manu Bretelle <chantr4@gmail.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Carsten Haitzler <carsten.haitzler@arm.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Fangrui Song <maskray@google.com>, He Kuang <hekuang@huawei.com>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@linaro.org>,
	llvm@lists.linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Quentin Monnet <quentin@isovalent.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Rob Herring <robh@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
	Tom Rix <trix@redhat.com>, Wang Nan <wangnan0@huawei.com>,
	Wang ShaoBo <bobo.shaobowang@huawei.com>,
	Yang Jihong <yangjihong1@huawei.com>, Yonghong Song <yhs@fb.com>,
	YueHaibing <yuehaibing@huawei.com>,
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 1/1] tools build: Fix llvm feature detection, still used
 by bpftool
Message-ID: <ZTGzHzhZwJv0+xBH@surya>
References: <ZTGc8S293uaTqHja@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTGc8S293uaTqHja@kernel.org>

On Thu, Oct 19, 2023 at 06:17:37PM -0300, Arnaldo Carvalho de Melo wrote:
> When removing the BPF event for perf a feature test that checks if the
> llvm devel files are availabe was removed but that is also used by
> bpftool.
> 
> bpftool uses it to decide what kind of disassembly it will use: llvm or
> binutils based.
> 
> Removing the tools/build/feature/test-llvm.cpp file made bpftool to
> always fallback to binutils disassembly, even with the llvm devel files
> installed, fix it by restoring just that small test-llvm.cpp test file.
> 
> Fixes: 56b11a2126bf2f42 ("perf bpf: Remove support for embedding clang for compiling BPF events (-e foo.c)")
> Reported-by: Manu Bretelle <chantr4@gmail.com>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Andrii Nakryiko <andrii@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Carsten Haitzler <carsten.haitzler@arm.com>
> Cc: Eduard Zingerman <eddyz87@gmail.com>
> Cc: Fangrui Song <maskray@google.com>
> Cc: He Kuang <hekuang@huawei.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: James Clark <james.clark@arm.com>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: llvm@lists.linux.dev
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Quentin Monnet <quentin@isovalent.com>
> Cc: Ravi Bangoria <ravi.bangoria@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Wang Nan <wangnan0@huawei.com>
> Cc: Wang ShaoBo <bobo.shaobowang@huawei.com>
> Cc: Yang Jihong <yangjihong1@huawei.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: YueHaibing <yuehaibing@huawei.com>
> Link: https://lore.kernel.org/lkml/ZTGa0Ukt7QyxWcVy@kernel.org
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
>  tools/build/feature/test-llvm.cpp | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 tools/build/feature/test-llvm.cpp
> 
> diff --git a/tools/build/feature/test-llvm.cpp b/tools/build/feature/test-llvm.cpp
> new file mode 100644
> index 0000000000000000..88a3d1bdd9f6978e
> --- /dev/null
> +++ b/tools/build/feature/test-llvm.cpp
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "llvm/Support/ManagedStatic.h"
> +#include "llvm/Support/raw_ostream.h"
> +#define NUM_VERSION (((LLVM_VERSION_MAJOR) << 16) + (LLVM_VERSION_MINOR << 8) + LLVM_VERSION_PATCH)
> +
> +#if NUM_VERSION < 0x030900
> +# error "LLVM version too low"
> +#endif
> +int main()
> +{
> +	llvm::errs() << "Hello World!\n";
> +	llvm::llvm_shutdown();
> +	return 0;
> +}

Thanks for the quick turnaround!

