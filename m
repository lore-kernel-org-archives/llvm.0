Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D71C32
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 13:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF1DC43321;
	Wed, 29 Mar 2023 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680095893;
	bh=0kws+d9Nmkb4SZo6HGrrZaRdbgyyJEYMqGYIL1EJG+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QztLpmc+Q5DKUUvHOYSENPRc98tzx/hhOu6lJ1d6I9qpVZT26qGVSp49GnAAiz+sg
	 55GtTS6RhMyFouLI2CJbzzZcWwnSPo3rRjRTF+fR3qcTWXVzOnfa8k3/NR7A+/gvjM
	 Z0Y9bXrpiOxg66k3dy1IwHG+WDeVRlEKalykiVJivfEYi8nRbQ1uoM8XEMEMcRc26y
	 ujaaZC6OWc3EliSgIbaDTKoV0ugw8TYmVcZHsSghKSZEQtCumQmvp8ZTBPfgO/0br1
	 kyQ4VoWf3UNUOTaqrdrQXrfcVkvC1TJ9m7RQ+V5JwR+oD4wmr5hHYRd0jhxZlv/M4z
	 /Q84b0E+Wzrkw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id D678B4052D; Wed, 29 Mar 2023 10:18:10 -0300 (-03)
Date: Wed, 29 Mar 2023 10:18:10 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, James Clark <james.clark@arm.com>,
	Andi Kleen <ak@linux.intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	German Gomez <german.gomez@arm.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Andres Freund <andres@anarazel.de>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/6] perf annotate: Delete session for debug builds
Message-ID: <ZCQ6kqhODsxSCXdP@kernel.org>
References: <20230328235543.1082207-1-irogers@google.com>
 <20230328235543.1082207-2-irogers@google.com>
 <ZCQ4nERbit/f6yhh@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCQ4nERbit/f6yhh@kernel.org>
X-Url: http://acmel.wordpress.com

Em Wed, Mar 29, 2023 at 10:09:48AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Tue, Mar 28, 2023 at 04:55:38PM -0700, Ian Rogers escreveu:
> > Use the debug build indicator as the guide to free the session. This
> > implements a behavior described in a comment, which is consequentially
> > removed.
> > 
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-annotate.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
> > index 4750fac7bf93..98d1b6379230 100644
> > --- a/tools/perf/builtin-annotate.c
> > +++ b/tools/perf/builtin-annotate.c
> > @@ -692,16 +692,12 @@ int cmd_annotate(int argc, const char **argv)
> >  
> >  out_delete:
> >  	/*
> > -	 * Speed up the exit process, for large files this can
> > -	 * take quite a while.
> > -	 *
> > -	 * XXX Enable this when using valgrind or if we ever
> > -	 * librarize this command.
> > -	 *
> > -	 * Also experiment with obstacks to see how much speed
> > -	 * up we'll get here.
> > -	 *
> > -	 * perf_session__delete(session);
> > +	 * Speed up the exit process by only deleting for debug builds. For
> > +	 * large files this can save time.
> >  	 */
> > +#ifndef NDEBUG
> > +	perf_session__delete(annotate.session);
> > +#endif
> 
> So now, but default, we will call this, as we don't have this defined
> only if DEBUG=1 is set, right?
> 
> ⬢[acme@toolbox perf-tools-next]$ find tools/perf/ -type f | xargs grep NDEBUG
> tools/perf/util/mutex.c:#ifndef NDEBUG
> ⬢[acme@toolbox perf-tools-next]$

We can discuss this later, applied the series with just that zfree()
change to annotation_options__exit().

- Arnaldo
