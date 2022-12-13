Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325679FA
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 21:31:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u12so17164860wrr.11
        for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/koqlmEnYtwMnvjdPo/jyVVzdAIk2r7pe0MYh1qUgU=;
        b=AhmlOzkpEAAsHzce1WbSOiZ0NaMXR4ItFqTykkUtDA8oHCb8varZkhEAoco2CGE/ag
         IV6awrv0Tm2WwmCAWP9d21A3JJaYDmoRKG9bl7VtNd9+JyKjz66VRpo6ETjiJOEDSTMF
         qNDcVuAulhVnW0qERRGOSVbDPZGXGYLsT8JChJmtOoW92kpyv4Z4YH3CDzIrtGccRm5H
         TOSWtZ1iy2JOfNM+EtSFbMPJUs8u3J9Gw267OzxO6n8zBTDQDhexZtk7RRyFKxZluZCy
         rcf9CjALIcSC15Qegy4Ajq0N+db0Hqy7enzdiSg54ZgxropE/4NQ5EWvpmUcoc1K99OD
         +k4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/koqlmEnYtwMnvjdPo/jyVVzdAIk2r7pe0MYh1qUgU=;
        b=epzLXM8p5A+xcOXUeY+D9Mo9PAHjlm/sOfb3Ds+XwQ2ZWAyU5ejYFttzA5+9R/asGU
         8LQNq2EOKPeT383G2wqcztr4BIePlO6SfDqWo6H4S4LmqGUonahVRy0krAjMIvrz00xX
         64Ch2OEBC1BrzBW2elg0QY+mV0xy+23RFE/hhGKJcRgCIr1oZrQgsnLZ+EFLdf/2zK56
         B3krk1LFOQlNOwyO4XtrOvAT4yb2tmIR+PrykRHgVMrCbKXXMd5HzI5/SwPlxN4qFObd
         Bq+E+Ama5qp2afR09CuGExOQyjYnuoEitmVQdqn3Q20e/mYCTda5RS7rgGiHFyB21uqm
         RCLw==
X-Gm-Message-State: ANoB5pl4FWaiZkgS4bIOIbeuvZuj1Lfx7Uzixg7gv3geFHQt8Er8Gg1V
	SSNUqBcNP+DI/QrWY+P7PxwUwT5g3Y0msednsCpNog==
X-Google-Smtp-Source: AA0mqf6u6lhGgX83By8MX9imp5hKBk2V1tX1MIy8IpS3+GyVYm4LHXnqv41xKCQsdhgqOBsG4sli9s6EEvbHoTPKUiE=
X-Received: by 2002:a5d:4acb:0:b0:242:78b7:6bf3 with SMTP id
 y11-20020a5d4acb000000b0024278b76bf3mr6524388wrs.375.1670967115262; Tue, 13
 Dec 2022 13:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221202045743.2639466-1-irogers@google.com> <Y5ePpm3HKts3b+gJ@fjasle.eu>
In-Reply-To: <Y5ePpm3HKts3b+gJ@fjasle.eu>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Dec 2022 13:31:43 -0800
Message-ID: <CAP-5=fWjdA0Qpapfg_Vk287Skd+bNwn=5VPJcaPxqx-vkPTdzw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Improvements to incremental builds
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 12:31 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> On Thu, Dec 01, 2022 at 08:57:38PM -0800 Ian Rogers wrote:
> > Switching to using install_headers caused incremental builds to always
> > rebuild most targets. This was caused by the headers always being
> > reinstalled and then getting new timestamps causing dependencies to be
> > rebuilt. Follow the convention in libbpf where the install targets are
> > separated and trigger when the target isn't present or is out-of-date.
> >
> > Further, fix an issue in the perf build with libpython where
> > python/perf.so was also regenerated as the target name was incorrect.
> >
> > Ian Rogers (5):
> >   tools lib api: Add dependency test to install_headers
> >   tools lib perf: Add dependency test to install_headers
> >   tools lib subcmd: Add dependency test to install_headers
> >   tools lib symbol: Add dependency test to install_headers
> >   perf build: Fix python/perf.so library's name
> >
> >  tools/lib/api/Makefile     | 38 ++++++++++++++++++++++-----------
> >  tools/lib/perf/Makefile    | 43 +++++++++++++++++++-------------------
> >  tools/lib/subcmd/Makefile  | 23 +++++++++++---------
> >  tools/lib/symbol/Makefile  | 21 ++++++++++++-------
> >  tools/perf/Makefile.config |  4 +++-
> >  tools/perf/Makefile.perf   |  2 +-
> >  6 files changed, 79 insertions(+), 52 deletions(-)
> >
> > --
> > 2.39.0.rc0.267.gcb52ba06e7-goog
>
> Hi Ian,
>
> which tree is your patch set based on?  At least it doesn't apply on the
> current kbuild trees.
>
> Kind regards,
> Nicolas

Hi Nicolas,

for the perf tool the branch to follow is Arnaldo's perf/core one:
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/?h=3Dperf%2F=
core

I may have done this work on Arnaldo's tmp.perf/core branch, which is
used for work-in-progress merges.

Thanks,
Ian

> --
> epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
> =E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
>      -- frykten for herren er opphav til kunnskap --
