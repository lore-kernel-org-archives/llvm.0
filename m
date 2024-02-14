Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E073910799
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707885233; cv=none; b=fVkjqUx4A8wywRKWefJOJ0I7TIvgEYt01MdWdL6AYbTNEVFQkco+EHQfhQksEXyx1GbVRMfUKDZ3p2WcK/jGlEw9hwQcFaVKh/vaYdEIntKv/YvxKBM/+RMkMRHKg+2RnKf017dRJGCT6INWiD4n0T4AS8PHiC9FEgkXV1ocGUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707885233; c=relaxed/simple;
	bh=DX3lmGDBGmX8QNS+MI9SZDn/w2KNnJD/ve+KtVqRpSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5FBGn4NiYJx43kYmNKejkSC4KD1Q47GTthmYp1TW5GIp04z3pRvJXD9Sh4v4jaVnA1gfnw4ltxuVsw3DtN1wPU+k7Y/KQmSiNHIp0Dh3i7cDh0p336puugmVo0r/JF2fJnk4bnLsdiYP8fWizJMqG69j40RDw8PNbrluJQvqpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fhfg4tyr; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fhfg4tyr"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3642a8ffa9dso63495ab.1
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707885230; x=1708490030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oppXsRfOgsmX9oD1pmO95Yc48JACNQM6Q192XVNGNI=;
        b=fhfg4tyrmX2oYPmpSyvDqm1XGYIY1BiUTAjHE8HrW7lR2dKrnKpHDAB5On+fU1JCZg
         NVgyAhrt0+4pYMfU1s+fghHfIuOMkfV9rvjyYni3OOwgQ20Fo934EiLaCsY7cO+rikcP
         /zr9YxBC20ZXj1ZUIuhVDz1TNXcnq+m+ygdJAeWWiFofwGvHoHANsW94NIaZfKd1RBy4
         zUPNFTN7yDtK/3nqyMQpihJxQ3Iy/97uuMT3tK5RNZ6/etmVjntIrV53VSylcsH/Z5YL
         5GW/2V377VpD8PSA5rWKp0M9f7EbJBeJ49ZAETE2uk1zhQZemGiZUW3s22I0feQj/nIU
         8UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707885230; x=1708490030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oppXsRfOgsmX9oD1pmO95Yc48JACNQM6Q192XVNGNI=;
        b=cBA3J61KMnWrsfjK4dEWAqYlZTYLU/RrKL2LlSiFwueADISln8RCAyMaCHUoiDrEyA
         b69UEy3bz1aEuPcr4BkaKY18pub+AZ+HOlF1T8LCOauuh9CrVp3qOEPFRnbCWp0Q8C3V
         qJCo6LHX/J+Aaca03TircKuK/49/DtrBpV80+EVn+dsMG/8iZ3GYOX7kANUr5Qb876FM
         x0ghogXimY22/GOrnMBYRCKLC0I/28nIfOYiAqZ0gK95uCqpYLFhpTeE4cXc9xcxue5K
         4FWqWojbSLMrk9+EFRnrcL4XlDU2x9QaDoHa3DablpHCGavQyoXJTeVKPD9DocrLcswC
         N+IA==
X-Forwarded-Encrypted: i=1; AJvYcCUyAYza8wkW6W0+K5s6Vek7610ogewzpSGER1VXVXk4XcGtULe7VQ0toBHekq1YYCqwCZqAssIoQVWf1OPiAKVr8ubgig==
X-Gm-Message-State: AOJu0Yyk+21QQTKd81WUYYaFBP4zX5wKYA1Tz1q5Yc3jj7oQaNVSvOhL
	rRu6oWsjOAvhTl9FfIWNgcYDz+5eh0XX0khv+CAi20fRZhEYpVdjyqNAB61Kg2m+6o4X+aQk+Dg
	PwVqWmeZ1dBi5rzGwKYaZA/JM2A2uLooCa86+
X-Google-Smtp-Source: AGHT+IFF4sQ90BX6vXnzz+zK6nk1Zg73NqW7rnSxvkA0GiMkhzqgWqoPBXgIMVJtaHp3xX1Rk+fC4/V5LzMr1uz4zC0=
X-Received: by 2002:a05:6e02:3d08:b0:363:bad1:b8d6 with SMTP id
 db8-20020a056e023d0800b00363bad1b8d6mr121340ilb.1.1707885229858; Tue, 13 Feb
 2024 20:33:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240212185858.68189-1-irogers@google.com> <20240212185858.68189-9-irogers@google.com>
 <CAM9d7chcdJ7zsOEWLo1q-U25YyvP=22+GGxcMEbdkQbW_csoyg@mail.gmail.com>
In-Reply-To: <CAM9d7chcdJ7zsOEWLo1q-U25YyvP=22+GGxcMEbdkQbW_csoyg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Feb 2024 20:33:35 -0800
Message-ID: <CAP-5=fXnY9zUH-u2X3w5pn+9ZWoamg+h_nR84YhNVU3+VnWfQg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] perf tests: Add option to run tests in parallel
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@arm.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yang Jihong <yangjihong1@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 5:14=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Mon, Feb 12, 2024 at 10:59=E2=80=AFAM Ian Rogers <irogers@google.com> =
wrote:
> >
> > By default tests are forked, add an option (-p or --parallel) so that
> > the forked tests are all started in parallel and then their output
> > gathered serially. This is opt-in as running in parallel can cause
> > test flakes.
> >
> > Rather than fork within the code, the start_command/finish_command
> > from libsubcmd are used. This changes how stderr and stdout are
> > handled. The child stderr and stdout are always read to avoid the
> > child blocking. If verbose is 1 (-v) then if the test fails the child
> > stdout and stderr are displayed. If the verbose is >1 (e.g. -vv) then
> > the stdout and stderr from the child are immediately displayed.
> >
> > An unscientific test on my laptop shows the wall clock time for perf
> > test without parallel being 5 minutes 21 seconds and with parallel
> > (-p) being 1 minute 50 seconds.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> > v1 of this code had a bug where stdout/stderr weren't read fully. This
> > and additional issues/improvements are dealt with in v2.
> > ---
> [SNIP]
> >  static int __cmd_test(int argc, const char *argv[], struct intlist *sk=
iplist)
> >  {
> >         struct test_suite *t;
> >         unsigned int j, k;
> >         int i =3D 0;
> >         int width =3D 0;
> > +       size_t num_tests =3D 0;
> > +       struct child_test **child_tests;
> > +       int child_test_num =3D 0;
> >
> >         for_each_test(j, k, t) {
> >                 int len =3D strlen(test_description(t, -1));
> >
> >                 if (width < len)
> >                         width =3D len;
> > +
> > +               if (has_subtests(t)) {
> > +                       for (int l =3D 0, subn =3D num_subtests(t); l <=
 subn; l++) {
> > +                               len =3D strlen(test_description(t, -1))=
;
>
> Shouldn't it be strlen(test_description(t, i)) ?  Looks like it has len
> of parent test already.
>
> Thanks,
> Namhyung

Thanks Namhyung, will fix in v4.

Ian

> > +                               if (width < len)
> > +                                       width =3D len;
> > +                               num_tests++;
> > +                       }
> > +               } else
> > +                       num_tests++;
> >         }
> > +       child_tests =3D calloc(num_tests, sizeof(*child_tests));
> > +       if (!child_tests)
> > +               return -ENOMEM;
> >
> >         for_each_test(j, k, t) {
> >                 int curr =3D i++;
> > @@ -334,52 +458,47 @@ static int __cmd_test(int argc, const char *argv[=
], struct intlist *skiplist)
> >                                 continue;
> >                 }
> >
> > -               pr_info("%3d: %-*s:", i, width, test_description(t, -1)=
);
> > -
> >                 if (intlist__find(skiplist, i)) {
> > +                       pr_info("%3d: %-*s:", curr + 1, width, test_des=
cription(t, -1));
> >                         color_fprintf(stderr, PERF_COLOR_YELLOW, " Skip=
 (user override)\n");
> >                         continue;
> >                 }
> >
> >                 if (!has_subtests(t)) {
> > -                       test_and_print(t, -1);
> > +                       int err =3D start_test(t, curr, -1, &child_test=
s[child_test_num++], width);
> > +
> > +                       if (err) {
> > +                               /* TODO: if parallel waitpid the alread=
y forked children. */
> > +                               free(child_tests);
> > +                               return err;
> > +                       }
> >                 } else {
> >                         int subn =3D num_subtests(t);
> > -                       /*
> > -                        * minus 2 to align with normal testcases.
> > -                        * For subtest we print additional '.x' in numb=
er.
> > -                        * for example:
> > -                        *
> > -                        * 35: Test LLVM searching and compiling       =
                 :
> > -                        * 35.1: Basic BPF llvm compiling test         =
                 : Ok
> > -                        */
> > -                       int subw =3D width > 2 ? width - 2 : width;
> > -
> > -                       if (subn <=3D 0) {
> > -                               color_fprintf(stderr, PERF_COLOR_YELLOW=
,
> > -                                             " Skip (not compiled in)\=
n");
> > -                               continue;
> > -                       }
> > -                       pr_info("\n");
> >
> >                         for (subi =3D 0; subi < subn; subi++) {
> > -                               int len =3D strlen(test_description(t, =
subi));
> > +                               int err;
> >
> > -                               if (subw < len)
> > -                                       subw =3D len;
> > -                       }
> > -
> > -                       for (subi =3D 0; subi < subn; subi++) {
> >                                 if (!perf_test__matches(test_descriptio=
n(t, subi),
> >                                                         curr, argc, arg=
v))
> >                                         continue;
> >
> > -                               pr_info("%3d.%1d: %-*s:", i, subi + 1, =
subw,
> > -                                       test_description(t, subi));
> > -                               test_and_print(t, subi);
> > +                               err =3D start_test(t, curr, subi, &chil=
d_tests[child_test_num++],
> > +                                                width);
> > +                               if (err)
> > +                                       return err;
> >                         }
> >                 }
> >         }
> > +       for (i =3D 0; i < child_test_num; i++) {
> > +               if (parallel) {
> > +                       int ret  =3D finish_test(child_tests[i], width)=
;
> > +
> > +                       if (ret)
> > +                               return ret;
> > +               }
> > +               free(child_tests[i]);
> > +       }
> > +       free(child_tests);
> >         return 0;
> >  }
> >
> > @@ -447,6 +566,8 @@ int cmd_test(int argc, const char **argv)
> >                     "be more verbose (show symbol address, etc)"),
> >         OPT_BOOLEAN('F', "dont-fork", &dont_fork,
> >                     "Do not fork for testcase"),
> > +       OPT_BOOLEAN('p', "parallel", &parallel,
> > +                   "Run the tests altogether in parallel"),
> >         OPT_STRING('w', "workload", &workload, "work", "workload to run=
 for testing"),
> >         OPT_STRING(0, "dso", &dso_to_test, "dso", "dso to test"),
> >         OPT_STRING(0, "objdump", &test_objdump_path, "path",
> > --
> > 2.43.0.687.g38aa6559b0-goog
> >
