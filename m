Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FD1867
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 17:18:20 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id a127so2187091vsa.3
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E8pbstQIKMU8n6W0382loX5SA213a1sxeL3uH3Qg3JI=;
        b=k3XSeJBNpwXtCKAiE6JPyVsJWnTxJ4iqv54j9tbN8FuaqK46ZMp4gtSFZCjKfonLPE
         R/cnoFlLe7QKfuwRT9aYsfaMsGKOets5M+f+K9PmO09ISJssgjjb52fl+KGPKvKJOdks
         FYpMcjAmjLbc8HeOPo6IiJ1qSx1KwtuP4hStjQ48xQbeH2F/YNOSCVUEwjNItGkzQ2lf
         8WBUkXWJOTK9mXA0qLglRkFXFzxbf1t1YRo3No1Y6xRmw7sEBSY6xxuOuHoOuzHR4Yk3
         e5Z5bS3okR3eq8MWMu5cq91aUu191A6fSfCRx7XiR9Nm4CoAYk+UVlYzPRle/M1JzMJr
         DTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8pbstQIKMU8n6W0382loX5SA213a1sxeL3uH3Qg3JI=;
        b=AF/gzlnB/LNaSgjlPQDg9eIjPO0BjWxPySCFDTVzRv503r9OiJ+g5bAO7SVfTifswf
         q28PUCpCjwaexNxs7TqZNJ1aiQzYfaPNX5xAEisO9JsG8OgvXmZ86x4gf0N0dwmk9QBz
         YMXJt/VEl4mznstcULDvYzZ29EeSiiNlG96WZmCGHT8CpP6cqsczqvggjpa285ZmYtLC
         rPe8Cc8T4DO9rkg7zmc2HKLWXIGd1fjEmP6q5bwROwu5fUKYX6Ln6dEnQKO3NlLRQogg
         xpCkFtQCLlLSpJzqt7WduX7YOiD2fiKvRFvBkNeNyKem47tHtRfDswcMgBDx9gxqrd+I
         ZcwQ==
X-Gm-Message-State: AOAM532SQC/9Zo0mr2GegLiCEOmBerCmDArNu2dWwn4aFKyc+YXZKPWC
	fd6VtrUZa4wiG0Oarx+hvfsPEYh/j3w3mYzvOx4=
X-Google-Smtp-Source: ABdhPJwcuJYCkBW10RtqOqWTejiFdCLoEZrniTSO/MDyY/NMI4lGYtijRlZqeNR9qXFnkLnvS8yvyDGcgoCFEdKHVDY=
X-Received: by 2002:a67:f80b:0:b0:32a:17d6:7fb2 with SMTP id
 l11-20020a67f80b000000b0032a17d67fb2mr6263197vso.40.1650475099231; Wed, 20
 Apr 2022 10:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-9-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-9-alobakin@pm.me>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Apr 2022 10:18:08 -0700
Message-ID: <CAEf4BzZVohaHdCTz_KFVdEus2pndLTZvg=BHfujpgt29qbio3Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 08/11] samples: bpf: fix shifting unsigned long
 by 32 positions
To: Alexander Lobakin <alobakin@pm.me>, Yonghong Song <yhs@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
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

On Thu, Apr 14, 2022 at 3:46 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> On 32 bit systems, shifting an unsigned long by 32 positions
> yields the following warning:
>
> samples/bpf/tracex2_kern.c:60:23: warning: shift count >= width of type [-Wshift-count-overflow]
>         unsigned int hi = v >> 32;
>                             ^  ~~
>

long is always 64-bit in BPF, but I suspect this is due to
samples/bpf/Makefile still using this clang + llc combo, where clang
is called with native target and llc for -target bpf. Not sure if we
are ready to ditch that complicated combination. Yonghong, do we still
need that or can we just use -target bpf in samples/bpf?


> The usual way to avoid this is to shift by 16 two times (see
> upper_32_bits() macro in the kernel). Use it across the BPF sample
> code as well.
>
> Fixes: d822a1926849 ("samples/bpf: Add counting example for kfree_skb() function calls and the write() syscall")
> Fixes: 0fb1170ee68a ("bpf: BPF based latency tracing")
> Fixes: f74599f7c530 ("bpf: Add tests and samples for LWT-BPF")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  samples/bpf/lathist_kern.c      | 2 +-
>  samples/bpf/lwt_len_hist_kern.c | 2 +-
>  samples/bpf/tracex2_kern.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>

[...]
