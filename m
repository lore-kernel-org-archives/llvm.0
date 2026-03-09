Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C33EBF29
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076649; cv=pass; b=CVO67dve0dO0AMLSK2ecHaS8WChB5W8zWvZqb1eOmf4pwp78UJrNHoo4uTXORUcnck5dtMf+rbD7C9NVz2WFqaqQPV2GPCXw2dRMgCg3JfucHNUkr7gKOEa7J7qggaodru+Bdusx+PXJmEE3lo9EHA0a/nbfJyb3szbG1mrpETs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076649; c=relaxed/simple;
	bh=KlVS4uimnGg2P9OAHjWKxIKUvpjpakW2vhNGGc1Iif4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7vlzn+nVWRFR8nZ1W2y+AtUv3AXof5jVPd6ylvqWICzVxtvdVPnphSiqgr43Xi1Uy4lQw4IQfGRcr7aBk3Eg9FzbUG4OVJggl3tqhKaQwyNgMNnyEOTVElSgThr0h7KLLRIA7IJh3o5ePRLMgYnubH99ylxS9tJ3vtoHDoVVRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jAUtsnug; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jAUtsnug"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae49120e97so10415ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773076647; cv=none;
        d=google.com; s=arc-20240605;
        b=bR06RRASiGlu+7pCZJ6MpJusC8jm75psBgklcedCpJYmwZGrXmEadQ8NsfKKTKZVNQ
         C3KsYJLJ0BXxpFfjA278S0G49pWKMmeDqIWXcPEIfYFsgmmLgKN5dknQ858bgZV2XSNu
         PDeFDH/771F9rJeFmWstvOh9OKkxbBWMNpNVrrab7L/nIf6nN4YfVZph8d9+1V7Q4pRx
         TDBUZNi3hXCM5Wtz8RDLaI0tdCeHneyWObdjW3FTQg+2Bo4S6Oh2vOkYuR28VZuz8aVL
         TeYtCOT+Pfr5PgoH0upI9+GdoxA6aT9elnB1gOI1KpRlyK/MTqIcD3pAtijaBUJHV7xT
         ptPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w45p66NfPrqrjiogvGBWv0oHv9O2Jx2o1hhM+o6/k7c=;
        fh=gcp475xRflAihQS6FWGs4NfPiEqcRY8hWz8oZ7BmmG4=;
        b=jpYptK2geDjQL//qb1V0WFyi0Vd3iP5eR1qyhTgy17dA2h5eqi1XDpQ6GU5lsMcV6O
         +UGRxgJFdq59o3vOkZlqRaOQBuztSHYMV+5xAxqvv9T4GJYlRg/qIPe9YU08p3En68kH
         N6LFuhqoRfow9UFONv/5gwat0nhy7GBMFKU1xshkMYPBYdM3NmMewloFbQnbuxClozjh
         RtnI62E/63x5OJ6lt3YTFN9ufbGu4h0yhMxpaavbEGWkok481JyiMJq346ybpfq+Xj/x
         uQIbU8lVfGzWQAjVotl1e8AMCX7L2GXKY5wX35wz9xRn3iHwHSnePgZ1C3XN7z2J8faH
         9wWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773076647; x=1773681447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w45p66NfPrqrjiogvGBWv0oHv9O2Jx2o1hhM+o6/k7c=;
        b=jAUtsnug1/vovpPD3//hbWJ0mQIonrBJ+mf/Ui6x5dhuBerSLUNvTFIC4sQp9LC2r3
         /L1lz26DBJpCMz/jep5jzXXG2SYx0j262f4gor1W6cl9U9zsxv3PusIsTodfr0MbweEG
         nvm31ZXL0hFDL1NR0L0gWGeUYpviXFPkZn+poiFIVaEa9ZMvMLZNMkLH21+TK3znmx6c
         vXCs1U8egBU8ZoGzBGM89uDJwrZWfIeZnnNwt/QLNL9OcoDyk0hHd2lHqx4Oma/nGQRC
         ht8166r7HboZzOxBm4Au5ij8d0RUEr6B4X1+t31RfzcperEoTxHk3g8X4gNGjimt6rJr
         D28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076647; x=1773681447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w45p66NfPrqrjiogvGBWv0oHv9O2Jx2o1hhM+o6/k7c=;
        b=h5I/qnY9FHeFT//RvtuVoFfO3GT/SDi6YYpjp2EGvgsKgB5wmlZ1BLc3RYBZtMossY
         ISURAGTgGljmvx2YZVlYDOYDCuJ//TO74uQhJdybRPRdXKhPUY7cLcifmsP6kSN8clMJ
         6PZI2WzdalbjQNA4tQD3aUlm02+rkaTVF7nnrpXf9MIaJVvnm70FwoWomkZMYYSkJ9bB
         RRQhcGp5chcpH8cLqXToBtovBugi+jkKrnI9GIRoSDY4agkm7B+qZNS44xsfWkhQLfwS
         CuXyCFZ6g4/3yUg9KV3zQt5lhr2ophwh3ODSLfwtScHmjh3Q3GE0YbzYjvnxAt5kKpWO
         +9NA==
X-Forwarded-Encrypted: i=1; AJvYcCVtuTKNr7IM/Ytlq2Fr1GzIut0cEVJrHyC7zCm0yeSWkkd2cZJkKXa9YHL2Tz0RaUfuZV/e@lists.linux.dev
X-Gm-Message-State: AOJu0YwkkuLhEkkYgFydjcPI29zTJf9Hyl4kGh1rBcFdK6mYdhrrKOgu
	zmVQjQFt978WjbYE8UfeWIDtVGq4FAJzQnD2+x5EvGW9OhOEkps5FIDZyMiQnR1ktejXqq3h7XK
	A6wix0GlhIirFW0dqJ21Us+kr6PAzBQ6/dJpchDIB
X-Gm-Gg: ATEYQzxUDI/CjpH/XaCEQXksJpKVPqv04DzMBZoiWlmVncGqhN2XPSp2b1Vu91FWUoZ
	f/8BssgoETgK656V/OjT3jUByLYJptl8jegBoX9sP67GS/LZLecGp2ILhhfQDpfBvRXdt5+bG/c
	gB/YOwMIMCCOBsNkcFDPOuKYFZTrQx4yvQ6Q+8d16RzUcTRggUQiKS8qVdppJMoYHE8Fa88X4BP
	Pifh9susVEHTDEtx1Cdj4rZIi8K0M5H9ZJF2k3znBnqk2snpnlaeKxbAyLLctCXZSXtWSCOHwgs
	Kb5y5yGg2qLYrfoiV9ZtIaK7VLj46KuLekD5viouK7vdCA==
X-Received: by 2002:a17:903:2345:b0:2ae:4e8e:954e with SMTP id
 d9443c01a7336-2aea3247986mr23025ad.5.1773076645917; Mon, 09 Mar 2026 10:17:25
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-5-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-5-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:17:13 -0700
X-Gm-Features: AaiRm50U-PXwLYjmiDwgX5D5-bqDn4azdaS0klGDRU3-QqWA5WlM1eBYcGFDKIM
Message-ID: <CAP-5=fV5jFCyyywddBmijiedcVLKz+LReU=NPkUOcanjJ5oAsg@mail.gmail.com>
Subject: Re: [PATCH v3 05/30] tools build: Append -fzero-init-padding-bits=all
 to extra cflags
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
> GCC-15 release claims [1]:
>
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=3Dunions option to
>   restore old GCC behavior.
>
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
>
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=3Dall"),
> the kernel has enabled -fzero-init-padding-bits=3Dall to zero padding bit=
s
> in unions and structures.  This commit applies the same option for tools
> building.
>
> The option is not supported by any version older than GCC 15, nor is it
> supported by LLVM.  This patch adds the cc-option and host-cc-option
> functions to dynamically detect compiler option and append it to the
> EXTRA_CFLAGS and HOST_EXTRACFLAGS respectively.
>
> [1] https://gcc.gnu.org/gcc-15/changes.html
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/scripts/Makefile.include | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..bab3174565f0d1e40ec574a36=
0a0fddcee641f7e 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -137,6 +137,34 @@ else
>  EXTRA_WARNINGS +=3D -Wshadow
>  endif
>
> +# output directory for tests below
> +TMPOUT =3D .tmp_$$$$
> +
> +# try-run
> +# Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwi=
se)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run =3D $(shell set -e;              \
> +       TMP=3D$(TMPOUT)/tmp;              \
> +       trap "rm -rf $(TMPOUT)" EXIT;   \
> +       mkdir -p $(TMPOUT);             \
> +       if ($(1)) >/dev/null 2>&1;      \
> +       then echo "$(2)";               \
> +       else echo "$(3)";               \
> +       fi)
> +
> +# cc-option
> +# Usage: CFLAGS +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di586)
> +cc-option =3D $(call try-run, \
> +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
> +host-cc-option =3D $(call try-run, \
> +       $(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
> +# Explicitly clear padding bits with the initializer '{ 0 }'
> +override EXTRA_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Da=
ll)
> +override HOST_EXTRACFLAGS +=3D $(call host-cc-option,-fzero-init-padding=
-bits=3Dall)

Could this slow down builds, as each reference to EXTRA_CFLAGS and
HOST_EXTRACFLAGS will invoke cc-option, which shells out and runs cc?
Perhaps you could evaluate the values once then reference them
something like:
```makefile
FLAG_ZERO_INIT :=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
override EXTRA_CFLAGS +=3D $(FLAG_ZERO_INIT)
HOST_FLAG_ZERO_INIT :=3D $(call host-cc-option,-fzero-init-padding-bits=3Da=
ll)
override HOST_EXTRACFLAGS +=3D $(HOST_FLAG_ZERO_INIT)
```

Thanks,
Ian

> +
>  ifneq ($(findstring $(MAKEFLAGS), w),w)
>  PRINT_DIR =3D --no-print-directory
>  else
>
> --
> 2.34.1
>
