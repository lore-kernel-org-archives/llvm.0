Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481C19440
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 22:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhswk5OI"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso2854781fa.2
        for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697755649; x=1698360449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znKTjYCMK7qVlPe1x85VLsQxhjgS/CN/1N2ibCS0Pek=;
        b=nhswk5OIC7/sgU8oNOnL7QKixQu7f2+7lInexlnP58X4aF5JraiHZ+1suetAA1k8bB
         +rJWDeIBES1w2XZOuO/0ewh9nUtYOzuiqNpkv80GYnqGP6EyRStLHn5b3tzP54WFYcTJ
         FK1FtnbSLC/FaaxgmYfDs/DyxFIT1sOMxFi8Mo5MPhHbvJU63PDYamRovt+0+a0mumxc
         SKN659MO4wx7itFJxmsHFiftrA7Fl9hQ8fx+2VqRVra9ZsFGidlYas8VXNrZlR+6ypeR
         fSsP0j1jVR0U6hb5GJT3jOb8IlzXfC1cFLFh5MSAdT/POcaB7qKSXQ38nN2nzStAnaJb
         Ey6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697755649; x=1698360449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znKTjYCMK7qVlPe1x85VLsQxhjgS/CN/1N2ibCS0Pek=;
        b=Z/r9pb+yV4PXC38pGThX/mIPIQIg0WaU597shhx6Oy7GzMhFnqRG28LX4l/JFNV0z3
         mDKfX4EN7DwIzAdIhU2APmKLx8iEIQr4tF+X5j9AdJhseUIywc+darMX4zyhS1gDq1Lm
         NY6I7U3zAkUNrpWHsLY4csmCGAWifzfrhl/J0bvM3fYlALJh4lvlY5FL/BxgvA0csBNw
         jrVrCuWp6ga7LYda7KZ4pOq6L1oxKBI3LEHMHAxuVJP6IkeR229wl8qd6XVtb+OSYIyK
         vcWrhGRhV7F2jbN07oM20q9eSyTWqPxuQN4dhRKz1/36hRNPa4y8jS7FwlGp5Yqr4nvT
         4TGw==
X-Gm-Message-State: AOJu0Yyn9oYOcWwL/BIVRU2l5juVNfQSPjhOA4jczv8PSG7RxR5hTgJu
	h+2at+oD1mE7fjTi/m9o8j6GYIPZ4VWL0T83CiU=
X-Google-Smtp-Source: AGHT+IHy65GTNdlUTy4eWmv1QGEZswUfHu0S4xVwjoBxCKL4FFUBpAf6AJ5h6EW3YDS7FnH5QqZ8dN+gP6T4uQF8cf8=
X-Received: by 2002:ac2:5470:0:b0:500:a6c1:36f7 with SMTP id
 e16-20020ac25470000000b00500a6c136f7mr73421lfn.3.1697755649162; Thu, 19 Oct
 2023 15:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZTGc8S293uaTqHja@kernel.org>
In-Reply-To: <ZTGc8S293uaTqHja@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 19 Oct 2023 15:47:17 -0700
Message-ID: <CAEf4BzYC01Uvj5R+eipu8wmWpNH6K_=_ptj-Wxezdk_O7AFAyA@mail.gmail.com>
Subject: Re: [PATCH 1/1] tools build: Fix llvm feature detection, still used
 by bpftool
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Manu Bretelle <chantr4@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Carsten Haitzler <carsten.haitzler@arm.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	Fangrui Song <maskray@google.com>, He Kuang <hekuang@huawei.com>, Ian Rogers <irogers@google.com>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
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

Should we route this through the bpf-next tree to get the fix for
bpftool into Github mirror ASAP?

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
