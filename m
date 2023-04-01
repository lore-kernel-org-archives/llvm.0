Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBB179
	for <llvm@lists.linux.dev>; Sat,  1 Apr 2023 00:29:46 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id p91so126266uap.1
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 17:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680308986; x=1682900986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBlyoCG5LrraHZ99yJ0ZxyQWhF4R6c4+6bmaGeRq1gw=;
        b=VOvNiOCX/hHBZragGGW64j4rSioqg9mPt/P0JV6Rj203R4Q+DyfBYOqtDnbaHZnk7I
         JHXcFkGhyWLC/fxl/gmy8ZuBY6wNlOqape99jz3Z/GLViw/cNOvValBPssXWlVm709ml
         mHpY6yh4FrF5gMQUkKPnFXDfAuD9ELehiNUc9jl++XTLfKs6ysmjp0B1Shr3x7C+nOHC
         iPuBTIPIVmjdZLXS2mbnyyjAyqMNwaNOnWqSMuRv399gBsuEE2KW86sjYYZb9imodbyH
         Y8XjFSfYs5h3/FcwQvLhS8zDXMj1B2/PjkYvLJSa0akIPQoy4HjHKTUgStdr8FsW2jea
         xatA==
X-Gm-Message-State: AAQBX9dhZy3U55f3JPO166NeRKvnxxJINRMd+C4///IpSQbIAKm4WbQC
	8psUFRPSuD/JjXliLBR+ZzVDc+/t+ggKRY5q810=
X-Google-Smtp-Source: AKy350b+UdbtNsbeWTDuQqjj0QTeUrVOfKAec9umZoelcs51P97qffJSP5Eyk5kH+sVF/2qMlW+KV9vHGDkcD3E4/z8=
X-Received: by 2002:a1f:2d11:0:b0:410:329:baaf with SMTP id
 t17-20020a1f2d11000000b004100329baafmr9888056vkt.16.1680308985712; Fri, 31
 Mar 2023 17:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331004844.1592789-1-irogers@google.com> <20230331004844.1592789-4-irogers@google.com>
In-Reply-To: <20230331004844.1592789-4-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 31 Mar 2023 17:29:34 -0700
Message-ID: <CAM9d7cgRw0mHykCAwZvNP8oAXYUPzEXXaMwvg_krBnyPgrF-3w@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] perf srcline: Support for llvm-addr2line
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 5:49=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> The sentinel value differs for llvm-addr2line. Configure this once and
> then detect when reading records.

Thanks for fixing this!

>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/srcline.c | 65 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> index 2da86e57215d..423ddf3967b0 100644
> --- a/tools/perf/util/srcline.c
> +++ b/tools/perf/util/srcline.c
> @@ -435,7 +435,50 @@ static struct child_process *addr2line_subprocess_in=
it(const char *addr2line_pat
>         return a2l;
>  }
>
> +enum a2l_style {
> +       BROKEN,
> +       GNU_BINUTILS,
> +       LLVM,
> +};
> +
> +static enum a2l_style addr2line_configure(struct child_process *a2l)
> +{
> +       static bool cached;
> +       static enum a2l_style style;
> +
> +       if (!cached) {
> +               char buf[128];
> +               struct io io;
> +               int ch;
> +
> +               if (write(a2l->in, ",\n", 2) !=3D 2)
> +                       return BROKEN;
> +
> +               io__init(&io, a2l->out, buf, sizeof(buf));
> +               ch =3D io__get_char(&io);
> +               if (ch =3D=3D ',') {
> +                       style =3D LLVM;
> +                       cached =3D true;
> +               } else if (ch =3D=3D '?') {
> +                       style =3D GNU_BINUTILS;
> +                       cached =3D true;
> +               } else {
> +                       style =3D BROKEN;
> +               }
> +               do {
> +                       ch =3D io__get_char(&io);
> +               } while (ch > 0 && ch !=3D '\n');

Maybe better to io__getline() ?

> +               if (style =3D=3D GNU_BINUTILS) {
> +                       do {
> +                               ch =3D io__get_char(&io);
> +                       } while (ch > 0 && ch !=3D '\n');
> +               }
> +       }
> +       return style;
> +}
> +
>  static int read_addr2line_record(struct io *io,
> +                                enum a2l_style style,
>                                  char **function,
>                                  char **filename,
>                                  unsigned int *line_nr)
> @@ -462,6 +505,12 @@ static int read_addr2line_record(struct io *io,
>
>         if (io__getline(&line, &line_len, io) < 0 || !line_len)
>                 goto error;
> +
> +       if (style =3D=3D LLVM && line_len =3D=3D 2 && line[0] =3D=3D ',')=
 {
> +               zfree(&line);
> +               return 0;
> +       }
> +
>         if (function !=3D NULL)
>                 *function =3D strdup(strim(line));
>
> @@ -471,7 +520,8 @@ static int read_addr2line_record(struct io *io,
>         if (io__getline(&line, &line_len, io) < 0 || !line_len)
>                 goto error;
>
> -       if (filename_split(line, line_nr =3D=3D NULL ? &dummy_line_nr : l=
ine_nr) =3D=3D 0) {
> +       if (filename_split(line, line_nr =3D=3D NULL ? &dummy_line_nr : l=
ine_nr) =3D=3D 0 &&
> +           style =3D=3D GNU_BINUTILS) {
>                 ret =3D 0;
>                 goto error;
>         }
> @@ -523,6 +573,7 @@ static int addr2line(const char *dso_name, u64 addr,
>         char buf[128];
>         ssize_t written;
>         struct io io;
> +       enum a2l_style a2l_style;
>
>         if (!a2l) {
>                 if (!filename__has_section(dso_name, ".debug_line"))
> @@ -538,6 +589,12 @@ static int addr2line(const char *dso_name, u64 addr,
>                         pr_warning("%s %s: addr2line_subprocess_init fail=
ed\n", __func__, dso_name);
>                 goto out;
>         }
> +       a2l_style =3D addr2line_configure(a2l);
> +       if (a2l_style =3D=3D BROKEN) {
> +               if (!symbol_conf.disable_add2line_warn)
> +                       pr_warning("%s: addr2line configuration failed\n"=
, __func__);
> +               goto out;
> +       }
>
>         /*
>          * Send our request and then *deliberately* send something that c=
an't be interpreted as

Can you please update the comment about the LLVM behavior?

Thanks,
Namhyung


> @@ -557,7 +614,8 @@ static int addr2line(const char *dso_name, u64 addr,
>         }
>         io__init(&io, a2l->out, buf, sizeof(buf));
>
> -       switch (read_addr2line_record(&io, &record_function, &record_file=
name, &record_line_nr)) {
> +       switch (read_addr2line_record(&io, a2l_style,
> +                                     &record_function, &record_filename,=
 &record_line_nr)) {
>         case -1:
>                 if (!symbol_conf.disable_add2line_warn)
>                         pr_warning("%s %s: could not read first record\n"=
, __func__, dso_name);
> @@ -567,7 +625,7 @@ static int addr2line(const char *dso_name, u64 addr,
>                  * The first record was invalid, so return failure, but f=
irst read another
>                  * record, since we asked a junk question and have to cle=
ar the answer out.
>                  */
> -               switch (read_addr2line_record(&io, NULL, NULL, NULL)) {
> +               switch (read_addr2line_record(&io, a2l_style, NULL, NULL,=
 NULL)) {
>                 case -1:
>                         if (!symbol_conf.disable_add2line_warn)
>                                 pr_warning("%s %s: could not read delimit=
er record\n",
> @@ -606,6 +664,7 @@ static int addr2line(const char *dso_name, u64 addr,
>
>         /* We have to read the records even if we don't care about the in=
line info. */
>         while ((record_status =3D read_addr2line_record(&io,
> +                                                     a2l_style,
>                                                       &record_function,
>                                                       &record_filename,
>                                                       &record_line_nr)) =
=3D=3D 1) {
> --
> 2.40.0.348.gf938b09366-goog
>
