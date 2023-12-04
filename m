Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBFF364AD
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0+q5TQwo"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50bf1de91c6so113e87.1
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 13:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701724475; x=1702329275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC3Kqwq0MMmfCoFQwZgAsJVop+/+8BNQbF/H1UQSrUk=;
        b=0+q5TQwoc48fLj/9ATYy6VD3abUYnK2r+BtJonV9DVu5+tebEK4lRQmjuTscda0Flw
         3Ph+EzV9YhFBaaSoFcc14aooMPfGZpbk1uzzpkf4vs5Ia35kMwfah9W0kpAUqgeDGcsJ
         euiRI1Lo7yEp7l51NsDnz7EOOxOLyzQXFP65t3D/vo1TZUSdI9snck0PEFD+scEXlxMB
         rpKj84XxvW11UnbgYnKCFBnprKf4f2jfGz9ESyj0hQvOUL16Np8D/vn/+TY1pLgyItER
         2G7pCuA/vFiVuKH2yVQncVQ7Sfg6ATXkh4ZTIMiwz4V/bzu30cep2JuxSHIhol0qdN7G
         8AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701724475; x=1702329275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC3Kqwq0MMmfCoFQwZgAsJVop+/+8BNQbF/H1UQSrUk=;
        b=oUsij4aVzGGeZUi7G8O9rdsaeVZVtz8UHYyUPdJ+y/mmEwiUNp8Zm+KGmBASaMYONO
         aV6M32lJlnLll37tAeJ/1tq3GwdvXnN+nCFbkxQ3O8dLZzNvS1soXAkdkFkN6krIkFld
         NDByRox4KAfDnwvCTqCG3ox9ziPaWsKGrx8IP4rqaGDEjh7zN95Plf9UkhAzPIdh12i9
         i2/s9ZNHYyE3hXTpVQQuB38CmZwJmiynOwUWwnW9Z/BeYy4bFvt+qy20hQ2KkO0OEdb8
         rbkOPiTEAWoIlx/kfJ7x5Pxdoi9reAuGcF5ecE/c0a5JfZzfKKxsZxU1+EGHKtZW7BIM
         ck0w==
X-Gm-Message-State: AOJu0YyB8WONMZA4tFsZeUfCCVWXENrqn68kZ0ELO7UAEmzLgKgjBf8W
	83VUEivb+Rv/8kQfENFWKmrF9exEIIU8s0ybrmvLcg==
X-Google-Smtp-Source: AGHT+IHFNQl9WEbRcWJgH4WIhG5b7q61jmODDxGI8iaboRfnh21mH+fe1Ktul9AFsgSTRW5UVuMiGdR5g8dxC5LoCTU=
X-Received: by 2002:a05:6512:12c4:b0:50b:fc76:42c with SMTP id
 p4-20020a05651212c400b0050bfc76042cmr87811lfg.2.1701724474909; Mon, 04 Dec
 2023 13:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231201235031.475293-1-irogers@google.com> <20231201235031.475293-9-irogers@google.com>
 <CAP-5=fUtoi7ynQ-x_7rrv_vYoTZfS_14COA1MskOFVXJ_jCDew@mail.gmail.com> <ZW420ecpaSjwykny@kernel.org>
In-Reply-To: <ZW420ecpaSjwykny@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Dec 2023 13:14:23 -0800
Message-ID: <CAP-5=fXq2CTwSO8QVRdgz2uR73DrGU9qD3z5gPPD3ZEncsn36w@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] perf tests: Add option to run tests in parallel
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 12:30=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Fri, Dec 01, 2023 at 06:06:12PM -0800, Ian Rogers escreveu:
> > On Fri, Dec 1, 2023 at 3:50=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> > >
> > > By default tests are forked, add an option (-p or --parallel) so that
> > > the forked tests are all started in parallel and then their output
> > > gathered serially. This is opt-in as running in parallel can cause
> > > test flakes.
> > >
> > > Rather than fork within the code, the start_command/finish_command
> > > from libsubcmd are used. This changes how stderr and stdout are
> > > handled.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> >
> > Actually, I think this patch needs more work. The verbose output is
> > degraded and missing in some cases. Suggestions on how to fix welcome.
>
> I'll think about, but to make progress I think the first 8 patches in
> this series can be considered now?

That would be great. Thanks!

Ian
