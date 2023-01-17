Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64F1FA7
	for <llvm@lists.linux.dev>; Tue, 17 Jan 2023 07:09:13 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id t10so20696719vsr.3
        for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 23:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iw9KmqXhQAK464aHwakno69xYQNB+Zg+iX2cv1NWImM=;
        b=hGb6/ZwlYS4Z4sYL4sdBPzJBB1kEeESnRfHAzm9pTHGbUux8nTYlBo+Kqp2G23KdBS
         /WqjngEvKDZ+CUXpwC5QLqF7ChP2yqAMU/RjcxQCK+nm+/YAhCZYb3nJa+LzMDzF30Ui
         LLq5LkF50pnavsFQzNqzIv8Jl6SrbRqYhN7gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iw9KmqXhQAK464aHwakno69xYQNB+Zg+iX2cv1NWImM=;
        b=aKG8BgXrHKPtRJDRn4A59bSW4shpZnu4PL3SsFhq7j7f2lKtcpUV/DNV3yC1Gt2apI
         IcpF9yQM4Hx29ScaVUYWIDe1++kCC1A892MFKAWIXcBllfcX6WKKE9svbYLRZTAeA0Bv
         +6c+zvWUAg9OkjbSS5WYc2y3+tj/qeg4LU3Hqcaf0FQazav/5zQZzdA5gelz2XGugs2j
         tQzuB4HZ9fqiJtWyp5GtGsmympPYgYSeu3ujGQxF/2FrW68zpA/rImzjBdVnoqQtn1XK
         3XisjdxtLYiqo1Bj5LTYB+3Ehh0jqeqvwnkLzMhCieUvGvqofT56fo+mjW5B7mPdGHFC
         7udg==
X-Gm-Message-State: AFqh2krYLjc+sFKUn/PCg7KgMJE0QYe8WxL62Lry4ci03XgukogUSdtq
	3KnTPq73ypTIhNIPijXscvmQoQ9tpD4uriVRnnZMXA==
X-Google-Smtp-Source: AMrXdXuznbTWfKXHBoqIxnpdKiYSTwB8VxhxTRxnELjfH+dgvQFQXM/KyS8aB9RwhLIYscJ1Hq3DdNGeM8INU2lrDUE=
X-Received: by 2002:a67:e9ca:0:b0:3d3:d06a:3229 with SMTP id
 q10-20020a67e9ca000000b003d3d06a3229mr213632vso.28.1673939351950; Mon, 16 Jan
 2023 23:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230114-bpf-v1-1-f836695a8b62@pefoley.com> <cb03b745-26b8-706c-de40-80ae991e29fd@isovalent.com>
 <194f38f2dc7d521375e5a660baaf1be31536be9a.camel@gmail.com>
 <CAOFdcFOgAH1z7EKyM=Q4EvzLuKETOWWDMwuqp36SxV-X6PGP5Q@mail.gmail.com> <1135125e-6b8a-7b75-5f0b-3208f6b6e8ae@meta.com>
In-Reply-To: <1135125e-6b8a-7b75-5f0b-3208f6b6e8ae@meta.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Mon, 16 Jan 2023 23:09:01 -0800
Message-ID: <CAOFdcFPnHEc2qd-=C+hdK4nTjJfbHsf4r-G7pdJTRBAT6MuOzg@mail.gmail.com>
Subject: Re: [PATCH] tools: bpf: Disable stack protector
To: Yonghong Song <yhs@meta.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Quentin Monnet <quentin@isovalent.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	"Jose E. Marchesi" <jose.marchesi@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 11:05 PM Yonghong Song <yhs@meta.com> wrote:
>
> If I understand correctly (by inspecting clang code), the stack
> protector is off by default. Do you have link to Gentoo build
> page to show how they enable stack protector? cmake config or
> a private patch?
>
The relevant override appears to be
https://github.com/gentoo/gentoo/blob/c5247250e9d4a09e67a602965a5f72be3cebbf34/sys-devel/clang-common/clang-common-15.0.7.ebuild#L93
