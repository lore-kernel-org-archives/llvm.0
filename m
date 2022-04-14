Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A573234
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 23:01:31 +0000 (UTC)
Date: Thu, 14 Apr 2022 22:44:48 +0000
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TkUjN83L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail2; t=1649976293;
	bh=m39CgK5yAeTLeYnreGilY1UHwXX8icQa6tZk1rsB5Sc=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID;
	b=TkUjN83LOR7KPiP6/BtDcJy9T5A0SCRrwKRt1UzFAetbS3c2v+4YvxILXankuuXKA
	 4HY05YFja8QYjbogtEz/s3wWHsySjkzwMmMmTQe/GZkAKHlTVVzgr2BOFKMUlYdunH
	 rlfQ0yZrJiUMxNdi/r5H9DIqgAc5zLN8ybeswQmgTg7NUzgVx050NOn/FYpLVcfwaf
	 POZh9VZIGI9C+ZjD+HeOg87Gpvtxhol39CYLQ9cTVYgA+ymIpw0NTL02KXjOxWRu3j
	 V2oO+f4NaEvXJWVWqIMY7N935zYLBKulFFf/y0Q9/PDR1Pc6f/JDUGJcRR8dSV0C9U
	 bTqx92pK+L0rg==
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, =?utf-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Alexander Lobakin <alobakin@pm.me>, Dmitrii Dolgov <9erthalion6@gmail.com>, Quentin Monnet <quentin@isovalent.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Chenbo
	Feng <fengc@google.com>, Willem de Bruijn <willemb@google.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Thomas Graf <tgraf@suug.ch>, Ong Boon Leong <boon.leong.ong@intel.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH bpf-next 01/11] bpf, perf: fix bpftool compilation with !CONFIG_PERF_EVENTS
Message-ID: <20220414223704.341028-2-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-1-alobakin@pm.me>
References: <20220414223704.341028-1-alobakin@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When CONFIG_PERF_EVENTS is not set, struct perf_event remains empty.
However, the structure is being used by bpftool indirectly via BTF.
This leads to:

skeleton/pid_iter.bpf.c:49:30: error: no member named 'bpf_cookie' in 'stru=
ct perf_event'
        return BPF_CORE_READ(event, bpf_cookie);
               ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~

...

skeleton/pid_iter.bpf.c:49:9: error: returning 'void' from a function with =
incompatible result type '__u64' (aka 'unsigned long long')
        return BPF_CORE_READ(event, bpf_cookie);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tools and samples can't use any CONFIG_ definitions, so the fields
used there should always be present.
Move CONFIG_BPF_SYSCALL block out of the CONFIG_PERF_EVENTS block
to make it available unconditionally.

Fixes: cbdaf71f7e65 ("bpftool: Add bpf_cookie to link output")
Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 include/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index af97dd427501..b1d5715b8b34 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -762,12 +762,14 @@ struct perf_event {
 =09u64=09=09=09=09(*clock)(void);
 =09perf_overflow_handler_t=09=09overflow_handler;
 =09void=09=09=09=09*overflow_handler_context;
+#endif /* CONFIG_PERF_EVENTS */
 #ifdef CONFIG_BPF_SYSCALL
 =09perf_overflow_handler_t=09=09orig_overflow_handler;
 =09struct bpf_prog=09=09=09*prog;
 =09u64=09=09=09=09bpf_cookie;
 #endif

+#ifdef CONFIG_PERF_EVENTS
 #ifdef CONFIG_EVENT_TRACING
 =09struct trace_event_call=09=09*tp_event;
 =09struct event_filter=09=09*filter;
--
2.35.2


