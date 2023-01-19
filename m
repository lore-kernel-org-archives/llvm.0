Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88FA93E
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 16:57:35 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r30so2472250wrr.10
        for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 08:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg10deSIR4Ota9oUJc2Wj0K5H8oRSFmTEIwjyRfBUc4=;
        b=D6Y71Fe1wki2Musy+TA40xb7XSwRdiZWBuN2sC+WHD+gjRvKy3yw9EgVvqvUJ2nq7g
         epLHHWdogKGwNmqLD2ppF5QXJJDSBGOuoNkb6eQRZ5pTUnAfuwk+i4DwI63vVAb3NQCk
         E9vCQvRCi25QA+R3DPA8FJL9MnB7l3e8ur4drv22EL5K/xTK4tq04ULY1usp3DwxcUSZ
         bIEmfggZoB9SMOjpUAFOQ+U0Iz/I5rBKS2XUBEs2hPIH+GZefswZXfinz+tyTgKSEfAd
         N/ngB68GLw2jLBdf3v5Tegsn13wBvWECesagTKN4uivAnDkra/jIdP/NJv3+04UrpuWB
         I7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg10deSIR4Ota9oUJc2Wj0K5H8oRSFmTEIwjyRfBUc4=;
        b=eruKRezQQChqatqKsGjBiQgjYy2V/ua1+S06uRLOJSXY1z0KoTrVFSCZDFX/FnbZ0/
         Ui05W6mxq0PuT6NH7RGxoe+6RSSZmLv7pcYZr5F1Yx8TzqAwpnVWSO/HMc6Zi9+bXVzY
         1o/Q/kV2XluNbnkk74550LFlZO/Z5tXtwMM9PW224dwbymT2UI4tBrRsa8LAZA595ihQ
         vAyLkArKViyYWXDgdWymv1fQGjPUAwrWY39GOxJKWekUqqRIaU7Xi8J6mUWBvKspaIMO
         d5BFs8xm8N413NO/XmA7B6bBq/JhSlVfF7h+OxdOM8tXLtYTsnnYWyLHdyPsy8r3azd7
         hAoA==
X-Gm-Message-State: AFqh2kr77NtEPlF5bdPNCOJXzizFlKgi86A9pZuypfvP9H0EeafOUzK/
	k0mr7i/zGzaprTvVqHklbyaXPn0mbU+IXNt48ALGpw==
X-Google-Smtp-Source: AMrXdXtfCEkciDijv/IzIePJAPvYftCBTTHPqm2fosbWZbxgHc/G+pTkqQbugWtmfAxrrkJWeu3RUFtkJE9+Hq9q37s=
X-Received: by 2002:adf:e2cd:0:b0:2bd:f8da:9be0 with SMTP id
 d13-20020adfe2cd000000b002bdf8da9be0mr393900wrj.375.1674147453954; Thu, 19
 Jan 2023 08:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230113185732.134861-1-irogers@google.com> <CAP-5=fXg28wcW93tfiN6mdFHj0+eSRE3dL3LTv53bRYuezjZDg@mail.gmail.com>
 <Y8lv6oclCytPk7hN@kernel.org> <Y8lyVTwQqzWk0mLd@kernel.org>
In-Reply-To: <Y8lyVTwQqzWk0mLd@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 Jan 2023 08:57:21 -0800
Message-ID: <CAP-5=fVWgHGxUqvn2pw8+dfQ7gXpLHJA0ewQUuR-sgH10744aA@mail.gmail.com>
Subject: Re: [PATCH] perf buildid: Avoid copy of uninitialized memory
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 8:39 AM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Thu, Jan 19, 2023 at 01:29:30PM -0300, Arnaldo Carvalho de Melo escreveu:
> > Em Thu, Jan 19, 2023 at 08:08:13AM -0800, Ian Rogers escreveu:
> > > On Fri, Jan 13, 2023 at 10:57 AM Ian Rogers <irogers@google.com> wrote:
> > > >
> > > > build_id__init only copies the buildid data up to size leaving the
> > > > rest of the data array uninitialized. Copying the full array during
> > > > synthesis means the written event contains uninitialized memory.  This
> > > > was detected by the Clang/LLVM memory sanitizer.
> > > >
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >  tools/perf/util/synthetic-events.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
> > > > index 3ab6a92b1a6d..348d05e4ec03 100644
> > > > --- a/tools/perf/util/synthetic-events.c
> > > > +++ b/tools/perf/util/synthetic-events.c
> > > > @@ -2219,7 +2219,7 @@ int perf_event__synthesize_build_id(struct perf_tool *tool, struct dso *pos, u16
> > > >
> > > >         len = pos->long_name_len + 1;
> > > >         len = PERF_ALIGN(len, NAME_ALIGN);
> > > > -       memcpy(&ev.build_id.build_id, pos->bid.data, sizeof(pos->bid.data));
> > > > +       memcpy(&ev.build_id.build_id, pos->bid.data, pos->bid.size);
> > >
> > > Ping. Should be an uncontroversial change to fix a copy of
> > > uninitialized memory into the perf.data file during synthesis.
> >
> > Indeed, applied.
>
> Humm, don't we better do it as:
>
> +       memcpy(&ev.build_id.build_id, pos->bid.data, min(pos->bid.size, sizeof(pos->bid.data));
>
> Lemme check what is setting that pos->bid.size....
>
> Things like sysfs__read_build_id() that does such checks, but perhaps we
> should be defensive and do it in this function as well?

Defensive is good, another option would be an assert but they can be
compiled out. Do you want me to repost?

Thanks,
Ian
