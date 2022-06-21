Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93771858
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 16:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681CCC385A2
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655827619;
	bh=WKXmvpKHiXF8HIz4rkJYUYibRv7Uv4uklkh4UR/cIbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bSr7jJh8fhPN8M9KYv0VSDsMGSp579PIxQijlxfDGf0MbiUcagVP7eVDcGWIlEhK/
	 tO+Nl4dz/aFdyCAuFBlaVFWbt7RUoi8G2UG8nztYg1jf1o7q1j64xmfSCeKuEUCBDT
	 Q32QEFuzY46axmZGNyohlyUYhklDNWvp3cSGLby1WDdDGaizXRPllhgUPT282papHw
	 0036tLntbpca+Zqjn6/SlvDuliHCbZKEWYksYKqkfYTVqLvtyOEOVs7Ntu8RRSBKRw
	 2tlZ9FahyjI8fXRbQDOkNUc0tk65Q8Ajjwst7lypv9z9E2E0SXi0HjKxaKNd1vtnME
	 M8ntbG8nW4B8g==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3176b6ed923so135581587b3.11
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 09:06:59 -0700 (PDT)
X-Gm-Message-State: AJIora+KAYkzoKkC6jr9pkmA7t12PW8c0EF33U9pJs2vbZmh/WUqhQ4F
	bphnJiNI86w77An1Cgqk/0IVI2vzAyB2qjWS/C5wVg==
X-Google-Smtp-Source: AGRyM1uOvf2G/HTOk28asJ3XCqY4R29PVP4aYQLAsbfLR43nAQyBCYRC5QUKOEnwEXcrpbTPABYxw24lN9Krc5Q+2tA=
X-Received: by 2002:a0d:f741:0:b0:314:547b:968c with SMTP id
 h62-20020a0df741000000b00314547b968cmr33773024ywf.171.1655827618483; Tue, 21
 Jun 2022 09:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220621012811.2683313-5-kpsingh@kernel.org> <202206211035.p3LxbVfK-lkp@intel.com>
 <CACYkzJ775f+EGSpFiKUXkYdtx5x1mygbGC9P+knqvapio9XUyg@mail.gmail.com> <20220621124115.7daxj2csuyfxfvq5@apollo.legion>
In-Reply-To: <20220621124115.7daxj2csuyfxfvq5@apollo.legion>
From: KP Singh <kpsingh@kernel.org>
Date: Tue, 21 Jun 2022 18:06:46 +0200
X-Gmail-Original-Message-ID: <CACYkzJ5CjOr+i2riupYsxcJToo4k+CpWxUP2W1ACrM06u3Wq=Q@mail.gmail.com>
Message-ID: <CACYkzJ5CjOr+i2riupYsxcJToo4k+CpWxUP2W1ACrM06u3Wq=Q@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 4/5] bpf: Add a bpf_getxattr kfunc
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 2:41 PM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Tue, Jun 21, 2022 at 12:48:08PM IST, KP Singh wrote:
> > On Tue, Jun 21, 2022 at 5:20 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi KP,
> > >
> > > I love your patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on bpf-next/master]
[...]

> >
>
> You can silence this warning using __diag_push, e.g. see kfunc definitions in
> net/netfilter/nf_conntrack_bpf.c.

Thanks, done.

>
> > - KP
> >
> > >
> > > vim +/bpf_getxattr +1185 kernel/trace/bpf_trace.c
> > >
> > >   1184
> > > > 1185  noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
> > >   1186                                       const char *name, void *value, int size)
> > >   1187  {
> > >   1188          return __vfs_getxattr(dentry, inode, name, value, size);
> > >   1189  }
> > >   1190
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp
>
> --
> Kartikeya
