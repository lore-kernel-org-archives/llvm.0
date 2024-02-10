Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C73110A
	for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707540143; cv=none; b=RQMq4l+n1A6oSf2MpNxP6HH7a1q66GGCXTXS70Qk1Ym9JTsx+E6OPkf+vlViOb031C/jdLQAZIBQ3WRXo4R+IVx2IkX11UWU3GANzdXYTUSqTYlyRgHynk28I00xUfhlksAw9sgoS8jsO5v5/9IL6Mi0aVjfT5SYag6pzrU/xjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707540143; c=relaxed/simple;
	bh=T2ASNije7gX81LNlvMmud6Kc73BC7zKEk9U2E6S4JHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZxflUoZ36MKd7XYQZQb213YBCsa172dRnqlAN79fcYtpOMAvs1WKzNvCt9Uw0H+VkdebBU5yJKT9WWOGoNy7gE5JHgqkprEhrsuaSPGkMcsik+Bqcm6HymxsnZJCgI0CfQTQGv86xEWYcUYiYmS+UCS8yExc9DZWIeAILZLdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-296db7e258dso1176796a91.0
        for <llvm@lists.linux.dev>; Fri, 09 Feb 2024 20:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707540142; x=1708144942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOncT+gChfuvB+kGoeOPvG9sQftVVeruKeAijPzHPfs=;
        b=d+sAl7GChPG3kvQSm5Sg4JpR8+UD8JfHdZSTlS00LPTFz7V3YOR0t0Drb5DLm9Xi40
         8+6VA0pKaVYx8TQN8yNQiosxBmOzTQWD0yu3vf6E6LOjYLV0Fr43sPRh2Y2ibJ9pS6Xi
         sFhNozqRvQF+zSeD9bikAhbFYzEZ3yXDwrFRSPOVqpdqXjYwgkLfiqiQZXhFeVcIX+sc
         i4LWuwQuyPgWufpoIX3p9zqJeq3jODvaSKdiN5KUjnHeAsOiZWo4JzlnCfz68Rl2c5hT
         vIM6GZVKq15KY+xq2ZPkbgLUPIeSbKWF8sT2U+MjmOaLA8vj19UVx1zUl/f+fNZZt5si
         hsaw==
X-Forwarded-Encrypted: i=1; AJvYcCWW0iHz2eXV97sxhn/yT9C4ecCE7L27bN1jRcDwejBIGz14GwFh7yVSm5sbbCRuRm1Zromaau0iRJ2obLXF2DS+OSo5HQ==
X-Gm-Message-State: AOJu0Yx8qpIc8gxNeLwl3HiHRwBNij97SwwuNedHKh575tEciGe5Avk1
	i4tIB+ANpjaEoWI4wg68mj4CjkHs6gOBx+KuoFQnQKl4No0mDRWPDK4KY0Io/kk5nBTePDP6Lik
	77EXM3OAXVMTMxbM/9tOgJk+UwDg=
X-Google-Smtp-Source: AGHT+IEEOGs8eYYJcn54c8V2Nckuq5c37tHGiBPyRpxxSegy6QGfNKKjHBSxfglzNgWTCxni6d3Zo8RdJT+D7EK6/r0=
X-Received: by 2002:a17:90a:6f46:b0:296:4e2f:a680 with SMTP id
 d64-20020a17090a6f4600b002964e2fa680mr4366458pjk.10.1707540141565; Fri, 09
 Feb 2024 20:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com> <20240201001504.1348511-8-irogers@google.com>
 <CAM9d7cih+JqmhVOSoYmRUK2+FRWnknQ6VucYpg5ZC01BYqdv=Q@mail.gmail.com>
In-Reply-To: <CAM9d7cih+JqmhVOSoYmRUK2+FRWnknQ6VucYpg5ZC01BYqdv=Q@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 9 Feb 2024 20:42:09 -0800
Message-ID: <CAM9d7ci-qxL0r6SOh0_bktS33OBf6JoOE3LJzmcZgZV_uNzcLA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] perf srcline: Add missed addr2line closes
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

On Fri, Feb 9, 2024 at 4:21=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Wed, Jan 31, 2024 at 4:15=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > The child_process for addr2line sets in and out to -1 so that pipes
> > get created. It is the caller's responsibility to close the pipes,
> > finish_command doesn't do it. Add the missed closes.
> >
> > Fixes: b3801e791231 ("perf srcline: Simplify addr2line subprocess")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/srcline.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> > index 034b496df297..7addc34afcf5 100644
> > --- a/tools/perf/util/srcline.c
> > +++ b/tools/perf/util/srcline.c
> > @@ -399,6 +399,8 @@ static void addr2line_subprocess_cleanup(struct chi=
ld_process *a2l)
> >                 kill(a2l->pid, SIGKILL);
> >                 finish_command(a2l); /* ignore result, we don't care */
> >                 a2l->pid =3D -1;
> > +               close(a2l->in);
> > +               close(a2l->out);
>
> I was about to ask the stderr, but addr2line_subprocess_init()
> sets a2l->no_stderr already.
>
> I wish it could be handled in finish_command() but it seems
> the API allows setting external file descriptors (before calling
> start_command).  Hmm..
>
> Anyway it looks like an independent fix.

I'll apply this separately.

Thanks,
Namhyung
