Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D6290B
	for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 22:53:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bk15so13793510ejb.9
        for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=USWxWFA5v5RQ4g1w5jR/fk1KNbzmnZEodvDSAMOXB6k=;
        b=Qb2K25jq7TjzdjPoE45+9PpWEFdxqtknTJ+dBxc5pQDklQF1KLGezYs4BsfXwjyUTV
         +HzuBHNziCQjipYRUfyIWUTkPvMqWz+OsRVrmNkGJPO8wok6y3kvPWcmLKmyx0r+S8hX
         5zAZRcaZYvx0VhxKrg7HamovnitHMcNJ1g/TSpsN0M05wgXHqud/Tq+ERPvcUsUB1bD+
         Mok0a8jOs9aylRNICEaSt4le+5/DuAIr2f5g3VYk4wYlfnR3Xil5vD+ercvMtqQ+rCdY
         l6YGNdTo1DmXyw+jdyOvDAYvnMYh+NvAEk730ca3lerPQekM8s3/Z0maOc0cysCv3Xfr
         qppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USWxWFA5v5RQ4g1w5jR/fk1KNbzmnZEodvDSAMOXB6k=;
        b=GQPs7BQTS5YuXPVdjyYELzj/fgwsQnnypAe0Jm9gNZJZugot1QFil8Hbw8cVyVTQh7
         GZHqzCJCRxLEJxwr1oKBJTMekKsRAQI/EDt42sqj/YOUwPjdBJZ+9HyuE5otJLlmmir5
         63cnUB7SIDSRwzX2McG8AJymqJjU2PouBzmNpXw3Dm0RK8GcoEySQf8E6w790ggBpLWP
         QMBZ0QYzTJxbAIrSVJdkzbXNO7hpo/P2IU7JuqIL5TFQlKHy3TEHd6sEN3l0QBdEFQ0H
         NC4uG/LKUtIzXc956jTZZ+kDXnQLs3sqwAtM4TDp9xK8zl9doXTBoAH4aQxgx95sYoC0
         qEOw==
X-Gm-Message-State: AFqh2krXmNl0xufd3gP+GznmpAjL6K9EnD4/UlhQ/6u4/E+r49AXJrPJ
	+pofgrq3YZbfWUAbx5cMEgw=
X-Google-Smtp-Source: AMrXdXsrxKuyx8GSa5FEU6+25Vl8kCkbrM1Z1NApYTd+DqFQnBlP0WjMLK6l8JQLcYQmj+K6AvY3yw==
X-Received: by 2002:a17:906:a146:b0:86b:1ccc:d42f with SMTP id bu6-20020a170906a14600b0086b1cccd42fmr584511ejb.61.1673909603251;
        Mon, 16 Jan 2023 14:53:23 -0800 (PST)
Received: from [192.168.1.113] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id f1-20020a17090631c100b007aea1dc1840sm12322454ejf.111.2023.01.16.14.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 14:53:22 -0800 (PST)
Message-ID: <fa3c22057e798f0a2946661ac73dc4c2f923d317.camel@gmail.com>
Subject: Re: [PATCH] tools: bpf: Disable stack protector
From: Eduard Zingerman <eddyz87@gmail.com>
To: Peter Foley <pefoley2@pefoley.com>
Cc: Quentin Monnet <quentin@isovalent.com>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,  Jiri Olsa
 <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Tue, 17 Jan 2023 00:53:21 +0200
In-Reply-To: <CAOFdcFOgAH1z7EKyM=Q4EvzLuKETOWWDMwuqp36SxV-X6PGP5Q@mail.gmail.com>
References: <20230114-bpf-v1-1-f836695a8b62@pefoley.com>
	 <cb03b745-26b8-706c-de40-80ae991e29fd@isovalent.com>
	 <194f38f2dc7d521375e5a660baaf1be31536be9a.camel@gmail.com>
	 <CAOFdcFOgAH1z7EKyM=Q4EvzLuKETOWWDMwuqp36SxV-X6PGP5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-01-16 at 14:49 -0800, Peter Foley wrote:
> On Mon, Jan 16, 2023 at 4:59 AM Eduard Zingerman <eddyz87@gmail.com> wrot=
e:
> >=20
> > A bit tangential, but since BPF LLVM backend does not support the
> > stack protector (should it?) there is also an option to adjust LLVM
> > to avoid this instrumentation, WDYT?
> >=20
>=20
> That would probably be worth doing, yes.

Ok, thanks for the input, I'll see what can be done.

> But given that won't help already released versions of clang, it
> should probably happen in addition to this patch.

Yes, of-course.
