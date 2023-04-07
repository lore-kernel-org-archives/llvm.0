Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE16FBD
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 17:34:57 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so43892587pjb.0
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680888897; x=1683480897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL8XT2dmegghAeYpKyssd1/mU3F1iBt8lThUBp5c4gY=;
        b=QWyy+rpanfpbOQipdK4S0IuAPz4YxLzjaGmsTfT+dojd/dx5oCHxpkZmWzrh3J93ZM
         k896UTgn1JLv25w/ht3L4yDtHyRgX12VNGz2wet1zb1IyjvC48JIpm6YRR5zOHlvYpyp
         vg/NuD08IwdhtiyPjudoTrzqBmmgyigyV8fDswWrB3eTk4f4yKz5fkjaUV4UlxdQd2z+
         d4I7MvDi3NTWFDrNqDYA7oEL8CXAv9Lk67oe6OXhYYMzmBXuygmurYSrXIiZHSa/qbad
         wgsPc6MG4Yg9DQdgn54u6IUkJeGPyHRBJmqz2mQbIV18xthIetTpt81WmwcUEFUMLDhN
         wHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680888897; x=1683480897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL8XT2dmegghAeYpKyssd1/mU3F1iBt8lThUBp5c4gY=;
        b=6AKZKUVpQqVpzc8dGb7TVoIOJ/ck769hqsAZ3autrW92EVqP9XMmqfEeQBN+MhMRv5
         HByL8GiU6CLwcyLXie6cGCrOIkAGBSW18nHeMs7tuoZl2W+4vspszKuHvlqSh/5OSbGd
         0pY7o1WA+N3JsOaaWKp7UpFt7ZX+iMI/095lqbbIY2NTUnZwoQPeQe/XaxJ813Ii3LKR
         aSjcUWRptcvdxjBzJnP0q4hGZmCERI/8R0VmV9xwqlXYiJ7ybqD8RLvmEfj7yZbWUIhp
         xgrmr4IB9EQ9eiTGOymkP/hsqbH1fLxqVgptA5ah/5Y5ZQWytx2E6UjKIm1xBgwCPBvU
         cKTA==
X-Gm-Message-State: AAQBX9fHwKF1lSi5IaoTOAjVW4Sc/d2ucyBC6UlA6+OCO2hSR0VzTyQL
	KqJx/jHftHBJAIQE8xJHN6DXggVlBtcioXajVVZ8Kg==
X-Google-Smtp-Source: AKy350Y3+tyc2y5AqmX+ezlQ/w8+BR5lVu9JAdgHFRIjCTIVUzXOhXQ3/IkTS6gnhNWCbqRBOnYyquPB8sl9mA83s1Y=
X-Received: by 2002:a17:902:6b81:b0:1a0:4aa3:3a9a with SMTP id
 p1-20020a1709026b8100b001a04aa33a9amr1129540plk.2.1680888896519; Fri, 07 Apr
 2023 10:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307151239.1994179-1-trix@redhat.com>
In-Reply-To: <20230307151239.1994179-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:34:45 -0700
Message-ID: <CAKwvOdnGnGVk21Yh2GsH-fNx_M48f9CU05nnHSbnJd_Zq3En2A@mail.gmail.com>
Subject: Re: [PATCH] bpf: extend btf id list
To: Tom Rix <trix@redhat.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	nathan@kernel.org, joannelkoong@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 7:13=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> With clang and W=3D1, there is this error
>
> kernel/bpf/verifier.c:10298:24: error: array index 16 is past
>  the end of the array (that has type 'u32[16]'
>  (aka 'unsigned int[16]')) [-Werror,-Warray-bounds]
>     meta.func_id =3D=3D special_kfunc_list[KF_bpf_dynptr_slice_rdwr]) {
>                     ^                  ~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/bpf/verifier.c:9150:1: note: array 'special_kfunc_list' declared h=
ere
> BTF_ID_LIST(special_kfunc_list)
> ^
> ./include/linux/btf_ids.h:207:27: note: expanded from macro 'BTF_ID_LIST'
>  #define BTF_ID_LIST(name) static u32 __maybe_unused name[16];
>
> When KF_bpf_dynptr_slice_rdwr was added to the enum special_kfunc_type
> the total exceeded 16.  Increase the array size to 32.
>
> Fixes: 66e3a13e7c2c ("bpf: Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr=
")

Looks like Nathan's patch got picked up.
commit 2d5bcdcda879 ("bpf: Increase size of BTF_ID_LIST without
CONFIG_DEBUG_INFO_BTF again")
https://lore.kernel.org/bpf/20230307-bpf-kfuncs-warray-bounds-v1-1-00ad3191=
f3a6@kernel.org/

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  include/linux/btf_ids.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> index 3a4f7cd882ca..166c387b48f7 100644
> --- a/include/linux/btf_ids.h
> +++ b/include/linux/btf_ids.h
> @@ -204,7 +204,7 @@ extern struct btf_id_set8 name;
>
>  #else
>
> -#define BTF_ID_LIST(name) static u32 __maybe_unused name[16];
> +#define BTF_ID_LIST(name) static u32 __maybe_unused name[32];
>  #define BTF_ID(prefix, name)
>  #define BTF_ID_FLAGS(prefix, name, ...)
>  #define BTF_ID_UNUSED
> --
> 2.27.0
>
>


--=20
Thanks,
~Nick Desaulniers
