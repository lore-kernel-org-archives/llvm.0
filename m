Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA42C9E
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 03:35:32 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id e136so37108863ybc.4
        for <llvm@lists.linux.dev>; Mon, 06 Dec 2021 19:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VhnVwEWLdblOjr90EMEMGhUapGYQEMmVHRRWBGP+yjw=;
        b=KOwS4EtQuhp4PrM6HVNezG+TT+Q7knK5h5qA8nxKdQhj06qYbByS10l4IPBnwjo7N5
         h4UUzStinEkO6vAssGrKkDO3/PMGKcYJx3M+8lKnR9PwpyuJjOkiBQNEGJhsAh5rvvVH
         i7DHd3dBpTLNwLcJTi32jDw/4iycLdQh+Vzc0+eNvqCCcIFx7IM2NuWAUlgrJ3NPwpMc
         KA5qlBJtwsRvyxQZXB3x3XXaLXEvQgfyQCqm+FbNJOglEkMvjVI+zmQD4Qcmt4Z3I20j
         3rivXIFNbdxxdZcF27goiZk89ezC0WTkdhwsIZSDzqWCq6BB0K+FN5ALDNxN7Ln77BWe
         rzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhnVwEWLdblOjr90EMEMGhUapGYQEMmVHRRWBGP+yjw=;
        b=PzZAZavbOrhSY0ZuDLOrvtF1U40Ax7wwS71ZjrblxnLvGkeWDUBVWcSVYPY0lpql2Z
         WdZEvEV/RCqhk3Bx1T57ZpiuqUHibCQgHrob96ssBrETwPp1xzdnpdqQ69ZgrqlpCMna
         dqAfd3QmJGady1w6IW6PHCf7Jg0uOvwliKJPOop/a6WBuPaxcrJVN91zjCAo7kCjf500
         EOUSLQ2khd2GCGDy3PJWtV4L/PtcXahcZd7HNP1STLixSSkM+R7DV0k2hY4NAdpgV6Nc
         pyqIGrzZvLSyPIdErhhZz+0IjDxK8waRROM4wIPRjKlDT+7b3A5xaEKQx5L4YdiowHdb
         91sQ==
X-Gm-Message-State: AOAM531UC3EyTuXg60kwHMxog/EE+mEAp+72V6UnH+OnGUvay/jmXqfw
	NwLEmQl2qrd9JnYHqyCvz6LWqISGMtVeNoHurtA=
X-Google-Smtp-Source: ABdhPJynZCr7m7alFn9eEw0KlD0b7XnSu9eeqFbyzTLyGtGWoaVXfKduwnIJx828coovBV12MA4M5c6d7qqK6rXsO1o=
X-Received: by 2002:a25:84c1:: with SMTP id x1mr48226892ybm.690.1638848131288;
 Mon, 06 Dec 2021 19:35:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211203195004.5803-1-alexandr.lobakin@intel.com>
In-Reply-To: <20211203195004.5803-1-alexandr.lobakin@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 6 Dec 2021 19:35:20 -0800
Message-ID: <CAEf4BzZLt_ojTAf-=1nO2R7F8ROUwBdUsfp_W9NaAk-XSNEYmA@mail.gmail.com>
Subject: Re: [PATCH bpf 0/2] samples: bpf: fix build issues with Clang/LLVM
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Networking <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 11:55 AM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> Samples, at least XDP ones, can be built only with the compiler used
> to build the kernel itself.
> However, XDP sample infra introduced in Aug'21 was probably tested
> with GCC/Binutils only as it's not really compilable for now with
> Clang/LLVM.
> These two are trivial fixes addressing this.
>
> Alexander Lobakin (2):
>   samples: bpf: fix xdp_sample_user.o linking with Clang
>   samples: bpf: fix 'unknown warning group' build warning on Clang
>

There were conflicts when applying, but luckily I was the one who
caused this conflict in XDP_SAMPLE_CFLAGS, so I just fixed it up
locally and pushed to bpf-next. Thanks.

>  samples/bpf/Makefile          | 5 +++++
>  samples/bpf/Makefile.target   | 2 +-
>  samples/bpf/xdp_sample_user.h | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> --
> 2.33.1
>
