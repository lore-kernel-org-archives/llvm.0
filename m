Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD11259C84
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078047; cv=pass; b=Z7lJSaq4f8KPE03AYBz5zkTC40mBAjuSd8p/uGl6+6ZeUkcpWIkZecACg91yZFEgSgLg2PvK0tl/pwVWkzsZhmDkcd7KoJ7l+Lqi59qzf88vUlSFGbqm5FR5584MZEEEGo0giDFiioMwpFiu9jQHCRLrKFDUqiHUpJfi/3S7us4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078047; c=relaxed/simple;
	bh=n75q7FQkEfbF8c0uFYyEvlysohLp/IeXvVTwRBBtQUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cR9HoT+ab9Jf2OOSZT/QRuvrdqcoHvHWh13usEtOkUVKgCXkHxE8oz3AlJQEGlJngGMfac1vlwcG7q8Pxen9c/jCwXc9KfSlw1OGtkyA+EzJfAkHEeg6+xfaRDH2M/BbMpMnLTKTWGcQ2s9FdyBL4m4vbrBG6PiJ0MOlxBgFsTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2cZyj+bw; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2cZyj+bw"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae49120e97so13175ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078045; cv=none;
        d=google.com; s=arc-20240605;
        b=VhjE6ccP9jxsCDhQ9tQrRtyJimXvLLqKBJlVVaTk2seYpqfp82yvQomzLBLcY3cKYc
         PyScG/v3Wnv86Ur8rIrgjLcAZUZ/4QlSxo8Npev2IHLQprbByvIASwFRCnw7uXu7oYGF
         AIfgD2X5DCJX8eJmPbFhM7PKFoHpVyQfrdFtmibiJ0IZd2jrIJd3lMVeqWdZS3lqG2Jh
         xqOgcz/JqA/es/LdomPTECMRlbDB5Eue+Wxdut67+T+Yd4cw+yzA7LP7by6knOMf1fCg
         Fz8ewu8HN7Zb1Ee2MDekwzWa42WgCATpC0dZQDe30u/CimOb7ScWYEijgayPYtT50zeX
         YLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=43itZXu9qIpHkrE/yaiQXvWJBibTFZU4J0qcAKp3nP4=;
        fh=NX9Ww0i8KhxJdvFf0R3YMtu0ZqS9LRNQhJ4QCgF6x9M=;
        b=fjkbN07tHYmqKWGxOr/+D1Vn2P2H/djFexr66Oj8T2VNGG224DLh3bgYZxf4FZxL9V
         bgaoN0OkitWq4ZT80VMydwysY6Cm3EjB0TtfbwTT9vkthZN3mWdL+YrAKLxLwP+iGBOU
         kEK94xiBt7Cl+IXULcG+/TTs+YLfkNHFy0/UEvDI2p/upikHg7a+oSlZLOXB/xTP87aZ
         qtqNzpKNjlq5NDI5wkzCmrLYXtm8IEvkrluwzu9pZpikZgrFYFRiDkYzxtThIRuwUbmv
         hPJ4Hfj1NkuT1snkeCPMPNfr5kcQVRjI1Inco68n1qgZVsGayewd0CTCgINLTKonpQUe
         WQPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078045; x=1773682845; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43itZXu9qIpHkrE/yaiQXvWJBibTFZU4J0qcAKp3nP4=;
        b=2cZyj+bw7ElpRCC8dqYDjG1Gz2TVHBnu0+zrFJP9+M3xutkeL2yjYO03L6DNhpHNwH
         ZW2PFCbFD47VUtfijfDn5FRzqHSI5MVdDtYIjleyWxVieGG51W9djVXAkzRZq1pryRsF
         zGuVOinbmDRfMI9p2O7ohwj5cohXuckgOjrCKG2j7hNVs1EXOItP3DRUH1JivyosbCOe
         Chowb/4nY4/G0hvzXI+JJixwuwR+WE8WXJDJbo3Z9Fm4nkR+3/AcEck+f9TiB7cEjk7i
         jcilbxuTNRiOqyTP1JPmAwHib4G1Q8lkln/NV9pJaCGobv4kH4qjQdZxPF4J9+o7Gif3
         nJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078045; x=1773682845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43itZXu9qIpHkrE/yaiQXvWJBibTFZU4J0qcAKp3nP4=;
        b=gvDE5C4uI20ybf7mRHjW6E2vGBSQ45ER8CAZHYoWOER0j6SSbOZ3GI8pfu9EOfzMy4
         YFehlTYWG/BYVvcnW7Lxy77yvwEabP5laGSL5+A6NG+baFevB2qFYF+weWHnhY/nC1dn
         YzSorZnlcM7Tj5BJMPLhKSELh3C21dm3qMVFW1t+BEJ64AALxxGBl04Ds7t6Zio9Z3/r
         /6gKMvLiQQq6arJymp47sz8DbEnOKtq9Sp/6NpOMCy03dnFLI+9sNF2AOgHHMVBj67SX
         0Wi0FNYn4WRg4/RCmL3zuyWWdq6co19ZsylZfRokRyJ0C86xSty6Wo7BMKZonsF3y3Dy
         Bgkw==
X-Forwarded-Encrypted: i=1; AJvYcCV/tFZgu+XuM11E+lSEGy5Evx3PIR4CE+BqxmIaCFT7qDgqf+bXVV4IjNDOC7H6DOebX/bq@lists.linux.dev
X-Gm-Message-State: AOJu0Yxagnkjpw/XdgnUCzOh7jToI4iB3lBQ+86H9cC6uX9DkezAN/P+
	ATmET4x1I8zxEc2qNuZ/tMvmzIEBZid0+Nyoi+mSde/7ZMlX6tC/YwgHFHnv1Ovoy2ofKFC+pjL
	PtWWdAkp5SBjvDZsS+krgtxfY8afPErfABeSyying
X-Gm-Gg: ATEYQzwexdWel0BTDQ76fc78QgYkwSj0aidUjYohA/OJHQ2dw+hJdy/Q98xzEUXE6to
	7CtlZNA75R2I+XsFsZ7nJ3DswUJGMAXOrqp592Qj+4LkO0lbMwj1dJcr9n8+o8o0EqxgKLlBMHW
	OstjJhLC/HQ/NojCLEgiwN6uyTGTGUMi+W7b9dsIa8uaiO9uXs+8slN57JSRYaTyGc8vuOPS3Vn
	T6AGQtngRfVbXPSmm+2w1I5oUFZf3WkfyLh2qL5NxHZHegy5QkM0kuH9ZGz40cfFNsDxrKLSYV8
	7KOliGEqufhbSsLP9o/p5XCgDsHmaDpfF20=
X-Received: by 2002:a17:902:e5c8:b0:2ae:5a44:ea91 with SMTP id
 d9443c01a7336-2aea30d03bfmr173965ad.22.1773078044165; Mon, 09 Mar 2026
 10:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-1-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-1-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:40:33 -0700
X-Gm-Features: AaiRm50xMh2x6blfn_3hS50syuGxpKu5Drg312ff5ApM7P2oqhep_6Y9V5rZ_XU
Message-ID: <CAP-5=fUaowg5c5GRVrTATCbkFrRa8WUyp3_h3O_6t2Vy4rBsmQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/30] bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
To: Leo Yan <leo.yan@arm.com>, Quentin Monnet <qmo@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
> Prepare for future changes where EXTRA_CFLAGS may include flags not
> applicable to the host compiler.
>
> Move the HOST_CFLAGS assignment before appending EXTRA_CFLAGS to
> CFLAGS so that HOST_CFLAGS does not inherit flags from EXTRA_CFLAGS.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bpf/bpftool/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> index 519ea5cb8ab1c0ee31acc67fc5f96b40e21005c2..3e7d8359e1b2a81a29a47544b=
e8539e3b191a0e8 100644
> --- a/tools/bpf/bpftool/Makefile
> +++ b/tools/bpf/bpftool/Makefile
> @@ -81,6 +81,12 @@ CFLAGS +=3D -DPACKAGE=3D'"bpftool"' -D__EXPORTED_HEADE=
RS__ \
>  ifneq ($(BPFTOOL_VERSION),)
>  CFLAGS +=3D -DBPFTOOL_VERSION=3D'"$(BPFTOOL_VERSION)"'
>  endif
> +
> +# This must be done before appending EXTRA_CFLAGS to CFLAGS to avoid
> +# including flags that are not applicable to the host compiler.
> +HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> +               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
> +
>  ifneq ($(EXTRA_CFLAGS),)
>  CFLAGS +=3D $(EXTRA_CFLAGS)
>  endif
> @@ -88,8 +94,6 @@ ifneq ($(EXTRA_LDFLAGS),)
>  LDFLAGS +=3D $(EXTRA_LDFLAGS)
>  endif
>
> -HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> -               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
>  HOST_LDFLAGS :=3D $(LDFLAGS)

This isn't an issue with the patch but AI code review is noting that
"LDFLAGS +=3D $(EXTRA_LDFLAGS)" happens above, and then here,
"HOST_LDFLAGS :=3D $(LDFLAGS)". This means something like
EXTRA_LDFLAGS=3D"--sysroot=3D/my/target" in the build would cause the host
ld to pick up the --sysroot flag and probably break host builds which
likely use the host `bpftool` when cross-compiling (perf's build
should use the host `bpftool`). If the HOST_LDFLAGS were set to
LDFLAGS before EXTRA_LDFLAGS are appended, this would not be an issue.

Thanks,
Ian

>  INSTALL ?=3D install
>
> --
> 2.34.1
>
