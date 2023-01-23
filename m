Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E77E6
	for <llvm@lists.linux.dev>; Mon, 23 Jan 2023 04:28:28 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id g12so2593416uae.6
        for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 20:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vjjHK/TOmoBm6O8k+2N7BkktCx3pSWAVz7qW+oPVNVE=;
        b=hPpsuvAwLZh1RRCrs7FTPeEjeZ1bFN6J74cr1RlkEBHsUWLp1jcyckOkVISwJOsUJd
         ocwNmh7jSMAxjyZr95W33Vdo0HkqHvnUYFOqLpAwJBZASXSAMVc+L8dHPjYvGMrJac7t
         hGiweTAlxha7IXjucOyG1O4TnBDS1rqatTJ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjjHK/TOmoBm6O8k+2N7BkktCx3pSWAVz7qW+oPVNVE=;
        b=xYGOU7jZmq261MAKF/rBBsPVuVBvvtQXwTNzrxts1FcJhfTvA5jtbnn17yfVIHPhgq
         WB4U8XVUPkl/P0Zz3YaILhPjyNJqndePVsFHZ4pymCmumbwoVCpwZCQS5iQy8jLLUXQO
         DoWU9Pzu1Uj1UtrjV8x7Y5JhM7Ydsdx//meEROXzBVlQJ1hG/ZrppBWwvcWXRz4FLRnq
         n/CwN1UzRtEZyCf2OLrkwyiesPfvPalbEviVnFhT/51bAQaZbs83XR3qCg028hnuZ7M4
         XkkEw5vFQVNvgmSgBMRW5DaGXk+5OrdOXE4/i+CCl/2H+iFKXdq3tB8Bz+McwTxsCnqT
         7/ZA==
X-Gm-Message-State: AFqh2kqc+zYDM6Ih9SSTt9s8/hBJ7lE5q/fU2U3r2LMXczzIjU6r9MIC
	fy7TRf7BWi7lLxru6bt2p7/9+bHvRnOxatm7K08hPQ==
X-Google-Smtp-Source: AMrXdXsdoh8iqfsdbvQAPcLKMxmJ8Wx/zLXGK4/3eZvXbxxCNwT+oiDSGJknhi0DYvFAGaxJ3CyQrZHmh0JrQHnX4I0=
X-Received: by 2002:ab0:1427:0:b0:5f7:89e9:d714 with SMTP id
 b36-20020ab01427000000b005f789e9d714mr2463881uae.0.1674448107340; Sun, 22 Jan
 2023 20:28:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230114-bpf-v1-1-f836695a8b62@pefoley.com> <701abf4bbf5b7957a24d2f164c643e1d9f586fad.camel@gmail.com>
 <4dc6a571-8564-b38c-31df-0d9741dfc592@meta.com>
In-Reply-To: <4dc6a571-8564-b38c-31df-0d9741dfc592@meta.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Sun, 22 Jan 2023 20:28:15 -0800
Message-ID: <CAOFdcFOh_rNt3pfkNHPPeK=Kojro==Kpgmmu-VnLuaMYfFoiwg@mail.gmail.com>
Subject: Re: [PATCH] tools: bpf: Disable stack protector
To: Yonghong Song <yhs@meta.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Quentin Monnet <quentin@isovalent.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 11:34 PM Yonghong Song <yhs@meta.com> wrote:
> On 1/18/23 11:28 AM, Eduard Zingerman wrote:
> >
> > While working on clang patch to disable stack protector
> > for BPF target I've noticed that there is an option to
> > disable default configuration file altogether [1]:
> >
> >    --no-default-config
> >
> > Should we consider it instead of -fno-stack-protector
> > to shield ourselves from any potential distro-specific
> > changes?
>
> Peter, could you help check whether adding --no-default-config works
> in your environment or not?
>
> >
> > [1] https://clang.llvm.org/docs/ClangCommandLineReference.html#cmdoption-clang-no-default-config

I guess I could, but I'm not convinced that's the right thing to do.
Ideally problems with distro-specific configs would cause loud
failures (like this one) and result in fixes like the changes being
made to upstream clang/gcc.
Simply unconditionally disabling distro configs seems to be the wrong
way to approach this and makes it less likely that future problems
will be reported in the first place.
