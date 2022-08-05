Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F3184E
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 15:28:14 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z2so3871489edc.1
        for <llvm@lists.linux.dev>; Fri, 05 Aug 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nk665Su5xb9lfbgCe09ymRRIU+UUZDMS8Dljdw9Nzec=;
        b=NcJfbaV8IP0wEnbKxkXsopTDyIDk65kpx/0CKlMw+Fc4SDosRJLZMHk58SNvoTC+uB
         DVIx/mze+OU4922IXHJ3//lXlm0rQ6V1nn8pTxcaXa79msaDb/jMk/jCG7Q1sSBDV44N
         rPRSxCkJmtB0+Bitgf/FRWSjZjtvUJZfYuDMQ3U4CYbJ/1UQhnz5csiMFwta+ZPYmnqu
         am6Mew8dMqKWK2lPkzWiOf4/9SYiKSh+cToBd7T1TsotL+m/LMcDDdf0ND5KJs+7qxk4
         Ei3WYLlqgDsTapYg0CHl0ngZFRzUmzzDmBtaKzNLUjgWc8ubM7lOPOmlFPz23bt2ekK8
         4gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nk665Su5xb9lfbgCe09ymRRIU+UUZDMS8Dljdw9Nzec=;
        b=fWwSEXfzLmGbbuq9/rVdr/CrzXuhFxNPIIB/SkftmTUL2raJZ2pJKJFHbjXijXY6aZ
         YMNMGY3PZIJ75mKj2ns3Rx/g5uxtLXbrd2p4OX/NFA5Ef/YNIwnr2td4wEYddBIghf7m
         wJHXtoibeOJHBRS51BEuQw5YTNDMTZgxAWgyTJvac65h/KtVzJvwbiuzRZVAsk39gWuB
         5SCu3cvc5QLo0UKZ5XBTQDglg1yIN2YH1sdbIAY2bwOBPUYo18zmBMkZXCdmyNlMj7hQ
         qKQbmdnah7JUVkpYAlUroE+hEXSj9dN5AMkaWI4fyvucBJBGmWKsm+NpjnD7BnrrqPve
         4bcA==
X-Gm-Message-State: ACgBeo0rB5qNFTI6yKXTjeS5u3h0rU2Dea0/8vtJj1N1gu0ro6Xp+jLr
	5CZHRbWcpvlMGLO3aExMk3eMOcGN+SlpeEWbEpU=
X-Google-Smtp-Source: AA6agR75gtSXQnZkl1er1ObborDZW6Tt0Qlr8Lf6f0issBPgry00DlQa2kEbnOlZGdgfOPKILfTZDrpaUWTWXsrkdKk=
X-Received: by 2002:a05:6402:27ca:b0:43e:ce64:ca07 with SMTP id
 c10-20020a05640227ca00b0043ece64ca07mr6145406ede.66.1659713293023; Fri, 05
 Aug 2022 08:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220805081713.2182833-1-james.hilliard1@gmail.com>
In-Reply-To: <20220805081713.2182833-1-james.hilliard1@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 5 Aug 2022 08:28:01 -0700
Message-ID: <CAADnVQJ2LSrviYX++K8YQCc7B6yNapJ+MA9jCiFw=UQ3dQYMLw@mail.gmail.com>
Subject: Re: [PATCH v4] bpf/scripts: Generate GCC compatible helper defs header
To: James Hilliard <james.hilliard1@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 5, 2022 at 1:18 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> The current bpf_helper_defs.h helpers are llvm specific and don't work
> correctly with gcc.
>
> GCC requires kernel helper funcs to have the following attribute set:
> __attribute__((kernel_helper(NUM)))
>
> Generate gcc compatible headers based on the format in bpf-helpers.h.
>
> This leaves the bpf_helper_defs.h entirely unchanged and generates a
> fully separate GCC compatible bpf_helper_defs_attr.h header file
> which is conditionally included if the GCC kernel_helper attribute
> is supported.
>
> This adds GCC attribute style kernel helpers in bpf_helper_defs_attr.h:
>         void *bpf_map_lookup_elem(void *map, const void *key) __attribute__((kernel_helper(1)));
>
>         long bpf_map_update_elem(void *map, const void *key, const void *value, __u64 flags) __attribute__((kernel_helper(2)));
>
> See:
> https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27
>
> This fixes the following build error:
> error: indirect call in function, which are not supported by eBPF
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v3 -> v4:
>   - don't modify bpf_helper_defs.h
>   - generate bpf_helper_defs_attr.h for GCC
>   - check __has_attribute(kernel_helper) for selecting GCC defs

Great job ignoring the feedback.
Applied.
Just kidding.
