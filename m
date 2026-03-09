Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C529D26E
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079654; cv=pass; b=qjRWs/rDg+6HV5/MpH2U6n7v4jvIL1jhlCw1nuJmT6yqCx8YEcjcngQgoo/OGEOs/PoseYFBIvh9hWCo9ODZWhkvzwlP0sn733qh+iUTxH8OeFU3McSgFUmIE4OG35WNTDurNWpvgHyKNqdFHS3NZOaLHn56676Znu5ID9/QoKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079654; c=relaxed/simple;
	bh=QIMNB5EyqX39o2tFyg9pOLQaPD6ckffxKJvkpme5m9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZBBlD+SoV4ENE/mYOMLSbE3+ozywIPnxLgHqLnypafsNfA9f9Cizo7Q6fQY5ZBoJOIRPLMNUvUZmkoPQ2AYlZxfpXTfwiI8bsr2x9rpwn9Z+Rv6OmQC7WVh5xxfBBD3iLudGO+5SPpjlOc9Wxk8+hILz/p7EN+ptHltmQi6PW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qM2VVABk; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qM2VVABk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae523d54d2so16275ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079653; cv=none;
        d=google.com; s=arc-20240605;
        b=glchdWfaqYf6vf8u94b+OKhR6rZHInWdZ+rPNfrxpFW2dsBRcr0gcBP6iw0RsWMMkv
         cR7R3iFyf4kaAfqBY0fR0hzoyMd7Zp5TdAAaRYctkPascgC40Ww861q6oi2XNA13rZa7
         fs3PX6EcjzoXG59rd09D8FIefVRs6iLe7vcKEOczp6iBu9cY/QGRD8aOipQrls5FCvX6
         w6D31xhpDUJ9X/IXegW3QOsW5T2nGYRb/ZfjzcIgjbOdUzCo5UgQ+cjYwWqlKbxLhndw
         lL/ggNaWQCiRP73BbTIeLcLXFCHmMXMKpX+5CjuWazuK2oJndkZxE82TjcDGkGul9h4h
         D+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8TSrNRaJmO51nmlmw1NUXrIFdMrsiQHCiZF8RZbGZ8o=;
        fh=RUMD/Zhwo6Yz7eKk9zAQ+NumpCUe7mI1wPbupoTiru4=;
        b=b1RoiLk/bPIPZwvuUV7HsUAMFJBRyJT4hcVjq/dDyapSNjZKywz45UHK7hF5ZTVN7Y
         xtMbEedfjEmzPNK9oC4uugd+oDSm3chBLY0kobCBKLCDeiPdvUBDjlaQlvL7yZ+ovChT
         yGjDXmmAvYemYZG30eANh3PG6CgISeRtFHGie0p2BPph28JNiMngbsIj6YLgnWfu+G0r
         PivQQONz7TKWfeTeO0kjvpGqRC188qfUfTpnXTJjUMTb7UmeC4udgBZlGkF4UGGC2xSd
         wWjSWAamCtVDNa9i06HuHHW0pW7VCsaksWSVrINyhvby171lInDL0QeoGPJ34E4GYNte
         SSVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079653; x=1773684453; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TSrNRaJmO51nmlmw1NUXrIFdMrsiQHCiZF8RZbGZ8o=;
        b=qM2VVABkxcBXUPGP+yc7hiL4bzB2pVbGqBxzGbUci6c1D7dOPJrlLV6Wu72yW3wPTq
         /FVGdH+UNMUd+PIn01kK4uDdPudTxSiFbl+fcs0DRXNcoVcPfUTpJNx0BhuD9fV4mONY
         +KAbiYjJZS1mebiZRGrbDctnHo3oDiH1J8YFvEllHjZa06U4PZ7FpBW/2m7KCynaVk7I
         N15nn6Z+9zR+ALtUsovGDVM6o9tC57xTtMVgktCommkw5dbq9CwJvSybS/yQ3YXtYgLf
         7pJeQBfYJuhFqG5GweeJoGjDWEadM9KVEybUCV/BvcBWjwSSRtcKeNIHHNOa7Ad0v2NU
         WnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079653; x=1773684453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TSrNRaJmO51nmlmw1NUXrIFdMrsiQHCiZF8RZbGZ8o=;
        b=F1EKz0q6yk7V9PPSQFViMyUxVNBT54aTmr7gfW1UY9AuPJMkQ3JYoqinYpuF2Ofp4P
         oSCs695mRtJ27j4wMgX/GhGGOYhVjTlu3+m4YarAWInVno04qxjlXoUfdzxPnlYJVpJm
         qrZjMe5+E8pXLniofWhqaln6MsZN67cjaxCJXyT7UvYUnkxXaSGjomQnAsx4/UFyxQ/7
         AjvUJFwdNdJJD3kE4PMdLJlzZGxA6pWtNLad99mvPgoFvnBGF4b4F3Yrc35Juq7t4CjU
         bOWzznOSJizZQh/Txk7BhamBkpwscDpVXu+Du+FEaoU/cponZyCB64R4siAYvXSHjDfK
         g71w==
X-Forwarded-Encrypted: i=1; AJvYcCUOgAuf4+xXMpP1ttIgX/v9I073N6bWjMNYhAZunolZnaFCskJjAcevrCQXuTWysbovjbZz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6iVVhxCOD4/rS2jjEGjyIZFA3bhpjAuIxxbiFPhm7F0Ul+9ZV
	2N9nGllaiy/2gBeMmsOAcE1hWa+p6wQb7ZKjBNg7HkDLni7rSC3zRqMfZbWTjmrFZFny1fT5av7
	YO5vd8VLCnoDoD1L5p8MkJtghi1cBiSKeMNJUV3zv
X-Gm-Gg: ATEYQzzTyulzpSnD+jAX1qFw6Px+SUXq7rBn+P4qshyZjFUF5nX8fOxMPVhlxlCbmoz
	D63FT/NaFxdWAM4XuP6eeA7L+UiW5yETx4UknQwsf79wIvskVGQb2GX2kjylmvlvCQFe+0COR88
	nmkOhdFMoXO0uvP2VLD6S4Kv5+mtKXXEoxYFe0dr17vohH6TVTT6vr+4kspMieZfzrUaC7IdYiz
	01FfsedQPcureebebnAiFeHDLtZfTo0aM/WPXzhMTa7a5IGWwTkDJWDLuE+QVmuE0x9JxpDvBAB
	dw+p36DJZ/tCDttMj89wvWdTeAYK1izIaoY=
X-Received: by 2002:a17:902:da91:b0:2ad:ab68:f2c3 with SMTP id
 d9443c01a7336-2aea32679e7mr214325ad.13.1773079652084; Mon, 09 Mar 2026
 11:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-22-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-22-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:07:20 -0700
X-Gm-Features: AaiRm51tQNQ2inpIlTxQfShRsJQdMzHGmNgW_x5TCtZwRMueLBJEPIayhaU2J5E
Message-ID: <CAP-5=fVp5LEezSpRaTZTH17KjkFBvnDLqonMDa5Lm7O7wHD_Bg@mail.gmail.com>
Subject: Re: [PATCH v3 22/30] tools: sched_ext: Append extra cflags
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
>  tools/sched_ext/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
> index 21554f0896923fa9c2e5b98c85d65d964152e592..7b97af037ae55981bc84d4a91=
40766fdf4c62a6c 100644
> --- a/tools/sched_ext/Makefile
> +++ b/tools/sched_ext/Makefile
> @@ -89,6 +89,7 @@ ifneq ($(wildcard $(GENHDR)),)
>    GENFLAGS :=3D -DHAVE_GENHDR
>  endif
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)         =
         \
>           -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)                       =
       \
>           -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

> --
> 2.34.1
>
