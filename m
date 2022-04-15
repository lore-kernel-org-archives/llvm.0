Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F033F4
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91497C385B0
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 23:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650066389;
	bh=LTJf/A8Me12vLOMr5JY1SIon/1xfytx3EclH8+DlUvY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LBZSxeeTHTnhfUzAb394wiHLjDjPcy6kLVK9zRbNdHz7mA1uf3Fgnv1xQAstRgV+d
	 lPFYg6DQsp2l7nbwuMZmQ/97nwSS0PPxnXPPO0+8ebU+guKLBLRCprQ+TO+Zjr090Q
	 ZUEzWNL3YyvA3lwmaRaXfiKf/vfOLZa4eQN+w/1i0Db5gOBAQN1bR3XuGcqt9v9vIX
	 pZkWct2LfHEUTqGZCXPyLJoNxRblsBNAcNmCnJCPXu6wCQ+A+dJ5+rDeXU9MUkaQHY
	 eG4BrBrEVmBhdnNP3yR3tjddyZgEkvRuIN5sz3iHDpsRl7HeFWC2eptCx/DmPweY8z
	 YpBGmaNXEhQhA==
Received: by mail-yb1-f178.google.com with SMTP id t67so16706703ybi.2
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 16:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM533L2kBX3ZK2PhoBBCcnFCSgxl7vCfYof1k1Al3q++jPl8+J7dau
	39C/+LUduLo+M4xifsf+2YNS+dfvXpWR9qw5BcM=
X-Google-Smtp-Source: ABdhPJyWyr2oTV/QYiBZcOp+HRuagV8MwNq7QqnmSyEnbUluuqK77EmsK07wn6ItjGoYFnwvNX0hmFftNOObm3DtmGs=
X-Received: by 2002:a05:6902:1506:b0:63e:4f1b:40ae with SMTP id
 q6-20020a056902150600b0063e4f1b40aemr1446621ybu.322.1650066388578; Fri, 15
 Apr 2022 16:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-7-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-7-alobakin@pm.me>
From: Song Liu <song@kernel.org>
Date: Fri, 15 Apr 2022 16:46:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6JoSHe2B4daYjFrkWYBvGLzq2PZnPs76ceT0iW1h6sMQ@mail.gmail.com>
Message-ID: <CAPhsuW6JoSHe2B4daYjFrkWYBvGLzq2PZnPs76ceT0iW1h6sMQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 06/11] tools, bpf: fix fcntl.h include in bpftool
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

On Thu, Apr 14, 2022 at 3:46 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> Fix the following (on some libc implementations):
>
>   CC      tracelog.o
> In file included from tracelog.c:12:
> include/sys/fcntl.h:1:2: warning: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
>     1 | #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
>       |  ^~~~~~~
>
> <sys/fcntl.h> is anyway just a wrapper over <fcntl.h> (backcomp
> stuff).
>
> Fixes: 30da46b5dc3a ("tools: bpftool: add a command to dump the trace pipe")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  tools/bpf/bpftool/tracelog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/bpf/bpftool/tracelog.c b/tools/bpf/bpftool/tracelog.c
> index e80a5c79b38f..bf1f02212797 100644
> --- a/tools/bpf/bpftool/tracelog.c
> +++ b/tools/bpf/bpftool/tracelog.c
> @@ -9,7 +9,7 @@
>  #include <string.h>
>  #include <unistd.h>
>  #include <linux/magic.h>
> -#include <sys/fcntl.h>
> +#include <fcntl.h>
>  #include <sys/vfs.h>
>
>  #include "main.h"
> --
> 2.35.2
>
>
