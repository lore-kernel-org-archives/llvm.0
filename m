Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ADB1094E
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 21:48:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-40550136e54so103421cf.0
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690235300; x=1690840100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ifTUtuK5V5MYNm+bAiFRs1Giaz2am8su6EuD15e6Ok=;
        b=mMZUcwQNUodC/QF5Mwrwq4C5u18fp9psSC6UogZD89mO6pyZOOc7ho04Q2E7SqS/OO
         KjReVXCVmSn2vYocui6Dtk4Wm2DAnDXrk8g0wR7nnx5vBHWQgxtz001U5hQtWel4/muw
         tJ/yTdZDfKDBnHxwWLUnnv+FKDwZjAzFmIuo9B3bixEIYeBVKYlo7W2ujZubpiUjaYtJ
         CGYyn+1RC5RpPS84stQZYGW+dwJU0QtCn3Xl4TPiHwk2elm0ePhqvQZftkpbbr1xHBQX
         qtSRIrFmxyxhd/KpGzD7UKPMZKbbEA6SXOeFEQHkqse7OTDV0tI5Rvw4Oxu9u9hKLwmY
         yG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690235300; x=1690840100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ifTUtuK5V5MYNm+bAiFRs1Giaz2am8su6EuD15e6Ok=;
        b=aEFU/dYjLDqGFAJIUhYe57tfMQjnFubHFKIZp6T/5860t2hk/I1cpESak00YnaCIIk
         mVLByaUp7uVRSqN6OahhmYrqU6T6L/g4ry3qbbXXDXzQfdFDzRdVtT5iudwaHShxq5zX
         T8Jkx0Mkxor2A63giggX2FR2tK+JryYvihnORteDa8P5VXtJAX6L8NrRRpD0lnO6j3Al
         tNHzJnzb/W8z9ZEgwamWUHmNSLArsRUqa42hugqNDprPNuaNrXcILabq0lu1tPJi2ZlR
         rMXgGKzDGti1CJaIoa6MneujT3qelKkEqY0y7qVM0ae8/ouU2cW8I/JOzyTswv3tUlnl
         Fc7A==
X-Gm-Message-State: ABy/qLbJclkL/F656Q319H1NYeJHzW8K9IFu8+7MmUd1+yVqLZOSQhWo
	ki40rVu7FacBit38OkN2lLZBAUxdKvKDZHELtG6FCw==
X-Google-Smtp-Source: APBJJlHsYrWvniCrUgIhS1T7zRs3emxCP5nrN9ov/190OzoLUgKYnCs1z1pROaIHbr8oEMK6D6d+72oPtVgeoIS0i+k=
X-Received: by 2002:ac8:5c89:0:b0:403:59cb:66c4 with SMTP id
 r9-20020ac85c89000000b0040359cb66c4mr561657qta.23.1690235299904; Mon, 24 Jul
 2023 14:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724201247.748146-1-irogers@google.com> <CAKwvOd=12eSPyc5ZRgm8NPMJYjj13QOxcnHtv_Y7Ws-zffyUrA@mail.gmail.com>
In-Reply-To: <CAKwvOd=12eSPyc5ZRgm8NPMJYjj13QOxcnHtv_Y7Ws-zffyUrA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 24 Jul 2023 14:48:08 -0700
Message-ID: <CAP-5=fVh5atUjf4sLBYi4CwxYdWJfub_0anXKTdVuJrZkC4-tQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Perf tool LTO support
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Carsten Haitzler <carsten.haitzler@arm.com>, 
	Zhengjun Xing <zhengjun.xing@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, maskray@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 2:15=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jul 24, 2023 at 1:12=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > Add a build flag, LTO=3D1, so that perf is built with the -flto
> > flag. Address some build errors this configuration throws up.
>
> Hi Ian,
> Thanks for the performance numbers. Any sense of what the build time
> numbers might look like for building perf with LTO?
>
> Does `-flto=3Dthin` in clang's case make a meaningful difference of
> `-flto`? I'd recommend that over "full LTO" `-flto` when the
> performance difference of the result isn't too meaningful.  ThinLTO
> should be faster to build, but I don't know that I've ever built perf,
> so IDK what to expect.

Hi Nick,

I'm not sure how much the perf build will benefit from LTO to say
whether thin is good enough or not. Things like "perf record" are
designed to spend the majority of their time blocking on a poll system
call. We have benchmarks at least :-)

I grabbed some clang build times in an unscientific way on my loaded laptop=
:

no LTO
real    0m48.846s
user    3m11.452s
sys     0m29.598s

-flto=3Dthin
real    0m55.910s
user    4m2.342s
sys     0m30.120s

real    0m50.330s
user    3m36.986s
sys     0m28.519s

-flto
real    1m12.002s
user    3m27.676s
sys     0m30.305s

real    1m5.187s
user    3m19.348s
sys     0m29.031s

So perhaps thin LTO increases total build time by 10%, whilst full LTO
increases it by 50%.

Gathering some clang performance numbers:

no LTO
$ perf bench internals synthesize
# Running 'internals/synthesize' benchmark:
Computing performance of single threaded perf event synthesis by
synthesizing events on the perf process itself:
 Average synthesis took: 178.694 usec (+- 0.171 usec)
 Average num. events: 52.000 (+- 0.000)
 Average time per event 3.436 usec
 Average data synthesis took: 194.545 usec (+- 0.088 usec)
 Average num. events: 277.000 (+- 0.000)
 Average time per event 0.702 usec
# Running 'internals/synthesize' benchmark:
Computing performance of single threaded perf event synthesis by
synthesizing events on the perf process itself:
 Average synthesis took: 175.381 usec (+- 0.105 usec)
 Average num. events: 52.000 (+- 0.000)
 Average time per event 3.373 usec
 Average data synthesis took: 188.980 usec (+- 0.071 usec)
 Average num. events: 278.000 (+- 0.000)
 Average time per event 0.680 usec

-flto=3Dthin
$ perf bench internals synthesize
# Running 'internals/synthesize' benchmark:
Computing performance of single threaded perf event synthesis by
synthesizing events on the perf process itself:
 Average synthesis took: 183.122 usec (+- 0.082 usec)
 Average num. events: 52.000 (+- 0.000)
 Average time per event 3.522 usec
 Average data synthesis took: 196.468 usec (+- 0.102 usec)
 Average num. events: 277.000 (+- 0.000)
 Average time per event 0.709 usec
# Running 'internals/synthesize' benchmark:
Computing performance of single threaded perf event synthesis by
synthesizing events on the perf process itself:
 Average synthesis took: 177.684 usec (+- 0.094 usec)
 Average num. events: 52.000 (+- 0.000)
 Average time per event 3.417 usec
 Average data synthesis took: 190.079 usec (+- 0.077 usec)
 Average num. events: 275.000 (+- 0.000)
 Average time per event 0.691 usec

-flto
$ perf bench internals synthesize
# Running 'internals/synthesize' benchmark:
Computing performance of single threaded perf event synthesis by
synthesizing events on the perf process itself:
 Average synthesis took: 112.599 usec (+- 0.040 usec)
 Average num. events: 52.000 (+- 0.000)
 Average time per event 2.165 usec
 Average data synthesis took: 119.012 usec (+- 0.070 usec)
 Average num. events: 278.000 (+- 0.000)
 Average time per event 0.428 usec
# Running 'internals/synthesize' benchmark:
Computing performance of single threaded perf event synthesis by
synthesizing events on the perf process itself:
 Average synthesis took: 107.606 usec (+- 0.147 usec)
 Average num. events: 52.000 (+- 0.000)
 Average time per event 2.069 usec
 Average data synthesis took: 114.633 usec (+- 0.159 usec)
 Average num. events: 279.000 (+- 0.000)
 Average time per event 0.411 usec

The performance win from thin LTO doesn't look to be there. Full LTO
appears to be reducing event synthesis time down to 60% of what it
was. The clang numbers are looking better than the GCC ones. I think
from this it makes sense to use -flto.

Thanks,
Ian

> --
> Thanks,
> ~Nick Desaulniers
