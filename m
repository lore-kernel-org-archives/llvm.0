Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13725467B
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179371; cv=none; b=KF3UNjgQUfgPH4Yt7GWbLOLOXw1JBVjRJv/uV5iogl9IYCt8eoZhVI0IrvrH6Psw5TPjbN54Pxcd5ZKON9NNoNGebdBDT9A1r9c94fcyhbHwP9cVuBT0qHehwbOww2LU3ehblT5o3PXWUCHDA90tPUc2burrjfMXkwJ/rsGnFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179371; c=relaxed/simple;
	bh=FruVc137rIMV3xfiSwhivbMir0fGyRuBlxHaGRlShtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUF4r5YLgepXaM3UpuE/0wqOq8SJMtQw9+vHFYGrtWY+HaHQaZFg9MEpCQ8R2OUXNFm4j8eDy5l6QmSnKv9VsZYbITfbIycgAmiFsg/7KTdkjK/36VOOkjZ6XSG84FSMnkun08/7PvUYns81aI6H9UsVxEydDNfxbvKIfrCYTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMwnAHLI; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMwnAHLI"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29c23b9abf7so432553a91.2
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710179369; x=1710784169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbU798yjoe9QW28weq/V45GGj69Gs5hSFHP5NyuJ08o=;
        b=AMwnAHLIUQSz7qtYfS1kV1NWToFJZXOS4OhlPdMkaOorKwmZpeLSrt4vxtxDtT0b/d
         eWBJp0UYRkEFcXbqUlXkD4GSPZK/AZmexnHjQ7fZIZBsiL5p2aD5n5gRlB7hSRKsJvsj
         JgqXKaAAownmpfz7bTJCYRQsGy3xJg1LL2nakiYL5Mwh8I1GIhVKJJKejlsUshrLRq0M
         22WXxFPziHwxDsUfsF20Jf0gng+oSR3D4SXiV+iZtrO8uMFJW/BSf4eeKHJGPujCzkj9
         kyHw2K2j1N7r6lwbeEi7vT7idspMAgVvvfF4TYvKitcjvqUn+RSg1obf2wPE3z9tdFy2
         24fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179369; x=1710784169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbU798yjoe9QW28weq/V45GGj69Gs5hSFHP5NyuJ08o=;
        b=FMCQeOAObXA0NpL3kHy7FY666BPws6H8HsigX12UR65u8kGOsIoAbL6e8ozUMilB4F
         23qXjiqKGPre92c5oOz/bux9KfdfMn/od0WeMvKywUnpy38mx+AWJDJp0vifZyJqXMhM
         ROS16sY5XsKUAwe5IZIgnRNAtfcf55bVy2UWMHNHqrneA1y0TzCXx/h48MXZY3QVCumq
         LjSiIEzw0NXCUzPv0lCFsojmqGftVb3nzFfX/W4cbEz9+rFKRvKSg7LvMV/F+qTCjWUJ
         AinfZwxsoXD74EwLfiCOdwvNnuRnr+xXgO8MhF0myP08N/W8j/6alftI6uoITFMDx4gx
         MayA==
X-Forwarded-Encrypted: i=1; AJvYcCXQBsdjesnoGyMixrUUodHMfekCrLQ9IpWYrvu9ECKdVKhgDdi2/HjxiJB35V3lUOCjWTOoB2+BPhjk9o6NtKLC9muwnQ==
X-Gm-Message-State: AOJu0Yz9Dc3Yx1zppUzjZOyWwL6r9ZK0enOcPilV5QM23UKJYDwftBC6
	QsAVvDjKkkPJb6tLS4WK/1RvuTWWAooB20VsOq27rqKL8uOcgZsvVkr4HLLl32XNRGeA8E65k5a
	25E8wnq8Oh2H63hOrk3AcMQKWIow=
X-Google-Smtp-Source: AGHT+IFoTIEdjqsxBYqxcW2ZvSOL+ezHdwHnCQaQtLgWWppeaIwje2I36qXoDeTn1HfSnWTODh8p84OGtT7sU7h7l88=
X-Received: by 2002:a17:90a:7563:b0:29a:d7ba:2c99 with SMTP id
 q90-20020a17090a756300b0029ad7ba2c99mr5706073pjk.10.1710179369144; Mon, 11
 Mar 2024 10:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com> <20240310020509.647319-3-irogers@google.com>
In-Reply-To: <20240310020509.647319-3-irogers@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 11 Mar 2024 10:49:17 -0700
Message-ID: <CAEf4BzYiH6xRRLFBdUAkjn0uJP=safZod4=1EmEwTTH9PDmVvQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] libbpf: Make __printf define conditional
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@aculab.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	James Clark <james.clark@arm.com>, Nick Forrington <nick.forrington@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 9, 2024 at 6:05=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> libbpf depends upon linux/err.h which has a linux/compiler.h
> dependency. In the kernel includes, as opposed to the tools version,
> linux/compiler.h includes linux/compiler_attributes.h which defines
> __printf. As the libbpf.c __printf definition isn't guarded by an
> ifndef, this leads to a duplicate definition compilation error when
> trying to update the tools/include/linux/compiler.h. Fix this by
> adding the missing ifndef.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/lib/bpf/libbpf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index afd09571c482..2152360b4b18 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -66,7 +66,9 @@
>   */
>  #pragma GCC diagnostic ignored "-Wformat-nonliteral"
>
> -#define __printf(a, b) __attribute__((format(printf, a, b)))
> +#ifndef __printf
> +# define __printf(a, b)        __attribute__((format(printf, a, b)))

styling nit: don't add spaces between # and define, please

overall LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

Two questions, though.

1. It seems like just dropping #define __printf in libbpf.c compiles
fine (I checked both building libbpf directly, and BPF selftest, and
perf, and bpftool directly, all of them built fine). So we can
probably just drop this. I'll need to add __printf on Github, but
that's fine.

2. Logistics. Which tree should this patch go through? Can I land it
in bpf-next or it's too much inconvenience for you?


> +#endif
>
>  static struct bpf_map *bpf_object__add_map(struct bpf_object *obj);
>  static bool prog_is_subprog(const struct bpf_object *obj, const struct b=
pf_program *prog);
> --
> 2.44.0.278.ge034bb2e1d-goog
>
