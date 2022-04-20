Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8F1867
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 17:20:42 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id q2so2194760vsp.4
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vceL50BIp2v6AiSQ6YiQr6PR8WOQ5ol+sLtkOLau4XA=;
        b=dPSQHu6nx3iobsZSUWBFmXF4+kbgM/szfCsN6teKAmJ9FpHP0/BQhQ7vkzc+xC4nqd
         MlYf4fGWTY35ANgfJwFGNPL2LOBp1umldmad29D2CJ0hU0Mxls3ffBj/tXq7HqkEq6/B
         JKnor+MXg9+H+0s9wpmSgYrMl2w3+eijPyNKoEydWt9ON88mle7z56kT7U/ydH0cRWZq
         NWOYdeVdI8wJRc2PzplJ31uJGHcyViapKYwj22j/YU5QeaZC9gLRDGu4gDXoELQm8aPJ
         79wH0nGGRPIWA560g2smnsMVD4weZ/45UYENV/J0QkSL2DtXM7tjN0jxyEtXlz8eUnS1
         /f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vceL50BIp2v6AiSQ6YiQr6PR8WOQ5ol+sLtkOLau4XA=;
        b=SYeoj1/rP7ypLzb5Y+xiXwWwg01UxnfyrwA5sxtdOVeQsm4jhOnGJHxcUKg5iVFixb
         XnzUWxvC7TrYMBQIw8u2hHwuROKjx94S121+FO9N7nQ1nHZawfZKAZrVjpG7V577kDKy
         sPhya/Lzqmrrto14SlO8XwSfc0QVgEw+RGOXcAgz3W2e+r1U3vX7rXmstVuvcOI/+kPi
         e0Dj083X5eFXcfVGLJ+4zbBrA9kRkTJzWMdCFdeP1hWLN6i1R9k7Ouf+DGCokmYfn9ZT
         DTOOakpwUYHMAXZjWgaHzow5rh+Lx1obHz1yHcEqS3SCARP6qLwQRJBbMeUwX/S7QK5O
         2lZQ==
X-Gm-Message-State: AOAM532dmzSJGbvl/ewCqXcLbiycxt6g0JON7vj22pmJppB3iBXPv0Uk
	XUdaP1AsOp883SKc74HEaDKy11LdTCXDAVTNs3E=
X-Google-Smtp-Source: ABdhPJwa5MK25KXgiSTD0eO/ewqGUYce48kyJBJEdJott0E9+lLwDRk0RiatpUDoEtgOvwNXhLZUz4i9JP7/swbztEA=
X-Received: by 2002:a67:f693:0:b0:328:295b:3077 with SMTP id
 n19-20020a67f693000000b00328295b3077mr6552415vso.80.1650475241848; Wed, 20
 Apr 2022 10:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-1-alobakin@pm.me>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Apr 2022 10:20:31 -0700
Message-ID: <CAEf4Bza2H=vd+2nWV26UXBJCbMJkAVt2kggEj7Jxe8UVcs-qkw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/11] bpf: random unpopular userspace fixes (32
 bit et al.)
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

On Thu, Apr 14, 2022 at 3:44 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> This mostly issues the cross build (1) errors for 32 bit (2)
> MIPS (3) with minimal configuration (4) on Musl (5). The majority
> of them aren't yesterday's, so it is a "who does need it outside
> of x86_64 or ARM64?" moment again.
> Trivial stuff in general, not counting the bpf_cookie build fix.
>
> Alexander Lobakin (11):
>   bpf, perf: fix bpftool compilation with !CONFIG_PERF_EVENTS
>   bpf: always emit struct bpf_perf_link BTF
>   tools, bpf: fix bpftool build with !CONFIG_BPF_EVENTS
>   samples: bpf: add 'asm/mach-generic' include path for every MIPS
>   samples: bpf: use host bpftool to generate vmlinux.h, not target
>   tools, bpf: fix fcntl.h include in bpftool
>   samples: bpf: fix uin64_t format literals
>   samples: bpf: fix shifting unsigned long by 32 positions
>   samples: bpf: fix include order for non-Glibc environments
>   samples: bpf: fix -Wsequence-point
>   samples: bpf: xdpsock: fix -Wmaybe-uninitialized
>

For consistency with majority of other commits, can you please use
"samples/bpf: " prefix for samples/bpf changes and "bpftool: " for
bpftool's ones? Thanks!

>  include/linux/perf_event.h              |  2 ++
>  kernel/bpf/syscall.c                    |  4 +++-
>  samples/bpf/Makefile                    |  7 ++++---
>  samples/bpf/cookie_uid_helper_example.c | 12 ++++++------
>  samples/bpf/lathist_kern.c              |  2 +-
>  samples/bpf/lwt_len_hist_kern.c         |  2 +-
>  samples/bpf/lwt_len_hist_user.c         |  4 ++--
>  samples/bpf/task_fd_query_user.c        |  2 +-
>  samples/bpf/test_lru_dist.c             |  3 ++-
>  samples/bpf/tracex2_kern.c              |  2 +-
>  samples/bpf/xdpsock_user.c              |  5 +++--
>  tools/bpf/bpftool/tracelog.c            |  2 +-
>  12 files changed, 27 insertions(+), 20 deletions(-)
>
> --
> 2.35.2
>
>
