Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6EA94B
	for <llvm@lists.linux.dev>; Thu,  9 Feb 2023 22:01:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gr7so10756679ejb.5
        for <llvm@lists.linux.dev>; Thu, 09 Feb 2023 14:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=12EmLmXNPxVlBwqhOstyYyPyvkcnUa7HgYnHDTPPtNE=;
        b=VlJ35ScMfjK5cUQAGBmGVcnTAuHtfwb/ke2H1l8NFfViNicrUGiQh7hbu/EqVgOJ/5
         VLgvb9npmAszqdK3H8E4DdfhEQNHVxHGbCdUO+63RdFECF3TBh7o/6pOOvhxj8EjoQkC
         6zZwCQgwSB9LMqPOgywPSKeefXjNV2A6bwgojpyZ/3k9gBRL870oaTNprn/WE0dwkxKv
         539yOjP8uezXZe8sTutqBHz2ASYxJzRVQ70Ma53irQRAjyW9oS3U3u8orouGlgHFORSi
         iZhfr5++lvrlYhacDuhkF/oVvFyZbilzrTFJGx/SeSvRJUvdh9sdEbv0msMn5/gUsOtP
         IPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12EmLmXNPxVlBwqhOstyYyPyvkcnUa7HgYnHDTPPtNE=;
        b=YBl34N3u2ctsBjEQKUl4AU1U+2JxneeGqTTAZGnCZhR4KYKgWwf7YTt7ZGIG2SOZPZ
         rCzXg5O0MaNciJ37qE3RyjQMUoh2Mt790fMNCEwbkICr3oaP38Scnnkck/i0so91PHOB
         54B9cUvHTJYXXP6OpxvMdx1P96ZYD96znamGH7zCHiIglD+KPNlvFwaNy/uliigijlne
         pzfBhiCQa6kCWZCxEduqApu70RcLTkhKYjGxu0jRfunJED98JCsR8c6surSLg+VxgYHL
         2Qx8bEz/LUVUI1oFCdPiCNsA1RHvu+IRFOgjDKAsrfLYwFpenOTHq+y0PSnqRHCi50PS
         Ne8Q==
X-Gm-Message-State: AO0yUKWTQINvTzHZAwQ/p27yLMUotYjxj/ngYIPCSWJFLpZa5rhf3e+N
	P333zwEMGM7pwZP5QOEnhe98Vw6SbCOxQUh1gpU=
X-Google-Smtp-Source: AK7set+ng9pmkzKqIxaS7qA6X4EwNgcgxsLiahOVc2y/+PRfgUFnkEXjaeRFkczOkKCB8xLLHVP05GF+ZrJsP4YTQ1o=
X-Received: by 2002:a17:906:eb8f:b0:878:786e:8c39 with SMTP id
 mh15-20020a170906eb8f00b00878786e8c39mr2945087ejb.105.1675980086713; Thu, 09
 Feb 2023 14:01:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230209192337.never.690-kees@kernel.org> <CAEf4BzZXrf48wsTP=2H2gkX6T+MM0B45o0WNswi50DQ_B-WG4Q@mail.gmail.com>
 <63e5521a.170a0220.297d7.3a80@mx.google.com> <CAADnVQKsB2n0=hShYpYnTr5yFYRt5MX2QMWo3V9SB9JrM6GhTg@mail.gmail.com>
 <63e561d8.a70a0220.250aa.3eb9@mx.google.com>
In-Reply-To: <63e561d8.a70a0220.250aa.3eb9@mx.google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 9 Feb 2023 14:01:15 -0800
Message-ID: <CAADnVQJed84rqugpNDY2u1r89QEOyAMMKZHLHefX=GRWZ3haoQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: Deprecate "data" member of bpf_lpm_trie_key
To: Kees Cook <keescook@chromium.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Haowen Bai <baihaowen@meizu.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 1:12 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 09, 2023 at 12:50:28PM -0800, Alexei Starovoitov wrote:
> > On Thu, Feb 9, 2023 at 12:05 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Thu, Feb 09, 2023 at 11:52:10AM -0800, Andrii Nakryiko wrote:
> > > > Do we need to add a new type to UAPI at all here? We can make this new
> > > > struct internal to kernel code (e.g. struct bpf_lpm_trie_key_kern) and
> > > > point out that it should match the layout of struct bpf_lpm_trie_key.
> > > > User-space can decide whether to use bpf_lpm_trie_key as-is, or if
> > > > just to ensure their custom struct has the same layout (I see some
> > > > internal users at Meta do just this, just make sure that they have
> > > > __u32 prefixlen as first member).
> > >
> > > The uses outside the kernel seemed numerous enough to justify a new UAPI
> > > struct (samples, selftests, etc). It also paves a single way forward
> > > when the userspace projects start using modern compiler options (e.g.
> > > systemd is usually pretty quick to adopt new features).
> >
> > I don't understand how the new uapi struct bpf_lpm_trie_key_u8 helps.
> > cilium progs and progs/map_ptr_kern.c
> > cannot do s/bpf_lpm_trie_key/bpf_lpm_trie_key_u8/.
> > They will fail to build, so they're stuck with bpf_lpm_trie_key.
>
> Right -- I'm proposing not changing bpf_lpm_trie_key. I'm proposing
> _adding_ bpf_lpm_trie_key_u8 for new users who will be using modern
> compiler options (i.e. where "data[0]" is nonsense).
>
> > Can we do just
> > struct bpf_lpm_trie_key_kern {
> >   __u32   prefixlen;
> >   __u8    data[];
> > };
> > and use it in the kernel?
>
> Yeah, I can do that if that's preferred, but it leaves userspace hanging
> when they eventually trip over this in their code when they enable
> -fstrict-flex-arrays=3 too.
>
> > What is the disadvantage?
>
> It seemed better to give a working example of how to migrate this code.

I understand and agree with intent, but I'm still missing
how you're going to achieve this migration.
bpf_lpm_trie_key_u8 doesn't provide a migration path to cilium progs
and pretty much all bpf progs that use LPM map.
Sure, one can change the user space part, like you did in test_lpm_map.c,
but it doesn't address the full scope.
imo half way is worse than not doing it.
