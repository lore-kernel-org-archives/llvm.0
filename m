Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3F52ED141
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079115; cv=pass; b=onxSqNBmpGyFgVbq/7ltAkTQMBtF/U6zHbzfx5q9vp/RLeCPnYwSKB4nDQNc+iWIznXW2hEYOAhqsM8zAuEVNLWBmRBB/V+CektlBERJiGHLIUhP9iOhC21pB824J2MDcxOkTCxw9aljb1IDx00oq5sf79Ymvy9sxaottKOZ0QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079115; c=relaxed/simple;
	bh=1xHBM1npckFnBQ/QU7s8rXIaGuuzzkPI1ggicrM5qec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7IcLUAE8d4aXqxfjI3mrsjGZfqjHdXILKYCCeWMUrVryE96QfbQBU7v3q76syG/891vE/FgE8/Rs2CiPwUTtYXySrvWrlPGdy4bE0/WQPghuhJBh3jKad1whAz1fuftbY3gY7GFnEijFvMDzNCD5I/+GKOkVdB23iqwsdR9AI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qnnll4FD; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qnnll4FD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae523d54d2so13795ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079113; cv=none;
        d=google.com; s=arc-20240605;
        b=YUikrOTlM2OUrNWEQ0BsdnjlNt/rr+gqA0MXuWMQcxngNfnnF1kN3SHwBnOhAandFn
         rDO5vs0r7B+L60Yr5tEOcsYXbWBINGLnpApaS7LVuBxdYbK3xOraMC1w48/Z6bmWKdSd
         eIofsyD61y3zPYky8EhPTVJSte3F3sbN5frgypZdb+YIawgUhpEX+AGGwdbEx+0jpmrv
         3W9fwk1EOKjxhr4JZCIWE6n0cWQ01xinw59OrOj+6m+baGDTrtj0FIBnYS9qzLJWewY2
         vSL5TFixLzRlCnF9MeSgg4D5KaiolJeHhJ7HbYzLwiimUpejOkvYFNpDh/INUaoJBdex
         Rz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=slXFRZSUuUHYd9aE4MbVYMvGfHoCqJ3GVsU6T8shJBI=;
        fh=7ZS2X+m32fhiAA9ibmwlFVCEUrQg1n2QvE1FNyMxYz8=;
        b=QDfOAYHj6nDY4+2Vb9nnl3aAvuymJK2OX1fcywQhKNDVHi4eI6MQTbAqoJ0Lnm+aJh
         EYbE2TBR4iQdP5VExZS/8DiU41Sh3vTSc2g4clw10n8oNSFIVVUgQ0K4KNtceANgzSvn
         TxRzxugyfNTRBVWO7zzroPUz/mcvv1TDKCV4UkWlb3bzjcjudxCUZJWjE4VJYLbcApqP
         zBhPUm+Db/lgAsKSpzFhaVhNuccbPbz2rzaJtCBJugIfhL57Bt14los7p189iy1utfWQ
         7JrAkS//YlCb99ExJfSekSOhEw/e4cLWtDKkxdmxEEkMAuVHakaRXxMrDGtb0W5Ek/dJ
         CwNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079113; x=1773683913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slXFRZSUuUHYd9aE4MbVYMvGfHoCqJ3GVsU6T8shJBI=;
        b=Qnnll4FDrnJNjoM4CWn4YW1FCASoZJW+0zlYWFqoywoohujGkUjlf74ut0DNAO77Rv
         It8R7xr/Bo+0ZUZU6MJMmbdXSf/YB/b8hS7sCxsjn/G+CE2l64ftp9V5MxYHrYOO/cXs
         ks6ccg4GlPiAB6hwIL5dNj/BIPRZ5uPOMXLv1U761L+wafZ7xMhoI/twSsTuUDlKKSXy
         +od+lutQRu0sMDv3Lb40DNmiQf1Somf1DXEo05k9jZUQ2bcMi9srPRWC7Ozw0pSDjLSy
         gt1FxijasnhJISUj4DHhwW5uUcCXWfJObL3c/Y34WHzTRV1uWWt5nGOb/lLMz6oR7XqY
         J20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079113; x=1773683913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slXFRZSUuUHYd9aE4MbVYMvGfHoCqJ3GVsU6T8shJBI=;
        b=TQZIdTY0ZOlGiC+YgBBWt41jKoi10a9HLWTAI7hDQrpB55QZQEXzXp55I3ptg58Ut+
         t5fxFA4lNltYljPq75hjh1aGPSefh51ddG5sg9nW/4dwzorDsRqvtIDii9aPpp7Te8ww
         9fkucn0vXgONKswUmq7ynKAavzv0JXz2vMmmZVyKR5uLG1ttsMXAb5ZlOcRNaZKnpeR2
         LPsCC/a6y+7gCIG0MfvjUn4fTe7s3957trm0M9w7e6ZyXUvcTG4K/NSneeixhyA1oPY/
         KJMv9ehIrJlr5ICCTuyM+3aZOz0eCcvLZWR2lbX0EA8uareKu8bP8LNlkFjVhemG4nF+
         Z0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/9mLEwYmROlmsjomuEhEKbeJtpbKC+2ojP/MyPLKHsGsAOKw6anco6x1H68n19lmb7XJj@lists.linux.dev
X-Gm-Message-State: AOJu0YydcaU0iy/EL377dxdTW4JIBZc4zZASVewF8zh+arlKlHgqM0C5
	v1cLH9Tuj/31Hl+vA/81AlO0RgA/6AwyQAgkSUHDdwanPlqPXnWriZ3sMmdon+Ctx+8gjYHC/MV
	+6XTw+GDqmRML9fxae9rWvYaocRiRChFhkkG/4f5c
X-Gm-Gg: ATEYQzxMAxsn1x7svi2UWdGIhVNjuZmQU5pVTqf8hpX1Vx8thZJgBd4uAlJIIXs4yLn
	bFwxxoxS3lRzUqPVV1KvlQHnG3FC2VkIX3DWsNyolLoWgaZBsBKFy09ctgI5kxCt8E1j/SJdExz
	cggcbAwioO2FDIB3AH7gt5WkOf43310h0w2XBtbWIyFE7kQDXR1/YM8YmEvjI+49fxCMj+NIfkx
	ZRgE9c8ZnHkzTgbSbgr+Kmgtcl6qtyp5YGI6FAu0vaukdDGrMQFtou4l5fxhU795XOmdLdmflJx
	dPv7PJjsBvwPNVwaFbVZp7f5wtiARZXo6r6SP1nQAoY8IA==
X-Received: by 2002:a17:902:f70f:b0:2a7:5652:50b2 with SMTP id
 d9443c01a7336-2aea324799emr181285ad.9.1773079112595; Mon, 09 Mar 2026
 10:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-15-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-15-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:58:20 -0700
X-Gm-Features: AaiRm51s4uFr6B2kmJ1teMsm_yMIkBYdnRBaZ4VTor_pU0VbgMb5xyzkSrea21g
Message-ID: <CAP-5=fW1CXWUg=LS4V_+988LsukYuBuKX15qY0-vTqar_Lz5qQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/30] tools: hv: Append extra cflags
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
>  tools/hv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/hv/Makefile b/tools/hv/Makefile
> index 34ffcec264ab0fdf7075d25456ef012cb866796b..e39c16325b451ee7c2ddc581c=
c4d168915472ed6 100644
> --- a/tools/hv/Makefile
> +++ b/tools/hv/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>  override CFLAGS +=3D -Wno-address-of-packed-member

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>
> --
> 2.34.1
>
