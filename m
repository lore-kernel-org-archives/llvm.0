Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65886882A
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 19:17:37 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b3e3f33e33so35215ad.0
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686597456; x=1689189456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZZnDMehrpoBA93zHNtYxRT8/Ymf8pvYvAg1yVBg5/4=;
        b=keY5rgqjJR3aCNXzC9vjyaZW9XOrpvERMqGkM4RxD6n7d+2NEfDZZ92PYFuo9O6DWW
         Lv3KMuyeOjYtG1xyoh1zJUSlAwIIK9gsnY3TEzwKg+R0brkH6ZwHMKMymynW4TfPymIN
         jlwlWRyrtC+tJzS8iquz45RJalu3azLVbw8T138oVbci21AmAsc8vqwgtau+qLB/WfNW
         tkP7jkYewZz0ISAIdhl3aNb75FPS1PjdP4AIvWDklpjanIPapq65Uty09NVXyjTIpaok
         CXVY8gl//Wpqasw7eweqDmohZ53SeHuGKh8WiukFSvXqQF+OewbxrWBfuO0uWNrWJjIN
         VIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686597456; x=1689189456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZZnDMehrpoBA93zHNtYxRT8/Ymf8pvYvAg1yVBg5/4=;
        b=BgNJcXtylvJGMJf708tXwX8a7T1S8d6LzO/yIkLLahmC0EjazjkDjsVTZzr8V5qSo7
         SuQD68Npux4Nax/VXJukpDVFNBLdffCLIE5kzcDwFMByVHSqzd+zIf1kTwsHKCsGs2fp
         0nnRTMiScNt8eNTSxm/+iQDMui5lbI0LWDaSPlqGfD2z76xygYbI4HwFHTxlG86El+ey
         opQdAt7yoGRX73kJE13DEHawOJk6lJa6/hdoQCDuhmQdJrcotqT8llJGu0a2HVOwAN7O
         JsmCIOUyYkzLQiqUXJhtlkp5fHjGlQWcx4iIndD3jjzraCFA1LjmDaJgZjUxdFwwpQrA
         ofbg==
X-Gm-Message-State: AC+VfDxBFlZdhU8dFI+lJJagR09ISKCDY3/YlwBZrgg8urkReL1gIeww
	W0Ct+yxScqJbzzErvfFfcUavsO1deHFXSgBL0RjfDw==
X-Google-Smtp-Source: ACHHUZ6pzrAp8DYHzFw09Om/1sOsX4ebRUPfbmfEHrmKwvP+eaKyiX6qR5FZuTeM/RkNT+3DUev3KPnY5kL+KFHpjVw=
X-Received: by 2002:a17:902:e84b:b0:1b1:d1fe:e73 with SMTP id
 t11-20020a170902e84b00b001b1d1fe0e73mr35074plg.8.1686597456453; Mon, 12 Jun
 2023 12:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230609235419.204624-1-irogers@google.com> <20230609235419.204624-2-irogers@google.com>
 <ZIdt18EmHQBgiWXF@kernel.org>
In-Reply-To: <ZIdt18EmHQBgiWXF@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Jun 2023 12:17:24 -0700
Message-ID: <CAP-5=fUnS7yC+d4Xey0YMuOJcaXRBscjvD5i=q=vjS_7cgW3gw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] perf srcline: Make sentinel reading for binutils
 addr2line more robust
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Changbin Du <changbin.du@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:11=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Fri, Jun 09, 2023 at 04:54:19PM -0700, Ian Rogers escreveu:
> > The addr2line process is sent an address then multiple function,
> > filename:line "records" are read. To detect the end of output a ',' is
> > sent and for llvm-addr2line a ',' is then read back showing the end of
> > addrline's output. For binutils addr2line the ',' translates to
> > address 0 and we expect the bogus filename marker "??:0" (see
> > filename_split) to be sent from addr2line. For some kernels address 0
> > may have a mapping and so a seemingly valid inline output is given and
> > breaking the sentinel discovery:
> >
> > ```
> > $ addr2line -e vmlinux -f -i
> > ,
> > __per_cpu_start
> > ./arch/x86/kernel/cpu/common.c:1850
> > ```
> >
> > To avoid this problem enable the address dumping for addr2line (the -a
> > option). If an address of 0x0000000000000000 is read then this is the
> > sentinel value working around the problem above. The filename_split
> > still needs to check for "??:0" as bogus non-zero addresses also need
> > handling.
> >
> > Reported-by: Changbin Du <changbin.du@huawei.com>
>
> Changbin,
>
>         Did this fix the problem you reported? If so can I have your
> Tested-by?

There are ongoing issues that Changbin has found, the thread is here:
https://lore.kernel.org/linux-perf-users/CAP-5=3DfWdvMVOiZDhqiz1R9hucz+6+ho=
_L3jBixqP3YLcJD7Lew@mail.gmail.com/

Thanks,
Ian

> Thanks,
>
> - Arnaldo
>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/srcline.c | 61 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 53 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> > index fc85cdd6c8f9..c99a001453b4 100644
> > --- a/tools/perf/util/srcline.c
> > +++ b/tools/perf/util/srcline.c
> > @@ -406,7 +406,7 @@ static struct child_process *addr2line_subprocess_i=
nit(const char *addr2line_pat
> >       const char *argv[] =3D {
> >               addr2line_path ?: "addr2line",
> >               "-e", binary_path,
> > -             "-i", "-f", NULL
> > +             "-a", "-i", "-f", NULL
> >       };
> >       struct child_process *a2l =3D zalloc(sizeof(*a2l));
> >       int start_command_status =3D 0;
> > @@ -461,10 +461,10 @@ static enum a2l_style addr2line_configure(struct =
child_process *a2l, const char
> >                       style =3D LLVM;
> >                       cached =3D true;
> >                       lines =3D 1;
> > -             } else if (ch =3D=3D '?') {
> > +             } else if (ch =3D=3D '0') {
> >                       style =3D GNU_BINUTILS;
> >                       cached =3D true;
> > -                     lines =3D 2;
> > +                     lines =3D 3;
> >               } else {
> >                       if (!symbol_conf.disable_add2line_warn) {
> >                               char *output;
> > @@ -516,20 +516,64 @@ static int read_addr2line_record(struct io *io,
> >       if (line_nr !=3D NULL)
> >               *line_nr =3D 0;
> >
> > +     /*
> > +      * Read the first line. Without an error this will be either an a=
ddress
> > +      * like 0x1234 or for llvm-addr2line the sentinal ',' character.
> > +      */
> >       if (io__getline(io, &line, &line_len) < 0 || !line_len)
> >               goto error;
> >
> > -     if (style =3D=3D LLVM && line_len =3D=3D 2 && line[0] =3D=3D ',')=
 {
> > -             zfree(&line);
> > -             return 0;
> > +     if (style =3D=3D LLVM) {
> > +             if (line_len =3D=3D 2 && line[0] =3D=3D ',') {
> > +                     zfree(&line);
> > +                     return 0;
> > +             }
> > +     } else {
> > +             int zero_count =3D 0, non_zero_count =3D 0;
> > +
> > +             /* The address should always start 0x. */
> > +             if (line_len < 2 || line[0] !=3D '0' || line[1] !=3D 'x')
> > +                     goto error;
> > +
> > +             for (size_t i =3D 2; i < line_len; i++) {
> > +                     if (line[i] =3D=3D '0')
> > +                             zero_count++;
> > +                     else
> > +                             non_zero_count++;
> > +             }
> > +             if (!non_zero_count) {
> > +                     int ch;
> > +
> > +                     if (!zero_count) {
> > +                             /* Line was erroneous just '0x'. */
> > +                             goto error;
> > +                     }
> > +                     /*
> > +                      * Line was 0x0..0, the sentinel for binutils. Re=
move
> > +                      * the function and filename lines.
> > +                      */
> > +                     zfree(&line);
> > +                     do {
> > +                             ch =3D io__get_char(io);
> > +                     } while (ch > 0 && ch !=3D '\n');
> > +                     do {
> > +                             ch =3D io__get_char(io);
> > +                     } while (ch > 0 && ch !=3D '\n');
> > +                     return 0;
> > +             }
> >       }
> >
> > +     /* Read the second function name line. */
> > +     if (io__getline(io, &line, &line_len) < 0 || !line_len)
> > +             goto error;
> > +
> >       if (function !=3D NULL)
> >               *function =3D strdup(strim(line));
> >
> >       zfree(&line);
> >       line_len =3D 0;
> >
> > +     /* Read the third filename and line number line. */
> >       if (io__getline(io, &line, &line_len) < 0 || !line_len)
> >               goto error;
> >
> > @@ -633,8 +677,9 @@ static int addr2line(const char *dso_name, u64 addr=
,
> >               goto out;
> >       case 0:
> >               /*
> > -              * The first record was invalid, so return failure, but f=
irst read another
> > -              * record, since we asked a junk question and have to cle=
ar the answer out.
> > +              * The first record was invalid, so return failure, but f=
irst
> > +              * read another record, since we sent a sentinel ',' for =
the
> > +              * sake of detected the last inlined function.
> >                */
> >               switch (read_addr2line_record(&io, a2l_style, NULL, NULL,=
 NULL)) {
> >               case -1:
> > --
> > 2.41.0.162.gfafddb0af9-goog
> >
>
> --
>
> - Arnaldo
