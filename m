Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665A40F8FC
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078973; cv=pass; b=VHchRvWe4aVoDnqXYfVPRkjSvd/7zsXyWsgjqD5WgW8elCIcKcm0V9Vqya1V/vvyd0Fsx2GrM9nENzLIRYebkKw7kfmmMCBG4NWh9Yn1l5cBYssyaKOkBw8wNsQDXz5e2kTFO+O6qNwWwnEgZPzi7gIPrjVUhHy4EcY33F0tPjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078973; c=relaxed/simple;
	bh=h+/4DZvdFjdZvTikaC3AlhbGhNWEZcA48r6UYxyTE/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEfQ7TxqgJj61ofpZMYe3AeWivIb+DrZNvS4ie1d20GzQ7JANRPAc45M6Uje4mlN/qRcJDhZ/nf+pSQY9zMCdikw+cz6xYpX4QLKoK+TT4o38n4cbCuPSgEn+dpl7khYn8z0Cvwq0ezL24A1ONLJIqvldfV0r9Ts+odHRUSrSb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=szHRLBAy; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="szHRLBAy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ae49120e97so16235ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078968; cv=none;
        d=google.com; s=arc-20240605;
        b=b7fsy1Jvb1EFCTVNhtX8GStP85YAbvOcgEiIkKuaYydNGp83Mk6Ot1Ucp3WtCDc30p
         R1JFidxMJo12Vzyns6E6xFpQHeb5xHnAvoPYDWDxN8zu4wWLA0V7uZhuw00yWjPhKEJK
         s5+oh1FH/nZgabMCLTgW3ppysndYFP3vaxPyXO0yLSYE5+l/e8Nu2qrosDmlmlLe1G7a
         YT3XFakCkC/iSzwb3Jj9sp6EEbFnqu6MFL4NOPy0m+5x8Up7PgsDbr7C4LvIKj1JwPdP
         BsLJrsACzHGEVhJ7uLd6bMB7fueyBXVHZf37YAS0XuPDHKHBGjRiHuGV60BItcqeBoHW
         V2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sEzDXhUVFO4MvSKwYYet5FlMfGg8jYj3MEwBCZj/ctI=;
        fh=fJ8mcg9OWndwgcMm+f60LDXu3w+B5a//92pBhJ8cDfQ=;
        b=PmTToQckaQ8QMYo003Y/B65nemOQZCq78wg+fyhVJj3wERqsCI+reW0V1Dnl2gkMED
         cSQKzMnIQViv3iWmUOlt8/9KrRGQmGm/OzH5fwk/3Qa54sV8mc8cvbZrUdrh1snsyDPL
         1N+gJLKJyAUxFgjYAPlv2UdBqCHS5eTAJdvIrGEsR3ZKHMDtrLuoh7yfcRyhqrnoYhAd
         H84S0DbED5tVR7zpMnHps+rAp40vCv3Elxw2w5CmBwT6R7vKhaueEFPVQK4lD8E4ZyAk
         0n8Bcgm3DbmrIoRp1ueelWxD9w2gVFVT4Y7CGnAaDv36MXyYkTcdiQZibDI6/A8pKtbM
         7E5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078968; x=1773683768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzDXhUVFO4MvSKwYYet5FlMfGg8jYj3MEwBCZj/ctI=;
        b=szHRLBAyudh1flqbWk9IXYjHcqApRWcYz8+A8AYArVKPPfmkigIkiGrNJwaqtKm5+0
         54KgbBX0XeYi8j8j74QASDwA9E1kJsoU83/BaI8RTlX0NwChHzE5CIoTX+u1VAL3M/7G
         70VAmt0NkzGj2yeOoYLAALY8kQlRNbrhNxIwSmKH5DrirB2fsFBdiaqr8taBy78zAMXH
         0MzIiCOkrafm86NcYQMo+VTLXkHET9EEhrj+lDJg21QHtdYCKvnvkHYJOpstkt5Hyafl
         2/f7PiUrRtJWYMI+LIrPlQmjQTAz1rB78/B8l00IfOXmaPc2V95Bd48rllb2//B5P74p
         Hp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078968; x=1773683768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzDXhUVFO4MvSKwYYet5FlMfGg8jYj3MEwBCZj/ctI=;
        b=kIIQISQq2BEe+0Jzdsj5dlv9OdHjK7EL8OvjyAZ3jC4g34wkJ7GrGDQOtR50ao2TiD
         WCCi1vQbvfgVHGuBOTsGaZ3eVs56mGDaZuIK4vuFlnyafd3ZrlbNUZswbLlHolLNUG/e
         GQhkhB7iK640/jpEUudcd5ICdGl77/XG4L1E3eoucT4C+MX+GfFAf0r64665ieW9GNMO
         qcfOkbELQViIFK9aAHj4uiTuTQ0AQhfas+dRRLuhUOMXDdoyPppsXl8OM97rdTe8Eps7
         cTstAdAF2BNcOo/29nywrVwWsEcmiQsSUSGY+vWHeikqQJU79OfK3niawHOP29c0WVAf
         xkNg==
X-Forwarded-Encrypted: i=1; AJvYcCVjMD778RxoFj1oeLHtCNqgZbm2097dDklg7cozMrIGbdOnebrI1xX0MrpKrZSrk4Wnu8Dz@lists.linux.dev
X-Gm-Message-State: AOJu0YxCfbPFYKeQ37PIs70mUa1r9bxAIgcr43YIwLePROFaCLlP1KDr
	Q8ISVoisTPWvEs41UxBT0Ug+LwX7laFNvFAjBuLtbwiGfQ95Rs2Y7YwGdMHQT0ZMHYlosP6fZPV
	errGp+9Hwx0cDzMNC6K4388f34R3Otehq+7HclDAZ
X-Gm-Gg: ATEYQzzmNpSkYFIF9Qi/bZVQ5LV/OmSMa3VEnTB0y9C9Cg3LyxZGfFVXhsxFTgAQbS0
	BKZaaSmQv5tAo0aojYZirH8yAccv3+I3EZ1tFeYzTMngTnmR+Q3rBEzLWx3wpgQe8AmjpJuAIQr
	g8wzN2nMQ/0MZOrlhO1FSMSx69A9/EVhSxCBwJ07YIx8DX7wEsC93sx2i5WEx9L7jVJxDxGK8FA
	MefgK5ExHJUCaJptJoRRPA+HJXeExpBQlaSnSlCZ9QAqb7wFvML1y+QMR3KW/HljXf8h7XCCYzW
	ObSXLs/FIMOUxplRV7dkqvaDnXDFdCI/zjg=
X-Received: by 2002:a17:903:22ca:b0:2ad:6f9b:3b2e with SMTP id
 d9443c01a7336-2aea32bfe3fmr148395ad.23.1773078967464; Mon, 09 Mar 2026
 10:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-12-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-12-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:55:56 -0700
X-Gm-Features: AaiRm51Xb31ugKo9S_MPmrA2EHDpcWCZuqysgwYrJ9m0CLzFNaO2kRL95jSSXGo
Message-ID: <CAP-5=fXyH=AZO9XEhXG_X0D+ikAyBmHBUXvDB8ivoJVF2ccjBA@mail.gmail.com>
Subject: Re: [PATCH v3 12/30] tools: counter: Append extra cflags
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
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
	Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/counter/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
> index d82d35a520f610260abb43f6ae28e56d73268231..c0628677af3807bdc331ce2db=
a92b4e5f1a25b68 100644
> --- a/tools/counter/Makefile
> +++ b/tools/counter/Makefile
> @@ -12,6 +12,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include \
>          -I$(srctree)/tools/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>
> --
> 2.34.1
>
