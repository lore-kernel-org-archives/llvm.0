Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDA1867
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 17:14:58 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id i27so1107528vkr.5
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d76SzSLsBTkFqFFguIDMrMvNHnCvFYILc5XiPKskwYo=;
        b=Gju+6I2rCSYu423lBeSyL0oV5n9GSgLkcJh4F2N6s0OI6R11yXpVW3Lvg5ysdv8Ka+
         HH563Lr1r3cjei21MPMfIeUe1ngDm9GNnlgGaRzjS57S4/T4EwLCjP/1zQfsjmnMG6sH
         /cv+/+MR9RxgVL+5WwO4iT8lHYIz5t4YwNMTAga5Wu0/xX6Dlw28CANZIGfH82hcaoC1
         zOAMpZ+kO7DEPK9sPDTrAhoGQrELT9mP8tlq5zbmtoIa75nxxt3qdgnOROc2dz5/Cj2w
         hEqq3pN5wlD5eQcXJB76l/sZbv2x3uEJcoAZeKA+hhltTm3In7Th887jdy4rIvz0GU7Y
         lSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d76SzSLsBTkFqFFguIDMrMvNHnCvFYILc5XiPKskwYo=;
        b=wuFQVgU0kSiifcddENrvhe6gKY1LDNT0sP23b5HpV8OHgjL5sQR7HiUcMNskP/H6pi
         aA7s7gzJW4aAN1/rgYQstpVJQJjBDiZwpQtwLsOUXDL9oQX0zrWr3TUQnzYfVBjBDJTl
         rElGHmrDky5hoo6RK/agohhlxNP2Z0HqXlZDTqbcBi0b2IEIQXRY/bV3j/Vc5qavnzPx
         zQiD7qs/0Qq+t/374Ts3jtjjRDmU1++7pOMR0LXbR9IHDnZIA75KkYqyUxK45GLcyKPn
         KKfiQZuoxLOOYg15Je4f1ix2KhY43eoYKFmoVyHcgNgHlKZr+2BKZfB3s0O+3QQ12yUD
         zajQ==
X-Gm-Message-State: AOAM5312A4NwfG+bxjujqGbcKEcs9Gy7EKbDFWnJAbuAqMZfRCj8PjFN
	13mvy/kf0gej+RLGMk2L1JNfJQFruI9dH79ZpMA=
X-Google-Smtp-Source: ABdhPJzCk1CPND/tmyjLwT0j9L9ckm9gszTVGpOnR/dZfdzYIBae1hLXue47DPEDB9+arzUsxUO71KIhbqhPk7K3OvI=
X-Received: by 2002:ac5:cd88:0:b0:32c:5497:6995 with SMTP id
 i8-20020ac5cd88000000b0032c54976995mr6271589vka.33.1650474897363; Wed, 20 Apr
 2022 10:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220414223704.341028-1-alobakin@pm.me> <20220414223704.341028-8-alobakin@pm.me>
In-Reply-To: <20220414223704.341028-8-alobakin@pm.me>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Apr 2022 10:14:46 -0700
Message-ID: <CAEf4BzZZ7Hxg4XgTTF4m=wG6aMZi88WMXrMgV3_4rs0FPugrtA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 07/11] samples: bpf: fix uin64_t format literals
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

On Thu, Apr 14, 2022 at 3:46 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> There's a couple places where uin64_t is being passed as an %ld
> format argument, which is incorrect (should be %lld). Fix them.

It depends on architecture, on some it will be %lu, on some it will be
%llu. But instead of PRIu64, just cast it to size_t and use %zu as
formatter

>
> Fixes: 51570a5ab2b7 ("A Sample of using socket cookie and uid for traffic monitoring")
> Fixes: 00f660eaf378 ("Sample program using SO_COOKIE")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  samples/bpf/cookie_uid_helper_example.c | 12 ++++++------
>  samples/bpf/lwt_len_hist_user.c         |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
>

[...]
