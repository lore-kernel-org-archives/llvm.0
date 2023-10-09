Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65B38BA7
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2hnYcgO"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5032a508e74so6913e87.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696867999; x=1697472799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0jKnvS+p6tLusyf0KR6YxKQNRwudB/CjvpEJfWJaDA=;
        b=T2hnYcgOz3tdkKEIgLF6VmXOlTZZvKEA6NOth9jtHtbxDcZmIAm772DIrp+OsZWlpo
         kceD4o6kGmHmEs0DApwSfg0IhkLgz78C5QpcvqPsXWefthB06hK6Re+Q8PhMbTNupHaW
         isD6hlvRJQwuT5Piomz9tCcxiRWxWvMZmC247+gZPtSDuKnMPOGPaBx8gAivoyNyf7aW
         QkqcTQOkUjwNATfQEqjGMq0oDOEb8Irhw8wW3NIE1UZG3ibeW39I/3ApDbpXJbH0cfUB
         0mkM7Oet05IN/7YIstA66U5jyABShWBJI6TPN8rWPeSuv8V3TdYdhCMbEydWTQVWIArj
         P9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696867999; x=1697472799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0jKnvS+p6tLusyf0KR6YxKQNRwudB/CjvpEJfWJaDA=;
        b=UkwV/cZ260GWphZthZqSnOZC33vIbumcO/aikwMQPAEiKX/L2odGGi5EHL8R7Z7otN
         BFsKFY8716lo9BKvKH6SSN+bPKnF40JUMkL09N2glCCmvhlRd1+OSvY7i8WvQBD0GuQC
         eqtNb6ICZvCn+o9OwUMfMfKEd+R9nhzY/sWFdQfCQyrTchJEXnvvGzc77Rowur2fTp23
         bofbnOXmzsAFa4B3w9y17oOcArKR1ofbR/IpK2Cu5GdQM/zuSPc+jHOXwqsSfeortGRk
         CgfP63rePt5ER29dT5hJ+fV6qoGH+zga5sNvJ4+jwU/3/rtdcC3fpELO15fAI7oaKzTp
         D2XA==
X-Gm-Message-State: AOJu0YzxQbZ5XEsiU/i7PUPNRfOYKe6D6WmGdBiB68LhQRPWwP2hSLjM
	Bit8XtlD8pGxDakpCKIAYVxUkr2IUuJJkfpONIHfGg==
X-Google-Smtp-Source: AGHT+IF1HdpHvO8s/EVxVQ0me6ekTtk7UbIlgadFNqVNz5wYB+4oNqfX/opeS9wuIKe7sPJkg7G/ilLuNk6Uh/uD+jE=
X-Received: by 2002:a19:7006:0:b0:502:dc15:7fb with SMTP id
 h6-20020a197006000000b00502dc1507fbmr284723lfc.5.1696867999100; Mon, 09 Oct
 2023 09:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-6-irogers@google.com>
 <CAM9d7chmVRrFgEZMYk3EWG+1wjXqLC3suu-xrX64hmfBSAFi0A@mail.gmail.com>
In-Reply-To: <CAM9d7chmVRrFgEZMYk3EWG+1wjXqLC3suu-xrX64hmfBSAFi0A@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Oct 2023 09:13:05 -0700
Message-ID: <CAP-5=fXbU_hckJp=evE5ja7BA4sS30E6hHryXXAEvwXs=1qkBA@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] perf bench uprobe: Fix potential use of memory
 after free
To: Namhyung Kim <namhyung@kernel.org>
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

On Sun, Oct 8, 2023 at 10:51=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > Found by clang-tidy:
> > ```
> > bench/uprobe.c:98:3: warning: Use of memory after it is freed [clang-an=
alyzer-unix.Malloc]
> >                 bench_uprobe_bpf__destroy(skel);
> > ```
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> I'm ok with the change but I think it won't call
> bench_uprobe__teardown_bpf_skel() if the setup function
> returns a negative value.  Maybe we also need to set the
> err in the default case of `switch (bench)` statement.

Yes, the analysis (I'll put it below) assumes that the err can be
positive yielding destroy being called twice, the second creating a
use-after-free. I think it is worth cleaning the code up and making
the analyzer's job easier.

Thanks,
Ian

```
bench/uprobe.c:98:3: warning: Use of memory after it is freed
[clang-analyzer-unix.Malloc]
               bench_uprobe_bpf__destroy(skel);
               ^
tools/perf/bench/uprobe.c:197:9: note: Calling 'bench_uprobe'
       return bench_uprobe(argc, argv, BENCH_UPROBE__TRACE_PRINTK);
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/bench/uprobe.c:150:6: note: 'bench' is not equal to
BENCH_UPROBE__BASELINE
       if (bench !=3D BENCH_UPROBE__BASELINE &&
bench_uprobe__setup_bpf_skel(bench) < 0)
           ^~~~~
tools/perf/bench/uprobe.c:150:6: note: Left side of '&&' is true
tools/perf/bench/uprobe.c:150:41: note: Calling 'bench_uprobe__setup_bpf_sk=
el'
       if (bench !=3D BENCH_UPROBE__BASELINE &&
bench_uprobe__setup_bpf_skel(bench) < 0)

^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/bench/uprobe.c:68:7: note: 'skel' is non-null
       if (!skel) {
            ^~~~
tools/perf/bench/uprobe.c:68:2: note: Taking false branch
       if (!skel) {
       ^
tools/perf/bench/uprobe.c:74:6: note: Assuming 'err' is not equal to 0
       if (err) {
           ^~~
tools/perf/bench/uprobe.c:74:2: note: Taking true branch
       if (err) {
       ^
tools/perf/bench/uprobe.c:76:3: note: Control jumps to line 91
               goto cleanup;
               ^
tools/perf/bench/uprobe.c:91:2: note: Calling 'bench_uprobe_bpf__destroy'
       bench_uprobe_bpf__destroy(skel);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/util/bpf_skel/bench_uprobe.skel.h:44:6: note: Assuming
'obj' is non-null
       if (!obj)
           ^~~~
tools/perf/util/bpf_skel/bench_uprobe.skel.h:44:2: note: Taking false branc=
h
       if (!obj)
       ^
tools/perf/util/bpf_skel/bench_uprobe.skel.h:46:6: note: Assuming
field 'skeleton' is null
       if (obj->skeleton)
           ^~~~~~~~~~~~~
tools/perf/util/bpf_skel/bench_uprobe.skel.h:46:2: note: Taking false branc=
h
       if (obj->skeleton)
       ^
tools/perf/util/bpf_skel/bench_uprobe.skel.h:48:2: note: Memory is released
       free(obj);
       ^~~~~~~~~
tools/perf/bench/uprobe.c:91:2: note: Returning; memory was released
via 1st parameter
       bench_uprobe_bpf__destroy(skel);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/bench/uprobe.c:150:41: note: Returning; memory was released
       if (bench !=3D BENCH_UPROBE__BASELINE &&
bench_uprobe__setup_bpf_skel(bench) < 0)

^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/bench/uprobe.c:150:41: note: Assuming the condition is false
       if (bench !=3D BENCH_UPROBE__BASELINE &&
bench_uprobe__setup_bpf_skel(bench) < 0)

^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/bench/uprobe.c:150:2: note: Taking false branch
       if (bench !=3D BENCH_UPROBE__BASELINE &&
bench_uprobe__setup_bpf_skel(bench) < 0)
       ^
tools/perf/bench/uprobe.c:155:14: note: Assuming 'i' is >=3D 'loops'
       for (i =3D 0; i < loops; i++) {
                   ^~~~~~~~~
tools/perf/bench/uprobe.c:155:2: note: Loop condition is false.
Execution continues on line 159
       for (i =3D 0; i < loops; i++) {
       ^
tools/perf/bench/uprobe.c:164:2: note: Control jumps to 'case 1:'  at line =
169
       switch (bench_format) {
       ^
tools/perf/bench/uprobe.c:171:3: note:  Execution continues on line 179
               break;
               ^
tools/perf/bench/uprobe.c:179:6: note: 'bench' is not equal to
BENCH_UPROBE__BASELINE
       if (bench !=3D BENCH_UPROBE__BASELINE)
           ^~~~~
tools/perf/bench/uprobe.c:179:2: note: Taking true branch
       if (bench !=3D BENCH_UPROBE__BASELINE)
       ^
tools/perf/bench/uprobe.c:180:3: note: Calling 'bench_uprobe__teardown_bpf_=
skel'
               bench_uprobe__teardown_bpf_skel();
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/perf/bench/uprobe.c:97:6: note: 'skel' is non-null
       if (skel) {
           ^~~~
tools/perf/bench/uprobe.c:97:2: note: Taking true branch
       if (skel) {
       ^
tools/perf/bench/uprobe.c:98:3: note: Use of memory after it is freed
               bench_uprobe_bpf__destroy(skel);
               ^                         ~~~~
1 warning generated.
```

> Thanks,
> Namhyung
>
>
> > ---
> >  tools/perf/bench/uprobe.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/perf/bench/uprobe.c b/tools/perf/bench/uprobe.c
> > index 914c0817fe8a..5c71fdc419dd 100644
> > --- a/tools/perf/bench/uprobe.c
> > +++ b/tools/perf/bench/uprobe.c
> > @@ -89,6 +89,7 @@ static int bench_uprobe__setup_bpf_skel(enum bench_up=
robe bench)
> >         return err;
> >  cleanup:
> >         bench_uprobe_bpf__destroy(skel);
> > +       skel =3D NULL;
> >         return err;
> >  }
> >
> > --
> > 2.42.0.609.gbb76f46606-goog
> >
