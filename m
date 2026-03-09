Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB423043DC
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079171; cv=pass; b=U16KqEvGaqC+D3ZN3o3xHvgWmVTm80/ywBDE43QYgBDjndmCy+Jcyaqc2GWzmKr5T1D8D0eoVxj9ribgZ3UvBoX1PZkIKQd9fV8FTOdVC9lrU0PEIx4GntmPL8LJmq+GIO6OaTjQtn0IkxlO2UHMHbQlapN4VvTpLVvNnV0S7fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079171; c=relaxed/simple;
	bh=jtXROgFXN+cxX3Q4sedN4Vfye4bLDvRQNMbs+Ut+9NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hh1HNJzMo627axWa00TIa6gwgh8SpSpb0Lfc13klai7yvPBNef2PoRbvq87ugj4phNOZaxxyb311RE4FO0MjdrcC7rkaYyOyrH1KpmddxWs1eAt7MNe3ywzk86asMnLKXz+ctWWsTRoZrW7/6oBVFGenZRuzDYAQNYE6KeYr6tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Awj4v9jf; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Awj4v9jf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae4b40999bso15835ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079169; cv=none;
        d=google.com; s=arc-20240605;
        b=fOWCOzrsDk3qfknRd8y4BbeCPHtGywdxeBKd74R7+Z5tmj/66zuRsotLZ2zz12QOEA
         V+nwWAbg8vgTS0gJSwBiVO9FgiMmuyU/Lz3iNQEgMuielw6aV23JEisb13cgbtMehJvJ
         D7mjC9oqD1uumkm09UnkP/mMhZ68+ynJp+JhedX37u5GQ/ylq6RphT5SwujwgpEZHDNB
         avDhhYszGZRUY6Q1wxa6RGUWe0/g7Eo7EaBJpH7AIJXaoxcuv/D5G1AKLMza7KUVteiE
         bAE2c27uVnx4IwAxSB3JAgDVxlE+zGGoHCguzgyvfxJUPGYSdxbyZFbzedbQkiijJi/G
         dP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctFWtlUv7s1JIakxz/VQBeCjue+g3dZBcOJ9UZNZBPo=;
        fh=is2eaY/d5/IhgF2aLijKMgPj59QHIgJaKw8TscS29hc=;
        b=LZ5wlnv8CxTp+j2FuIGUIITGxZlIeTeTH5S/rYH1DdCnSa89o3BrCyUcNJ5IXi4j+q
         pFSOf4if9XGRMjrrYt69ZO3iof30NVE67S/+ROv3cdbsGQYZ8mTmybaggvuBIOT0SueM
         EacBXMDT8gdqjziYWFP8HyCKeRP0FggoD1UnlvCF1FYVECuhoM3P1fmqH6xwNSwdR/Y9
         JchwJkiEhrYU1ZW/Nb6r4gECCQUXnlPTILLFD6t0xIiG6nyZc9+rNJyx/Ih3ZfDjKDF9
         oiTzJic+xfRGanKSFyAd4ctPNtscuG91MWocnmddyZYZM03j2dQb9Ell2qxECiB81jh0
         Dkow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079169; x=1773683969; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctFWtlUv7s1JIakxz/VQBeCjue+g3dZBcOJ9UZNZBPo=;
        b=Awj4v9jffiDicQPIu21fWmPny1VVeTO0e9DSu3ObgqW63pb8uju2hAki17VPvBCyth
         /8XpqW3+Ai8oAqxEPM/hm5ouvOCyf7jgoTbfedTZhZm90tolnkZR1Vb5FhsdB9bOECyE
         cvJFv27pIekKYRzptbQ6+zQ3YCh15FCex/E8jJVd6oWb4abu185n0BIBsaVXAe+Dabno
         Ocnzcm8EolBMAsKqSeBmiHrKlPJCgWUywziadBNaLPucs8dtDn9aSo+HPOmPxIiWnjOK
         5vJ5ynGhTif1K8MOw/gslZ1vkB92jbql1UTtTSSD7offv62U8+TOF4dwYJa21YNDsMcq
         Cgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079169; x=1773683969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ctFWtlUv7s1JIakxz/VQBeCjue+g3dZBcOJ9UZNZBPo=;
        b=PRceNAmZtE5Mo3TRQUXagyAi1u2jgCVZKTkpzo1S4zV0PvTWxrCMU2gfubEGSknLZl
         n3Vhl1PvXHmyzj5oCv7DFanMGHR/gKitkX8hBpjYdSEXLzFyCkC7GPfvd3ONIfXFy+Ie
         dlHljK5hiflXwaLAIoM0Ttx5mS3ib2QyXmuIScsbsa8IHkwuF3hRcZX3IU/AA2hJMpBs
         ggZSzJ4WcHTmqHnDtElk6HBVgZ5nBV7AeAazVjYuPjSuEgTqTdu272xqG1fuHMCmWKe1
         SI/hxj/C7aVeScGduXyy6rXEEApmx/OyMFBoYtJAVBiz04UqjHOFGW7nQfcLT3lhN2FN
         U8TA==
X-Forwarded-Encrypted: i=1; AJvYcCUw8qNw9bGrs4K181C8rnFugX9UAWfrtoAv3NSsZkzlgryFQfeMqWXLbzbVn2kfpt4z5a+H@lists.linux.dev
X-Gm-Message-State: AOJu0Yx55oA6qIUOpH7RjMZRIoOrmbaSAkQWZhMnBCe0YTEULAXmoWBe
	bVfHq/4qoG8kUcfH2zJfs/H07EslYETcSi4c3W4yhykx86gvHr6cPvdDC+mP4X74M79++BIzSm0
	3y3rjMdgUCjOyr+YnERoODAl+dooYTuX/rJsFkFev
X-Gm-Gg: ATEYQzwhbW9bjFEedTy1Nepp+84eFnb49+M1jXalWn9e+RhHmPOihLziEXADGzEvouS
	dRqCtDLG1pLDXeDSOn6T9TsN54FmR0fJJnGqk4qfJfbk4GBu1Lbj6QhvVXICQL6uV+l5RnD1mGp
	sGjdh6g3GRgpmb/pFh1K5vkuRsfRPZ3q5sds7WuQLPuvoHPSCTWxOIUIKJR084k6WDCA4tGfWvL
	rAnu8kAMPatoa68LkkQz6B2zFyvlqnpzh2G18RhiMhvrtUrajwxD5khwNawEzLOCJ230QdRwGDY
	n6y8KATPa3yUW7JSwmKaTRl6JpR6zoAK83Ws/Vb6pIGH1g==
X-Received: by 2002:a17:903:98b:b0:2ae:4572:50e8 with SMTP id
 d9443c01a7336-2aea3021bd4mr262895ad.8.1773079168841; Mon, 09 Mar 2026
 10:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-17-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-17-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:59:17 -0700
X-Gm-Features: AaiRm51Mi3jyhZ6d5D7Dts58gg-d_J7aFNrAN6Haonrc-goj4a5d3pqt2PgJB3o
Message-ID: <CAP-5=fWd3wr_jvagN7P9tBtbtva4m1RGRmx8rREVLZVXFeWZaQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/30] tools: mm: Append extra cflags
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
>  tools/mm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/mm/Makefile b/tools/mm/Makefile
> index f5725b5c23aa261994b5b42f37c443bee2edebf2..742c1639db0a6f7aee59cf8f4=
634cb40eacd49b2 100644
> --- a/tools/mm/Makefile
> +++ b/tools/mm/Makefile
> @@ -9,6 +9,7 @@ INSTALL_TARGETS =3D $(BUILD_TARGETS) thpmaps
>  LIB_DIR =3D ../lib/api
>  LIBS =3D $(LIB_DIR)/libapi.a
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -Wall -Wextra -I../lib/ -pthread

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  LDFLAGS +=3D $(LIBS) -pthread
>
>
> --
> 2.34.1
>
