Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47621D7995
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670643; cv=pass; b=OOjt26PMV7TY7rVKccmAVsL8zr0bs9LNC7u9dz4OwRsBfPYIjxLTLAQuB7okA5AVue80L9TsumVTQ0hIcZmlcV3fW0xA4pWMTBOUa18YAgqbKBNW8Y/7KfCyAcKqqnJxjk8GDFbahflyt9K54psPwWjPGlJS9O/mYMrMT2dVAM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670643; c=relaxed/simple;
	bh=5ExJGKQqqkgOKiYAl01vajNqrVmhutAhhk5RAfQPwdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKH/x/qimF3Qo/lLg4WSGi6R+YrvkfopI1r60aCUvhyGBoCbDLqERRcCA5XNWnf8e+23D9wpfSyPjui1y8UGjFqQloivTWBaDE3cL6X8IZPti3vetT/W9c8+9s5kd7ykWCspF3Y8aaE89nNvd/uASruB+dJZ8/tPJnZ+qaEukeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMELsa6c; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMELsa6c"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso52945805e9.0
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 07:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773670640; cv=none;
        d=google.com; s=arc-20240605;
        b=RZLS1SHj4mN/2kQfpchpPXOVR76bZnmQK1o3MHdNsCqUiTD4oJKCBuEpLf/c/LnRxa
         U/GhaLZ1SPkH8E2GMuuk8g8VuIQKjUtEX7SVws3TTZP3CYok/p9+mk6l05zweci0OfQv
         mHKitUNMd+dH8uikOPS6dNevonvmEHbmXvKVBrWtHBX/1/M8nkgoi3zITzKF0hPlg814
         2+XYzIdsGJZ89GROI4mLTnfOmNz0JkXrgsNyJQ/tWz5qR4Bf39bv4UF5rqGqaIzZ2onH
         rR+rXE4v4XtUWIFQuNLb+/klKE9CTr+Hhfhxyk9A59in2Imyfb9cdKpGX8blROb/wkUy
         Ocrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lmBn1aXsKzUNTVIGoWkY2AXVOYef5Jy5uJj2KWu6G54=;
        fh=o2MOwqQdxnSlBAeQpm8pHwahKYYXPGfH/y7dtK27rfs=;
        b=A/xXurn2pNlUo8mkDiZPJxO0ZP4XPUGfvkTViPIV6NiSDyR1bjQuaiZEJ0cpLNBhhd
         Txo3cihG/HLwH4C52eTB84O3cG0Cvo5KwhxGUHrdAE/fgkXTrZw0fwgqKckjGVLDS4p6
         2aXfL6ZImkTdqimcrKSTwqLtifGY4jb0pGbYzAP8vi3TXKLwNGFa/KUr0BI87U7Ju8ZD
         YhQpcM8NGzmhvhJUouYd9G6caaxtprNsUjmVy4bsMqW9R35yB3LLtx08DZMJdU2RQjzu
         ehMnzGnC+TFgjQ9BTfk4Kr9uvTOJeXWcII4uJPqBogtwCpVrlxNjg28MU5KEIoF+tBc5
         /8mQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773670640; x=1774275440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmBn1aXsKzUNTVIGoWkY2AXVOYef5Jy5uJj2KWu6G54=;
        b=UMELsa6czphPMtfP4QVusKqAyCUraLjE9EVCr+ie3QD2brWbEXD4bbE9SbqRhDTGnC
         k93aXiUurgWar1oc3uWboW9IQUVM17zJDNsNw5bKVNj+1UAGMTJY/jBPpdyFoshLGiH+
         /4XldMIeH2chKZf5HMc9+cWLbcdeyFYbYRodZOPNaFJj71CbtFT0ejNkxRZErRT+A2uF
         gvNJ+ViS/RTp8/KRyejZZoioLzRd1lFBF/StuZJ/weTOx8lDOqRVse4JBKLIptHUZ1uI
         SKgOmlpZb8KgMwyTkt08EaRjExnql1HnAg+oN6xvPVUYTnFnoh9a7ZMXAVkK1MfxltUY
         5uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670640; x=1774275440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lmBn1aXsKzUNTVIGoWkY2AXVOYef5Jy5uJj2KWu6G54=;
        b=iSStq9+3hNk3yt/+/M8nKXPPRZG9oGIUa86v6su7onLiDOFvsZDrMbCELfxSprP5Da
         7/EiD0bvirKvi6YQY/xBmO0F1Vz/wd2kFKlGpaVVxpx3TaVtADSPc1I8oCPyiblg4FtJ
         vjUdmFcufJJNb71F4DPMi/qryY3mz0Wu0o0pd8nFnHnwzSW/Gz7DrzPtx6oGVxpRSulC
         hCvlhSiFGrqPVz4Xa/upriS2G3l/Jrt3pOrmJkG7j4QjB0wtDxc5Bw3Ywqz4iEH3U/Zt
         fiWeSHadlNaqG30RDEQtu16TEV5TqHUuMopsus/Y/MzD6MOniGGix32erV1LIw+9DoNc
         TjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCULXxL5P1k5YyjYzAv2lYmHiXP9nGhpzGOnN18R+LIb4+IcTk13rZiR0HFdN4wOB5ZrixHs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1j6x8J3OiuzjbV+QanB0SYNlzI0P6L9vYQbw5NWB0+2LLHYpf
	qFECv4Uy9GdsoBRN3R0KMsfzB6q0XSNKSTDQV1uqst45UDuwNnExpkCTEnUbpo0fGoBwSa/84YW
	5lbiNuiY+oy4baw5k7mcxpsDhgn6GY0o=
X-Gm-Gg: ATEYQzwZfCIvEu8Drh1MgGgdFchZabqgEJMk36oldxEtFFgLCdZ/Poj59hl3q93U+e9
	ahbtFePt09NenP31XkDF+dRzSHyeg7AQaXeNJKTw6Y/WzV5Jk4U7Oo6PCFhpSeqQp8alNdjryuB
	2W6EhZD++iJpNx4h44P2OW5NeZ0S2np4fPFtRgzNi29WNquyefnUk7Vl4Wr4aTeS+K77LJkC1tj
	uFqqAKdbpzEilCeNkCCxbX2e819PenfQg6S49X1N3qwpeTzo2NAB2k7DMHLIs7Lq2QIiXedmLfc
	sTAn8591AH7f4OfnxediCvyywSb1WkkXjBGjVxUTkG19B4apHJ5VMPsYsoFg81ViQd9ndT5142E
	ooQ==
X-Received: by 2002:a05:6000:3109:b0:439:c560:bb78 with SMTP id
 ffacd0b85a97d-439fe1a069dmr30731666f8f.22.1773670639789; Mon, 16 Mar 2026
 07:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-7-9e35bdb99cb3@arm.com> <20260316101800.GB8048@e132581.arm.com>
In-Reply-To: <20260316101800.GB8048@e132581.arm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Mar 2026 07:17:08 -0700
X-Gm-Features: AaiRm52U4nGYmhrhg5_rJVsmWgv2fI-zySEYrY3v3DyOI4rw9kmBbiG37OT5JGw
Message-ID: <CAADnVQLN6bYHnusnC5QnDoGGUO-A=qnM6fP9bhEVXEHD6_y9EQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/30] libbpf: Initialize CFLAGS before including Makefile.include
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kees Cook <kees@kernel.org>, Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
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
	Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, bpf <bpf@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 3:18=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi BPF maintainers,
>
> On Wed, Mar 11, 2026 at 08:29:32AM +0000, Leo Yan wrote:
> > tools/scripts/Makefile.include may expand EXTRA_CFLAGS in a future
> > change.  This could alter the initialization of CFLAGS, as the default
> > options "-g -O2" would never be set once EXTRA_CFLAGS is expanded.
> >
> > Prepare for this by moving the CFLAGS initialization before including
> > tools/scripts/Makefile.include, so it is not affected by the extended
> > EXTRA_CFLAGS.
> >
> > Append EXTRA_CFLAGS to CFLAGS only after including Makefile.include and
> > place it last so that the extra flags propagate properly and can
> > override the default options.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
>
> Before sending a new version, I'd check if you have a chance to review
> the libbpf patches.  The libbpf change is crucial for this series.
>
> Another reason for pinging because I received a bpf-ci report about test
> failures for this series [1].  The failures looks to be unrelated, as
> the tests fail starting from the first patch, which is irrelevant to BPF
> code [2].  I tried reaching kernel-ci@meta.com last week but haven't
> received a response yet.
>
> If bpf-ci testing is mandatory for libbpf patches, could you advise me
> on the correct workflow (e.g., whether the patches should be based on a
> specific branch)?

yes. It is mandatory and libbpf patches must go through bpf-next tree,
so pls send them separately.
