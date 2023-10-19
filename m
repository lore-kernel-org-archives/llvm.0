Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A48DF57
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A1KjzpwG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53eeb28e8e5so1728a12.1
        for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697752702; x=1698357502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwvPbEHpAjaA4Y9KWdhz2lpaz5n8xnml5PfY99zf+1c=;
        b=A1KjzpwGsb99SlpMeXd0XdAryLYZuRBHTeOnrRGmANesQ1R8WmiHsZYadQ834l1BSF
         AiAEeYsO+ON2FTOko3pszA7yXKg6sl19i/RYJ3M1LCgaiHP9Wh/Rmvpnc8tOx36sDNFZ
         RSDPSWrnpF/6BH4zvIHmmP3hU0dpDMAYgixtwukffeWIhFzVSdQPi0U51QTmGoE8cxyL
         UoLKHapmOqOaItZtaPeULQ8O+YvR9uyzIxjMyuUFlSrO3UiRz635JObSmqPY3lADsylQ
         4U2os1TfQomJsMl5iRhp0L9pOLyEnSYD0vQmKntSeQZwIfSO+NiPQZVR1iF+lPyNaUCQ
         XWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697752702; x=1698357502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwvPbEHpAjaA4Y9KWdhz2lpaz5n8xnml5PfY99zf+1c=;
        b=USanmDf9qx0VhTvUpWkFe/QGtei2IgvOy/ESLKqPk7k7Ac2dd14bgc348zJN8HI+nf
         gLoOTgrmg7ZxxwHcEpjJM8awx7ZZBicroreGC2hzpZeaqcngQtKLKRXsQ1r+WIuH0gdp
         N49MUUPYMsO+dspunUZymdzKb2MiS3IjSxGSrhNHvDc3igZvYRvRq6t25NDA1pOZ4cd6
         izCNF7YNPyTLxblcy5Kyc/BfO0DUyiBpafSTvip6IcTTQHu6DfMJX7/CpIfpIQjMl9L6
         hL+BSkhtPUyOiv+ZojUiy4nWrsD9IMFX27MveHkezi/+eFgYGjjdHgUaFDsAoxhDgzN6
         wtbg==
X-Gm-Message-State: AOJu0Yww0uZl/oOnKcF/EwGv9//iMmmlSwlFRT7hri0xfewA10qe77Hf
	oiAS//rccrMEzbheUAvqrq3MdPzCq5vljwLN4bd6hw==
X-Google-Smtp-Source: AGHT+IFgg66TljOkm3tijcLjKf1m1/ftpVCM+vMIHZGZl6rTGngvrOHroEZ5mWAb5CekzqWB8Eh5AVZaefCrfPgVOhA=
X-Received: by 2002:a50:d49e:0:b0:53f:90a8:2794 with SMTP id
 s30-20020a50d49e000000b0053f90a82794mr39158edi.0.1697752702382; Thu, 19 Oct
 2023 14:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZTGc8S293uaTqHja@kernel.org>
In-Reply-To: <ZTGc8S293uaTqHja@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 Oct 2023 14:58:10 -0700
Message-ID: <CAP-5=fX=Uj0mqGGtrGMpF4aAuBWps3DcS8zVAhRDMbo37TdX6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] tools build: Fix llvm feature detection, still used
 by bpftool
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Manu Bretelle <chantr4@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Carsten Haitzler <carsten.haitzler@arm.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	Fangrui Song <maskray@google.com>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@linaro.org>, llvm@lists.linux.dev, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Quentin Monnet <quentin@isovalent.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Rob Herring <robh@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Tom Rix <trix@redhat.com>, 
	Wang Nan <wangnan0@huawei.com>, Wang ShaoBo <bobo.shaobowang@huawei.com>, 
	Yang Jihong <yangjihong1@huawei.com>, Yonghong Song <yhs@fb.com>, YueHaibing <yuehaibing@huawei.com>, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 2:17=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
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
> Fixes: 56b11a2126bf2f42 ("perf bpf: Remove support for embedding clang fo=
r compiling BPF events (-e foo.c)")
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

Sorry for the breakage.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/build/feature/test-llvm.cpp | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 tools/build/feature/test-llvm.cpp
>
> diff --git a/tools/build/feature/test-llvm.cpp b/tools/build/feature/test=
-llvm.cpp
> new file mode 100644
> index 0000000000000000..88a3d1bdd9f6978e
> --- /dev/null
> +++ b/tools/build/feature/test-llvm.cpp
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "llvm/Support/ManagedStatic.h"
> +#include "llvm/Support/raw_ostream.h"
> +#define NUM_VERSION (((LLVM_VERSION_MAJOR) << 16) + (LLVM_VERSION_MINOR =
<< 8) + LLVM_VERSION_PATCH)
> +
> +#if NUM_VERSION < 0x030900
> +# error "LLVM version too low"
> +#endif
> +int main()
> +{
> +       llvm::errs() << "Hello World!\n";
> +       llvm::llvm_shutdown();
> +       return 0;
> +}
> --
> 2.41.0
>
