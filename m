Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F433F4
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A2BC385B5
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650065687;
	bh=H8TG9TaTkxthyp0a78kt3dMEbKUO8m3PltS7yJt03Lk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R5LN2lDSo7WwY13++WABknpygBkhBycI8X1dv7msbP04tZZ/I6BHEYnxB6uST2e49
	 oiZJSedLWWeU/zAwVDkxwuB0H8SyWamRC8YrpFQ3bGKJGnuPhxZ9jyaRPt3L8jR8S2
	 H9HlWA2DLcbCu7FNeALgjw9dpdbRHHaEGKywfYZ8yIKY8Y2cE/x843FrRYYzbcKBTU
	 8ZdIwqq26Z+OGKJgmiXWlsQd9R4C/WfXzQmUU5DXbyNTkE5aMG1FX1TJPKwaUOukAn
	 K9tTzqCnCxmA1Iqp5eNg4zT8aHNsXcDrZriydwFOKK75q2qN9rrRipW2TQCaIVUDGS
	 Fkt00ed2C7Lbg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ec42eae76bso95282827b3.10
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 16:34:46 -0700 (PDT)
X-Gm-Message-State: AOAM532AK0aSe48TSzf3kT6WXgW7SzhST/FOIANuQNge1XqMRoeMkKD4
	ixeKI5L89pome48n9iKmq7aTikXvXq5EoDOnprs=
X-Google-Smtp-Source: ABdhPJzFi4avB4LXxfU1+vAL7RiFsHM0NYSgX5xmyngsW8isXQE/FvZ8UGsTCkZUMTOvj9iYRuUPlvo38P1Pwkh32Ek=
X-Received: by 2002:a81:688:0:b0:2ec:239:d1e with SMTP id 130-20020a810688000000b002ec02390d1emr1124694ywg.211.1650065685677;
 Fri, 15 Apr 2022 16:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-4-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-4-alobakin@pm.me>
From: Song Liu <song@kernel.org>
Date: Fri, 15 Apr 2022 16:34:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6_9nq6wesTwDbpV50euq=ubqdLdfVkc9-pNOnGevXs1Q@mail.gmail.com>
Message-ID: <CAPhsuW6_9nq6wesTwDbpV50euq=ubqdLdfVkc9-pNOnGevXs1Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 03/11] tools, bpf: fix bpftool build with !CONFIG_BPF_EVENTS
To: Alexander Lobakin <alobakin@pm.me>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Dmitrii Dolgov <9erthalion6@gmail.com>, Quentin Monnet <quentin@isovalent.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Chenbo Feng <fengc@google.com>, Willem de Bruijn <willemb@google.com>, 
	Daniel Wagner <daniel.wagner@bmw-carit.de>, Thomas Graf <tgraf@suug.ch>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, linux-perf-users@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 3:45 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> Fix the following error when building bpftool:
>
>   CLANG   profiler.bpf.o
>   CLANG   pid_iter.bpf.o
> skeleton/profiler.bpf.c:18:21: error: invalid application of 'sizeof' to an incomplete type 'struct bpf_perf_event_value'
>         __uint(value_size, sizeof(struct bpf_perf_event_value));
>                            ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tools/bpf/bpftool/bootstrap/libbpf/include/bpf/bpf_helpers.h:13:39: note: expanded from macro '__uint'
>                                       ^~~
> tools/bpf/bpftool/bootstrap/libbpf/include/bpf/bpf_helper_defs.h:7:8: note: forward declaration of 'struct bpf_perf_event_value'
> struct bpf_perf_event_value;
>        ^
>
> struct bpf_perf_event_value is being used in the kernel only when
> CONFIG_BPF_EVENTS is enabled, so it misses a BTF entry then.
> Emit the type unconditionally to fix the problem.
>
> Fixes: 47c09d6a9f67 ("bpftool: Introduce "prog profile" command")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  kernel/bpf/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 34fdf27d14cf..dd8284a60a8e 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -4286,6 +4286,7 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
>                 goto out;
>         case BPF_PROG_TYPE_PERF_EVENT:
>         case BPF_PROG_TYPE_TRACEPOINT:
> +               BTF_TYPE_EMIT(struct bpf_perf_event_value);
>                 if (attr->link_create.attach_type != BPF_PERF_EVENT) {
>                         ret = -EINVAL;
>                         goto out;
> --
> 2.35.2
>
>
