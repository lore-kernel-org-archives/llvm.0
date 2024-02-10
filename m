Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC04110A
	for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 04:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707540069; cv=none; b=W61VtQaOyAyk45fM1TVeU4acPC3468Yva9/S30X3+xxQIRRSXBUVZxPN5rRdjXLouwjgeTx0jVuQRCq3GZA7JAeyYeFRXbcmC36h0dtrDR/+W+Ok7u8SJRIDbwuS0LBtwhf4GdzkqKJnxfw4fezEgsH8NN8XFFwuAFBf+5r1C0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707540069; c=relaxed/simple;
	bh=glEKylj6hGoshCUUwb23D4sXjlqavO0BCnKPI92hvlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCEIMa6XCzcnHRG+VhUzPHL128gxYnkrweMGD9TMt+ccMmTmQQ9q16jFt0ifj8ro9Qsl3apKhF9U8YzFiCbW2QblZ9WPCQfZvyNU69ZUvVNkBrLOt/02GzGQ2ZJKmwv1/AsnxPB8uZZMWZoxKghksbpKUwqBU57F1rCqVKuPIdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-59a87156cb8so629477eaf.2
        for <llvm@lists.linux.dev>; Fri, 09 Feb 2024 20:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707540067; x=1708144867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZCGeaOgFb/POuILW7FEZXlx24Rn7F7T3YvkEdqGZn8=;
        b=rTpdauw/fvvM/CPV+mzskWd2Nxek342/hwIIJ3qQ2kCz0J/nnfH4KIbLPgmP7bjVRp
         4ktWgHoGGjQ0rKticKUsTZ1qd0zgtpvL5hYqw832M/6sZ+fk+JDgh/0Tq4byUNzuHkHo
         Kf8nhF99ykx3R5UhE2t9MSYlDfV8D6vahnBA0GzamU2bripY/WT3qeAbL/7qZcnqZzY/
         dHmevU9fZacyCxBNRNjz0ec3bTusXrC6fDyzKAvGbaz+CeEz98a+1BWyMWqDAVB2Y11g
         cRAbOweRm1FRzvOk4gmGLE5RYoEuPqF5n4OOJJiKpELr9aEqdk9MbInsulnGOpnIC/tL
         L2tg==
X-Forwarded-Encrypted: i=1; AJvYcCXfRqzqDS7UTZDWfGzmlcVv6iFehYPCf3JmoJVNYSahXmlmoMGdMSmP9NRTC4qwmqM6brBWbiYY4suB0gbbilK8hLCgGQ==
X-Gm-Message-State: AOJu0Yxho0QACc/IzrlK7JESmRAp4mHSUC6aTGIz2MgxM/l9SXmzOhN0
	dzVlpHUtZR1+vMqTiqVMFyEzqpDzKi0ChPXdbzIvcPKeuF6BniVstsEsCrXXettwhB7m8cLHHqA
	S00nEym84rgD2CQ5r3D4UpsP0XSk=
X-Google-Smtp-Source: AGHT+IEJ/x2TjQP1hdkhnSUv18VsQ0EdYULkKuKuNTVsNhbj3HngAA7gbe7Ti38jDWoSmT5WSwMTz2Cq/iSJVKXP2VQ=
X-Received: by 2002:a05:6358:5985:b0:179:22c:4a4d with SMTP id
 c5-20020a056358598500b00179022c4a4dmr2150235rwf.22.1707540066959; Fri, 09 Feb
 2024 20:41:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com> <20240201001504.1348511-6-irogers@google.com>
In-Reply-To: <20240201001504.1348511-6-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 9 Feb 2024 20:40:54 -0800
Message-ID: <CAM9d7cjka_O5OmCxkrp-K6g45VnxEJNd73jjv6kQanutf+6sbg@mail.gmail.com>
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

On Wed, Jan 31, 2024 at 4:15=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Avoid filename appending buffers by using openat, faccessat and
> scandirat more widely. Turn the script's path back to a file name
> using readlink from /proc/<pid>/fd/<fd>.
>
> Read the script's description using api/io.h to avoid fdopen
> conversions. Whilst reading perform additional sanity checks on the
> script's contents.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
[SNIP]
> -static const char *shell_test__description(char *description, size_t siz=
e,
> -                                           const char *path, const char =
*name)
> +static char *shell_test__description(int dir_fd, const char *name)
>  {
> -       FILE *fp;
> -       char filename[PATH_MAX];
> -       int ch;
> +       struct io io;
> +       char buf[128], desc[256];
> +       int ch, pos =3D 0;
>
> -       path__join(filename, sizeof(filename), path, name);
> -       fp =3D fopen(filename, "r");
> -       if (!fp)
> +       io__init(&io, openat(dir_fd, name, O_RDONLY), buf, sizeof(buf));
> +       if (io.fd < 0)
>                 return NULL;
>
>         /* Skip first line - should be #!/bin/sh Shebang */
> +       if (io__get_char(&io) !=3D '#')
> +               goto err_out;
> +       if (io__get_char(&io) !=3D '!')
> +               goto err_out;
>         do {
> -               ch =3D fgetc(fp);
> -       } while (ch !=3D EOF && ch !=3D '\n');
> -
> -       description =3D fgets(description, size, fp);
> -       fclose(fp);
> +               ch =3D io__get_char(&io);
> +               if (ch < 0)
> +                       goto err_out;
> +       } while (ch !=3D '\n');
>
> -       /* Assume first char on line is omment everything after that desc=
 */
> -       return description ? strim(description + 1) : NULL;
> +       do {
> +               ch =3D io__get_char(&io);
> +               if (ch < 0)
> +                       goto err_out;
> +       } while (ch =3D=3D '#' || isspace(ch));
> +       while (ch > 0 && ch !=3D '\n') {
> +               desc[pos++] =3D ch;
> +               if (pos >=3D (int)sizeof(desc) - 1)

Maybe (pos =3D=3D sizeof(desc) - 2) ?  I'm not sure what happens if it has =
a
description longer than the buffer size.

> +                       break;
> +               ch =3D io__get_char(&io);
> +       }
> +       while (pos > 0 && isspace(desc[--pos]))
> +               ;
> +       desc[++pos] =3D '\0';

Wouldn't it overflow the buffer?

Thanks,
Namhyung


> +       close(io.fd);
> +       return strdup(desc);
> +err_out:
> +       close(io.fd);
> +       return NULL;
>  }
