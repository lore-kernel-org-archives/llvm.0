Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87123D412B
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069029; cv=pass; b=Afm8iYAFwvyTaXfkfoD2KI4FAauqkponrduxItKprtUZN0i/EFTlW2DBN8eymaSs8OmtmO46DKmW++kDdyfx7ZTNqmdH2bwQe5CVOffs9p0sa2Y6cQ+lVmHGS23Q32w5aO1UCIrD/3KOP4ednY0xEFMi3NI2ACUjydGZkBN9Cz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069029; c=relaxed/simple;
	bh=5i8qPmQzszVgv/IzZW6/JLkFuKhxnzZQEpxh8nw5jy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHir7+51Icor7V1p6ftTYIYX+q7uFbLpQTUuD3MFHoKJCmDlJSUai2Apaz02QvkKNYCELngf4MEELhiQeQUqYJMPPfV0M8Xy4fXVMJwH+Hr2d987DI57OFbGvY2J+93PNJrSfpk30pQO2EzmarAf2aMqb0mnXhEIXWrECHCsFnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QcMq2riq; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QcMq2riq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae4b40999bso157365ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 08:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773069025; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5IMUca/CdZ3JOTAdV2HjZMireNgKOQdc2xDMr5pf9n5jMhkUmKKoz3LIvJBGkDhUl
         prdfwxfR82xfC6/P8RX0s6PVSGSxRp9ugKk23NFIWBWSL/z1eAV30RqogXX6xxm8amaO
         14UxNI0bwi+nGylgbQzHRrN/MOkcJuS0e5cBNt6DqPKUIFtfuIEDd6I0Hh9Rg+hE7y5m
         8pesICdrKMWetPmhllg+8Pl8RjPH0VwsiWY+3PGJm+F7MgD9oSeOBTHtYynb91y+y0B9
         DyDNv7Ut+xM+0Db8YsJ+oUBtyn6MNd6Xb/lj05NRHQDreBBRgsoxTQGh5kj9TYXhFGzV
         Dz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6FbR4+wo96W1dWPj028FNCvwM/SPgWjQY/Nh61K7Dcw=;
        fh=Xa/19SOVIRwMNk1OlQ8QJQ7RKmErnAxqxmBY2hMyu/A=;
        b=jTs3F3AOh8PFMLKRQh9uJxZZdSXcCotC37FKkHKsHeDzwmXRXVe/CtxnJ53C89XYVa
         wQsPoMLvh/yG5JDSVsOth2fHebYo2hB+/IUjkKHPceyeyyvLmvj/xR2cKOguYB+tFyh1
         76Bk1nUcGAUFlWGz/IKX/fOPu6BVRQcdMRlLqqY5jitxp8yIa5z1uVvL/T2j+uAHjPmP
         DA7dPv53Du36TkpxBgoUCX3DoicUKzbH77c3ZXXkD/Y4jCwZ7mniHW1H1GAMqMpKWRAv
         fkk1tGmvO3MV0KFR6CL89CVMARUuYJTuvarq49PTbUu9b55M6Zz40JUWxt/nJzh3EapZ
         Dykg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773069025; x=1773673825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FbR4+wo96W1dWPj028FNCvwM/SPgWjQY/Nh61K7Dcw=;
        b=QcMq2riqhfjZS4ySNBCR4nS3Xfr8T9TTnYK9OII1cfTNicCPcMff5EEpTyZb/hxI8o
         YKSj6FWDXkZneC9gt3vgsTRQvkLjyynz1J7JxZisziVKslZDyd9cAKxVOHHAqecUD4cW
         ztTIgys4WlmDiEOBWDd5NPkuy0QKfSlg/PD+okIpy0NEp+Hhec7WIJkX/37h0SOFxwuS
         qoAmRYS9l83lpils6Vty/rJTaUOjQwtWaxSMslJbELsoyCg+jZ/UuqvUc0YKmBouuRk6
         bey4o0GVF3QsLRuWa3EGlVmBWACZLEfYGOY9Y+f2f13+ckZGQN5eEXWiLsHNRPXEwpxO
         vipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069025; x=1773673825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FbR4+wo96W1dWPj028FNCvwM/SPgWjQY/Nh61K7Dcw=;
        b=sNjGmBfGHT/Q88y0cWLOna3FLmtBiVX/OLyjlxy/5VbZvXFDkSTYC+g7TpCidfGwVL
         iSS4dALeqqInOP23glaX6vj8dZRI0vGhf6YDv9aMo2fgFTDIG/gi5TE4j4GW0vkrtiO/
         60cUrfA0xHoD3fBf42bKmIMe4OeK+UZc5/CslhFBnQgX50gi8cfVfhaNjc+Q7/GAtnJr
         oPgSKKfdTOXkjUkNyO5cv3ptPtgxmF3nLEH0+wGQkmJs5o2Tdkz3qcYlJQYC8aaBWytA
         U3fGk72z1oUvXOHg6qPN4sP4q/iy+P7/6i6zOJgEaVK8iEo4P86NhpphrJ+Lponbjqw1
         buhg==
X-Forwarded-Encrypted: i=1; AJvYcCXzIdi5ItH+D95xPf4L5F3IfTulwhBR8sYR0NNpPawgKO/4fJx7Lb8mM4oLlSZBw3vIiren@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn4aP43FwJPEwoakSFdG9V5M54vdcUz+C8SsSyOK3qKcuxQP/z
	tgQzCPrkTammufcCVabYWWm2CUh3pRHjk3AlsWzbOrU4swyjUfHFTStXLE5smWi/rUdJXWIHsgS
	WDL7mCPslCVmMjdlW2R2vVIRby4xzmOZ9lfG8cwvR
X-Gm-Gg: ATEYQzzrJLuoW2cI3U2UAR4473gTQFPkHSfaQCSQp8es5jpMjohU9h36MDG0VzzzFk6
	CuicTwUr1+b9xRNM7qQ/PVaYnKzGuhb/8YrfnawWKebBeF2ri6aiT5CgBU0MAPR9PRluomvaDkP
	9WomnrJSOLhGR9UTWLWZ7UH/1d6OC+JLw+HSKjfpB9csOejz+mP4sSVAiG6ldKFQpQz8c77jFSS
	lz97/RdL0CFDNH3c0q8P8e5nlAwZAna8tKO34pm2HvApMznyTzNSS8MpjChutRYvv61aOdOb5xi
	jHb1d8RRG16qfOTL1FqCBvyC0sCkNowi9SpnDg==
X-Received: by 2002:a17:903:1a23:b0:2a7:6c4e:5914 with SMTP id
 d9443c01a7336-2ae8ad1c62emr4122395ad.6.1773069024342; Mon, 09 Mar 2026
 08:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-3-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-3-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 08:10:13 -0700
X-Gm-Features: AaiRm53Q6tq8LuPIrmfsSi3or0ZsIgIF5Wzq_daN-fddH5XU6fwZ-9Q1_o7c91A
Message-ID: <CAP-5=fUjJ1QONNLNyJL7Ugc3=44sJ2i10wpQNoGtM7Fnd5wJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/30] tools: lib: thermal: Initialize CFLAGS before
 including Makefile.include
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
>  tools/lib/thermal/Makefile | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tools/lib/thermal/Makefile b/tools/lib/thermal/Makefile
> index 41aa7a324ff4d76351b89d7d7cf382df3fc14052..50efa97163fc089455161d6b8=
1db13aa0ae41af6 100644
> --- a/tools/lib/thermal/Makefile
> +++ b/tools/lib/thermal/Makefile
> @@ -23,6 +23,14 @@ INSTALL =3D install
>  DESTDIR ?=3D
>  DESTDIR_SQ =3D '$(subst ','\'',$(DESTDIR))'
>
> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> +ifdef EXTRA_CFLAGS
> +  CFLAGS :=3D
> +else
> +  CFLAGS :=3D -g -Wall
> +endif
> +
>  include $(srctree)/tools/scripts/Makefile.include
>  include $(srctree)/tools/scripts/Makefile.arch
>
> @@ -39,13 +47,6 @@ libdir =3D $(prefix)/$(libdir_relative)
>  libdir_SQ =3D $(subst ','\'',$(libdir))
>  libdir_relative_SQ =3D $(subst ','\'',$(libdir_relative))
>
> -# Set compile option CFLAGS
> -ifdef EXTRA_CFLAGS
> -  CFLAGS :=3D $(EXTRA_CFLAGS)
> -else
> -  CFLAGS :=3D -g -Wall
> -endif
> -
>  NL3_CFLAGS =3D $(shell pkg-config --cflags libnl-3.0 2>/dev/null)
>  ifeq ($(NL3_CFLAGS),)
>  NL3_CFLAGS =3D -I/usr/include/libnl3
> @@ -60,6 +61,7 @@ INCLUDES =3D \
>  -I$(srctree)/tools/include/uapi
>
>  # Append required CFLAGS
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D $(EXTRA_WARNINGS)
>  override CFLAGS +=3D -Werror -Wall
>  override CFLAGS +=3D -fPIC

The change lgtm. Running this patch through an AI review showed that
what looks like a typo, CFLAGS becoming CFGLAS, is located below:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/lib/thermal/Makefile#n62
```
# Append required CFLAGS
override CFLAGS +=3D $(EXTRA_WARNINGS)
override CFLAGS +=3D -Werror -Wall
override CFLAGS +=3D -fPIC
override CFLAGS +=3D $(NL3_CFLAGS)
override CFLAGS +=3D $(INCLUDES)
override CFLAGS +=3D -fvisibility=3Dhidden
override CFGLAS +=3D -Wl,-L.
override CFGLAS +=3D -Wl,-lthermal
```

Thanks,
Ian

> --
> 2.34.1
>
