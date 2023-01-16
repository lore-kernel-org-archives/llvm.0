Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C0290B
	for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 22:49:46 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id i23so3164919ual.13
        for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 14:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0IEpt49/65E0wGkbn3RYoaG0iQiOmclklQOb+UN4RXU=;
        b=kVs7w+0I28gjlBzuI/gIhfx+so8q2yysPSVzIWrNOGS9rqKYUMOU/8QVCBdFk3JBoW
         LqofLbwAC8DQpo0ItS0cDQNjxA/Q9qrX0YNuFVBWfUEM7PhL3HvxR1zdwzXLI1Sjxqhl
         uCPTIlucAzxhKmTP666Nh90oD+1B7ndvd1tjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IEpt49/65E0wGkbn3RYoaG0iQiOmclklQOb+UN4RXU=;
        b=1ffyI3XmWKLZ/+P2hsZOQpgpE4vYcksQ5SeUCM+ZOfaKQ4ZsD9kMcDHDcv8rgiAccX
         W2CWzOwKBcewK7Bh+zxTP1aj43FAIFinp0TCGpxCeVpqz1OKNkqLzy6/9P5uah8uTJ2T
         kqBa/2WBx/4MWW9lGYXocESnXJ6eyLEjMvqMCgAuXnB7kvtkniqQwabtXw8r3DkfUzPh
         CmlkdZPlyaG2CIoPs7bXIZzNdbeGWpAW1rg54lbkNrtDnjZyM+WlgA1jdnB5esQifL9J
         iyLGNLEQQ7ncJqgklOp+9eo0Fi/ko5FdkA71CIdZsthH7Px06XhpLI5gQhOjpmJBJK7B
         0bWQ==
X-Gm-Message-State: AFqh2koNVtqGUI7gAXZVVLmp4PWS3fuOllYkjNF47JFHxLp/kON79Pl5
	funodlqfzJ4QP32gs5XV/LgdvLOGwGWylWgiNflwog==
X-Google-Smtp-Source: AMrXdXtwfbujXEmrpHh1D8hu3UQ2BUu4tyjxDDaOO6XcpcdIsuLMlwUgNRJxCrVjED8qrBxFxcawcPiPC4YFDJP+sKM=
X-Received: by 2002:a9f:37c5:0:b0:60a:bb33:8267 with SMTP id
 q63-20020a9f37c5000000b0060abb338267mr48403uaq.47.1673909385284; Mon, 16 Jan
 2023 14:49:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230114-bpf-v1-1-f836695a8b62@pefoley.com> <cb03b745-26b8-706c-de40-80ae991e29fd@isovalent.com>
 <194f38f2dc7d521375e5a660baaf1be31536be9a.camel@gmail.com>
In-Reply-To: <194f38f2dc7d521375e5a660baaf1be31536be9a.camel@gmail.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Mon, 16 Jan 2023 14:49:34 -0800
Message-ID: <CAOFdcFOgAH1z7EKyM=Q4EvzLuKETOWWDMwuqp36SxV-X6PGP5Q@mail.gmail.com>
Subject: Re: [PATCH] tools: bpf: Disable stack protector
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Quentin Monnet <quentin@isovalent.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 4:59 AM Eduard Zingerman <eddyz87@gmail.com> wrote:
>
> A bit tangential, but since BPF LLVM backend does not support the
> stack protector (should it?) there is also an option to adjust LLVM
> to avoid this instrumentation, WDYT?
>

That would probably be worth doing, yes.
But given that won't help already released versions of clang, it
should probably happen in addition to this patch.
