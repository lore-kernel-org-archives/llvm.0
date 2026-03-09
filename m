Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA922EF64F
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078168; cv=pass; b=G+UPomkQjSLIf8GHd5aQHPN3NtelurKbJ99dO3REDplKe+dKWL0OX0G45uFxQGfU5+Sc4JzwcSm0msc29wBmR3DdrXg/PM+85a2K99u7gZSdHc3JPNS2SCYkQRafnjdI7goef9gDL6Z/aHb8V37btjdTReju1fENDJ8qhoKa7e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078168; c=relaxed/simple;
	bh=t1FsZ8AwRGJsG2F3mctGRLTHPGEfEzdJEwNT+r1oShk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxaX27INtd4VEk14S4ouIEquuQVsRy0IZfw2WH3eAZEajpQCcxIfxE2B+lciuYRdrzgJb3qjFDumne8DaTojVl0mM86vW0zFddfstweTBsFxQK+k6GQo+LyDEYLrq5XZvvSsgh384PGgKbTXfq8fOnvOD3DP+xxn3mZs3g92KXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvV0MLmE; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvV0MLmE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae4b40999bso12235ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078167; cv=none;
        d=google.com; s=arc-20240605;
        b=Hv6jcpRiETje5ZuTY3OfEGzGpUR88xZE32wRfm9ik2lCUV0/TmM9Ddi+o1mPNbE1+b
         3G4jcZQXa+hsNzyaVZ2ZUh/V6C2CtlHiR8LUjW5ocKd32NiP9YI6nAfDvEAORoMTtWXt
         gLHKrI4kfZOPyH/nkf6Gnl3o0YxBzzr4Qdh9kl9S+7V20Vx3xfWYc4JEv2ABzWlARcSd
         tbI83EhlKVShJneFNV2kZd2yxVdZXkU1adIrgc7VCEADr9ZCF0QOwGWnnEX3mgtdZ8RK
         9U21AItw53bzhaTRLz2riip6R3EsFf/XUGik6LYSQZQqFUxJzDmf9U+TIL1lv6nbrCVy
         DHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeMbooImq7XRfteaXymWNoOOhKFZP8D3AO8LBClHnvM=;
        fh=3h8Modm4Pcwxa2Y2dmmm68Od2KzivfdCxXqd16WXfC8=;
        b=YEFAaRgtH85iyPoJJl3s4K1kN7aVP6unhmaVfrFraxebPEoHdhdpZzEW560vtcoRns
         iJ7fw3kQxGUhadnRM1nt2aC27eA5tkIaUSpPHvVHCuok0vWnKiiv8afz/wtWoY/QtnEa
         viWj5NopOXbD6nksFDemCJKLKc72qBMoUiKOw9q99jUsTsiWEAMEpHT0O23E+dfoE7W/
         DeYNftKEmHcXeR0k3IKpd8p/uIBZh+xK5YRON7DCT2ljEf1ft9cPWanTsY4ocAYGNpaE
         W3VE7unWm5rDtaCXb65uwafLRpQpGyDG9uc7A8T014hkndPRy/Qjfg+Bqwvj09ofSWx5
         AqXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078167; x=1773682967; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeMbooImq7XRfteaXymWNoOOhKFZP8D3AO8LBClHnvM=;
        b=uvV0MLmEK/+IM4eNNrnPzXLSXrvgB5I1Xa6yRe3FcpWiZztRG+8QWlUTNAikfuzYRu
         4QNMC8PaZXPEcKNyClKoRlLgwVoeXMIH/FQ2PpcYSXgB+CRFyIDrJraf8wt3rp/U851V
         tPrMmecK/U6fTdgpDx0oT1Qp9Vh9uh5rAHySLuCfpE38MvMxectkLFKZEuUbNgDzOeFO
         axc+0DQTvIFru6VVexuKF6Ja/Ymyw7yDhXml94tf0Wrjo/BE08HpiCCoTE/2Ubfgjo9q
         xsIswWA0vHOaeORcs7hOE9I1tlXiT3VVSVx8wIcTOsq7NiDvhx9LdrI23gFyP/CxpM3Z
         s4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078167; x=1773682967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeMbooImq7XRfteaXymWNoOOhKFZP8D3AO8LBClHnvM=;
        b=b3WwCdq9HBCf/2VQjDEml5fxkHlYsZaXtAc6MqkIy7p8YHBRDB13D720waQCXXdNqJ
         KZSMw/rLGN2FnDfE0x7aLQ78sAKEYBy1g5oLS5Qv+rgAg5LHGZGYhcnGLhZWYZVXoIKw
         syW6bzSzQOhkYJ1I6X33hD9EfhZJ0qFuI9T/wSM1Xor2v1GWAd1xMk/BRXO9C2Ghiiip
         gnlZ/OA5Sjdn92QBL2TOB5EwfdzzfAm0blsp6csnFdw6ZlaTVrlI+VQcDTms06TANYvl
         7/nnLHR9tJhRYynMUM8HwdbS9g/lAuc/Wgsni5VXNtCXtLzC67EDdlKPOpyhJsSStDS7
         Ll/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3QdJ63UwEiipsOdmfAk2dqe0ocqMuufRojtTmpSRpbDdmehwoMLIS3TmTwinuAzk/3hCS@lists.linux.dev
X-Gm-Message-State: AOJu0Yw963ESTOfcbtE9u8WmhoFzN9ZRvM39vYmMSYMUIdVcgYm9nhJU
	bnc4tbOcaaXxnBY8f2ghIya4ndPsFIuWUwkDbXq1UcgqE/vA7wSoqsBdwm06MlB/c3Ems2qoGI+
	8YjFUUy9mXDgsFAgqQsxifGflAARVp5E8g7QaKa/w
X-Gm-Gg: ATEYQzwqKtkQNW3v4voWgV/TWxtTlle9ZQzeA+R8duNwWeU5fJ4aA7vM6E78Im2gPmv
	x+nD8WDI2v13845KeZega7J5khf9F36KDMkY8GjcgZq8uU+XjDCylmWOx1zJ1OFIFOzAjpqMI/k
	U8ERV8sWSEZQXwPNhv9t8pn9Og81KTFVEwm091XSbSA3ipJqDf38fVM10SZjCGPw89J58MLHr7y
	dKtI4V+7CacN/J/TIvZ24Ch443PaQuZsjAuw4mbG8iYLUb4RNjDDxS12rV+CSuUf6dIufQXQ+E3
	8DTWOSFhOBLO+TS2v5UyzfEnVmn8WMGvL50=
X-Received: by 2002:a17:903:228e:b0:2ae:6755:a24f with SMTP id
 d9443c01a7336-2aea2f240e0mr278945ad.0.1773078166229; Mon, 09 Mar 2026
 10:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-8-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-8-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:42:33 -0700
X-Gm-Features: AaiRm51Zpc7AIVlXdWIwZwXjPhYHvP-DlYD-PFQxAE3VNul7LnsUe2Ks9NfP7FA
Message-ID: <CAP-5=fUUvztUFJUwBYcaeEuc03-S=JpasCmws6aoz2i8LZTRFQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/30] tools/bpf: build: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bpf/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/bpf/Makefile b/tools/bpf/Makefile
> index fd2585af1252669c59228af3a77320e449e1a1ab..f7d7978b4e2c1e592f980c2b8=
153608b9d821d89 100644
> --- a/tools/bpf/Makefile
> +++ b/tools/bpf/Makefile
> @@ -8,6 +8,7 @@ YACC =3D bison
>  MAKE =3D make
>  INSTALL ?=3D install
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -Wall -O2
>  CFLAGS +=3D -D__EXPORTED_HEADERS__ -I$(srctree)/tools/include/uapi \
>           -I$(srctree)/tools/include

Should appending to CFLAGS happen last so that the user can override
the default CFLAGS values?

Thanks,
Ian

> --
> 2.34.1
>
