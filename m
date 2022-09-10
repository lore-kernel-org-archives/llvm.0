Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBC7E9
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 18:37:52 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id r17so11278901ejy.9
        for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 11:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=J3D/ARkSkqKI85ccm0AMVtwEb1skGkqx7TLvFxAbwM0=;
        b=GiIm7U3J5Reg7owAgAksi+e0a1Tid5Z/3k/dq7aNDlhkQYPwnAtIolQT/WmItfeFl9
         X0HRuJvuWggo1GjcBohcNNBqtV9FqUDXJWh9ly1gC50deEwre8P7XbAxiOrd/pB9oc8r
         2acUpW5u+l2DtPqbNsPSGQp5BP0Ga7N490AvmQqCrIscPmNV1W2gswzHiZu+v8dHkCjl
         CZfrjZpfJG3OUeLWu9933KTlbNKX/s9ti9vXcksXiyqfC9ZiWyQXV7XKzzM4hauoTU5U
         RIzyqLYJndMqDPCSZd3L9Mx8pRIB08yyMv9DP39XLlVzBc/Y3N3zI5yj9G2evWN3czQ8
         Pnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=J3D/ARkSkqKI85ccm0AMVtwEb1skGkqx7TLvFxAbwM0=;
        b=4UrpYTYEJkKHtvw/FvmREFYI+i+kAdRPruJLWnwlmmTxZAiP7huRuxu1CbTsRRlsh1
         Q9ZBKnBaWddPFTabmlKEYgQZmNCfRT0KUGerTWFyGUi3Q+fpX8sC7TQHxapYcCV+oYcv
         +FfPH6y6GS0HY4muqIfujY/qS+V5iYdOD1bj2bU5MomU9N2cEJaP78IWzAthphdlYBTd
         8v8ZsBoT9rgXMop98p0Muxa2HeRSFzHAZzKriCEsZ4bNUSKL7vKC0/hSzbftXy5trJ9v
         rKtekyYWS0tRer0y9xeWLvVpVLAomtWLj1L0CUcTevYLh4YykG1TCdckBgw/XY672Y6f
         lCmg==
X-Gm-Message-State: ACgBeo1Yn+mI8UMUbnJ3UauBwt+9P7faD6VHZdehSMRLvMpQfpHGAzE1
	mrB0U6zpcW5+J2pnQAiEip2uNKSyZIAC1aLNjQI=
X-Google-Smtp-Source: AA6agR7MVenKlUXQoi9uH76H13dv4xZZFty1YmiZVlH6XdxVv25sbN+UGRwBWYDaMhnt8RH5j8LuKb+THoc1QqC2K+M=
X-Received: by 2002:a17:906:58d1:b0:76d:af13:5ae3 with SMTP id
 e17-20020a17090658d100b0076daf135ae3mr14321706ejs.708.1662835071050; Sat, 10
 Sep 2022 11:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220829210546.755377-1-james.hilliard1@gmail.com>
 <CAEf4Bza6g4tZDtuKCaBwVVJSHUrLYh=pbUffPBpmWtR-xyXyqQ@mail.gmail.com>
 <CADvTj4pF=D7PEBF-LK_sKckRUCq-vd9ZjohpiEgLvORg8UaZyw@mail.gmail.com>
 <CAEf4BzbjMWC50J-mn_aNd2BeJWU=nLJmsJCAVvTqLSYsh4RejA@mail.gmail.com>
 <CADvTj4qLhgQ1K30dKoviw10G6f5XTv7T6SChUPvYnNWZGxw4OA@mail.gmail.com>
 <871qsjyb41.fsf@oracle.com> <CADvTj4ov8wnWCGXsKRF5QJn9_+NQ8RspydrGPjE5=9KWZQuNEA@mail.gmail.com>
 <87r10j7h8r.fsf@oracle.com>
In-Reply-To: <87r10j7h8r.fsf@oracle.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 10 Sep 2022 11:37:39 -0700
Message-ID: <CAADnVQL3HpDVUD3FHhLYqUjZ32K1pd5e6YCLBRsMVdiWc-+CCg@mail.gmail.com>
Subject: Re: [PATCH v2] libbpf: add GCC support for bpf_tail_call_static
To: "Jose E. Marchesi" <jose.marchesi@oracle.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, David Faust <david.faust@oracle.com>, bpf <bpf@vger.kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	elena.zannoni@oracle.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 10, 2022 at 1:43 AM Jose E. Marchesi
<jose.marchesi@oracle.com> wrote:
>
> 2) If/when we support the C-like assembly syntax in GCC,

Thank you for considering supporting the standard BPF assembly
syntax in GCC.
I agree that C-like asm looks unusual.
The main reason to pick that style was the ease of understanding
and to avoid gnu vs intel asm order confusion.
We didn't want to deal with question whether 'mov r1, r2'
means r1->r2 or r2->r1. The C style asm r1=r2 is unambiguous.
