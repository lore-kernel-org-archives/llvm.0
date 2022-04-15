Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FA833F4
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4762EC385BA
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650064856;
	bh=H5LJwPbVhvyvTjl53a9PdwZH87MlV/bckKSPVid1hFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G4T6wE40lgyvJa3jOlMgxoai6nBzgbMje5k8IcYpW83uNnMLhXURA86/bCqrCIhU9
	 uYztFsyvoZ0hqpMKcJUEfvfdfxAb5e4z1ui4xXYZ+tcNmO0pLfRdVSKo8bXbNUcmK+
	 sW0Oi4SlL5KEWsLmqAyZsNPOQ0H5kbCYHmq4XirCYnXv+t/HGTYaEuBdz4bsiXOSJ6
	 +14QF1NxHMzZSooNcbFNzsMTj9Eld9hG8Vd8z7Fx0AlCpRffAibJ9OYx02VOiodjpk
	 mEhxO+wlljqUz6lib05uSPulr8Xsa9cnHybkfosNHVPtguTDBhsk6osOMV/MeZtQU5
	 orB/w4FGXc+2Q==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2ebd70a4cf5so95601017b3.3
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 16:20:56 -0700 (PDT)
X-Gm-Message-State: AOAM533c488+L2FeiaWy2yTdGbIHqqY2nGfeQlb6p+B1blrxcrFfIiQn
	B0z1Ge9EgAc2wZXmEKEddzkcFyKnFOSj4XEYNyM=
X-Google-Smtp-Source: ABdhPJxkXwLE32cy9vO7zAkTLquRKkeV5Pv4mTYQklMv/2cDtiOUZg+7j4dLOyNKcRICXvJ4LlZHOTfeJlkbxbPWvXc=
X-Received: by 2002:a81:14c8:0:b0:2eb:eb91:d88f with SMTP id
 191-20020a8114c8000000b002ebeb91d88fmr1212396ywu.148.1650064855126; Fri, 15
 Apr 2022 16:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-2-alobakin@pm.me>
 <CAPhsuW7qrH6Fc-MSJSJzS0r_vDzTfHyaaRDGhrTjo9vijQwpWg@mail.gmail.com>
In-Reply-To: <CAPhsuW7qrH6Fc-MSJSJzS0r_vDzTfHyaaRDGhrTjo9vijQwpWg@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 15 Apr 2022 16:20:44 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4SZS9p6OQ0yAaOo_BdNT3HeA4T9pLCCEiazc+HmJBZKQ@mail.gmail.com>
Message-ID: <CAPhsuW4SZS9p6OQ0yAaOo_BdNT3HeA4T9pLCCEiazc+HmJBZKQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 01/11] bpf, perf: fix bpftool compilation with !CONFIG_PERF_EVENTS
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

On Fri, Apr 15, 2022 at 4:07 PM Song Liu <song@kernel.org> wrote:
>
> On Thu, Apr 14, 2022 at 3:45 PM Alexander Lobakin <alobakin@pm.me> wrote:
> >
> > When CONFIG_PERF_EVENTS is not set, struct perf_event remains empty.
> > However, the structure is being used by bpftool indirectly via BTF.
> > This leads to:
> >
> > skeleton/pid_iter.bpf.c:49:30: error: no member named 'bpf_cookie' in 'struct perf_event'
> >         return BPF_CORE_READ(event, bpf_cookie);
> >                ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
> >
> > ...
> >
> > skeleton/pid_iter.bpf.c:49:9: error: returning 'void' from a function with incompatible result type '__u64' (aka 'unsigned long long')
> >         return BPF_CORE_READ(event, bpf_cookie);
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Tools and samples can't use any CONFIG_ definitions, so the fields
> > used there should always be present.
> > Move CONFIG_BPF_SYSCALL block out of the CONFIG_PERF_EVENTS block
> > to make it available unconditionally.
> >
> > Fixes: cbdaf71f7e65 ("bpftool: Add bpf_cookie to link output")
> > Signed-off-by: Alexander Lobakin <alobakin@pm.me>
>
> While I can't think of a real failure with this approach, it does feel
> weird to me. Can we fix this with bpf_core_field_exists()?

Hmm.. the error happens at compile time, so I guess it is not very easy.

Andrii,
Do you have some recommendation on this?

Song
