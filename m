Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B0347BD1
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079290; cv=pass; b=tclc3FB0yULyO5lHMHzehB9nEiqiuhLUZgzxzRk92nvjyxMbDVjzCA87lVMeWv/K4L+VQlPA4AuZpJYFA/PEjJQK2e5u/tTXJsjkjG2VnGao6mM5KV9QjwXrPwvJdHLP8UKAaVqPbz099lcHPeF7Okrm/Ux1o3y7qP9NG/Rp+oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079290; c=relaxed/simple;
	bh=PoafOCA89v7UXLaSorz9ixnmscwPr1Rj7wAcGvs6co8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRii2KdT1csysGv7uEIyA1kkJc4jv2ROh3u6xDOK6jX1I1zVCMTZdYv8S9ONXXSV6ius+v4lqs7eTvWLGoIthG3Aytr30HNYw+zIxFK3t8iqVT5zUWn08POI+mjePg7rsTC3JGcPOf1PrFG2f1pgiFssu82TfNQ0R0cqOym1WCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aom+Sj4c; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aom+Sj4c"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae49120e97so17475ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079288; cv=none;
        d=google.com; s=arc-20240605;
        b=iGkhhSenTwXzmMV7M3VRNH642sieONtbPNoBvNXR7TilpxOJf/mc+hOodESIl2Yw9l
         iHUPUJttpktHscLFazeBYHfEQjRJHdvpltkrNr57NwIQ35DpBX8Ya0zthb2Wp03Vkdr2
         iAo/zKR9APAQUFSXPPwg/McO01/TRQxEM1z6j6XjZWZQ2RpaaPhNmTPASFDXjGFUqCVI
         KrXk4E6YVVNN9b+cyYA3MX0Wh99eHM0nMJ2CXEeC0FRKdTLyn5qIHZKKEX/2ef4Rsv/h
         a/AqYiRFD/Daa1fiddhA7MixsOmS2Vc4mQocOb7W7yqwO1K+kzd1QRFyrTVOA18vbPh6
         qW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r26udjS1htgyNVho4B7xDT7S+9gsz+aLoULdjRjLynY=;
        fh=EL/NEgWZr5m4Paiojh+H+NK2Qk0gX337itk+2NGqh74=;
        b=jrxhsR8ws/NULzCegmj3Larjk5/EMB8AzjHXiYQ1SROAlMOjK3qKasJ7Gt9FB0UJHe
         NW0CAyjAp6y3EUjQZVANReBownPpjQvuu217jTZ81Sx92R6FZAImt5ox2I4VM1p8A/kX
         k2HHG1hUeyAgY1gLACZX72Qxlvpz4DiRxIoxRIpES0b0EJEY4CVlBM1PM24gWPqTMZd1
         lNF7KGOq/tcVKv/xxKVS2AkXlLbwA1qHROrq8J6JtTAso8IiBAsJzMBTveSqUP+2TBO/
         IZgeZkCcCgq9d4hsudioOIzMfVMJGYNIea9VFg+nXRvb/nrAkOZaSrtDf4AhBGGL57KR
         oeng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079288; x=1773684088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r26udjS1htgyNVho4B7xDT7S+9gsz+aLoULdjRjLynY=;
        b=aom+Sj4cP76N/Hdih9YBaBlS3Pp/n9q1RkOyLWbAqz0/ywa7Y3kyTRfBpLg5isSZ4x
         btkpmhCItfSSXu+WeHQxHNbC7t01fD2yaWwmU6JbMayABQOWwV0vOS077D7ZQN8kUPJE
         AEZqZIMrKhjPbpNGEmmKa6dA7fnPPTizabS0ZmXvHLYgP3KndZxRgAnQVEqBW/dgWufK
         /VLaEBaZNk2QfEL6bLfZ5vlCC1nD4eMdZW5ltkBoQwQnJ5/B+tkIyZ8M5/rS0magEsOx
         x40WbxOW8BCdU/AStSrtDXYy5EGsDjMsu7q3LPgvHFtfe8AOqtblnLBo/2DyGQ6IzQUP
         ZE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079288; x=1773684088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r26udjS1htgyNVho4B7xDT7S+9gsz+aLoULdjRjLynY=;
        b=np06i0N8StGvbnJVLs4n9feJo0rsFGZBtaEdqXn2xNznz3gOBEqKvZWDQRibhT+H1R
         RxbClvI3K3MN1mJqQUvyeGaUi7X7EyX0AEpt+9MR53vtrrWQhSwYy1ZJcxpDsVFB/vwQ
         31zpXbtpH9aV+wx9gbtm4+XR7VOsTU49u84I1QH/HFDVMrypfBbPeP6Y9HtAQvChNocE
         fapPUHgF8EvzE2E5M/wv84DezKcF4cXX44yPPWSeeBu32o3AVyMDYshzJVm7nDw6XsnQ
         dwr9wclFKz0toJ1J06y1GieVQLV75myIuAk7YtTQvs8HtgklQ1lqJ/IlPfoVuhvQGyvH
         qOKg==
X-Forwarded-Encrypted: i=1; AJvYcCXrdbAiYayydHFuiPUa9qfY2ej02KrLm0oboLi5Wr85isO3HweRVl6hDI8Efu79fwubJibt@lists.linux.dev
X-Gm-Message-State: AOJu0YzG9IXPgMBouB6a0/0Bx7sSX2YHqREgKRjfjiLpj8p7TPL8KUYH
	MsHVkLT5v8APOFk60rPB1rYbBFIHfmpI1hW+3WwgoomF3ihPHV3lhmf/ZYLJv7cIyiRCdLeoZcY
	xOb3XOIHr9ufXyyJibPiKPypBiaHlv2sgTJyzJ9WS
X-Gm-Gg: ATEYQzymnGLkizlYDTyvkro/7TDv5rHmKA3ArlbZePFJteQz/Gn8sVfj01nNp6V77FV
	so4CTT+nxfRJvRA3HlFr0M4R1LN+oy5PRmQjpab6tYc48OQZP0j5EBJxPGBhSOD8ZJUDsw3IsLj
	8VExGCWDfYV/FBlK34F3wk9lLAuCVhL6SrHfn38kbpeDalYiFHwoEHhMmk01CnrOMKhbgOqX3Tf
	pdor+jZ0t6WYnKdAw/z/RvQFKGdgu4H+3UNOgi0ko87fQGA5/zW55LIYWXYrNz3m6qVsyfnOYb0
	rmcvXP+lUwDTPfAmBXDbaCZzuxpug2f+M1I=
X-Received: by 2002:a17:902:f546:b0:2ae:575f:3755 with SMTP id
 d9443c01a7336-2aea30d24bamr257805ad.20.1773079287603; Mon, 09 Mar 2026
 11:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-20-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-20-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:01:15 -0700
X-Gm-Features: AaiRm53zbBx4vwMw2frKtxn1Vd5dHWsmKAdma7wTK-CrU2Ft3XFe72ThDfNa_1s
Message-ID: <CAP-5=fWX54+J0Sbf4XYfcNeEgiKXE8t7T6FRKp1mOb2gm1Dg+w@mail.gmail.com>
Subject: Re: [PATCH v3 20/30] tools: power: acpi: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/power/acpi/Makefile.config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile=
.config
> index cd7106876a5f39dfda38e286c54c3a7c268b34a2..4978c06828af7b0f47e533735=
ad82c962b7e0765 100644
> --- a/tools/power/acpi/Makefile.config
> +++ b/tools/power/acpi/Makefile.config
> @@ -67,6 +67,7 @@ WARNINGS +=3D $(call cc-supports,-Wdeclaration-after-st=
atement)
>
>  KERNEL_INCLUDE :=3D $(OUTPUT)include
>  ACPICA_INCLUDE :=3D $(srctree)/../../../drivers/acpi/acpica
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -D_LINUX -I$(KERNEL_INCLUDE) -I$(ACPICA_INCLUDE)
>  CFLAGS +=3D $(WARNINGS)

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  MKDIR =3D mkdir
>
> --
> 2.34.1
>
