Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E902298CB2
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079148; cv=pass; b=VGzRRMomYHWZnfTdPpHYlj1oNMZhUeFOMtO7/sViPtpHx1c7f0IhSUMK9SW0D9DK8o4IIXi8fmmh84bQnrR4JAqyVeYsJ6voLPMIfnjzO/NI1dTW+z2EXYwftdO1+iKBrDuNHtFRJCy6e0tG85kwa6J4avTK4DmDxCUO4x25ZFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079148; c=relaxed/simple;
	bh=K9KvPWrinhMHT35zdp7wWeOdqTqba23yLvkTaWHsvhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+vXwPItX12SZBBk2OAF5mu/jx/ifb4yUAw+95PAfA60FQH+SuFa6bNl/ADUTWYHM4f05gVANqoMkW+aZBLY4cvvB/vAK/b5fymcCH/zCl7D5jpStPzSxRr8oRpINhYpw/KuSJMqJZxDNsJrdmElxz1Q7b5ZW3GK0gMpVNowazY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=coB8X/LR; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="coB8X/LR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae4b40999bso15205ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079146; cv=none;
        d=google.com; s=arc-20240605;
        b=Kdb2qoibyUOse+lUMEL9aGoj4DnC6ES0AcATIP7fWRxxTPu0HuAQfudLkb3rrliz7C
         qNkBeoG2qZ9FZkPwZ3hDADy7CBkFLC8aQAjB0X7YJvWzq0y79Bya0h7rWxhUWAOFE9z4
         D+YntFCMxMn/9knS8p9WbwO/uici3kqOvBX73gUTP1DiscxLTYKMtiXEBtYT0ELSRmAm
         nI+WTpUFzmNspumFxztbX7ECifIWZbBNt1ASXn3YzeJBcCDfg4ibePSoAvyHraszt5T2
         kIxclOjVW6Lrdoas2Ws7LcRvQvj7GVFaWvuw2Y0tp+0OlmtVfcirzwjIp1fOxh3WLv8U
         Obhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDreSjYEwoLVTucpTragxMff4MtZhsK4TyZGpsfQmdA=;
        fh=+XTtwtLn5cYB2SyUctLtRgQAd6NGrsvNt1U6agTfK8A=;
        b=D4OTuqKXDBz+SLwppHckNUVtsK1BaHfMUvKXoDkr3npwVGsuReqwG6qZn7JA7cnQn2
         3xePgL5+n+VIa9pmdBTRdJxzN6Jt3Lc3ZxUJM/V6aKmSGYniMgdZCGJoZD5ex5Zo+0wL
         5/w/Ho9e7d4yAhaLlg4YJGjdxXtKYXkqvC/SAj69rCxoGHEmIryeJ6rlidgfQV9ojizr
         smC+iVn6OLNxfulQNQ/Ek8NMGqnYN9HCCfg4ry5m5eEQYdJitQQE8m/WD3uZ232KFM6D
         JzXjgmPLD3zujGqEjgroHtSX0SqHMYbRwsb7zKxVnSOvchipRq3oHqeDGYm/hFKRQm0A
         d30w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079146; x=1773683946; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDreSjYEwoLVTucpTragxMff4MtZhsK4TyZGpsfQmdA=;
        b=coB8X/LR3GCHbeRVgB3vdjTWqt/7ZdfqIctMA6JPhoU/FVJ2z0Zm4/IBKr459Zj85t
         wAZlQYTz2JX6OJVRb86+OxtpnWsiCQh9o++cIBrxz0BASonUpqJrHXHQiJWdpVo/ukcp
         eJxFF+KIa9DM05Jk/G0xLdHv2K/ou/WsvDD1jtl/YeUrnPPtszaer6XZMyLTPf13RekZ
         HBXF1UBbsKbXXO1jntTWp25j3gXNrOfvI4kEuLDQDHRfBXW+nDf5oidkqXK+PNF7iDxQ
         XqB1rh11rSAWru/IfxUjE9gr3pe/XeAPw0tJ8Jejfc8FGUivJM6mqlBtJnMYTv/na2MH
         uJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079146; x=1773683946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDreSjYEwoLVTucpTragxMff4MtZhsK4TyZGpsfQmdA=;
        b=nDUlwVdjldFNS8y38ZGPqAKZQUcUcKL0wpjqlekocaRSTDj2/snnayVDwxl55oYdax
         Z6zymfUKv5SILNQzYmYfJuZT+pseWLmYpKAx7iw/0Z1szQw8J6pNY4KdzRrS9bbGvHaZ
         BlAXooCL5FgBMy7VgLZNirZZsCULVM/PtKBmoHCOODHIhimO+lfiGOYMNadeQdz6+oKy
         oXU0gkyq13R9RGd9EAW2RXU3Lgn4vo2UxpGutagf7v8MDzwHIwSUBzrxxUdkPXH1RhEX
         b87kMV295INDSGSbo9PVMw5kq4Va5LPQ5yZhdEXpU7P5OP3nQd7NOILv7L84u6dz5+L+
         JnWw==
X-Forwarded-Encrypted: i=1; AJvYcCXxqKs3jiEpc5eRXTV6loAt3ppNTTCOC9EWkXTFUuqUAZSmrmGeOfeElpi8DsIlAnD73sN0@lists.linux.dev
X-Gm-Message-State: AOJu0YwpyXGASzB5pb6376N/ErjhSVaTMCUf+8Mi7eEcJeMtEBFe5mSf
	lTEJY/mIbtsAft2Mjc13rlzhPKhKn5hvAwTZHRRrInZig5kNCt2rMehoI8OwK8nAF251gvo2IXu
	4WBfS+SybU3Lm7AvA7ygGwyuzN2TIhozXWUqDKi6q
X-Gm-Gg: ATEYQzz9Yr/cDuge9VZwVX525W6wr3MCbRoJCYGF0NOa9JJmDRpDbJWxcdOifuMN70C
	ARK9wHwfUs33sr5z7FZGsA62pRYz67G92+cYVCu4QV7l9m5qFIIaIm58Fwt5tCBk+KrQtIJrSJi
	JzX59jVr4ldsWCi1BJOSYz/LYWgKhhwJAQdqJoVK91lRzvJSlv4vj0L7UKlrKn1DGxWeLup4kTn
	YP92uNd4o5+ra6oLVxiThbKMpuFts3Y/y+Lu//XmqnZvWEwXg4NH9hFkwsXY8fADhaPjgZ6n0Nw
	Uvsr/x2MHxMMiUjkWIZR2oODMZIggCtXCOQ=
X-Received: by 2002:a17:902:d4d0:b0:2ae:80a3:cd11 with SMTP id
 d9443c01a7336-2aea311f196mr241605ad.7.1773079145133; Mon, 09 Mar 2026
 10:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-16-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-16-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:58:53 -0700
X-Gm-Features: AaiRm52uvKkGWQKOUhlbyvaGeNyxJc-w_yEiNj_NYeHVrpEtOTjr68aBFV5Bu78
Message-ID: <CAP-5=fXSK7fFp-=W7MavSMKbqpxffFSXKEmd=jt=7xhzvYt+vQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/30] tools: iio: Append extra cflags
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
>  tools/iio/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/iio/Makefile b/tools/iio/Makefile
> index 3bcce0b7d10f42208765be83dac047faa2e0ceb1..c189af6286751d141348957e4=
d63d33b87410381 100644
> --- a/tools/iio/Makefile
> +++ b/tools/iio/Makefile
> @@ -12,6 +12,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D iio_event_monitor lsiio iio_generic_buffer
>
> --
> 2.34.1
>
