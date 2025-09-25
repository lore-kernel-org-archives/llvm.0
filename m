Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1831E0EB
	for <llvm@lists.linux.dev>; Thu, 25 Sep 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829130; cv=none; b=A7XWQjtSTEx+t3mFSS0XRcF6LOLCAGowWVcRvXF+pYySL8rT8HnlSlCgZe18E8OFeR5Cwx9M/v7i0789t1QN6frKvq1WKb36smj5ojMxYFkf04cb6gUTRn8somsRQiK9ObwOvTNby1w1STRtccmD3A3AvqViAg71U5feQzAJBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829130; c=relaxed/simple;
	bh=MdI2AHIvRAIXfAa0D0cIiFe+/emKPsfH4wCzSWvwGLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAsOy5tAh1VxLd1QEkQln2ftMkBb3f7YJkI1ZrRFGfAFIzw9/axdD9wl+3qx+SlWaDmBgCIbcsyYPkL5qjmKpQ1fB638RQ9Y8dSqWERFwsAt26DEiw5XSonkDIbYUuU2OoPW7KXg88WekEEhAY7gYRI9sybuagBsj4grb7vli2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGrJ8Fso; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGrJ8Fso"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2681645b7b6so3385ad.1
        for <llvm@lists.linux.dev>; Thu, 25 Sep 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758829128; x=1759433928; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmXLeoRNYxQ/q9eeZjkA7V0DrLfH4gyiTpN84frRQQg=;
        b=YGrJ8Fso7TNoTeiDaqszBNwSdWbC9D+ZooFXv9p122STku7Fhkq8bywdQxvHNOTF5f
         Yo9ScKcIFOrW07AbazMBVJJCuiIxAE58vAdOYtHj8ddq910E858N/oEyv8wPWBfby/ho
         2vpfHxJTQXg51zowTW7hd925vDFJRkCVuu3WmPRcN95dvLk/L0DVcHqI976cLwQzZN9D
         0HqCFT1adLm567c1H0WUhYbtPVYq1jpYK/rbiHkJFuWQhSjQeulMudMOeAvOnJuYOyKj
         9nmL99d5y7K74UZ5t7OQe6Q+NCb8DWYm5JkjeHObbJCXnfAo/atfTXBBK1lzCVicYhJr
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829128; x=1759433928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmXLeoRNYxQ/q9eeZjkA7V0DrLfH4gyiTpN84frRQQg=;
        b=ZEC99Y5IXNU4I67uasSnnMs5yS8fQB8JpdXWuGRyLVpvGVEkN59nhQFd0bAyWxmBpB
         Ny4CL1qNSSDiMwHIxuOEj+owN9Y44yjKIhR4o4bDgbo1Czp9fRgFXJjwpA8terTwOWjb
         b45MQrSFzeSjE1/J2CPPJw2rzN6zqDfvvM1EqQGGUk1eE3pezQkTYWFpl9p/aukWBSP2
         qsmNte31Qcdlelg9eGT1PPZ/x40hma6ArR9hRtlIBwku9pd2hclSOr5wanFaRslOuicR
         SQ2TCJuZdjHzRcK8D1m+Vx4ELZkfrbZO6zqGmC8/vI3IwlYoYONnG2osZqDAmLAN+BkX
         r36A==
X-Forwarded-Encrypted: i=1; AJvYcCUGLLAGnVEHDmIix5shl1QvAQg0Dz6Ka5OScRq1/8qoVG4VIGQH3Z1f92FT/TsEDnsMRRsR@lists.linux.dev
X-Gm-Message-State: AOJu0YwMRSm05GAVz+q1Z8oeW4IhGxbyuI13LWlkmll2snxAA7uDM84P
	/xRC46b6BmxIVTrL8L6mLRqBu2LtlwwhCjXp4c0Rbd0lN3JZ0BPkbnQjs2iDHeDXKzdnMsCWdTS
	4tkT13qRSjTjPUXPnuVBbXV0Cgi1v8p73kzj5KbkO
X-Gm-Gg: ASbGncuLY5OLAhhQKR6T/Ywqm3PuXW7J66qYyFW2K6Dwfc6ixc2zs3+4uSy4odfG9nd
	7zizywWA/hX0egYg9Td3LXrwzhxYRSg9KpTbmq3bnmXPv+bLjtSCs9u77VZpafTyKhk7JXYC5L8
	Q6IRrMPmgZOJP7iW7WSZ74hrumLg3+BnrylVlqH1jaexi0rSmhm208GerFGYGuXOXZr5b40Wqcq
	DERkq0fi97afrn7wobhc7oGnlfckI/pw/rl9oYwyA==
X-Google-Smtp-Source: AGHT+IHlWDsv5W+Cnz3QpzSjCLsjC6JqkFfJnw0PQrGoFuGfCPLIcdnOMx84aEiFui77lbyr4nxAshVX71wahiIYeqA=
X-Received: by 2002:a17:903:4b46:b0:274:1a09:9553 with SMTP id
 d9443c01a7336-27eecd5abf5mr876475ad.6.1758829127934; Thu, 25 Sep 2025
 12:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925-perf_build_android_ndk-v1-0-8b35aadde3dc@arm.com> <20250925-perf_build_android_ndk-v1-4-8b35aadde3dc@arm.com>
In-Reply-To: <20250925-perf_build_android_ndk-v1-4-8b35aadde3dc@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 25 Sep 2025 12:38:36 -0700
X-Gm-Features: AS18NWArHaslRBdqbnMECGDnT24X9gvQ1wcAN-wPei7OArHIVhWE7ff1fDEiDAU
Message-ID: <CAP-5=fWGKgXV52_9E7n9yDX1uNLF8qWT9XTFK8eKtc_LRCW5wg@mail.gmail.com>
Subject: Re: [PATCH 4/8] perf test coresight: Dismiss clang warning for memcpy thread
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Quentin Monnet <qmo@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 3:26=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> clang-18.1.3 on Ubuntu 24.04.2 reports warning:
>
>   memcpy_thread.c:30:1: warning: non-void function does not return a valu=
e in all control paths [-Wreturn-type]
>      30 | }
>         | ^
>
> Dismiss the warning with returning NULL from the thread function.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

lgtm, should this be moved into being a perf test workload as in
tools/perf/tests/workloads/ ?
There doesn't seem to be anything overly arch specific in the test and
being a workload avoids a cc dependency in the test, as well as
meaning we test with our usual compiler flags, etc.

Thanks,
Ian

> ---
>  tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread=
.c b/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c
> index 5f886cd09e6b3a62b5690dade94f1f8cae3279d2..7e879217be30a86431989dbf1=
f36d2134ef259cc 100644
> --- a/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c
> +++ b/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c
> @@ -27,6 +27,8 @@ static void *thrfn(void *arg)
>         }
>         for (i =3D 0; i < len; i++)
>                 memcpy(dst, src, a->size * 1024);
> +
> +       return NULL;
>  }
>
>  static pthread_t new_thr(void *(*fn) (void *arg), void *arg)
>
> --
> 2.34.1
>
