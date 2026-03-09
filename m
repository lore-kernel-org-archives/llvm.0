Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC92BEC57
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075844; cv=pass; b=p+FeCwmBp4N2ZkvE6kPxGEMvMVlgtDZdDOf9a7vzolq4CZTQ4GTuryimnZ7dWClGc7V+UfSgAkJKIZ53Qp3Ppd6I+bOWU1wB84OSRUJGcSCVmUo0rWTwuhUP2FDeSRhBJMrOgiSpO6VXJrsY86dRnjI7fTAv5Q6AJ3GCM/PGJ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075844; c=relaxed/simple;
	bh=ASdF+Mq32+mdYKDjWTsjOQ8jTq7m3B4M/EbHwWyjk4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAy0TUdzoftauOPI4/4ZGC1AeHhpK8SsdG6DvB+Nbf9lq77RofvQJOI2IY78FIvFf/01Sv52miQzcjQ3V3TEEFFaBLxkdYd8xSrBUi49NvU+b7GTcf3qZoxpTErvh0FkYmdXtxTyih+yhJ0ZUXvcSZLHsNJ4xIWGyzyPXjBd+aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LCGMkMom; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LCGMkMom"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae49120e97so8505ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773075839; cv=none;
        d=google.com; s=arc-20240605;
        b=dtjGwiQg0Tr69iBf3VOdAxbf7Hts9F+TZnT3OO+KKDEjBvsx/iiYS3AZOIwk/rbhLT
         zr/habfc3AqUTY/arH/D5TyVAhDnGScgW52S3SXzto3wUUXJ1z50XTjuxUybVl2WKPpD
         2J4peJ9yxWqPByFOO8k4WC5Fvq28yoIUWab5Y6W3OqqQCsPbKB/ZJk0boib8TsKLBqxc
         ilAkyPhA8x3d138wqPhBaVxfgosU6fJqsNKkzCza3bUpM4ryH03VR10VItmDhBFa4jmH
         OrVajr6fIacvIvuavXXJ6CPzrSyQQEdBZ1PIc6vlkWrWGsc/tb+RRrozj8q/iOqdzpN2
         cKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=waNBZBIho4Q6qhndz2br3MqS0TFnbVcCKcfXaRGOh+0=;
        fh=cely/PeVcqwOn4IED4cnzQYUarlU8Z2AUoMlsSNDmzM=;
        b=SzrUosPDlI6w9toQbU99VXnDo8//ZezxxsQ5qNialwKlp8C21KeE02WC2LF8JLvTbG
         syOIQTjWj8q57LKelll3y8n3LICSeU82lxtF0fHI6k5Ia3uUzmkrK/0PA8FuJtbWoHqM
         a21dHz+pGIGxYfygcB1KwPyivEm7VeDHP2zwR7CgIrSKuzeB5sjlhqGG7NP31DL3GIBq
         QjhcdZkiWcdlG6JwMTfbIN49oVaeC9KDrPO/Cytfw38aeSjimiaX3yU9rThVjJAfkniv
         xCQ6XullvOhGyKLRovTEhp/IT63ciBdNoAxIGNNUdqH8XPWCKYeKU2MKuOltBmMX1lOM
         DSkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773075839; x=1773680639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waNBZBIho4Q6qhndz2br3MqS0TFnbVcCKcfXaRGOh+0=;
        b=LCGMkMomiU7pVbqmNXgbYa/W84pFVOrThSc3ltDBjlB+qB28a+FxdrtvcWMeoKk+yt
         dQkf1ZsIjhjvx8AUE2kygilLhs1nR1svPlNGs5fgk2vyBLyzcrWRqTLuny2nPiaINDeC
         CUDlqrRsR3Hvwtu+nsuzdNfRowIxFgGGCFhH7cqJCZQIJyyWSHoPhR8qY3JlWjEG/4LA
         kTQ5pMRYyJ9vMM64kle/ZuwHQWMQFZG3WLb2Jp4+nvLJCVkey4IvvXcpG8nUA0BLm4ut
         /C0zQKJYXXrV2sPp6TSnqYoUo2maUdz1hoGntqWX/It/MLH3asu6OFcOoO12v/U0TckG
         +HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075839; x=1773680639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=waNBZBIho4Q6qhndz2br3MqS0TFnbVcCKcfXaRGOh+0=;
        b=IvI4XXICSoJpCL1RsrBS6ezXrgvnLMb3lGcpJnEbKEArF1PUG9Z1uObGo1Rjg7AlbM
         SYFOz9yOysXiWAotuORgSt+LdS2URwJVl0r6oP4rvrDnGUqA3gBluIz7tJeio5CNTdtd
         WSljDRs9drJIBhY04nQIuRH0zglfcZ0hBR9iLGVpdE1WpjLnyjtTARyEMrZjLZ9QOSF4
         63qMP/9TrZH/a935EUDszICd7pfyAFnGpBbkA5CKT7vCI3RedHlSbnoECnRtni6SH4KJ
         9O6bEQnNk1BfmTfIviNRS0C9SSz7tMQTKuyCy8KtNo/0cn8YjHw3hb3CRj6NXrLZ5lyT
         M6oA==
X-Forwarded-Encrypted: i=1; AJvYcCUpZPPWDly9dkHCPMrBiKLpRNKCIFATsbyjhlpBgvGhIVNsZYj63I15a+sIZUB2r8ysMAua@lists.linux.dev
X-Gm-Message-State: AOJu0YyiSrFozN9aZG9t9Q6lsJfGquRshEe2qhuOTHJk374ubEMEk8NG
	TWhy7DBca9yhn/djfbzaExyN5TTYUGUygWDcpAb142xYPH3Uol+tyFBBnh4bYHwRU33fke8gr2B
	cR77S59/Qu2zh/uxYVr0uUWlpSYTbM8ASkycZzyNY
X-Gm-Gg: ATEYQzxzVj51UE0Y1sZ4RGUSa2+bU72gIbBk+zKLP9Xu47MUYMIs2lM70HzEdEgQ1L6
	+a22gGlWscLldlUNUEpRyzkObBAD2kRynEQ13Mkj3TesvFz39t/D9mAlIaKqBYbmD9RVI3g5BOR
	hdB1vj+idmX6XLxPiRvxG5CCm8HqxBaRNB9DTrO7v5SF32zsxecps0A+XYZZoNteXi2DfcxtmYn
	yvLTAbH2CNZUL3YuCztT3/6aBPHmJHQtaIeYQXDMik0O5VEMPcL1w+fk/uPVuYzRrKl+kUY61j0
	zZMa6km8ZBFF1vHhXoGytcBau+/vtXHnmEU=
X-Received: by 2002:a17:903:40d1:b0:2ae:44db:570c with SMTP id
 d9443c01a7336-2aea3053fbcmr53805ad.12.1773075839042; Mon, 09 Mar 2026
 10:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-2-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-2-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:03:47 -0700
X-Gm-Features: AaiRm53Xzo9WAGNyLfx5oOgp1hEVoxj0zvCDJaSL-xxCQXMap_Y2Qeu5UcpeDVU
Message-ID: <CAP-5=fX7f69cyuvKwXbJWz_njdHNdcoJxY=wWPCcz86XMXBX_A@mail.gmail.com>
Subject: Re: [PATCH v3 02/30] libbpf: Initialize CFLAGS before including Makefile.include
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

On Sun, Mar 8, 2026 at 9:46=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Initialize CFLAGS to the default value before including
> tools/scripts/Makefile.include.
>
> Defer appending EXTRA_CFLAGS to CFLAGS until after including
> Makefile.include, as it may extend EXTRA_CFLAGS in the future.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/lib/bpf/Makefile | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 168140f8e6461bd06db40e23d21a3fb8847ccbf4..76cc802375f67b9d8f589904b=
d9764040947e5dd 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -49,6 +49,14 @@ man_dir_SQ =3D '$(subst ','\'',$(man_dir))'
>  export man_dir man_dir_SQ INSTALL
>  export DESTDIR DESTDIR_SQ
>
> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> +ifdef EXTRA_CFLAGS
> +  CFLAGS :=3D
> +else
> +  CFLAGS :=3D -g -O2
> +endif
> +
>  include $(srctree)/tools/scripts/Makefile.include
>
>  # copy a bit from Linux kbuild
> @@ -70,14 +78,8 @@ LIB_TARGET   =3D libbpf.a libbpf.so.$(LIBBPF_VERSION)
>  LIB_FILE       =3D libbpf.a libbpf.so*
>  PC_FILE                =3D libbpf.pc
>
> -# Set compile option CFLAGS
> -ifdef EXTRA_CFLAGS
> -  CFLAGS :=3D $(EXTRA_CFLAGS)
> -else
> -  CFLAGS :=3D -g -O2
> -endif
> -
>  # Append required CFLAGS
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -std=3Dgnu89
>  override CFLAGS +=3D $(EXTRA_WARNINGS) -Wno-switch-enum
>  override CFLAGS +=3D -Werror -Wall

Not a problem with the change but AI assisted code review noticed
something unusual. Below here is:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/lib/bpf/Makefile#n87
```
override CFLAGS +=3D $(CLANG_CROSS_FLAGS)
```
and $(srctree)/tools/scripts/Makefile.include has when CROSS_COMPILE is set=
:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/scripts/Makefile.include#n116
```
CFLAGS +=3D $(CLANG_CROSS_FLAGS)
```
so it looks like the CFLAGS is duplicating $(CLANG_CROSS_FLAGS).

Thanks,
Ian

> --
> 2.34.1
>
