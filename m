Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CFA65C
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 01:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873270; cv=none; b=AcvmwuOJub09xYguFCGj1ZPluykZhNNbJsrLO/VMPloG/bobUf7BS3QsKkQp9sBdrcR8mPQ4a9T+6cQfoaL81I1a2bdxREzRi1xGWsPe+7CtRaxhk4iT2axJXl0b9ACUh6rLymGD5PKG3GS5duPbc80eA5vr4LYeUqrbDOwcz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873270; c=relaxed/simple;
	bh=uaCmhwOn8mw1USdD5pf5zdexUd38umclcqM6RnhK7bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sE2+vnPolrKPRiu7J9hmADdevyVI/G6alflwPj087F+1WdqIvm0HlJBLKJ+NFNfX9tP9Le9b2LxHT272tgGS+ZH4tgRrX9Tai6F1WESRnf2JweeqQZ+oGfYuYB4g68U7LMO9kxtQuqTR9Z/qfry5W0V3HhVqER4usZkCp1uCtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-296df89efd2so3760583a91.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 17:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873267; x=1708478067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiVVTshxLf488JtQvB4freL8sn2VgHj3EfM+SItvhFw=;
        b=AoJ9o5rl0JzaC4P0NlNK1BS7NQalOlAI80RIGOSEFb0ty605VH32P6Rm8Ky95T4D4k
         3x9xbyFZQ9hefUXN59nfxdl62LV9IWW8fDpQ+Syvcj7QNxdXlhGkBhvybwAq5BYyaAEW
         4bgsRUCHQTz9CgqfoqltSUYx0mpwBoSouOybopQu1illjrxHyyJl2DkpqW7lka0Vaw1/
         U6/P5i+Wryc3/7904/v8pPsPP0j57l0S+rsddKjjhSFkMCPrCe1ZoPnV9Ngr//Ct71yA
         m0Plt7bONGx8FCnvS6+PzG+s3lH9j20K5nN3qsiAzu6/5Ezm1rqOQSrU+nJMvBGhxO+I
         qJtw==
X-Forwarded-Encrypted: i=1; AJvYcCVHPzcdquurLSTdvzSAzp3dxWPcIs+UplFhh3p4vKyB0fXSo5Fnbq0THm5H0gEvlebOw9lYCbx9P5WEkxjqsVS6RkiVFQ==
X-Gm-Message-State: AOJu0YzB3a9DsXAcU0gmSdNPf9/IXtNFvN4o0uKu4JZg2YP02NVFFTMM
	uXeUOj6D8+xqIU0vzZk5KBn+9/+tIZjUoxWYbCC07JxiOORB7pzOdqGVq7BV5SMZHp4vWHuyQ54
	vU95IiU7GQJ+TfajCSVyRk5P9sjQ=
X-Google-Smtp-Source: AGHT+IErwkMc01Tf/azIdIDCC7FFkLqYU5zAjx8RMnonJ7nwDnz2JckEoxZsVS70HQzcgO7U5pDHLBjJ+/QXjxztTZ0=
X-Received: by 2002:a17:90b:1054:b0:297:17b0:34e2 with SMTP id
 gq20-20020a17090b105400b0029717b034e2mr1278414pjb.48.1707873267048; Tue, 13
 Feb 2024 17:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240212185858.68189-1-irogers@google.com> <20240212185858.68189-9-irogers@google.com>
In-Reply-To: <20240212185858.68189-9-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 13 Feb 2024 17:14:15 -0800
Message-ID: <CAM9d7chcdJ7zsOEWLo1q-U25YyvP=22+GGxcMEbdkQbW_csoyg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] perf tests: Add option to run tests in parallel
To: Ian Rogers <irogers@google.com>
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

On Mon, Feb 12, 2024 at 10:59=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> By default tests are forked, add an option (-p or --parallel) so that
> the forked tests are all started in parallel and then their output
> gathered serially. This is opt-in as running in parallel can cause
> test flakes.
>
> Rather than fork within the code, the start_command/finish_command
> from libsubcmd are used. This changes how stderr and stdout are
> handled. The child stderr and stdout are always read to avoid the
> child blocking. If verbose is 1 (-v) then if the test fails the child
> stdout and stderr are displayed. If the verbose is >1 (e.g. -vv) then
> the stdout and stderr from the child are immediately displayed.
>
> An unscientific test on my laptop shows the wall clock time for perf
> test without parallel being 5 minutes 21 seconds and with parallel
> (-p) being 1 minute 50 seconds.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v1 of this code had a bug where stdout/stderr weren't read fully. This
> and additional issues/improvements are dealt with in v2.
> ---
[SNIP]
>  static int __cmd_test(int argc, const char *argv[], struct intlist *skip=
list)
>  {
>         struct test_suite *t;
>         unsigned int j, k;
>         int i =3D 0;
>         int width =3D 0;
> +       size_t num_tests =3D 0;
> +       struct child_test **child_tests;
> +       int child_test_num =3D 0;
>
>         for_each_test(j, k, t) {
>                 int len =3D strlen(test_description(t, -1));
>
>                 if (width < len)
>                         width =3D len;
> +
> +               if (has_subtests(t)) {
> +                       for (int l =3D 0, subn =3D num_subtests(t); l < s=
ubn; l++) {
> +                               len =3D strlen(test_description(t, -1));

Shouldn't it be strlen(test_description(t, i)) ?  Looks like it has len
of parent test already.

Thanks,
Namhyung


> +                               if (width < len)
> +                                       width =3D len;
> +                               num_tests++;
> +                       }
> +               } else
> +                       num_tests++;
>         }
> +       child_tests =3D calloc(num_tests, sizeof(*child_tests));
> +       if (!child_tests)
> +               return -ENOMEM;
>
>         for_each_test(j, k, t) {
>                 int curr =3D i++;
> @@ -334,52 +458,47 @@ static int __cmd_test(int argc, const char *argv[],=
 struct intlist *skiplist)
>                                 continue;
>                 }
>
> -               pr_info("%3d: %-*s:", i, width, test_description(t, -1));
> -
>                 if (intlist__find(skiplist, i)) {
> +                       pr_info("%3d: %-*s:", curr + 1, width, test_descr=
iption(t, -1));
>                         color_fprintf(stderr, PERF_COLOR_YELLOW, " Skip (=
user override)\n");
>                         continue;
>                 }
>
>                 if (!has_subtests(t)) {
> -                       test_and_print(t, -1);
> +                       int err =3D start_test(t, curr, -1, &child_tests[=
child_test_num++], width);
> +
> +                       if (err) {
> +                               /* TODO: if parallel waitpid the already =
forked children. */
> +                               free(child_tests);
> +                               return err;
> +                       }
>                 } else {
>                         int subn =3D num_subtests(t);
> -                       /*
> -                        * minus 2 to align with normal testcases.
> -                        * For subtest we print additional '.x' in number=
.
> -                        * for example:
> -                        *
> -                        * 35: Test LLVM searching and compiling         =
               :
> -                        * 35.1: Basic BPF llvm compiling test           =
               : Ok
> -                        */
> -                       int subw =3D width > 2 ? width - 2 : width;
> -
> -                       if (subn <=3D 0) {
> -                               color_fprintf(stderr, PERF_COLOR_YELLOW,
> -                                             " Skip (not compiled in)\n"=
);
> -                               continue;
> -                       }
> -                       pr_info("\n");
>
>                         for (subi =3D 0; subi < subn; subi++) {
> -                               int len =3D strlen(test_description(t, su=
bi));
> +                               int err;
>
> -                               if (subw < len)
> -                                       subw =3D len;
> -                       }
> -
> -                       for (subi =3D 0; subi < subn; subi++) {
>                                 if (!perf_test__matches(test_description(=
t, subi),
>                                                         curr, argc, argv)=
)
>                                         continue;
>
> -                               pr_info("%3d.%1d: %-*s:", i, subi + 1, su=
bw,
> -                                       test_description(t, subi));
> -                               test_and_print(t, subi);
> +                               err =3D start_test(t, curr, subi, &child_=
tests[child_test_num++],
> +                                                width);
> +                               if (err)
> +                                       return err;
>                         }
>                 }
>         }
> +       for (i =3D 0; i < child_test_num; i++) {
> +               if (parallel) {
> +                       int ret  =3D finish_test(child_tests[i], width);
> +
> +                       if (ret)
> +                               return ret;
> +               }
> +               free(child_tests[i]);
> +       }
> +       free(child_tests);
>         return 0;
>  }
>
> @@ -447,6 +566,8 @@ int cmd_test(int argc, const char **argv)
>                     "be more verbose (show symbol address, etc)"),
>         OPT_BOOLEAN('F', "dont-fork", &dont_fork,
>                     "Do not fork for testcase"),
> +       OPT_BOOLEAN('p', "parallel", &parallel,
> +                   "Run the tests altogether in parallel"),
>         OPT_STRING('w', "workload", &workload, "work", "workload to run f=
or testing"),
>         OPT_STRING(0, "dso", &dso_to_test, "dso", "dso to test"),
>         OPT_STRING(0, "objdump", &test_objdump_path, "path",
> --
> 2.43.0.687.g38aa6559b0-goog
>
