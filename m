Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C368BEE
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 16:59:23 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3e390e23f83so530781cf.1
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 09:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680195562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7akp0Ej3ybKTtSvJmlVCO91f+z9Y4B731b6732Wg8Y=;
        b=kj8zI+ocoSj82Je2zA1JoXvjC2y0OvYJkSAoLrdeg8HrwyJ6I5YZVj/yjENQUYAtHQ
         ehTSTFDKnH2VBA5wUGZTxh9uOgN03WLqbWJTaKq+oq/rXgj+xw2JLn41QSDiCZmPsxgo
         +Qau9sjscmvkVy3C8hlQJlourjG728IMl2I5QBdEKLMWg6MPxywQ4cRTAEbLGJOAuVNm
         P42bRwImN32orsZKDwrqwGG4o2xLyfdFhf7N2j75D4f8Kzv9IAV34c7UYgBmBxKHRmfQ
         ICt3CY0I3p6LnJwWIR26tybK90sQnMcXEmZz2p/Y7nmfMk0X+dtDmoqq12WtJ8E65GzG
         hyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680195562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7akp0Ej3ybKTtSvJmlVCO91f+z9Y4B731b6732Wg8Y=;
        b=JyEm+4gcXY5Aa7y1syc1VYwVo1OESp8WRB82+LAu1LPEBDewFVAHOmDbrSKVVl0TMt
         rUph+RcRE7AI2PXzBAcFFqVvGxESNXIFnOqGfONbbRubW+cIQLbW6D7DrA3Bvhv7OwRK
         ZvbQUJxL8OhDq1yyDMyuKqvTPfU1OPu0B2pat7SxmeyyFzyrCuRz3abjKhjrH5Vx0Ac8
         WhL+/4PcaIeB6LchYoUJlm29/be/hfm1SEXWrUfzKPIntSpOQCTVIg3IgScvTSfM1Vn9
         2SiV1DpbCZQ7cT0W9kTNwt7/qdTOjvadjOaEu/s0Wg8OrbJSVoIbmuQp+mjVNT+I4+6v
         EfYg==
X-Gm-Message-State: AAQBX9e5w6sbwlP+rwgpLeeJ+Hjv/fbU8aIG6/gsX6t/kwSJ7+SNioTf
	Z2/3TQ4pVCrSEToLt2aGWDCGblYZ8cmW1zLZOpKGxg==
X-Google-Smtp-Source: AKy350YmGF+RklGr0Q9QWyeuDfLojVGr4FVRoQSQ0Mlc6cG6w5SKVlN9G+P0VVnFT0LTzmOcP7YDX0QA2529VJmwK5g=
X-Received: by 2002:a05:622a:1309:b0:3b9:f660:be05 with SMTP id
 v9-20020a05622a130900b003b9f660be05mr327826qtk.18.1680195562424; Thu, 30 Mar
 2023 09:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328235543.1082207-1-irogers@google.com> <20230328235543.1082207-2-irogers@google.com>
 <ZCQ4nERbit/f6yhh@kernel.org> <ZCQ6kqhODsxSCXdP@kernel.org>
 <CAM9d7cjSEx_=UTMpDHMwGb=5H6Yf8UdHTMt1xO=4CVToh60oSA@mail.gmail.com> <ZCVxXTc0kyRAQ+XA@kernel.org>
In-Reply-To: <ZCVxXTc0kyRAQ+XA@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 30 Mar 2023 09:59:08 -0700
Message-ID: <CAP-5=fWZpfo62iN3YWWKm_VZZqMFCyddyg_JQTGe7j6nV+DbmQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] perf annotate: Delete session for debug builds
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	James Clark <james.clark@arm.com>, Andi Kleen <ak@linux.intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, German Gomez <german.gomez@arm.com>, 
	Sandipan Das <sandipan.das@amd.com>, Andres Freund <andres@anarazel.de>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 4:24=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Wed, Mar 29, 2023 at 05:13:17PM -0700, Namhyung Kim escreveu:
> > On Wed, Mar 29, 2023 at 6:18=E2=80=AFAM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> > >
> > > Em Wed, Mar 29, 2023 at 10:09:48AM -0300, Arnaldo Carvalho de Melo es=
creveu:
> > > > Em Tue, Mar 28, 2023 at 04:55:38PM -0700, Ian Rogers escreveu:
> > > > > Use the debug build indicator as the guide to free the session. T=
his
> > > > > implements a behavior described in a comment, which is consequent=
ially
> > > > > removed.
> > > > >
> > > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > > ---
> > > > >  tools/perf/builtin-annotate.c | 16 ++++++----------
> > > > >  1 file changed, 6 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-a=
nnotate.c
> > > > > index 4750fac7bf93..98d1b6379230 100644
> > > > > --- a/tools/perf/builtin-annotate.c
> > > > > +++ b/tools/perf/builtin-annotate.c
> > > > > @@ -692,16 +692,12 @@ int cmd_annotate(int argc, const char **arg=
v)
> > > > >
> > > > >  out_delete:
> > > > >     /*
> > > > > -    * Speed up the exit process, for large files this can
> > > > > -    * take quite a while.
> > > > > -    *
> > > > > -    * XXX Enable this when using valgrind or if we ever
> > > > > -    * librarize this command.
> > > > > -    *
> > > > > -    * Also experiment with obstacks to see how much speed
> > > > > -    * up we'll get here.
> > > > > -    *
> > > > > -    * perf_session__delete(session);
> > > > > +    * Speed up the exit process by only deleting for debug build=
s. For
> > > > > +    * large files this can save time.
> > > > >      */
> > > > > +#ifndef NDEBUG
> > > > > +   perf_session__delete(annotate.session);
> > > > > +#endif
> > > >
> > > > So now, but default, we will call this, as we don't have this defin=
ed
> > > > only if DEBUG=3D1 is set, right?
> > > >
> > > > =E2=AC=A2[acme@toolbox perf-tools-next]$ find tools/perf/ -type f |=
 xargs grep NDEBUG
> > > > tools/perf/util/mutex.c:#ifndef NDEBUG
> > > > =E2=AC=A2[acme@toolbox perf-tools-next]$
> > >
> > > We can discuss this later, applied the series with just that zfree()
> > > change to annotation_options__exit().
> >
> > I don't think it's just an issue in the perf annotate.  Maybe we can
> > do the same for perf report and so on.
>
> Yes, I thought at some point of setting some flag, perf_exiting, and
> then we would stop releasing memory, zfree comes to mind, but then we
> would still be traversing data structures, taking locks, etc.
>
> And we can't just exit() as we may need to flush caches, etc.
>
> IIRC this specific case appeared in profiles, so was commented out.
>
> > Anyway we could define NDEBUG=3D1 for release builds from now on.
>
> Yes, we should do it.

I'll send out a patch. Just a heads up that this will also disable
asserts for non-debug builds.

Thanks,
Ian

> - Arnaldo
