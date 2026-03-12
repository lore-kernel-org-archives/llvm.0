Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4D83F164A
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336302; cv=pass; b=moGeXKfQHtElfDgNe8ivYDLH74Kxt0g/SvPiyKQY+LeTdVmjekmohTcWfxImdVtCKrbHzbxuj+KtQRf9bfK6687H8u5w+iP1S9vn5ZAmDN3OwkGiA98IONJtQN4s10383NxFybnVKBi+YW7CrcuocTVR50nPXrLvCrEhAEOhKAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336302; c=relaxed/simple;
	bh=EUnbf8s9gG6GzSdAsBxHv68nHvfQl+MlAZdHKrNHid0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhf5xjusaDcrUJnZ1Y/Lu8hHUZDiHDg0fm1QI5wTEajTBRYLj3AJfiChR4x2/N63XJQ7nEPwDjAi4N/b0zPTWbJqJg9/LWXGD5c5Bm0O2QFdYKHUPvBB9LNmRWWaj6F9Sb7Q9vb2PmZr2pVieze/YNjQ90fR/QTj5nFvN63nmio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SGPVtCZs; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SGPVtCZs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae49120e97so7115ad.0
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 10:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773336301; cv=none;
        d=google.com; s=arc-20240605;
        b=MVatuW2TWxeDG0O3zVcSuzQ9y0I7Brklzm08cbOoExzRsPbpoz/SmMM2LZMYYqFWpc
         eojXOHrGiHdslTXnxUaYkQw6UjMpbHL2Nu+kb3DsAFzA6NONDMNh4L9cbcpgbMP6iqWq
         +WGUNT6Ego1OcdgK6w6OQthM3a2prs5qohWwki8MwfPP/xf2+h1Bh0Hm1PoXgIkwEiaq
         RB64/+rz05mQt+NrPAgrF2KqktyOKkuhYnmOEE6GSLugPjuQO7VajsK7Gtaf3+rbGsBn
         LgV0x9q5WvrZrn/2WTct9xj6QZCMY4QrqvW4XzsbR4+WtuHXYnh7akI+7XiNSgJpgEwK
         g51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wt8HMORomTHlz2fasa3fWuq19mlRWO2w6YTeCuKKCWs=;
        fh=8y4YF3ncU4JKCAoOAbJUYbVmUqSm+8NgcyDb9V3LKF4=;
        b=RCqe2umnAjk+XUWovoinyTdAGsqc6+ahRH+3Oziv/bKHx7mluntgzgA8QJp/g4/pSN
         V2zBEfX0Z65t8EC2owkV6Qboskw0q7qIM/rwufjxuzWnDEn8pcutlpkBhJdCmppO1y8V
         je0X2TKacwVCqlJ35kALE3pB/zCcdKI3iXLVPjIQsQDCZbMVs30ZClOYddCh95ZwglgV
         VSNcAEWp78Q1i47USxZr/CaZkkMPMuEQGMwteHZhAjpShetc4gW7kK62cEq/8OxU3yXC
         gmsKQGTpDQseaHHLVaDYSwtQJhHQXC3FKcH1II2ZFbJLsfKSnME7w1eJ6I9st++vBQma
         JoxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773336301; x=1773941101; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt8HMORomTHlz2fasa3fWuq19mlRWO2w6YTeCuKKCWs=;
        b=SGPVtCZsJnN7Li39m0+DH1ROyrBkQ6iBTaZ7Dvrx2igNc9bBeWacsxfRCYYx+5rX1q
         Ku6lZqKBeUjkAHt4TCppqBa05DDyxsyIxlF+NvsGjiq3ufEHPw7Vwf+WAtzDXeZpJ00c
         2YQ1Gd1ctZEVzt8HqG4OSQ1Je7S4Vu104Zoo4LCuBEsVv/rxYVKRr5s/il/mQxrdNL5W
         khBKmryTjWUIDVjQzHaTPJfeHkWCWtAYVFwAwlMZXW2DX1TpaWoAEjCFpfPAjo/RA6mc
         D7P5OVXejyyE+LTSwQYiN8tFSHJtFPly9o8dptqQivumU99wXf4F4CdvAd5AOfQ72ear
         n+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773336301; x=1773941101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wt8HMORomTHlz2fasa3fWuq19mlRWO2w6YTeCuKKCWs=;
        b=EdINWlKCjss1w4CSUkC5oVQM821oqP+niQpzsJlMBWgl2FIlyfsszdv9gJB61eeQhb
         jNPHdlIiRNogi2FD4EKGLrsG0FfC/3flnrFv//s/45AbQofIstOkRATook8QI4uPv3k3
         EmeRRckzJVvYam7EHrmUH5PHMK8dCgScCjlb31Lwlkau7F1jaAtGNFpxgMOPKKKZ0NEu
         WICg8CCoiXYVDWuVfA5v9kkfW6QOipQ3hY24GudC/ohWOAQ5Nu04Zvt3Vp7XL8urAk6J
         xm9Gpr/O5ynyBmVBlceqVUiwtoSLfCDAOp9cnxNHQPtIUWekKywaBxc4RZ7uHYfaf0NU
         Lv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGFdV4LkYMd2Vob5X4c3ISD0tihuTyR2RVkVGzbLscvVXvISNnQFPwt6rk0OPQ+IFAaJJw@lists.linux.dev
X-Gm-Message-State: AOJu0YzywC/c5mhR6MGn4WHA8yRFm/aNeX+InDjEJ6ONXRKRiWzzcmad
	hFLHr1sBDLCzBQq4B5cA5wfOX0KLhcsmJXq3zQiZR5gyoltdQ8eYFF6CENA+pGc51Dw1ZFARlTc
	Mtc8jm/AgknpmPq+c4i65eKey8WIn0LGixnW6hph4
X-Gm-Gg: ATEYQzzzHWdlfgMhEWwdvYVsjOJtY5DfuEq0+Oi/l7TlahCDiZxd6ke2EZVRqtMTWy7
	XxA9D/WzA5lNmH1rPb8x9SsYvex6KCLCVyaM+4q07QWYUBVhwgFs3eA1UeiPZX2ro+0vHAEq+86
	i9pLTDIkAHZdz6XnrrsHZykwLY5Am/72Zs1UACQ/W8QkTgXy17jcuHgYApKYGz4I0KaY4DPpS67
	H8pn59CgcP9WsiV+yM4+YbPCOQ3Qy40nifZJEWIox+F42O695mpSe7355DlKtb7Xge3NgwhgJnz
	MxNueYYR/iXMrJ1cPknccw0GOlBwUwibTvOY
X-Received: by 2002:a17:903:94d:b0:2ae:ca87:b1c2 with SMTP id
 d9443c01a7336-2aecb4968d3mr115665ad.8.1773336299917; Thu, 12 Mar 2026
 10:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com> <20260311-tools_build_fix_zero_init-v4-27-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-27-9e35bdb99cb3@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Mar 2026 10:24:48 -0700
X-Gm-Features: AaiRm52hQTw51elOXRvyPkEpjj1HAq438fXBgq5QDvtll0HOsb4gHaSDYi-74S0
Message-ID: <CAP-5=fXjd15e5YpCM9KMjEhpjLxvxc6qUk0g7BprCfkzcRZ5_g@mail.gmail.com>
Subject: Re: [PATCH v4 27/30] selftests/bpf: Append extra cflags
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

On Wed, Mar 11, 2026 at 1:33=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> urandom_read is built with clang.  Introduce URANDOM_READ_CFLAGS to copy
> the compiler flags without appending EXTRA_CFLAGS, which may contain
> incompatible options with clang.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/bpf/Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 72a9ba41f95ebb825d25799c07ba3f0311243e45..27112f08c9a5b6cabc4190220=
7d00897070b41b4 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -71,6 +71,12 @@ ifneq ($(LLVM),)
>  CFLAGS +=3D -Wno-unused-command-line-argument
>  endif
>
> +# urandom_read is built with clang. Copy $(CFLAGS) before EXTRA_CFLAGS a=
re
> +# appended so that it does not inherit potentially incompatible options.
> +URANDOM_READ_CFLAGS :=3D $(CFLAGS)

Later in the Makefile, include ../lib.mk is executed and it appends
CFLAGS like -D_GNU_SOURCE=3D which will be missing from
URANDOM_READ_CFLAGS here. Perhaps move these assignments below the
include?

Thanks,
Ian

> +
> +CFLAGS +=3D $(EXTRA_CFLAGS)
> +
>  # Check whether bpf cpu=3Dv4 is supported or not by clang
>  ifneq ($(shell $(CLANG) --target=3Dbpf -mcpu=3Dhelp 2>&1 | grep 'v4'),)
>  CLANG_CPUV4 :=3D 1
> @@ -255,7 +261,7 @@ endif
>  $(OUTPUT)/liburandom_read.so: urandom_read_lib1.c urandom_read_lib2.c li=
burandom_read.map
>         $(call msg,LIB,,$@)
>         $(Q)$(CLANG) $(CLANG_TARGET_ARCH) \
> -                    $(filter-out -static,$(CFLAGS) $(LDFLAGS)) \
> +                    $(filter-out -static,$(URANDOM_READ_CFLAGS) $(LDFLAG=
S)) \
>                      $(filter %.c,$^) $(filter-out -static,$(LDLIBS)) \
>                      -Wno-unused-command-line-argument \
>                      -fuse-ld=3D$(LLD) -Wl,-znoseparate-code -Wl,--build-=
id=3Dsha1 \
> @@ -265,7 +271,7 @@ $(OUTPUT)/liburandom_read.so: urandom_read_lib1.c ura=
ndom_read_lib2.c liburandom
>  $(OUTPUT)/urandom_read: urandom_read.c urandom_read_aux.c $(OUTPUT)/libu=
random_read.so
>         $(call msg,BINARY,,$@)
>         $(Q)$(CLANG) $(CLANG_TARGET_ARCH) \
> -                    $(filter-out -static,$(CFLAGS) $(LDFLAGS)) $(filter =
%.c,$^) \
> +                    $(filter-out -static,$(URANDOM_READ_CFLAGS) $(LDFLAG=
S)) $(filter %.c,$^) \
>                      -Wno-unused-command-line-argument \
>                      -lurandom_read $(filter-out -static,$(LDLIBS)) -L$(O=
UTPUT) \
>                      -fuse-ld=3D$(LLD) -Wl,-znoseparate-code -Wl,--build-=
id=3Dsha1 \
>
> --
> 2.34.1
>
