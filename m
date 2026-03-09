Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BE41C2F9
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079071; cv=pass; b=A19oPV14I+/Lk7btv4kXf5rX3wZiYKRLuutbCn9V9Ulkpdi6Rrc9mJfBpEiDRa5hSCX3l2c2Zd71FfD4Dbs3VIWBwkWgaXU7FOYPmkldVe6KItthdw+gKDPA5Q/HGEQVxYLtEgo/JEpkkK+Pcym68DiMcAuaZ3DAlXD8Aqr6wq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079071; c=relaxed/simple;
	bh=bi/0kzUFQaV8p3doZRD93rVlwd2uelaWqK+VBjCrW5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tI9dH8DNSMlhCFFRxJbx+qFLuExZ1YL5lX7yAru60l5IYUA3XvgC0/KUZhNeJUD9zLHHJB6UafU/5UVNNw/tk+tN/7yHuec5Eey8jtcCI68Bs+WRsssMryAPAz2Vxv7HauLEdd0gtcO9miPBr2QXRDAzitbcVPBM22LVRQoCYdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=faunCFSw; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="faunCFSw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae4b40999bso14715ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079067; cv=none;
        d=google.com; s=arc-20240605;
        b=KhwQDbbl4LlWG6RCh5jbC3jcEUKSC0ghksIVbieWCgYEdjrBtDCOwBok31ub4+XkGJ
         yzFXyCkIw6nJ/hi3/bMOGCA/Dpx9BCvyf/DJw3gdxPzVz4ZoQLQzQhy7YO0nAGMxT+K3
         SAxfYGnhoJbl8SiCGcq9ZV4z3tII2KDOJWLK3Eg3ixWPlUBbRnMPcB+WAQugdMJ7ANty
         ubmwYVs2Ygo2cLNwfB85VNIomFVsnpjyNo9tA2gKMB4X/bDSK/XxS6ociZY/XFstja8U
         F3H9ErRgxG1eIOnfNDKJMvJ51zHGdsbCqLAI2xv2uoLpRgpv+IudlV2y66u1WxBB8Jv4
         /8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDlEc+C10LHwn7mMynGp+oAsPyPidhsvHXmfLuBSVbU=;
        fh=7v0ZhsdOBsOCalpPN9bpa/pKW/4BDs9XyEk8sHVZQek=;
        b=ACLh891pzxhWv9GB0xJHow9Lf2luGELUju+AVIxDtbkJIT0dQ/bUUzIdNptRRFSMSg
         cVUymPZ81CiSbR16okbc2hUTDn6Z7rgYIBjqgD8k2Y7TcanaRD6NBakkHlXtbA4PaFTI
         4x3n9Aw4Xb2HhfkkYjBVawrSqPvWsMP0fgnXkshytetXgAU1Uy5Hy665jWvZmFg2QCSY
         Oj/T7a6zZ4mMuoJB4BxRIOvanaOl0w4z0OBoZ80J59GBFB97cbCibBaZsnR+QrIVjRHi
         j/j9jjhvNey1C9yieiLojA9LFRxec4LolfP7qHoDJdF3TH257gO3OamVINSLfuPe1BXr
         GPjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079067; x=1773683867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDlEc+C10LHwn7mMynGp+oAsPyPidhsvHXmfLuBSVbU=;
        b=faunCFSwU1lsjF/MbldIL8j+K5CgEjAci90mAb/sj16PEJp+QgVCxALO5MbR5LNM49
         oT2j1/V+duC8mGoGdRUWCrZLr7VsTt5VFvRpi+VLdqP36Y2HYXSJFMS24W+JXZi9U35a
         PY3WGBHiZcmE0frwgODa+flaA48up7uKOuB5Z6ECC3zXSVc1vtitye9c4Fb3U/5HbaVz
         DVxu5CPXGr+Nx/9py4GdwoTkNss7kWtR7KUoC3YC+iiUTk5RcQVafArOzSr70+9kN482
         cxoTClIBFQYAoi1QBPF3++tKREyAEHFJu4kOyby96ARgpbcHJ/NQljkc5rKTxyRUTkYi
         1z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079067; x=1773683867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDlEc+C10LHwn7mMynGp+oAsPyPidhsvHXmfLuBSVbU=;
        b=VrJnr/qmwTtEOxB+iSmNRgTWPnWkqQ/zF/p0Q4dnP256cwk/Ze2f9uBXsibhOj+NQZ
         LWGSYW6p40rXbdpXy4xZcpy4cF5/I6iRfitks3rjJiT00TZy1OOWhXDZot0ar383vpqr
         9cgj5kkf9Jw3YmEGFQDXNrw7tYtDY2tqtDLCLW0e6TgEyuNiC6Y7zkI0ScUW1m/PHZNk
         NO1WrK4n2fNqp3pJNK+7y8F73oL+cO7VWZxBex1oY77qUu/DWr1vXhgCOSywWLFz+cIW
         bc9zKqko3rrHyaX8xws13vrUAUr57SzukoYNODZ1gu2zaDhYpyM9fsrTfp2wVzCDt6d8
         PILA==
X-Forwarded-Encrypted: i=1; AJvYcCUzC/0aUMX8yIJY8VZqk4IhJ8iMmIEVlBSkW+DQki976EtrXbbQ5Ku9ud46nNzdjdKtQ3N6@lists.linux.dev
X-Gm-Message-State: AOJu0YyWKEMR7f/pnco2PbFA91xP7KxrlqBBYUbGsQhfOwb1wk5KDulc
	tJ5OIAoknLHduZ0PZsgGfH1wRKr0Gn2db4DnWIh0LMKwmaTr3kE1UvrbQIbP6jpPSJxg5Aw1U3l
	GG1lzrBABMxLcW8N+EZFaLXqxCri8maDyXCMnmk7U
X-Gm-Gg: ATEYQzxn1FN6hzdc5i7lX4v2US+C4+jROUx8SGopxRmzwNI12oIxFoMEz1G9Hc11qXX
	L6w0KTfyW5lcxihN1/DjBJ3W1VvP090G1FZz6My0dpW/ickpcT8ianz/giPrJqnQkZ4Qho8vRdv
	QXDEZBk4crMzsg22cSMXoMTkjJ7zBqKcxbJHPZXB9GLmwdYZLYsdDuWXs0FV9OroMDg4VnX7s9K
	PrlwNA+BhulHwDDnC/oMMvy4vT3BPmsRsEuEaBAeUNzd75W9yQXt8reGshYuSi2b1h5zBb6CvTk
	m4rE/0zzSllc3Gxtd4+OSmg/VsEQWe1UWY8=
X-Received: by 2002:a17:902:aa85:b0:2ae:8039:fcb0 with SMTP id
 d9443c01a7336-2aea3122a7cmr131785ad.5.1773079066411; Mon, 09 Mar 2026
 10:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-14-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-14-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:57:35 -0700
X-Gm-Features: AaiRm52StTlx-ugeD48VkaRFXPHj3olO-UKSkeOjK7TIFhirgpNgc7cDU1gN2Ws
Message-ID: <CAP-5=fVTKXfV0qqt_Fj6r6wZ-O2X-gqjM2mkPfbawnDJQj7U-Q@mail.gmail.com>
Subject: Re: [PATCH v3 14/30] tools: gpio: Append extra cflags
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
>  tools/gpio/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 342e056c8c665ac075041ff7c7ca7ba94c691187..206fb6c91a569d64b1e4b906a=
da5ec866323053c 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D lsgpio gpio-hammer gpio-event-mon gpio-watch
>
> --
> 2.34.1
>
