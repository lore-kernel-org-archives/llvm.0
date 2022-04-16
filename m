Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DF2580
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 17:50:52 +0000 (UTC)
Date: Sat, 16 Apr 2022 17:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail2; t=1650131444;
	bh=dUBVYxJ9KjFGdWAPZ3BpuTxFmDw0xhV4VjL0SW5G2Cs=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID;
	b=amXLMAutJGPxMzbDaeGMyXFJX9zlX6dkXXT2t9TYkA46iUHC/JG9DfVb84E1JOr3v
	 5i7k7LSd6DCTZ9xQKZwi5NNgJfHv/MWn3SPTSbUKs5djHd6HpB83Jpha6uCFBEKI2S
	 ooJYv4Nu0+mGX154G/bDnvnCNY35Fs70h23GR1G3Q9iqkEV/9dfNmBjoz+J4sVs0EG
	 R3cAIWN/RYxouBCKNFFiV+kSnSqMug8na3JtHvmg/YEO5OSMTeVOeAAiKi/TnqiBIW
	 0lZthWkwvsFWIICVz4tefCNwyM0eB0/EOg5Tzqc/tR+5qvYDOiUyacvmPEMLFeeF5Q
	 1/fmwoe9vwpLw==
To: Song Liu <song@kernel.org>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Alexander Lobakin <alobakin@pm.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, =?utf-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Dmitrii Dolgov <9erthalion6@gmail.com>, Quentin Monnet
	<quentin@isovalent.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Chenbo Feng <fengc@google.com>, Willem de Bruijn <willemb@google.com>, Thomas Graf <tgraf@suug.ch>, Ong Boon Leong <boon.leong.ong@intel.com>, linux-perf-users@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, llvm@lists.linux.dev
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH bpf-next 02/11] bpf: always emit struct bpf_perf_link BTF
Message-ID: <20220416174330.195496-1-alobakin@pm.me>
In-Reply-To: <CAPhsuW42Sv2EkMzVoh2+i=2NN2yMRHOqDN8wmXGPax2-cz8ynA@mail.gmail.com>
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-3-alobakin@pm.me> <CAPhsuW42Sv2EkMzVoh2+i=2NN2yMRHOqDN8wmXGPax2-cz8ynA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Song Liu <song@kernel.org>
Date: Fri, 15 Apr 2022 16:24:41 -0700

> On Thu, Apr 14, 2022 at 3:45 PM Alexander Lobakin <alobakin@pm.me> wrote:
> >
> > When building bpftool with !CONFIG_PERF_EVENTS:
> >
> > skeleton/pid_iter.bpf.c:47:14: error: incomplete definition of type 'st=
ruct bpf_perf_link'
> >         perf_link =3D container_of(link, struct bpf_perf_link, link);
> >                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > tools/bpf/bpftool/bootstrap/libbpf/include/bpf/bpf_helpers.h:74:22: not=
e: expanded from macro 'container_of'
> >                 ((type *)(__mptr - offsetof(type, member)));    \
> >                                    ^~~~~~~~~~~~~~~~~~~~~~
> > tools/bpf/bpftool/bootstrap/libbpf/include/bpf/bpf_helpers.h:68:60: not=
e: expanded from macro 'offsetof'
> >  #define offsetof(TYPE, MEMBER)  ((unsigned long)&((TYPE *)0)->MEMBER)
> >                                                   ~~~~~~~~~~~^
> > skeleton/pid_iter.bpf.c:44:9: note: forward declaration of 'struct bpf_=
perf_link'
> >         struct bpf_perf_link *perf_link;
> >                ^
> >
> > &bpf_perf_link is being defined and used only under the ifdef.
> > Move it out of the block and explicitly emit a BTF to fix
> > compilation.
> >
> > Fixes: cbdaf71f7e65 ("bpftool: Add bpf_cookie to link output")
> > Signed-off-by: Alexander Lobakin <alobakin@pm.me>
>
> Similar to v1, this fix is weird to me. I hope we have can fix it in user
> space.

I've been thinking on this, but userspace is not provided with any
autoconf.h definitions (only selftests have them), so its code must
be sort of universal.
Both this and 01/11 are compile time and due to imcomplete and/or
absent BTF struct declarations. I'm not familiar with
bpf_core_field_exists(), and it might be that it's able to solve
01/11, but not this one. &bpf_perf_link must be present
unconditionally, otherwise it won't be defined in the generated
vmlinux.h at all.

Thanks,
Al

