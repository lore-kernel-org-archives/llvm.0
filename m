Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F57F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 20:24:45 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id i14so3679677ejg.6
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 13:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc;
        bh=VGHWLnPOuI0iW4HF+EMCDJDCZmTKff3mWYUEzLkNfiw=;
        b=dAzPq79++vwSq3w9xA+4dohDcZvqi0e0ZQ0sY20qPIv0KLftLe3e63OzidprZpDuoI
         dUcHn7uiB6ShtYIQEPH3oA23MVDDdQc/IBZUvm+nLbF8YFnVOdvokA/6adhir8ew94VV
         jDnADahwtP6A6hkTmXRV0krv2F+5BjZ04OB12O1eB8CqKY4ebhE2Kz4CJTajnzEBIQVe
         QYUcHbGs2Dw2OG8HsnIy7x/e9DC2Z6IVTYVomM5jdVsgUeXjHI/8mcJ+22uYBuQBIQaW
         cHcpGZp1pKi9mFeyMF1yuAFgwasQMxksaltwAlZc8QXa29StcOgY+ok9GDdvczOC8pej
         m6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc;
        bh=VGHWLnPOuI0iW4HF+EMCDJDCZmTKff3mWYUEzLkNfiw=;
        b=IzbSZ/pWEAc3sOSTvL8aXfB5MrlK0IKmhsNEvG0d/ZmEp7mghH9DogkAgbMa+Q7SEQ
         El3mg3cCvYfo/1v1IjxTA35c3UL4ypIVDyOv5JgBhf0PMOAwary7VDTpziVwTfHiD4u+
         qmSQS9mhXxy2GoVclFuY73M7ldAaYyXt0/u5/nnVA8Y9GLEUDKjHeBifYsIF1KHNBlTA
         +0Y6AKU71e92XZn+pUl9vQOVRgigvqoDcjb4T2iOhb+fG3nqPzlHtXhMwdTzfY1k9NPx
         W7VZf3/T/7Jq0wucGvOLylTGHCooCQbsOJ4/AFoB07S9HmVfOefMU8a12eyUzEp94fms
         wKGg==
X-Gm-Message-State: AJIora9AzYnd3R8KIsqXdjyOCoMflevfR+cWcGAR/CHclNeLdunKEbGM
	aXtl2IazzasfUd1ypJU2s70=
X-Google-Smtp-Source: AGRyM1t3kp3muaqngGlm0Nz2Rmtd9ZP/PZxNvexVuNje+xgIsmXZMoTPLIjVHEmigwBTkt2r3eWYUw==
X-Received: by 2002:a17:907:2d90:b0:72f:5bb:1f32 with SMTP id gt16-20020a1709072d9000b0072f05bb1f32mr14043465ejc.758.1659385483943;
        Mon, 01 Aug 2022 13:24:43 -0700 (PDT)
Received: from krava ([83.240.62.89])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906301300b006fef0c7072esm5579555ejz.144.2022.08.01.13.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 13:24:43 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 1 Aug 2022 22:24:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: bpf@vger.kernel.org, "Jose E . Marchesi" <jose.marchesi@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, David Faust <david.faust@oracle.com>
Subject: Re: [PATCH] libbpf: skip empty sections in
 bpf_object__init_global_data_maps
Message-ID: <Yug2iYQyd0TNlnHW@krava>
References: <20220731232649.4668-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220731232649.4668-1-james.hilliard1@gmail.com>

On Sun, Jul 31, 2022 at 05:26:49PM -0600, James Hilliard wrote:
> The GNU assembler generates an empty .bss section. This is a well
> established behavior in GAS that happens in all supported targets.
> 
> The LLVM assembler doesn't generate an empty .bss section.
> 
> bpftool chokes on the empty .bss section.
> 
> Additionally in bpf_object__elf_collect the sec_desc->data is not
> initialized when a section is not recognized. In this case, this
> happens with .comment.
> 
> So we must check that sec_desc->data is initialized before checking
> if the size is 0.

oops David send same change but I asked him to move the check
to bpf_object__elf_collect [1] .. but with your explanation this
fix actualy looks fine to me

jirka


[1] https://lore.kernel.org/bpf/YuKaFiZ+ksB5f0Ye@krava/

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
> ---
>  tools/lib/bpf/libbpf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 50d41815f431..77e3797cf75a 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -1642,6 +1642,10 @@ static int bpf_object__init_global_data_maps(struct bpf_object *obj)
>  	for (sec_idx = 1; sec_idx < obj->efile.sec_cnt; sec_idx++) {
>  		sec_desc = &obj->efile.secs[sec_idx];
>  
> +		/* Skip recognized sections with size 0. */
> +		if (sec_desc->data && sec_desc->data->d_size == 0)
> +			continue;
> +
>  		switch (sec_desc->sec_type) {
>  		case SEC_DATA:
>  			sec_name = elf_sec_name(obj, elf_sec_by_idx(obj, sec_idx));
> -- 
> 2.34.1
> 
