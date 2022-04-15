Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09633F4
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35186C385AE
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650065093;
	bh=ve8zcTJK3ne1EGkyC8vWulpuyQc5Xh6ZoQ+EsFt9Deo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f8MNQheziBEXQrO0FxkqhOwkyp/nfmv5VcI4MCAXbtxdywRrg4Ok8nWhPn7wnT4oV
	 26uaqET1A13eL0c9fwo6GD4/3E9bDIC+UNd9r0LRGbHfZFieNHO9c9Sjx8unQMLC/B
	 RJzlVMWW6Q+LMn4uXY0lXXd0xDM/7AG9fsf7NxG7MdOpr+dJmdU7s9vT67drUqHt2n
	 tKxC1kfAcoPvCBqZFnjQDPWv+L5diPtMUG0ASR2oGSCytsKVHR5Ag5fEnRR1jlcbjt
	 Dvx7A0V6tFZEtxwnuBazxUbSi2L1vVGNJ2Y1Kv91zDp7oIDOm4dv/5FAVL/u29w0Mk
	 5Pveg8OiZwA0Q==
Received: by mail-yb1-f181.google.com with SMTP id q19so16618850ybd.6
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 16:24:53 -0700 (PDT)
X-Gm-Message-State: AOAM530jKisuPtfU4sD7GXdCw3sHce2AOSsEDOQgG5YdWcOGHQff47Z1
	ppWccoyRciDi5/FCVUfogOI+g2x5/X4jT/hhHLg=
X-Google-Smtp-Source: ABdhPJy7qY8jdimtSi+WscUV67jjwPF27xZeL7M2caaxM31nPgf3vJcWAjTfoqUC0w9w5k4HE68MfI3InHS6lHUjQn8=
X-Received: by 2002:a05:6902:1506:b0:63e:4f1b:40ae with SMTP id
 q6-20020a056902150600b0063e4f1b40aemr1399464ybu.322.1650065092238; Fri, 15
 Apr 2022 16:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-3-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-3-alobakin@pm.me>
From: Song Liu <song@kernel.org>
Date: Fri, 15 Apr 2022 16:24:41 -0700
X-Gmail-Original-Message-ID: <CAPhsuW42Sv2EkMzVoh2+i=2NN2yMRHOqDN8wmXGPax2-cz8ynA@mail.gmail.com>
Message-ID: <CAPhsuW42Sv2EkMzVoh2+i=2NN2yMRHOqDN8wmXGPax2-cz8ynA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 02/11] bpf: always emit struct bpf_perf_link BTF
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
> When building bpftool with !CONFIG_PERF_EVENTS:
>
> skeleton/pid_iter.bpf.c:47:14: error: incomplete definition of type 'struct bpf_perf_link'
>         perf_link = container_of(link, struct bpf_perf_link, link);
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tools/bpf/bpftool/bootstrap/libbpf/include/bpf/bpf_helpers.h:74:22: note: expanded from macro 'container_of'
>                 ((type *)(__mptr - offsetof(type, member)));    \
>                                    ^~~~~~~~~~~~~~~~~~~~~~
> tools/bpf/bpftool/bootstrap/libbpf/include/bpf/bpf_helpers.h:68:60: note: expanded from macro 'offsetof'
>  #define offsetof(TYPE, MEMBER)  ((unsigned long)&((TYPE *)0)->MEMBER)
>                                                   ~~~~~~~~~~~^
> skeleton/pid_iter.bpf.c:44:9: note: forward declaration of 'struct bpf_perf_link'
>         struct bpf_perf_link *perf_link;
>                ^
>
> &bpf_perf_link is being defined and used only under the ifdef.
> Move it out of the block and explicitly emit a BTF to fix
> compilation.
>
> Fixes: cbdaf71f7e65 ("bpftool: Add bpf_cookie to link output")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Similar to v1, this fix is weird to me. I hope we have can fix it in user
space.
