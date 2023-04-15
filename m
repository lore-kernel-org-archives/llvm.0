Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F4A21
	for <llvm@lists.linux.dev>; Sat, 15 Apr 2023 08:31:43 +0000 (UTC)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0FC803F22F
	for <llvm@lists.linux.dev>; Sat, 15 Apr 2023 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681547496;
	bh=Wx0/JegDs5ydht80NXH/UwxmxbYUu5hxKxJx5a7E6kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=HpqfEn5C9IhKxg6Ssf3iFKsRu9iznJhTdwVvODx6cLELtb/qYI/YQCpqmr9GPR4E3
	 7fnVLLWjHzDgQiW13sC93GerI0iMIiPI5fMPGLXgvEgR2vtQt9RArCt8vi6f3V+Awp
	 TT0P0RwvzQJt9dF2ffx7zueH1RN3m4j5NlPxy/6nE5ufJ3oZCyuSyGcDhEbloSV24C
	 DAcWUH+vIWd6D2qMIo93xr1ExUYoW5QMOi14QgXbmtg4nC4+NjkhRVWy+ATunxNRAZ
	 zs4/R+EJXytnbEjsnRzi8p4sDLlGOUemfpakIC0vm4jFYnrdnhZD7XEpa8C0Q7d6NB
	 jmDJ9w8mMHJAA==
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2a8a9ba55deso969281fa.2
        for <llvm@lists.linux.dev>; Sat, 15 Apr 2023 01:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681547495; x=1684139495;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx0/JegDs5ydht80NXH/UwxmxbYUu5hxKxJx5a7E6kw=;
        b=USBcSVMQhm+IpI0XDQrTLn4ynOeA9/R1mO1Ce/snCgFzqAQOwtPMgAFklHddP0BvEA
         1cfExpn7USG6mbeHRRBbGr6C0u0qq8o8WJ2P1/oD1cXjimJ44EteRGVxEXl0MAFVd3zA
         LZPOr4+fzrsioOPYZalCsQxgR3G+IgzDCXAVgYBLRnHrvglK+vCQbkp5h7xZxmYqHZ1c
         q9W4O1IkwKo11Tie2ijseiHy/3tY1spDBFKvaJU7IBr++jqHz9GlOyOBxS1CFD6C6kU5
         ERw/Zam27/R3bsq8l5qOdPSkLF80NOu2Zx1bKDAopmrvBfBMpNcuvjtL8+fQctiSHrzg
         m5iQ==
X-Gm-Message-State: AAQBX9cjJ/Ze+hqD7ovvRBuajXXZYddRlx5rkD+Enj6Ekgm/M3Bv18Tt
	d4Jrt3/XCe/6VJnwEjWIOBZKeYM04xB6aXgUL6B+xsgHbQ0VmNEw5yW3DiHbVs0MdRm1PCguarh
	z70+HAeQCugyZsmVdXjzObokj5NPRppc=
X-Received: by 2002:a17:907:2d1f:b0:94f:322d:909d with SMTP id gs31-20020a1709072d1f00b0094f322d909dmr9553ejc.63.1681547474682;
        Sat, 15 Apr 2023 01:31:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350bD5nX03JewNoORuQdFHtYzSIEKXUwgdDNHDz4qbxSX6RiDgl4Lw29zLgKKwShLulQpqTQmQQ==
X-Received: by 2002:a17:907:2d1f:b0:94f:322d:909d with SMTP id gs31-20020a1709072d1f00b0094f322d909dmr9518ejc.63.1681547474284;
        Sat, 15 Apr 2023 01:31:14 -0700 (PDT)
Received: from localhost (host-87-18-123-182.retail.telecomitalia.it. [87.18.123.182])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709064a4a00b0094a4e970508sm3491554ejv.57.2023.04.15.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 01:31:13 -0700 (PDT)
Date: Sat, 15 Apr 2023 10:31:13 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Paolo Pisati <paolo.pisati@canonical.com>,
	bpf <bpf@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: ignore pointer types check with clang
Message-ID: <ZDpg0YmXpZFlvmpM@righiandr-XPS-13-7390>
References: <20230412095912.188453-1-andrea.righi@canonical.com>
 <CAADnVQJ00Npkp=+XYaTybzaPnrcfK0nKrePAktVNBt2-YqWdEg@mail.gmail.com>
 <ZDjvZ7mx7+IsSCCO@righiandr-XPS-13-7390>
 <q5rj72tmwlpzx6qgkromem5t7q6xmen52aavfr65olnuv52f3z@wzs4p3xz3635>
 <ZDl/KFLy7wOBa2tj@righiandr-XPS-13-7390>
 <CAADnVQJFxoYqBisj4w_Mm35mf3gR6YTK0QvNjQfVSjfcQK33yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJFxoYqBisj4w_Mm35mf3gR6YTK0QvNjQfVSjfcQK33yw@mail.gmail.com>

On Fri, Apr 14, 2023 at 06:15:41PM -0700, Alexei Starovoitov wrote:
> On Fri, Apr 14, 2023 at 9:28 AM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > On Fri, Apr 14, 2023 at 06:15:38PM +0200, Ilya Leoshkevich wrote:
> > > On Fri, Apr 14, 2023 at 08:15:03AM +0200, Andrea Righi wrote:
> > > > On Thu, Apr 13, 2023 at 09:56:00PM -0700, Alexei Starovoitov wrote:
> > > > > On Wed, Apr 12, 2023 at 2:59 AM Andrea Righi <andrea.righi@canonical.com> wrote:
> > > > > >
> > > > > > Building bpf selftests with clang can trigger errors like the following:
> > > > > >
> > > > > >   CLNG-BPF [test_maps] bpf_iter_netlink.bpf.o
> > > > > > progs/bpf_iter_netlink.c:32:4: error: incompatible pointer types assigning to 'struct sock *' from 'struct sock___17 *' [-Werror,-Wincompatible-pointer-types]
> > > > > >         s = &nlk->sk;
> > > > > >           ^ ~~~~~~~~
> > > > > > 1 error generated.
> > > > >
> > > > > I cannot reproduce this and BPF CI doesn't complain about it either.
> > > > > What kind of clang do you use?
> > > > > Some special version and build flags?
> > > >
> > > > I'm using Ubuntu clang version 15.0.7 (Ubuntu 23.04), no special build
> > > > flag (unless Ubuntu enables some different default flags, but it
> > > > shouldn't be the case... I'll double check).
> > > >
> > > > -Andrea
> > >
> > > Hi,
> > >
> > > FWIW, I see similar errors when I don't use recent pahole.
> >
> > I'm using pahole v1.24.
> 
> I believe Ilya is correct.
> 
> struct sock___17 is likely coming from vmlinux.h
> Which means that there were errors due vmlinux build which
> caused multiple structs to be present in BTF
> and therefore bpftool generated such broken vmlinux.h
> 
> The BTF section in such vmlinux is likely much larger than normal.
> Let's get to the bottom of it instead of masking build error.
> 
> Please try pahole 1.25.

Yay! Success. Everything is working fine with pahole 1.25. Please ignore
my patch, the fix is to simply upgrade pahole.

Thanks!
-Andrea
