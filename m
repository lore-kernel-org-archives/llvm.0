Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB39CA63
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 05:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-27927d37ec7so3204175a91.0
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 22:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696830705; x=1697435505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6To/XFZla//NDfF2btRt6lbatBC8d81aAvKQzzrLLY=;
        b=azGCHfJDaAa5Z9EP5/gJYDFRDVFYbXY9rxozuBn6lP1OyCWHUXvVW1iRntOO9UO9Wj
         21V9Dx22Uf3Rc5BfUNAmVdLBesWHp9/kYjxDpwEdukwnT10VDL+y2Wy3VfjMgqQkN318
         dTm8lRnSAl6Rc/dkLwnGUVjpUgxDUKnDDapIkr2Ue0g6LaHXJOmFLUwcWNxIb4klxPoB
         O3Hb0+YQB18I/MJ3gxq3wlCFBbudN1KWQg4cnxmCWddHoZtsrn7fkob6gVi2ZjdQiebJ
         KLXWJj194vZS506rXgN1Yqc5GN1TtEAZtNEPnsHDVPVjFJyx+Tb8X4zb2zn3NSit47ek
         UQHw==
X-Gm-Message-State: AOJu0YzmlKNAObDun9gH9EZv+6qKl73b9FIwJ6pnJlnXhw3YOVJRcov8
	3zEu0vF3/F0AKGZ2PIaaOD1iQZgstCDW/6DssehdOR6y
X-Google-Smtp-Source: AGHT+IFe+yFp/6ZZtgoksaQEaoA0GtB4qRd6BdyhzEmVCwEhguqPFr5Jdk1nmY7VZfEA4x2t+lec7Svvd6Cx87wSVKk=
X-Received: by 2002:a17:90a:c293:b0:268:18e:9dfa with SMTP id
 f19-20020a17090ac29300b00268018e9dfamr14452873pjt.5.1696830704800; Sun, 08
 Oct 2023 22:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-6-irogers@google.com>
In-Reply-To: <20231005230851.3666908-6-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sun, 8 Oct 2023 22:51:33 -0700
Message-ID: <CAM9d7chmVRrFgEZMYk3EWG+1wjXqLC3suu-xrX64hmfBSAFi0A@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] perf bench uprobe: Fix potential use of memory
 after free
To: Ian Rogers <irogers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Found by clang-tidy:
> ```
> bench/uprobe.c:98:3: warning: Use of memory after it is freed [clang-anal=
yzer-unix.Malloc]
>                 bench_uprobe_bpf__destroy(skel);
> ```
>
> Signed-off-by: Ian Rogers <irogers@google.com>

I'm ok with the change but I think it won't call
bench_uprobe__teardown_bpf_skel() if the setup function
returns a negative value.  Maybe we also need to set the
err in the default case of `switch (bench)` statement.

Thanks,
Namhyung


> ---
>  tools/perf/bench/uprobe.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/perf/bench/uprobe.c b/tools/perf/bench/uprobe.c
> index 914c0817fe8a..5c71fdc419dd 100644
> --- a/tools/perf/bench/uprobe.c
> +++ b/tools/perf/bench/uprobe.c
> @@ -89,6 +89,7 @@ static int bench_uprobe__setup_bpf_skel(enum bench_upro=
be bench)
>         return err;
>  cleanup:
>         bench_uprobe_bpf__destroy(skel);
> +       skel =3D NULL;
>         return err;
>  }
>
> --
> 2.42.0.609.gbb76f46606-goog
>
