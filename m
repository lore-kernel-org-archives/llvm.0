Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B317320F
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708113457; cv=none; b=OEH3RFKvAnNP52tcPU8sFKI+E1Fhz7/G1YdJZ6XUNgQEIhBukmrWksOlF9PkpkXLtRB+PBz6Ca2EZHe6lkDPy3grPbL3GPLR70958R+jkX6hcnJR9x0eqOAKWaDAbCAeQNwLPG6MNUzLOARhAIGPc6rF4L5O2cTbQpoV82Ui3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708113457; c=relaxed/simple;
	bh=mwBXSOLbzppGPcectkAGNJ7sViWWfxda+/ZYkgbgHHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIzlqdSHW6QGAmQow//xuT1+7wbkkeUZtEY1J0OiMfk3bgthAwUEbqdL1jZQsIdRo178BkDw1YKIrfe2cQ1SV5XqH+HfXPi4eGWYu6If0DnLKpfs2pNilqO2bpUqBdDy8WK+EDzXdgJUfPuyH1qGSGaUVT0eOSVgsWmAIg3BA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so2513614a12.1
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 11:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708113455; x=1708718255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT8lrnb7gXnsbOnwG07kVXdw+Ry7KiTiqSIe4Bjzp5k=;
        b=SrRaMbuiN1xbVGyTFnN5SisJOVABbTJVJsda/rTxDoSiGDe/6pKQo/uMi9WRevyYIT
         KZ1ZWsolCAdoGB+TcFvXDzYn5FoR1zVornXePiKMmbOCKHLiW31+mfUM+ywDeRZdRmXu
         qCOxTysnRfo0r3nYUmMlsdHNdLSyrMQAdmLu61HP4tMM3VYEQ1JnUPdrKqmjaqC8hFrC
         1/WWr2Iw4brtr043ZsSiDvHawuHoPcddAWuSKsrkB516rrsAnfovmusnNbaqwIMd/fpW
         M5hsvP5u/VSzERC/HYJ/dnLUiq56ph234u7jC2gOzIN3c7bwyIjYNY6vSRjbDHYaWF5U
         Kccw==
X-Forwarded-Encrypted: i=1; AJvYcCWSZ2ck0C1ML4LDheoxsUVNCnr9ht8AUAa7sI73G7wiBNNJb14SkIGeiB7jpZvS+2t3045LzjUjjzLxmJO/bZBfY7MwaA==
X-Gm-Message-State: AOJu0YykhWawua+Cx4i/thBpQ3E9+j5mybzeOtgjlps/ddlQzLwwjgn+
	Y+UW+5B6Hjd5ZrID+w+5u8hEMj0YoAjijv2c2PjLn/+a17gsRx7XBTjCMRsPCsTNC8t97s5TfZp
	8lwwWNka4EpnIi++XGu9Nl3+fNdI=
X-Google-Smtp-Source: AGHT+IFWRpynq69LNZN+UBhnF0PizVRFiXuYFvBza7v/gwZSo5+4DFDMusqXm9IXSVEcvBZ2bBqUqKse9+m6yZL3s8I=
X-Received: by 2002:a17:90b:19d5:b0:299:2d92:4942 with SMTP id
 nm21-20020a17090b19d500b002992d924942mr4919146pjb.7.1708113455044; Fri, 16
 Feb 2024 11:57:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240214045356.748330-1-irogers@google.com>
In-Reply-To: <20240214045356.748330-1-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 16 Feb 2024 11:57:23 -0800
Message-ID: <CAM9d7cjXAKARq_7x0nif+vaiAfHHRhWEWHLYT3jkVugeXMncag@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Run tests in parallel
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@arm.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yang Jihong <yangjihong1@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Tue, Feb 13, 2024 at 8:54=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> If command line option '-p' is provided, start/fork all tests in the
> main thread and then gather them in order at the end. On a laptop test
> time was reduced from 5 minutes 21 seconds to 1 minute 50 seconds. The
> option isn't default as the test shows up perf and test flakes.

It's a bit sad that tests flake when run in parallel but I think we can
work on improving it later.  So

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

>
> The '-v' option is modified so that 'perf test -v' will give verbose
> output only from failing tests.
>
> v4 - fix bug in width computation.
> v3 - fix a crash if shell test directory isn't found, remove merged patch=
.
> v2 - fix parallel test output/verbose issue
> v1 - initial PoC
>
> Ian Rogers (8):
>   perf thread_map: Skip exited threads when scanning /proc
>   perf list: Add scandirat compatibility function
>   perf tests: Avoid fork in perf_has_symbol test
>   tools subcmd: Add a no exec function call option
>   perf test: Rename builtin-test-list and add missed header guard
>   perf tests: Use scandirat for shell script finding
>   perf tests: Run time generate shell test suites
>   perf tests: Add option to run tests in parallel
>
>  tools/lib/subcmd/run-command.c                |   2 +
>  tools/lib/subcmd/run-command.h                |   2 +
>  tools/perf/tests/Build                        |   2 +-
>  tools/perf/tests/builtin-test-list.c          | 207 ----------
>  tools/perf/tests/builtin-test-list.h          |  12 -
>  tools/perf/tests/builtin-test.c               | 378 ++++++++++--------
>  tools/perf/tests/shell/lib/perf_has_symbol.sh |   2 +-
>  tools/perf/tests/tests-scripts.c              | 257 ++++++++++++
>  tools/perf/tests/tests-scripts.h              |   9 +
>  tools/perf/util/print-events.c                |  12 +-
>  tools/perf/util/thread_map.c                  |   9 +-
>  tools/perf/util/util.c                        |  19 +
>  tools/perf/util/util.h                        |   8 +
>  13 files changed, 509 insertions(+), 410 deletions(-)
>  delete mode 100644 tools/perf/tests/builtin-test-list.c
>  delete mode 100644 tools/perf/tests/builtin-test-list.h
>  create mode 100644 tools/perf/tests/tests-scripts.c
>  create mode 100644 tools/perf/tests/tests-scripts.h
>
> --
> 2.43.0.687.g38aa6559b0-goog
>
