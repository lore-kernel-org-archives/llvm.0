Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A333B6FB
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079489; cv=pass; b=BA0YWyyc5y9V2Fe7PaBWb83RsjFRJs6bwkM9R3TE8xU0s0SdRy6ZanCV10Ft+NEoQXP4eUYWQ08ATi0LJU6LFBjvFCBtuUtg07BPcq4oLi0/M7PS12JPltvA8Ws333/62GalhUjP23EqCpmqczhSzfuYShhg2OIzRXIHbsJlqw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079489; c=relaxed/simple;
	bh=npXWJ1Ogp4AocCs7RB8Gmks+wTJjIc4kyHvjbnfQFFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ej3YFlbeprHP0JOg5u4R59WlA5gkd6pB4iWl9SfjAJ7BbgyAJyAgSdfhuhi1rINskZKc9ABfZXVUNOE7uyju3c6luDHOgK0j03fu3a/eFk6Zr0rypqzkI2xquna1W9bzwPzlihkZLsLKHyXk1kOo+3extsJwfVDEIASjHEfHAUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1V69+Fs9; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1V69+Fs9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae4b40999bso16955ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079486; cv=none;
        d=google.com; s=arc-20240605;
        b=FodrCxQXWhHfk7BwWrqfpoHmIuyEpfNf10MzFPk2pUzRUZZhsaQovtZLF5smACnMTN
         4hokhUrAu9pR+Ogx0ql4E2BG4kgfEfAJEMhnaWwOWXeMdOjxwp8ToZ/8gRKn+iXtAjh7
         sqCwg7bqxxqKIawNFcQPJSQ4N+WFbZRh590RTzxCMlZ8DIjhGuPE0ngMX++Q4v7IgKIp
         pYQ0YyUl4jc7mmjnXuXBng7k+0Or6Xt6zjZhcCB2xTmb4h7+wNJPulukdGG8WRwAst1E
         xbKr6yjeRImR4rL0XjW2OlrXN57mIcUUTnNrp2XG1l0gDPTTjI3S9bSHrkHEUIvmnDxa
         65pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBqxxD+S7Du6uUzPbzqvi9ezyRX+g2oywK0VLlpuaLI=;
        fh=wCebiCpvNRuIqBLNoMIsyGsA7q2pLRxliUmxh+LuZAw=;
        b=CH1ibVbXPi0PA+nejteQT8DMhpcHPVo1A8nxZRzLeZDFR1nzWinb86xqh0TdqiCtZO
         gE/5l54+HAWLYqkA/HQkhQLLGN+1DQ6YMdeWOyk0P4l4FhNz2nJIEr5UBESg60Vv3q0J
         XdnJOIIigQFyMVUYIKwziQ3ISWEOuw2JOe1x3qFdGHSiG31LakAboSb5g3tYVM7wm1ko
         tZczrseGlsknyyVtZhfYn4G89WeaVFLhk6F7By52p6MWRKJJUbHWGei4nfH1d+upkrP1
         v37Ul0afXcJ4TbUKm8zFm0wfeJ5FcSq9N7BezynLgoE9cy/Gbz0M64Ll+QM2To46ejKq
         JcVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079486; x=1773684286; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBqxxD+S7Du6uUzPbzqvi9ezyRX+g2oywK0VLlpuaLI=;
        b=1V69+Fs9sTpkDMeiQSGXa4Cx7gBZ921HPjMvGWNke/xVkEHzKtG7xwom0KCLrpAWEz
         S2XMxAwixx15LMUXJYoD8JK9Og8nkS4hwAIHAeWHajE0mikbnKRUqBe+jImOP9bLgTLi
         eLQLV7Uy6jt0JEXuPTBV9u0xVS5/ljNZp3PYaeoQhfXNV+WJV2UBq65dd0+tPvH4dogG
         oFO9W3IcLnMP5e6hKSrrGzQyT3qCeSeoSbnYZxx1aT+rHVRWa4QzbtRnAccyUmwCugE1
         hkE7WVUDMnboLVUVZeO++NHeaySTqj0bMulyCM5Aatgt1OYFK/bA2rWYESOqS+029hUJ
         GBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079486; x=1773684286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DBqxxD+S7Du6uUzPbzqvi9ezyRX+g2oywK0VLlpuaLI=;
        b=vUyfXILUQJqgmIwFHPdJZrYoOwn6spEYJloeV1ZFE8nhmQ9Ckr3A/dIKkbzzPgP58K
         +Yb6z2xO+e94ISJkxcidQhwtbjcAMCOos36XPNPXgEGvpbFlgbvChfojfwm4gusHRu58
         /oyKbwwpzmLYnVL6gpFhgjADDo2hH0aOUtRAoTgwILVgkyuRgNCEtWUShSm3ABnYOfzw
         MzkWFlwzD/+EaCJIjQW4ZMqk0wU1R3t5DOB7WH/GTidKi8kY63qbAea/twbn+cdVXC8o
         xhlo1lMaSlOqF0pMQ8hiEgQuH0oulq1Gn9GJw44IYwlv3jJbnuHelHjAWdWAWTcD7DWd
         7Yvw==
X-Forwarded-Encrypted: i=1; AJvYcCVyyBkHRb8w948o5gND7W+FERWBMudRwchnxsDrn837PIi984YB8x1hXLwzibvHa/T0T1eC@lists.linux.dev
X-Gm-Message-State: AOJu0YwOmMprQcoLkehRzHP7kcv0KxT9zKC5a4ITMAl3SBSYNXmRh848
	G/OutA1kgA9f1FqsuWM3xdZBF9BwUiSOWmaKuihMiSp864Ebr/Ur/smdeDLIQ4PqPHU7QezBYgK
	ofqPK6USu6CXTNt6FexTpUMWQTTFZw8M9JNoY+/r3
X-Gm-Gg: ATEYQzx/PNxNuvaJeSvJXn8tYSgIf6uhbwuCd2pX14LlwnuUusVk42HuJ+hZhzLwaCC
	NJztg4hRatpxPbwoUJoTBld7UxbgtPlsJKaMlcLpf/uLZns7rVYkUTlb8+lS0sfkgWHLgJFkJx2
	A1oF9ip6av2BCkmv/+eAk2cdOSd/7GEH9TApgyUQMfyr1eH4Qn/lJW+SluWn390ULcDAQrrQMMH
	J13HqIdBQCo/rgsCI6qd65FPV8M6X+RH+huyFvvleg16uvYnM5gBg0QDvzT+Pk2zLFupBO1g54t
	LRMciCpdh8Zkq1QoOlta1vKwFsMSNHmuhj0=
X-Received: by 2002:a17:902:ebd2:b0:2ae:45bb:bc4e with SMTP id
 d9443c01a7336-2aea30ebe48mr266065ad.24.1773079485553; Mon, 09 Mar 2026
 11:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-25-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-25-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:04:34 -0700
X-Gm-Features: AaiRm50lc2gBLiSfkJ4Z4DE1wl9NNkgaEba7Sk-TcENnQ4sOXRAHypkvAN4AJdA
Message-ID: <CAP-5=fVxSoN0EoWMG3BXAxrBxyaRaSOcgONcz-TCjn4=CTh0zg@mail.gmail.com>
Subject: Re: [PATCH v3 25/30] tools: usb: Append extra cflags
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
>  tools/usb/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/usb/Makefile b/tools/usb/Makefile
> index c6235667dd46223b646bbab5c82c810221750182..db2ff5b8e5ab7b76e424df32e=
d5a9458daa5d516 100644
> --- a/tools/usb/Makefile
> +++ b/tools/usb/Makefile
> @@ -13,6 +13,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -Wextra -g -D_GNU_SOURCE -I$(OUTPUT)inclu=
de -I$(srctree)/tools/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  override LDFLAGS +=3D -lpthread
>
>
> --
> 2.34.1
>
