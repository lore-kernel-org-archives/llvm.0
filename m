Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630201867
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 17:12:13 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id 80so1116537vkw.0
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pYT8LiXPjG72JXyjXh0PA/0j6snOgjAInfuhdQQzK4A=;
        b=ZiyMakZPe2qW167OmeXyl2TuWZG/d54+3LqcHKYeCbiytsFzupldZcNEbtc3woraMi
         WuZQ+m7C4d9rEtCo8dS0y+0oipuQi3dRdUE78C8HHIGJOduFOGUFCTxyH/J+xxMObUeo
         3fx2WciP5/4tsVV5rAi1F2Rjh5wBollI5V+EK2kAG90dGELPOYf3oi7PG7tVGwYw9Oqs
         38Jjf6kXP8UYlQkmvWHW62Hj8xWG/XVyj/kAmay4gjQ4liV5GP258qHLLDahX87U4Zce
         TRodUG0FEsekwpItF7t9i66GVhDI7kAzoaTbxbuxVpnEzRABk4BlKz0aQ1H7VVD+nloQ
         4k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pYT8LiXPjG72JXyjXh0PA/0j6snOgjAInfuhdQQzK4A=;
        b=bRvJwikw4PHXYtPXbmAZju/FzLc4DlMswYVOGus2mHWQvjhZ86xqsgEh8pF/awX2d0
         1/EsPtOsc/aP7Ovxko0l46byu9SvMGdPYQlubAaWQ/p0d7KE/Iz/h/SrwgSCYasPbOO4
         kFuMrjihrzVa13ydMbDqS4EXkJOaCNteEUTBxf6STqYSY3VDS2zUc1zpZQUr62fT5zGB
         Ivj7xJkmLwnlPA6T85xmtYXJsaGuORyiRHaaUWJ9StQzjOE9dwsw+VxhTbZyRzdT8L3N
         cN++5PBoA/c0ePsk/v4w+sBH68efrNsgkBrO2DDMj0znuZ3WDJ2Yh6BIIPgi4uYRBB3C
         SrBQ==
X-Gm-Message-State: AOAM533LQaz+OG0WODbZ5Dc32dUBSKt385k03kTD4vaVLyf7kJ1kJthD
	CNQD0DewNYVQ5oen57UlpX+90mKwm/uOd5A0tQM=
X-Google-Smtp-Source: ABdhPJxnS1xt53URfkC+Hi8iynVsfEwenj/2vAUetV4O4xWYXcnniqZonwmQezQoWp3xT03XpQs1W0FscQZQVDNUGLE=
X-Received: by 2002:a1f:abc5:0:b0:343:20e4:890f with SMTP id
 u188-20020a1fabc5000000b0034320e4890fmr6765514vke.20.1650474732358; Wed, 20
 Apr 2022 10:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-4-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-4-alobakin@pm.me>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Apr 2022 10:12:01 -0700
Message-ID: <CAEf4BzZiuD+bJ2zMikrb_W6KUHWjEqu6jwp5cNEgaHdSgRhUtA@mail.gmail.com>
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
	Ong Boon Leong <boon.leong.ong@intel.com>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, llvm@lists.linux.dev
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

same as for previous two patches, if there are types that bpftool
expects and might not be in vmlinux.h due to different kernel
configurations, it's cleaner to just define their minimal local
definitions with __attribute__((preserve_access_index))

>                 if (attr->link_create.attach_type != BPF_PERF_EVENT) {
>                         ret = -EINVAL;
>                         goto out;
> --
> 2.35.2
>
>
