Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50641851
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 00:41:27 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id lh5so17479009ejb.10
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 17:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QgBu6l3SOQc9v277Gy+0Dwk3UC62V2zlMgK2CDkHwM4=;
        b=evWhPjTnvCy2qAfvOEtKk2l0OGVkU2o2R2FS/FnIRHwNJ4RJi55GI9l1rQhKnoHAJq
         yIPrmO0om61wS84O1OzQY4gvy3jTS7htSRrI7Blr3KMWS9++OI7wmcAXfwAWCIKf5Hd5
         +N3C++zPmH2J2GRnkbRar+gPoceIrNKgBV4oR6P26xre0P72Lnw9AlcOSgiox7pDQBUQ
         gLESxmJxKegpP73XCknbuQgBlgM/9b9BsUWjP5lDYFbLTwPpYfvec9MS5eQSB0xnap3F
         +vD6WdMc4b3xiliDjCfOY7avSuS3sxQX1CiPsZjAPAwoO7Mj5KRJyID4pMuc0yZ/Cysx
         IENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QgBu6l3SOQc9v277Gy+0Dwk3UC62V2zlMgK2CDkHwM4=;
        b=FMLJqjpaHHFJx3a2XNrT7z8OHHjajYT0DxLLp9U7CPynyxXtI8k49tF1oFH4VygaOV
         Nu9seM15TiBNAl8S4pw1l0Rr+jXkjvRoQu3upJxY5G7Sc4+22qM/VlvFL0AWmhrF1SBj
         o/yTkk8YNN09T9Bd9vlfeq5J0vEHRR/SLJ2aB5rHkxDQAxKo93dkebyLIIL+0RRq58dQ
         8/M90D76zd9ycdNy8I/9rf2EQ/fXcjWnavQXy9Rke4U/VCkD+Wc7NppPGA0u+cVMzShC
         6802J/oQr7euUi13iISCNqLyqObQj7PC2YAor/M8Gxe2PTYlNm49+BfeK8Ytbk1oKaYU
         HX7g==
X-Gm-Message-State: ACrzQf2lnwSNEjlVNSm7xfRwRe5kwWMRMLJUxEo4phb0k7R0ZV1N/8Xr
	l/B1gyD8Lf9Khgp0oLyN06Ay9eFxO65C7Z+FfqQ=
X-Google-Smtp-Source: AMsMyM5fEHkkqOS+igET9j4G33WfnWE/gcXQj0zep94rSz1jU3juUCEoiKzsEe45QEMXXXoP+aemleY+1utr67FCMhg=
X-Received: by 2002:a17:907:96a3:b0:780:633:2304 with SMTP id
 hd35-20020a17090796a300b0078006332304mr694171ejc.115.1663807285946; Wed, 21
 Sep 2022 17:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1663555725-17016-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1663555725-17016-1-git-send-email-wangyufen@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 21 Sep 2022 17:41:14 -0700
Message-ID: <CAEf4BzbacgBeBrJcutGrpMceD2ipYyvRgrwyKdATN0K39adg5Q@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] libbpf: Add pathname_concat() helper
To: Wang Yufen <wangyufen@huawei.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 7:28 PM Wang Yufen <wangyufen@huawei.com> wrote:
>
> Move snprintf and len check to common helper pathname_concat() to make the
> code simpler.
>
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  tools/lib/bpf/libbpf.c | 76 +++++++++++++++++++-------------------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)
>

[...]

> @@ -8009,14 +8012,9 @@ int bpf_object__unpin_maps(struct bpf_object *obj, const char *path)
>                 char buf[PATH_MAX];
>
>                 if (path) {
> -                       int len;
> -
> -                       len = snprintf(buf, PATH_MAX, "%s/%s", path,
> -                                      bpf_map__name(map));
> -                       if (len < 0)
> -                               return libbpf_err(-EINVAL);
> -                       else if (len >= PATH_MAX)
> -                               return libbpf_err(-ENAMETOOLONG);
> +                       err = pathname_concat(path, bpf_map__name(map), buf, PATH_MAX);
> +                       if (err)
> +                               return err;

also keep libbpf_err() as well, it sets errno properly

>                         sanitize_pin_path(buf);
>                         pin_path = buf;
>                 } else if (!map->pin_path) {
> @@ -8034,6 +8032,7 @@ int bpf_object__unpin_maps(struct bpf_object *obj, const char *path)
>  int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
>  {
>         struct bpf_program *prog;
> +       char buf[PATH_MAX];
>         int err;
>
>         if (!obj)

[...]
