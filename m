Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C847E2
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 00:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707871929; cv=none; b=JqKcuJb1D6T37LbM6b5H2s6FtzKsEH+xoqkV+Cn+QvF0hy8gQHMcUXSnMVaX+NN88r1EGBpan3AifuP/j7txhIXQHotxErsrJqzXBzySZrYArkOxUpHVETtdN4UFmQj7Xmb/yhAIGgJgHCj0HIahQ8ZxgFnhVxjXv5EfOPisTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707871929; c=relaxed/simple;
	bh=2+YC4GCoCVjMy2Ct2cJUi3Cr5RlvqD+v+ENXkPB6w7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g47Bj1PTOpd1KsqnblIKRDfl4vludUi9KZlT1QoOS2ezdKmAAQyrjTin2mZU/3vm3LBBQFnxXb86q10V0Q/jT2ZWbFwJfvsImGMzj+yTp3cAnav9cOeiZffyI+QOiWXqdJNKM8GWjV5qWmHctFm8AcBbBiBo58OoaJAa/waie5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d8df2edd29so1100747a12.2
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 16:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707871928; x=1708476728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wD7TEKagSlKHEJT8nomaZPXwtx6sNloUd/DUQpDUnxI=;
        b=Q1LhvleO3VVxvfQH3ETgK+q5qegvgzZYq86W+uqb8B0Gt7k7qDMp15F8mhT9MXM35V
         v0DmN7cNK0BZDRUG1MlIXdvCo0LVt3tBqOLFsm8fYZtgUoa0vsFp5JQUffqiDLMjsWGG
         zP4rTZbz1bb/AjzbMui/bNzXCAr5RtozpIIQ9Hf8D8d35aR/tLgKPgq4rAGQpOPFtS4J
         Lv6/P2pCDER8ztHr4PNuNIRXLMs/u+9VfU2IEDqksE1nA6xCZkO5LxfiwFsILWdwScst
         CSNZLiQf2k+rbDGWkxz5LR6EhspoCIT3s7rke/Z8lgJD9WB81iU3J1ScRxLd8ELLzMnK
         1dMg==
X-Forwarded-Encrypted: i=1; AJvYcCWJoMK0fRc9jZdIQLRotVYKqsiQ4s9tQLX2DWdHUKlqQp5prhoRUky+AbTVOxpzinDj4228ni7jJi1BkPrm6b/I9mGA9A==
X-Gm-Message-State: AOJu0YxBq13cf/4KCLxR4cJMjNcO6asi491m2AGXQPl2fpoP97P21YvY
	klpoPaykGM4TalKmO3vwcdLhgn+ppfhJ+m+vRVlZiCH106ju8JENjJ5R6GgA5itJof1aOA5/vFl
	PigR1puUZgZz+yYPKO0onvcGggeQ=
X-Google-Smtp-Source: AGHT+IG+bcT6feAmOjm0Rab9dbCrben3IbMYbnj/T7bjKQwI4D7q2hILoTEpOFQyLG6+V+SMtW2W36vE+dFPbh/EGZc=
X-Received: by 2002:a17:90a:d504:b0:297:bb6:cbe4 with SMTP id
 t4-20020a17090ad50400b002970bb6cbe4mr1007302pju.27.1707871927459; Tue, 13 Feb
 2024 16:52:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com> <20240201001504.1348511-6-irogers@google.com>
 <CAM9d7cjka_O5OmCxkrp-K6g45VnxEJNd73jjv6kQanutf+6sbg@mail.gmail.com> <CAP-5=fV1dA_hbH=UAZFL8DeuRzvRqW51-gQFSpuEsHpWEDDtWw@mail.gmail.com>
In-Reply-To: <CAP-5=fV1dA_hbH=UAZFL8DeuRzvRqW51-gQFSpuEsHpWEDDtWw@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 13 Feb 2024 16:51:56 -0800
Message-ID: <CAM9d7cim3Geib9QNrtL6FVH-gg-=metH_u_yKnJFa+G=maOz3A@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] perf tests: Use scandirat for shell script finding
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 8:07=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Fri, Feb 9, 2024 at 8:41=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
> >
> > On Wed, Jan 31, 2024 at 4:15=E2=80=AFPM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > Avoid filename appending buffers by using openat, faccessat and
> > > scandirat more widely. Turn the script's path back to a file name
> > > using readlink from /proc/<pid>/fd/<fd>.
> > >
> > > Read the script's description using api/io.h to avoid fdopen
> > > conversions. Whilst reading perform additional sanity checks on the
> > > script's contents.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > [SNIP]
> > > -static const char *shell_test__description(char *description, size_t=
 size,
> > > -                                           const char *path, const c=
har *name)
> > > +static char *shell_test__description(int dir_fd, const char *name)
> > >  {
> > > -       FILE *fp;
> > > -       char filename[PATH_MAX];
> > > -       int ch;
> > > +       struct io io;
> > > +       char buf[128], desc[256];
> > > +       int ch, pos =3D 0;
> > >
> > > -       path__join(filename, sizeof(filename), path, name);
> > > -       fp =3D fopen(filename, "r");
> > > -       if (!fp)
> > > +       io__init(&io, openat(dir_fd, name, O_RDONLY), buf, sizeof(buf=
));
> > > +       if (io.fd < 0)
> > >                 return NULL;
> > >
> > >         /* Skip first line - should be #!/bin/sh Shebang */
> > > +       if (io__get_char(&io) !=3D '#')
> > > +               goto err_out;
> > > +       if (io__get_char(&io) !=3D '!')
> > > +               goto err_out;
> > >         do {
> > > -               ch =3D fgetc(fp);
> > > -       } while (ch !=3D EOF && ch !=3D '\n');
> > > -
> > > -       description =3D fgets(description, size, fp);
> > > -       fclose(fp);
> > > +               ch =3D io__get_char(&io);
> > > +               if (ch < 0)
> > > +                       goto err_out;
> > > +       } while (ch !=3D '\n');
> > >
> > > -       /* Assume first char on line is omment everything after that =
desc */
> > > -       return description ? strim(description + 1) : NULL;
> > > +       do {
> > > +               ch =3D io__get_char(&io);
> > > +               if (ch < 0)
> > > +                       goto err_out;
> > > +       } while (ch =3D=3D '#' || isspace(ch));
> > > +       while (ch > 0 && ch !=3D '\n') {
> > > +               desc[pos++] =3D ch;
> > > +               if (pos >=3D (int)sizeof(desc) - 1)
> >
> > Maybe (pos =3D=3D sizeof(desc) - 2) ?  I'm not sure what happens if it =
has a
> > description longer than the buffer size.
>
> Thanks Namhyung!
>
> sizeof(desc) - 1 =3D=3D sizeof(char[256]) - 1 =3D=3D 255 , so at this poi=
nt
> pos can at most be 255 and there is one space after pos for a trailing
> '\0'.
>
> > > +                       break;
> > > +               ch =3D io__get_char(&io);
> > > +       }
> > > +       while (pos > 0 && isspace(desc[--pos]))
> > > +               ;
>
> Here pos is moved back to at least one to 254.

Oh, right.  I missed it moved the pos back.

Thanks,
Namhyung

>
> > > +       desc[++pos] =3D '\0';
> >
> > Wouldn't it overflow the buffer?
>
> At this point pos can only have a maximum value of 255 which is within
> the bounds of desc.
>
> Thanks,
> Ian
>
> > Thanks,
> > Namhyung
> >
> >
> > > +       close(io.fd);
> > > +       return strdup(desc);
> > > +err_out:
> > > +       close(io.fd);
> > > +       return NULL;
> > >  }
