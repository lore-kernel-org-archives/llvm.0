Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A62D7DE4
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851937; cv=pass; b=c5vVNLPfGxirHE7YIZKr4uW80nTvk8QRyDa5RESgYsnVamwXrxJtwmuPqhvpiLdgizeNnRCZyUUsj2pFv1FyznXGLcY+urqeR2HqyG7XgYKCoWaftcZBLm7JXolX4PZbAbpi1af3N5rLu9eMODCo5muwiTRzCKlXLMQUkY+nZoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851937; c=relaxed/simple;
	bh=pQRo/AIDHbWYmQiKbzY1fu0YoqvFJr3p4qbPZJOQBWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5tZvJPaOWxrhc76S5wh16jCaP+XPUyPHv4rH23WYWykj/JYLYJtNzZS6gU4vdaad+OOb6mWLK2La3pS3HlQ2ZkXZMgdi70d7utex9BntxHGBN/YMQfoniAFstqqvgQpC2Q4gpBrW3Vk/5gqPkfvsvB2Q4UhbiLW2EqJlLs40yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FrsxZ6M+; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FrsxZ6M+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b052562254so119495ad.0
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773851936; cv=none;
        d=google.com; s=arc-20240605;
        b=KP/k1gyE/gdffSRcD8kId5+MbUhKB/LmRt7NAIERLE8J4hhDUQ9mJHivgD8rwJn1p1
         FQ9GAzMrhmIT38PHr/rSziic3bBoGGLd5iGATSQPiE66JUnoy53ZjzCXG/UwwyPS0mui
         Rqy6FpnsTGdawmciprvOzdjAujH1EbeZpu1YZBCNL9xv2Ku15qQVNC+YWakDMoXWFV74
         ujVZRIVTKCD/OQXu1KXadoVZ8EREXIxEf5+xt8ImiKzilcIi1kROiDO/ZZojcHCm/lmB
         hzWlUOd2J7yuylv7geR5neBiavSlG6iM5U84quK51WgK3+XwxQPC2CIXBUa7YLNfEGEG
         4zjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hcjCxyCQZIThfXRlEgtWrMDq+8GZ2+bJDcg2rHRM0J0=;
        fh=WsdsBddoS0Qj+/JqkWqnB9lKi15HSnFheviffFjoqWs=;
        b=CTXs/MHdl2RKVSRt32JqI0DX6qsrzsDFGBLjy8gl7xkLhntCfmmS1k++dMdMFBG1bL
         PCeRPpb3mFH2IiojcT9aLzLjcqh3kbWIcHBoKhU5xK9P4te4/MD4QAcdkSFLt4usuEFq
         JHkpqrHQexDISeEehlxbIVu0WpG/QipTB9h3EPMVEswPbXXwTsFvo1ubQgrke0tv6Qwq
         ClMxZu2m7o7MEA+IZEKVmycG3cBc1/ndoY7gWxRwH0tdZO0EWf3BGvt+oxhj1fAYqkF0
         Xya/MjLk5ITtNmB0Yufa9ynPKL4SDlwriiWstasJurrQOxlbK7auR9nVT2JxWp4SrUOy
         XrtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851936; x=1774456736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcjCxyCQZIThfXRlEgtWrMDq+8GZ2+bJDcg2rHRM0J0=;
        b=FrsxZ6M+rpb/jyj0FPQHk7xz+yaoE69Xf1TMw2usAJ7oppfxH6+MDqXrZgg5W5z9qp
         i2Gw9KTunvhr6Lw3gC/SHht+O/DrS22nhNC6l4yAVOkThSbpe/+dUqEXszp2M6zyPcrD
         z9yLjDLxA/Sz6QTXgD5ACjgBw/yd1/j/xkJQ7pR350tCwbWsu4OOuE8wksIRpWx73nw4
         GqJLZY410TArVMyJ0aPbxdZPByPBkkujS2GL/ziO+3mxKpOisZ65jhBEDPl2jsn5CREB
         rfcvCvEBmKlQRAf7/8/jO/ZLYHLxEz61J2n9yxKy2asVa/gbUdePCuyd2qsv7hzh+asE
         ghWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851936; x=1774456736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcjCxyCQZIThfXRlEgtWrMDq+8GZ2+bJDcg2rHRM0J0=;
        b=KDRlI0razK+dmQhnLKHwdYnQmvzY5qgTxyvWwJmbvugRrR9elCTowec63VVaNkCuhk
         h09U+rPGAKHBsyjn/Nb56bLKNHxQvInQ2IBh8S3Ivkfwz0BdIaNyvEm8zq7ffP7SCvHF
         9lunwfRAgTozJsBRIJ5OqzhUFkI1oRqSHkzPB6e92QOSNp8VwU6f6xd60JM/MaVzmlWw
         ZGd6T52zLoG0zN4RAfB80PihqewZyO6YC555PYvOjYwEPiQx9TzKK+gO4vr936tLvAXD
         B8es06yGr+5iX3iC1KFVuWBeY3EtutJNHPZ8+15jMjhxuXASJiaD8pdr2ICD/svI7ltK
         zs7A==
X-Forwarded-Encrypted: i=1; AJvYcCXtemXvSByFSqgOQ1/lzobzgsSH0dN19VyWIEw4Md+29cSlD6VntJPgWsiL6jjTAoE/WrC0@lists.linux.dev
X-Gm-Message-State: AOJu0Yzoyb8s9WOGKObw62vWtGM2pCfp1ADscVz8klW+miJVICwX0bFY
	I9OScyCFJ/5YjoJ58hc9GRBJi9XaqXhN+pceYTRDJt95/OSv6XINPZDYMLCVpeBuOAUf2v4T8lz
	Bo7q3WTFOBL9QoH/tH6VKER/aXC3a21OfqOeq39GI
X-Gm-Gg: ATEYQzwQ0VTvOPrTAUDMixIN18eDfJGZDb+voM23Fofo0Ei4xRBXiMrGXgaue/PbkTe
	S5WR75P60YYCQ3fnQssYH/Lr+Hwx2UaIFdD/S3r7TaIdrBo09NARktG7A5zAWpEAxUumBzFxNCz
	sy1POcYwqLtGpKQlt8Y/IrB9q3Bfj8mebiHjNJ71weNCy3Z/0k0oL/nEunCnedtE1uF1j0RA3Ti
	vL67ozgdaghSymuKJe6sgDbIX4xw8NDR1sonG/ZSzBq5PgRhxSUl2uQmB7Q7zuehTPJw4jf7vIH
	V7TCJjPc
X-Received: by 2002:a17:903:22c7:b0:2ae:c566:bd99 with SMTP id
 d9443c01a7336-2b06e88a5f7mr4276635ad.22.1773851935141; Wed, 18 Mar 2026
 09:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com> <20260318-tools_build_fix_zero_init-v5-6-bbeffd8da199@arm.com>
In-Reply-To: <20260318-tools_build_fix_zero_init-v5-6-bbeffd8da199@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Mar 2026 09:38:43 -0700
X-Gm-Features: AaiRm50hpzLMMjzX6OI5eZpFyBk6BPkQvLc7onrrMNrR4VNp8m3oc-g1ki8itfQ
Message-ID: <CAP-5=fV_ObgCokJ3bKAQBYn-DPrGadGVzqvrzbuy8aEcsfkp8w@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] tools build: Append -fzero-init-padding-bits=all
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

On Wed, Mar 18, 2026 at 2:18=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
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
> Acked-by: Quentin Monnet <qmo@kernel.org>
> Acked-by: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/scripts/Makefile.include | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..a2397ceae512c1bc54adb15cb=
1a111ff34e28e43 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -137,6 +137,36 @@ else
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
> +FLAG_ZERO_INIT :=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
> +override EXTRA_CFLAGS +=3D $(FLAG_ZERO_INIT)

Sashiko [1] noted a possibly unintended consequence of this change for libb=
pf:

Does this override unintentionally drop the default compiler flags for libb=
pf?

Looking at tools/lib/bpf/Makefile, the default compiler flags like -g and -=
O2
are only applied if EXTRA_CFLAGS is undefined:

tools/lib/bpf/Makefile:
ifndef EXTRA_CFLAGS
EXTRA_CFLAGS :=3D -g -O2
endif

Since tools/scripts/Makefile.include unconditionally appends to EXTRA_CFLAG=
S
here, the variable will be defined before tools/lib/bpf/Makefile evaluates =
it.

This causes libbpf to silently drop the default -g and -O2 flags.

While later commits in this series fix this exact issue for
tools/lib/thermal/Makefile, it appears tools/lib/bpf/Makefile was missed.

Thanks,
Ian

[1] https://sashiko.dev/#/patchset/20260318-tools_build_fix_zero_init-v5-0-=
bbeffd8da199%40arm.com

> +HOST_FLAG_ZERO_INIT :=3D $(call host-cc-option,-fzero-init-padding-bits=
=3Dall)
> +override HOST_EXTRACFLAGS +=3D $(HOST_FLAG_ZERO_INIT)
> +
>  ifneq ($(findstring $(MAKEFLAGS), w),w)
>  PRINT_DIR =3D --no-print-directory
>  else
>
> --
> 2.34.1
>
