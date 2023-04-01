Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF260179
	for <llvm@lists.linux.dev>; Sat,  1 Apr 2023 00:19:18 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id v48so17266536uad.6
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 17:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680308358; x=1682900358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kN1OI426ezj2MWajyPtGNRa8U4BJeq5PITvMLQQ1/Y=;
        b=tuArFal04mMujZ2jMh9CRhIJTeZyxnneIt7vL+IoiC9DSfIqH/i6Aq2s8RSZYDZb72
         PJTLRpFe2MjLZ6ThUTBmzCK5BH251VVrllAjkotebi3rMZs/+NM4gsy0JTatEvAUV4RB
         9serzut97qjVvPmHRIRzUqcIwxgopmjc1sHIlGXzL6JEI4Uz/aokVUJeZGXwi2Mo2+90
         JQZ78UF1z2pj4+BNpYxxcYLvh17xG1MdQTZTT7Mq0H4m7FKict0b5qLEppjFYfDPXL2T
         F/cAy4vVTS3zR5IjF0lnBMCw4+G6XHlJ0zE4MYMyMyR3VgOSAyrih+5bR3HIuHaSWDrE
         F8GA==
X-Gm-Message-State: AAQBX9fuTXZiUXJXc0u1e3mQrJSZeA5WYdhNGqXQMMqBwEISRVvLesVf
	0hNB+t5FaPAukvB1tl/zoPOxKJLGNqb0aXmWs5M=
X-Google-Smtp-Source: AKy350aS07PTliXHfT/6Fq04P4riBefEIEVNi71XSk6owR1j8k7Nb0TCatxE3WstsfhhsfpiDIWmIjP0RuLipcCwExM=
X-Received: by 2002:a05:6122:2e9:b0:400:f286:4e07 with SMTP id
 b9-20020a05612202e900b00400f2864e07mr11620548vko.9.1680308357755; Fri, 31 Mar
 2023 17:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331004844.1592789-1-irogers@google.com> <20230331004844.1592789-2-irogers@google.com>
In-Reply-To: <20230331004844.1592789-2-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 31 Mar 2023 17:19:06 -0700
Message-ID: <CAM9d7cjXGO-xd1tKDUHUrYtG=94aXnubRrUNe6EmyuGwo3=okA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] tools api: Add io__getline
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Thu, Mar 30, 2023 at 5:49=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Reads a line to allocated memory up to a newline following the getline
> API.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/lib/api/io.h        | 40 +++++++++++++++++++++++++++++++++++++++
>  tools/perf/tests/api-io.c | 36 +++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>
> diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
> index 777c20f6b604..d874e8fa8b07 100644
> --- a/tools/lib/api/io.h
> +++ b/tools/lib/api/io.h
> @@ -7,7 +7,9 @@
>  #ifndef __API_IO__
>  #define __API_IO__
>
> +#include <errno.h>
>  #include <stdlib.h>
> +#include <string.h>
>  #include <unistd.h>
>
>  struct io {
> @@ -112,4 +114,42 @@ static inline int io__get_dec(struct io *io, __u64 *=
dec)
>         }
>  }
>
> +/* Read up to and including the first newline following the pattern of g=
etline. */
> +static inline ssize_t io__getline(char **line_out, size_t *line_len_out,=
 struct io *io)
> +{
> +       char buf[128];
> +       int buf_pos =3D 0;
> +       char *line =3D NULL;
> +       size_t line_len =3D 0;
> +       int ch =3D 0;
> +
> +       /* TODO: reuse previously allocated memory. */
> +       free(*line_out);
> +       while (ch !=3D '\n') {
> +               ch =3D io__get_char(io);
> +
> +               if (ch < 0)
> +                       break;
> +
> +               if (buf_pos =3D=3D sizeof(buf)) {
> +                       line =3D realloc(line, line_len + sizeof(buf));
> +                       if (!line)
> +                               return -ENOMEM;

We can use a temp variable for the failure case, and also free
the original line before returning the error.


> +                       memcpy(&line[line_len], buf, sizeof(buf));
> +                       line_len +=3D sizeof(buf);
> +                       buf_pos =3D 0;
> +               }
> +               buf[buf_pos++] =3D (char)ch;
> +       }
> +       line =3D realloc(line, line_len + buf_pos + 1);
> +       if (!line)
> +               return -ENOMEM;

Ditto.

Thanks,
Namhyung


> +       memcpy(&line[line_len], buf, buf_pos);
> +       line[line_len + buf_pos] =3D '\0';
> +       line_len +=3D buf_pos;
> +       *line_out =3D line;
> +       *line_len_out =3D line_len;
> +       return line_len;
> +}
> +
>  #endif /* __API_IO__ */
> diff --git a/tools/perf/tests/api-io.c b/tools/perf/tests/api-io.c
> index e91cf2c127f1..0ff39cdfcb01 100644
> --- a/tools/perf/tests/api-io.c
> +++ b/tools/perf/tests/api-io.c
> @@ -289,6 +289,40 @@ static int test_get_dec(void)
>         return ret;
>  }
>
> +static int test_get_line(void)
> +{
> +       char path[PATH_MAX];
> +       struct io io;
> +       char test_string[1024];
> +       char *line =3D NULL;
> +       size_t i, line_len =3D 0;
> +       size_t buf_size =3D 128;
> +       int ret =3D 0;
> +
> +       for (i =3D 0; i < 512; i++)
> +               test_string[i] =3D 'a';
> +       test_string[512] =3D '\n';
> +       for (i =3D 513; i < 1023; i++)
> +               test_string[i] =3D 'b';
> +       test_string[1023] =3D '\0';
> +
> +       if (setup_test(path, test_string, buf_size, &io))
> +               return -1;
> +
> +       EXPECT_EQUAL((int)io__getline(&line, &line_len, &io), 513);
> +       EXPECT_EQUAL((int)strlen(line), 513);
> +       for (i =3D 0; i < 512; i++)
> +               EXPECT_EQUAL(line[i], 'a');
> +       EXPECT_EQUAL(line[512], '\n');
> +       EXPECT_EQUAL((int)io__getline(&line, &line_len, &io), 510);
> +       for (i =3D 0; i < 510; i++)
> +               EXPECT_EQUAL(line[i], 'b');
> +
> +       free(line);
> +       cleanup_test(path, &io);
> +       return ret;
> +}
> +
>  static int test__api_io(struct test_suite *test __maybe_unused,
>                         int subtest __maybe_unused)
>  {
> @@ -300,6 +334,8 @@ static int test__api_io(struct test_suite *test __may=
be_unused,
>                 ret =3D TEST_FAIL;
>         if (test_get_dec())
>                 ret =3D TEST_FAIL;
> +       if (test_get_line())
> +               ret =3D TEST_FAIL;
>         return ret;
>  }
>
> --
> 2.40.0.348.gf938b09366-goog
>
