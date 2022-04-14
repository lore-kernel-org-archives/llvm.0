Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB03234
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 22:47:15 +0000 (UTC)
Date: Thu, 14 Apr 2022 22:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail2; t=1649976433;
	bh=THMmkXXMS2lPNNZpAKvu3GAAetFAVRpTegVE6Ot/KkU=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID;
	b=OXkMtj7iaWudLwGUwWTU7oX0NF7hArQWxhthVlcg3TIgPYTx8RSG42gqGiU0Cve2y
	 BYUA9IRlAcKYpB5XNnNj4k722gX0u+C8vCyNGLg7RNfRkuQHvESq2c5D/kPWDzUDYX
	 A/XxycqH1wvrAZuxlVmH94RVwUOQpoiaEIwfXOhor/M9wvCZfKI2z6k1RuLbsF7P8Q
	 PwsttRM3exP3+TixGhFGgbb4dIM1Y7iyQ+f3v9LpeadgCzMQ+EDKRN71eUoZA+PsFQ
	 DH7TZBmw8kyGraPfnf+/a1OXNifL7FRvUSS78NRqVmrT2SuuXgab8WjmEUww+SeRvE
	 iiARFXOmOeWiw==
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, =?utf-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Alexander Lobakin <alobakin@pm.me>, Dmitrii Dolgov <9erthalion6@gmail.com>, Quentin Monnet <quentin@isovalent.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Chenbo
	Feng <fengc@google.com>, Willem de Bruijn <willemb@google.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Thomas Graf <tgraf@suug.ch>, Ong Boon Leong <boon.leong.ong@intel.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH bpf-next 10/11] samples: bpf: fix -Wsequence-point
Message-ID: <20220414223704.341028-11-alobakin@pm.me>
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

In some libc implementations, CPU_SET() may utilize its first
argument several times. When combined with a post-increment, it
leads to:

samples/bpf/test_lru_dist.c:233:36: warning: operation on 'next_to_try' may=
 be undefined [-Wsequence-point]
  233 |                 CPU_SET(next_to_try++, &cpuset);
      |                                    ^

Split the sentence into two standalone operations to fix this.

Fixes: 5db58faf989f ("bpf: Add tests for the LRU bpf_htab")
Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 samples/bpf/test_lru_dist.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/bpf/test_lru_dist.c b/samples/bpf/test_lru_dist.c
index be98ccb4952f..191643ec501e 100644
--- a/samples/bpf/test_lru_dist.c
+++ b/samples/bpf/test_lru_dist.c
@@ -229,7 +229,8 @@ static int sched_next_online(int pid, int next_to_try)

 =09while (next_to_try < nr_cpus) {
 =09=09CPU_ZERO(&cpuset);
-=09=09CPU_SET(next_to_try++, &cpuset);
+=09=09CPU_SET(next_to_try, &cpuset);
+=09=09next_to_try++;
 =09=09if (!sched_setaffinity(pid, sizeof(cpuset), &cpuset))
 =09=09=09break;
 =09}
--
2.35.2


