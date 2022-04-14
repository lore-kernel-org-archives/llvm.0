Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0713234
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 22:46:24 +0000 (UTC)
Date: Thu, 14 Apr 2022 22:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail2; t=1649976373;
	bh=+DkRIXJc5M3gz3F1I0xigPA/k06QlcMXGhroeUqQePw=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID;
	b=HQiMjgfKOjR3X8TVweXIVyu1t4Gd2yBQvkpZ6YSQzI+fFkGQoNk7nXgVD2uZ4EXNT
	 eo3BJ/Xd/bWnrp/ClkfhLYLMO2GoXnTWE9gvTnCv6qf8ceUb6jJE1+lKhJ1LONCpxy
	 ELnrljzwRInDfLKRtetJn7/Y4YBka9BOd4B5EeDJaDIM+mtxVHHBQO7D/933Hj9Z91
	 Ea7hngMlNPpGn4g4EizCKziBbiPYdnbdv/YiIR7zzgV3hk4zo0v0HEOyUquzjzIO+O
	 8d7ZdZLYnTtFuHzvzi+WsZx8plerCzOqB6eqW30tVoPH8mDFimIu7dBPyyjVb8uYFo
	 4me2Zigwe515w==
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
From: Alexander Lobakin <alobakin@pm.me>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, =?utf-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Alexander Lobakin <alobakin@pm.me>, Dmitrii Dolgov <9erthalion6@gmail.com>, Quentin Monnet <quentin@isovalent.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Chenbo
	Feng <fengc@google.com>, Willem de Bruijn <willemb@google.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Thomas Graf <tgraf@suug.ch>, Ong Boon Leong <boon.leong.ong@intel.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH bpf-next 06/11] tools, bpf: fix fcntl.h include in bpftool
Message-ID: <20220414223704.341028-7-alobakin@pm.me>
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

Fix the following (on some libc implementations):

  CC      tracelog.o
In file included from tracelog.c:12:
include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <=
sys/fcntl.h> to <fcntl.h> [-Wcpp]
    1 | #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
      |  ^~~~~~~

<sys/fcntl.h> is anyway just a wrapper over <fcntl.h> (backcomp
stuff).

Fixes: 30da46b5dc3a ("tools: bpftool: add a command to dump the trace pipe"=
)
Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 tools/bpf/bpftool/tracelog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/tracelog.c b/tools/bpf/bpftool/tracelog.c
index e80a5c79b38f..bf1f02212797 100644
--- a/tools/bpf/bpftool/tracelog.c
+++ b/tools/bpf/bpftool/tracelog.c
@@ -9,7 +9,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <linux/magic.h>
-#include <sys/fcntl.h>
+#include <fcntl.h>
 #include <sys/vfs.h>

 #include "main.h"
--
2.35.2


