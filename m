Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572BD37C;
	Thu, 16 Mar 2023 01:39:38 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ek18so1749555edb.6;
        Wed, 15 Mar 2023 18:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678930776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAl9L1VdKK9T4FPnDb4eK9GFbN1rBiUNLvSKvbeXWfc=;
        b=T37qC6AIrqE3EMHD0jntWlPnspV/4IKsLrQsWHG+x+qn6CBMdyHZQevnTG/Gm9HEdY
         qu4CnrOAeWJzkwb57a8FImJR2eCeq/Fkilo6kZvwREVXt+tei7lBw1igVi6JXrO5K6Dt
         TdGxxKqOrb8NDf/vlaIDz1euI2I8motKRuhBgZXyZ2y2uAJge2jZKVQdFuPFQJwLqcRv
         o92SCaj/YYrBQcjg8Jqsfip27JmibCobEy1HUSD53md17lzGen7wuulI5iB5H5pu6YoZ
         2x8LkmJ7CY3RkROt9yfKMkPYkLIpul16NhkgfZKjq+Q/myZXtODGB77qkgtGkAhEbOE7
         fElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678930776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAl9L1VdKK9T4FPnDb4eK9GFbN1rBiUNLvSKvbeXWfc=;
        b=R8daarDHBwBH1qZqLPkyO111VoGb/aPyPHvwg94IAXr1tq0j8yRuy6XG0cfMMsnXgi
         0NzJy3YJaW9clcJ8oSu7EZhfBPlwh57rMefYlOQHWCQh01wQalXgQnADwNnz4gyOufY+
         telBcj73LCruJowiGcnub1ZXG7CZ55Y4VgmDINu/ZV9uhKBHEB8kMYJerurFkbTWkT+5
         laCl4X3ZSO8RvrMYiLvuCa6vmlhvyQLCpOLx5oXknC9x9DqrgLy2lJIz32lK3xrtfW7X
         mUu9LvQh19sVQW901cCHFGAZllx1ZIsQFE+lAFYes52LrPgBrVWQEtdPYLrA7E7x7TlG
         G3yQ==
X-Gm-Message-State: AO0yUKU6DjL8jxaW+ZXMtxA9kugZCNrE305tmX5FYWUvN9nswjrmEWPm
	dwY8gBu6tdNFajYCfbK0Cx2j6KSU4qwtHpjKK74=
X-Google-Smtp-Source: AK7set/nQFF7BQiVEvXaqwJkujkApr1O8Em/CXTTZWlDH+0L3EYoqGjf3pjR+sZYtLYSf0olM88MJ6UXmQdgFmP76lk=
X-Received: by 2002:a17:906:9483:b0:8b1:2898:2138 with SMTP id
 t3-20020a170906948300b008b128982138mr4333785ejx.3.1678930776380; Wed, 15 Mar
 2023 18:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3f6a9d8ae850532b5ef864ef16327b0f7a669063.1678432753.git.vmalik@redhat.com>
 <202303160919.SGyfD0uE-lkp@intel.com> <CAADnVQJ+-ThSUMzEgWu6OtkWB-bdqZKPiRxWUEbL5L=cPjeezg@mail.gmail.com>
In-Reply-To: <CAADnVQJ+-ThSUMzEgWu6OtkWB-bdqZKPiRxWUEbL5L=cPjeezg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 15 Mar 2023 18:39:25 -0700
Message-ID: <CAADnVQKWtWZg+zHfA2AOwwMKipWog-MpeR88AcXN=bJuuQu6_g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 1/2] bpf: Fix attaching fentry/fexit/fmod_ret/lsm
 to modules
To: kernel test robot <lkp@intel.com>
Cc: Viktor Malik <vmalik@redhat.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 6:34=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Mar 15, 2023 at 6:32=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Viktor,
> >
> > Thank you for the patch! Yet something to improve:
>
> Argh. Comma is missing.
> Viktor,
> please send a fix asap.

Actually, since it was at the top of bpf-next
I fixed it myself and force pushed bpf-next.
