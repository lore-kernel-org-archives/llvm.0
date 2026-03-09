Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA73A7837
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074241; cv=pass; b=DJF0THTeRG8lvrG6UOXkJekU3CgBAA7nijVQYpRKVKxesDp+cEe1u2fY7M2uOMIxrzt7JCvWm6wuM8fBEXTEvxSJRgtfyYrXOyO8IzbRMPHiX/L1cA1ESeKcm2uDOfifA8vr9QE6AViMn3orxvwjDZkq8QzIxzQi5uCWE3DX05o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074241; c=relaxed/simple;
	bh=/xVvyD0Lqn/lAfbvI9yNkpJEV7R1uzy3kwW07nfLaKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS4Iqz9KV7kToS9RaD3rDRhG93U676uJYitW+ITHUXgPZeRjpf8R7Oy/iCAqhWwJbcMZdvBe0UpLfJ1b6Uia3yIXwwx991+llNP+kyF4ezyEGFZjlXvprscPQpOzfnpa8NztDkkscSm2STcXmmUPmQeuOaiAnoMjX521sqjvG3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lx7gRJLG; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lx7gRJLG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae49120e97so1105ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 09:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074240; cv=none;
        d=google.com; s=arc-20240605;
        b=dHL3qsNYPIRja9boAhlg0gcNdWypdXRuYzQBjxYxuO2J4uOwgpzFdd4o9Fj+lCssG5
         25bL/vFCNihBrpNcXoY6AWtaOIqgWQUsZ9D8mfCfSV5a1TeZUQkf2IAoWze/TutBjyyC
         XxyP7ySeWjq4A9ODHBojbAZXlgqr6MRC/1qhdHO48LgDTUN3WgAm651F1g0kQftKA6ix
         is5+q9r9xftfj3qNNNPVnkH+TdG69GsKkq1en272+f4lw/5zuqjRxBUY51iqKHmtD+/f
         vBy6pI8FPzL5G9jxnNEPrn3hpdFXa+k7ljYEndkvrbSjwIQvOSaL7/mTyUydDbpZs181
         MRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8Tx6Ml8LCMcseT9tf2wyQ8mZ0fxne/KMVLw9eyT1gw=;
        fh=kmHpqtmdz4BNOGH0kUxv9rESbiClRAkpHP5UBfMB4Lk=;
        b=l13Qzo/SdBMERk8e453YLTtfcn9fSc4fWgKmZRJWwWYgH+Muf1C3UO7qugqv/zZliI
         QLOD4v+ST95EinLOlCS87v7fB+lkFDjd0UEzDzJdMBirOgdniPrhUOW1EOaX8WgtKqqq
         Lx5A3opa+7U0rZDWABeJNBY31uLlhKKJ5cafbsYWDmgwG6tiQDeXYuLsvKEjCmgctfZH
         P+AbLjubZHkrWYj7FPvQctN5FyATTGQaD7hljctDyGnPgAa7945vjl6tUhLft9lU3Kgr
         MEUVki/2vNXWUpV3z2HDoQT4HNZN3JDvxwd+lnZ1aI/93ZTpeBNuM2Jba61FGUFAmTLX
         LXDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773074240; x=1773679040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8Tx6Ml8LCMcseT9tf2wyQ8mZ0fxne/KMVLw9eyT1gw=;
        b=Lx7gRJLG004LboGnk4insGbTcy1HjoXmRAehqkjoi1FOYr5eC3EoF/oys1A6H04XQ3
         pyJm+ErBbqWUaEXGzUYQCjDCeie6Nprl+u9QpmaM+iT9Ca4gJXc6ChFG2fXmlYrkm+LN
         sH+uhZV22Mt5ZIICYVDTFPJs+5Lu5fR987lEDu5CFyhk3h5gh+ZVH0w6X4S04BUsdef4
         qAu2bEuggzZlIQeb1hx7Y1DzBu9MvRtBKMC/9grpIrILSedhGLjHbdhAVsRyPEF1G68B
         z8v5nd1HuXVzVEXxED1lDybXXMm9woZA5ivrOt+lRP1mwVdP7DJs/j09OyPzUtD/C9ak
         PS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074240; x=1773679040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8Tx6Ml8LCMcseT9tf2wyQ8mZ0fxne/KMVLw9eyT1gw=;
        b=gK5v6Nj/gYuJOVUdP44XkBjm3cQjSkNlJDQA0UJ7OzPkIT8nXF9pTcLfIOE2WW+kWk
         GstmoM8Y0A+FpIYXWBB/lk6LIQ4U1xjizn2B01wLUtjg34kj2gFGvRxiDJ9Wz4VMsve+
         tvuZpfiM6SOPyEp+eNpgtTdRFxO3Ww5dFtpeCipvZQhK9NrEFHZnDwjGyyIqUuATzO6B
         gw2zUJRHJAIxr4tpCQcngDTcejynvcVyoIuoM9laPwHM5mkmfBIAvHlacpnOvKvpTIC6
         2TSUjlxNzG27GLO4NYBrTZ3kd4Q7HwQc/psgn3t6OK51NY6qrhlxNlvvpmN9/BXXqmyq
         ajlg==
X-Forwarded-Encrypted: i=1; AJvYcCVQhoMXrQFApiIASfolweLZ+nNYGtY/L5qQLUAcDlKCP+tacJV8SB3/tWHLskZL0hjxmajn@lists.linux.dev
X-Gm-Message-State: AOJu0YwBchc2ZxKu8NnOtQG/IO7IEY+6poU7Bz5fhVN6zay0EmiBA1Sz
	aDK4Z0L6vMDLTUFZVk5wt3F5ifnc/oFlQ2lRqnEkJ13Q/RAMWDI3Fhs+AKiBuMUIuUQiNv5Giat
	/8LucrnRAkQj6QN0JhI7a+pHbjXTScKd7X/VpZDlN
X-Gm-Gg: ATEYQzxLADLP81YVMbPaRIF17rY+36CTgDfaWUVCdXXfUAB7KxOFpUxeNchSp0of5Z4
	Rd0noNiFLkvZPL4UEGEqwg79qDyB8lDRRJJNAD7QDbfLkQ/D/7gngj7A6r8VoBoScrlo8AeZFbF
	SbQ7pBs+Fg3hOYn6iwoCAmM8L+3k2dcP9I6MaiWu4dPoR/IvsWBJRTYK0vqD3OKPyDITBVH+sPb
	2OLilUj/f+p5q8mLgC3qyLd1BOUBnL/XglK9+WJasRG6SuNbYxnyKcOuf7QHgAuZsCWdswM30SN
	syI1QnswWG1Z6SIY10nrzdmO5J3/pBvyRus=
X-Received: by 2002:a17:902:cf4a:b0:2ae:4e8e:954e with SMTP id
 d9443c01a7336-2ae8b99a09fmr3540605ad.5.1773074239351; Mon, 09 Mar 2026
 09:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-24-6477808123b7@arm.com> <20260309114413.09e05127@gandalf.local.home>
In-Reply-To: <20260309114413.09e05127@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 09:37:07 -0700
X-Gm-Features: AaiRm51Y_hOVZDhnwqzBMfs_foRdCHZgFLdwNP1ZXf1eU_ewkridlTQIwkfdNsE
Message-ID: <CAP-5=fU4JF6=aocKhgyZqyqm0NOKpAKEmruFj2mgBHfkqbN2yw@mail.gmail.com>
Subject: Re: [PATCH v3 24/30] tools: tracing: Append extra cflags
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, 
	Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 8:44=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Sun, 08 Mar 2026 16:46:29 +0000
> Leo Yan <leo.yan@arm.com> wrote:
>
> > Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied t=
o
> > the compiler.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Not a problem with the change but running this patch through an AI
agent brought up:

  Should CFLAGS be initialized with default optimization and warning flags
  (e.g., -g -O2 -Wall)?

  Currently, latency-collector is built without these standard compilation
  flags because they are missing from the Makefile. In other commits in thi=
s
  series (like for libbpf and thermal), CFLAGS was explicitly initialized t=
o
 -g -O2 or -g -Wall when EXTRA_CFLAGS is not set.

  Additionally, should EXTRA_WARNINGS (provided by
  tools/scripts/Makefile.include) be appended to CFLAGS here, similar to
  how it is done for other tools?

Thanks,
Ian
