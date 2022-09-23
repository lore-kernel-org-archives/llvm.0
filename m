Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72AA4434
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 21:31:06 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id hy2so3191286ejc.8
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PNe1IOPZZRAElJQvbFrNHmFIjgRyuMkrbemeQcf55Mc=;
        b=U7iUDhSzWpn6eUoq6O+J6MVCDtL4PSi25fIpv0Zxyi7nnoPEDVrryFmxtkcnRk74OY
         P2ysSpDGyLS09yNMI/stWlG5x41UUZlwV51a3JfehzGUUzi8d55RcmkYGRWjg1Dsc29a
         OciRMWmS7M392oyQ0IvI4zAdnO3F+b4r3J6NTp03YrR29h0aVMwIQ5zMJJ3w5/IY5yDf
         R/JqcIQ0uQ3kaTL1Xnox0lQsWrx1KvmxbxxF+KiyvLUMxy+hYIzh/sSEvmsFK+cRhjzb
         NzdBRRjwdMpZwxJ1PhsJC/8PU9iJS2o82FctafG0uMh0LW/2uPcvtK4QljSVJBZ7xKoY
         mx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PNe1IOPZZRAElJQvbFrNHmFIjgRyuMkrbemeQcf55Mc=;
        b=x7BCj3i2AXpP/cTZMQ+L/gICp77C5uO9JgCnsX41ulGa20sH/eq3eAUdfs24taTZsD
         T00cRM/kZIe1EkWoS5dwHR4ApreiMft1SLT0IDfIlFayHrtofLvZ8RwIH2Kbex6ZEyut
         yG91V08FnecGCUFhVhy+uujYD4ZtocIbUPKlC4XHf9qpjZtkNFyxXhiVNO5QXxIXHQDh
         CMq+RZfO9c+TgE+ZaTPiyJzGQekK7rCg6YxeXOd4A9TdvoDtGjiW2YPyPKP4EELiE3gZ
         KRRMr0GqFw8YN7UAOVcaSkmFQVvHTeMZ8h//uHK/Kkm65TooeKfIPGw3aUWZW4fqhIy7
         Zljg==
X-Gm-Message-State: ACrzQf3zBKGu3apFoqlRalplS45EUubxxPejslV9c31cV1U2CxeMJ8p6
	+rpa453zW5DziDWEXGxVpIp36dhgp7f9i39mGOM=
X-Google-Smtp-Source: AMsMyM7feHuUoVXLUCMrfwsW2N2pC7DMsOGDMcdxi4iqTP4DHbKrZyvphFgCTaODLPxVZtTSrjTUSKJ6SFJ6dmwUng0=
X-Received: by 2002:a17:907:3d86:b0:782:1175:153f with SMTP id
 he6-20020a1709073d8600b007821175153fmr8899830ejc.226.1663968665007; Fri, 23
 Sep 2022 14:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1663828124-10437-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1663828124-10437-1-git-send-email-wangyufen@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 23 Sep 2022 14:30:53 -0700
Message-ID: <CAEf4BzZuw57ywTOe8Yjar11r_A=XZLJjxx1mCJwG0y2PHhf6pg@mail.gmail.com>
Subject: Re: [bpf-next v4] libbpf: Add pathname_concat() helper
To: Wang Yufen <wangyufen@huawei.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 11:08 PM Wang Yufen <wangyufen@huawei.com> wrote:
>
> Move snprintf and len check to common helper pathname_concat() to make the
> code simpler.
>
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  tools/lib/bpf/libbpf.c | 76 +++++++++++++++++++-------------------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)
>

You went a bit overboard with libbpf_err(). We need it only in
directly user-facing functions. I've fixed it up while applying. Also
moved buf and buffer size to be first two arguments to match
snprintf() order of arguments a bit closer. Applied to bpf-next,
thanks.

> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 2ca30cc..2d8b195 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -2096,19 +2096,30 @@ static bool get_map_field_int(const char *map_name, const struct btf *btf,
>         return true;
>  }

[...]
