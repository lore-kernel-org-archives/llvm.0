Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845F2C0F93
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079572; cv=pass; b=mLzta3uMx/zXmE32wwOh9msWbfhII/PTTlNPzcFRn0beEwXQmpiftvoNsMPOvti19nveJ/nluinUhlUZDI/nTNlMErrqECEfRnSuEE+FXOwsP41ExRhgEjLCQjaVBrNSIW+rDsZXjkrOVsqJ2v0pUBosXwxo6e973wT6eJnrWPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079572; c=relaxed/simple;
	bh=42c9ZH1wrf48IJ9g6TUsDx3jUDNj6OlA/w9q9LS4OsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nX19plBuE3JrSPFeqIj7o6c8PZYc/6msf+xqNFUiuQrjbc4m5gxElC6WzhDxzk9FBpnJ1nGhQWUwZsoIFvqs52hYfp4kvEgAL2qdHRFezc9YLRbsZHT/yVROtxJ8VP1DYHttuVrkvvDoFIOUQzXS4S3nyEnt1aLQSwDVcgDJiDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iYIsaEzQ; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iYIsaEzQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae3f822163so14585ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079570; cv=none;
        d=google.com; s=arc-20240605;
        b=XnGGHAjUUmOEVQg0YEx0r36+i4PCskqma52vBX8Yh6hOKdgAaB/EcCbDC+guxsmRhJ
         wtr8lUjn35kf28fudhPkGFq1qAhFWQ2+dgWQo6ZbNFJCJa6w/nM6apDJDsMO9TVQlTY/
         4BxJXzTC0xnmVKeF6g0exmI0b92PgbyrZ0ZXZIoDavejgH+JLyx/+IEUEKWgCliqqDW5
         8aF7mgQhZvLTsVnW+0BizD+vY1Ip4RVPRamVTkhwz53YQ4qQLGiplcx+VNsDVTA810Mg
         AwSOHoxo7/WudNIjKq21D+uKSC4OXADVl+sN+0pYGKdolh1CyDKcBj0WhNOwyDbUyB+F
         SYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8XdeGKgfNmQ0ihM13m4/+pDXEjwuXh/6MDXE3f2Ssk=;
        fh=zsdvHjjCBrj6mY66XfagGC4j+bgIK7c1m7j7QDYGvP0=;
        b=bdz3rMsEa2ha1nSJIYXzaFZU3t1vHK55GFZAXMeY8rMkTgnMcluvYQNhQLIjkMZydu
         MPNH3zKlp1jNOdtWVQnqecDNhNO9dWTYxWXp4EBSE+9Emj7hsWPusLUtfxJWgEtJlO1E
         RaB3fK+LJbVdU3SDN9m6Dxb9551OW+WLVeWhLevwue+vgMfkjb25/PMQGte7YKhQ/liS
         j/TtbP7vCqpKgRDNcgsPuRDf0lvObIWKVeUYRINxEmiIZy+tvmXQwOEOG8n5OVsWR9mQ
         mBCAeLzSfPPAGPbkXNkUnGZqCL1+/H4+RjCsofvl+4LNmghI3K33aSRCV0gSXXoynrUw
         m1+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079570; x=1773684370; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8XdeGKgfNmQ0ihM13m4/+pDXEjwuXh/6MDXE3f2Ssk=;
        b=iYIsaEzQRANzH1oKMQtoDsdOCBGayA4lFRZF1aIW2Vfu/3w92GDa+uqVh3cNwnEGoA
         HklBATWCXnwdBuqJbGMJozUlx6hRmjo/Ky8HXXhAAqFUlVFOzJsljuLWyW2gdZ5O4kdw
         GS/dPhp2QPmIpO1lurXGaYH92VxQLSbyAIwxccwgNU11eq6+tyF50p35OTuCmqG0jcWJ
         BK0Gsha26yNUFaNjCBRwxIRMh7LqVFWD4TsaBt71JyvKrdXaO6ZzEZ1VNmFZeQ0ERrk7
         6stk8v+nvefH6exqw2HxdGYcT1XutcPaMv0MO2Ga/GeghA2crRrmKVwWiVFPWm7iKyHO
         ThkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079570; x=1773684370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8XdeGKgfNmQ0ihM13m4/+pDXEjwuXh/6MDXE3f2Ssk=;
        b=H8bvx1aaqeQvbBHAvNrBvSxN+KU79mq9ViKaaEEy7cOZ6C8SflXDCzBf0mMGW5PzQk
         98HaDwr4thtxTXwPB/Qy1uLQgda1bVeUm1c5LdRfCwie2iU7SQzG5w1bxPN1bKTYhNoF
         OBKSwkAdoAULEwysLTWskKy7eM4gOed+TGJMIRFAEC3eQl4iHnK5nvn4/d4JvHs2bgLI
         gjM0Hzen6iN+6qxLwkM9NjHwbSp3Nvy2UZQAWGZU2S6x8gP5+TxqGYJueLAHPX926rWG
         bbVRA58OvFYSF15spkbMtJ41sghRItp8ic4rc9JHZ281LXvRIqIIA3npeeJ/eaC6a8Mq
         FgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMtAtn0FF+7wfOYHT0rvB4Uns1fve8gpXV7BtDJEbKPShJpeXsc2zfLIyhaKyhb4qBgN+C@lists.linux.dev
X-Gm-Message-State: AOJu0YzFyq6pD4I4p2qo4EWiIZxaezDJTalkEEwBaPBgfznzFZ9oF+op
	CkMP8PxhAeWAw0vaAhUymLUHi547tqFRfZZWWRDtZJg1n50AFCSMcPeXpR6VTHErqSo27NqooAz
	FXB4PT1nX5HXIz4I4Qa5R0KMaP++bVlLnkGGxN+uC
X-Gm-Gg: ATEYQzyHpNLsT7WCctWdkK8QU8Qo0XwW9Znl2YsrZ2OllJJtWxWI5TbcCniU+IU7dIW
	sttj5OTLbrPYbeTb0R72Rw02zRruqXRdR94oF8O9E1x3HFyfrrQR7uIvO9cTmXlN3W5OiSEQ2qQ
	8o9BvlKRgrSSderBiZoMc40YsMNnxCpyWw6qKsCUr1OrB/QIv7wio8vK68jXOf6Gz/IYV4m/Cqu
	XziULBim5PIRoPPHFhIaNNC5Pmv9/tR3ptTJWEUeu0EZQ//Ue0VWTRHyuDZqKybiUxwwt0qsiQH
	JhAiaqaj7ZtfM4KH8kws2FBfcXy3CmDPEY8hFblW+bkCqQ==
X-Received: by 2002:a17:902:aa85:b0:2ae:8039:fcb0 with SMTP id
 d9443c01a7336-2aea3122a7cmr154565ad.5.1773079569456; Mon, 09 Mar 2026
 11:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-27-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-27-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:05:58 -0700
X-Gm-Features: AaiRm538eyfLQGrSYDrM92WeXq5PMuuL8X7tS3nLFN11znCK8k6pxl_hktQ-lc8
Message-ID: <CAP-5=fVR6cTg4HU_DvK8sckgAqWw=HbgSGSdY9-prjb+TiOzbA@mail.gmail.com>
Subject: Re: [PATCH v3 27/30] selftests/bpf: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/bpf/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 72a9ba41f95ebb825d25799c07ba3f0311243e45..29dfcdbe98c781b53f1e87dce=
becf2027bafcd5d 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -49,6 +49,7 @@ srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  endif
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g $(OPT_FLAGS) -rdynamic -std=3Dgnu11                      =
   \
>           -Wall -Werror -fno-omit-frame-pointer                         \
>           -Wno-unused-but-set-variable                                  \

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

> --
> 2.34.1
>
