Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A6864F
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 05:18:59 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id h187so12130643iof.7
        for <llvm@lists.linux.dev>; Mon, 03 Apr 2023 22:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680585538; x=1683177538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+z2DtIXlnX8JchPJicDuk6IiWR6KVUfDtLG8QXJzFo=;
        b=KhVmA5qC1CJ1Y1izNgEHbUwO2SSlI7F5yZK7JzvpEMaENUcLtsHl2qv3YEcoPuiiFR
         4/O1e1zZFErztdz+4igXjSCOlVuKCo6wIH5LbSS5U3P5tTy2myAWpX8WrznurBK5+Gm5
         fYxQDpThyFs2svoPVtG99X6Sy+SqmvncjmRDwu5GHxQBBIntShcU4arGZPfylYeRXfsW
         GKswAOm63p0IG/xOtufsR3SetA0BHARg3nhqA5mlsmaXiNk3kZ8JmHti0eTbQhanDXfy
         Qe+5Quyr9dArLX384soBLztsHUPyG3hvvE89wt6PHquiDpQaXqdCrWy4N7fgtz5/DRP3
         BhHg==
X-Gm-Message-State: AAQBX9c87md2skA58eg0UF4Hil+cuvGV0njc5UyRSVBNJGUVNP25X9ix
	lcFm8nVEr7ICB4nSofV9LUEvECMoXrqHGuTQtQM=
X-Google-Smtp-Source: AKy350bBvTyWsO4MYoAA2TbNVAjasEfvOmD1ErXgo3dwhUR1n6WX/4f4etHN0Prhw4chjc8ELJOPyhM4X69infy65mU=
X-Received: by 2002:a6b:7e03:0:b0:753:568:358e with SMTP id
 i3-20020a6b7e03000000b007530568358emr1416961iom.20.1680585538552; Mon, 03 Apr
 2023 22:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230403184033.1836023-1-irogers@google.com> <ZCs1/skb2XqDYrYF@kernel.org>
In-Reply-To: <ZCs1/skb2XqDYrYF@kernel.org>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 3 Apr 2023 22:18:47 -0700
Message-ID: <CAM9d7chDz9dNpB+vywLMNxyc9p=wLaJp4qUYwfu6y88tEDYLLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Support for llvm-addr2line
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 3, 2023 at 1:24=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Em Mon, Apr 03, 2023 at 11:40:29AM -0700, Ian Rogers escreveu:
> > The addr2line command is started and then addresses piped to it. In
> > order to determine the end of a addr2lines output a ',' it output with
> > an expectation to get '??\n??:0\n' as a reply. llvm-addr2line differs
> > in that ',' generates a reply of ','.
> >
> > The approach detects and then caches the addr2line style. When records
> > are read the sentinel is detected appropriately.
> >
> > Comparing the output there is a little more inline data on my machine
> > with llvm-addr2line:
> > $ sudo perf record -a -g sleep 1
> > $ sudo perf report --addr2line=3Daddr2line > a.txt
> > $ sudo perf report --addr2line=3Dllvm-addr2line > b.txt
> > $ wc -l a.txt b.txt
> >   12386 a.txt
> >   12477 b.txt
> >
> > Some other small changes, switching to the api/io code to avoid file
> > streams wrapping the command's stdin/stdout. Ignore SIGPIPE for when
> > addr2line exits and writes fail.
> >
> > v2. Address review comments from Arnaldo and Namhyung, fixing a
> >     realloc error path, argument ordering and a comment.
>
> Added to local repo, build testing, will be in tmp.perf-tools-next soon.
>
> - Arnaldo
>
> > Ian Rogers (4):
> >   tools api: Add io__getline
> >   perf srcline: Simplify addr2line subprocess
> >   perf srcline: Support for llvm-addr2line
> >   perf srcline: Avoid addr2line SIGPIPEs

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung


> >
> >  tools/lib/api/io.h        |  45 ++++++++++
> >  tools/perf/tests/api-io.c |  36 ++++++++
> >  tools/perf/util/srcline.c | 171 +++++++++++++++++++++++---------------
> >  3 files changed, 184 insertions(+), 68 deletions(-)
> >
> > --
> > 2.40.0.348.gf938b09366-goog
> >
>
> --
>
> - Arnaldo
