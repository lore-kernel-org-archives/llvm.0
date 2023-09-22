Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CB45F40
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 18:26:08 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c382f23189so18535ad.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 11:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695407167; x=1696011967; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gTBcxUPj0X2lw9PxD7x8qtI+1zxhKTtoMwvn6AN1X0=;
        b=z10Hsus+q/3rzypHYhLF1Z1Awz0Y5ViBxEuTFkUGEZfH1Bcriy35obm25RuMQomOlw
         opwDvYn8RPUu1mt/1tV9AUqUSSFTNaxxp8n2DZMEZhv/C0tnc6t+O7Sbcc+PT2KdumtH
         c4nTSYxjVzQ6iAZagHrryKsym3oWqDMwCagJflka0sI7rU/5fqeVLd092VTYfnQgZCls
         HSlMp/fKGF3iR+Dxi8UnGLgFrPcAUSmmYtxzq7bJ1Z6d01EiUSWi1ivxJjjmueDxiCdE
         ZrCuFpI1bQVPuqH5onVpeJd6Dfh4o9GxnQXnQ1r02vappmZQfhcjo9gGgxoW3xyxDWTP
         AFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407167; x=1696011967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gTBcxUPj0X2lw9PxD7x8qtI+1zxhKTtoMwvn6AN1X0=;
        b=wRSq0ZbUJPniwiUG3f6R43/Z1RynqV05RYmXhXfl7MrEnQ5VNyVxycyk2dxXdVaOmj
         WgNp1+yqcF+pjsR2f+pax3CJOqt7VgIzt0HKu5oJ+zNsMIRJWQHU59kqep+a11WCmZ0x
         beSEz3VO39uhOAp9RbtuS6ULlmzyzOosTLdxsWO+hRl8Ny0rU33SuWnlgbazlW2FkyzX
         7180Loqo79t7W1WTJ/pFmIjS0aBG+rlSzkVe8ESWM7evA6VkQBHaPQ/HxqsG2nrZ40NH
         1Dlc7vc+E/4mwuVCYc/DQgoWvSTDCSkSvX/gXQKlDkGayn+X6+1LbR1h02NLNXjHpo5j
         6Mdw==
X-Gm-Message-State: AOJu0YycTPCkPZX/M0cZjSmY0rbfELhF3YK9GIVJ2OdnjiCFE4BOOs88
	Yb4yZwGVu2n8327xBeZGtuwHfcnngI8rZ4hXII9xZQ==
X-Google-Smtp-Source: AGHT+IGCw9CUYrruZ8DWnXPsm6cBFUWlN4w3pKDLMImz87xku5Rhr1T3gOI8P3au2gBUTcXhqc2mXZkvm1C5hGrfVww=
X-Received: by 2002:a17:902:d2d2:b0:1c4:514c:8717 with SMTP id
 n18-20020a170902d2d200b001c4514c8717mr25128plc.3.1695407167411; Fri, 22 Sep
 2023 11:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175327.work.985-kees@kernel.org>
In-Reply-To: <20230922175327.work.985-kees@kernel.org>
From: Shakeel Butt <shakeelb@google.com>
Date: Fri, 22 Sep 2023 11:25:56 -0700
Message-ID: <CALvZod5xVhR_Feq7Wp_P9BLjYHJCxqvA6BmHmzwGzw34niDQ2g@mail.gmail.com>
Subject: Re: [PATCH] mm/memcg: Annotate struct mem_cgroup_threshold_ary with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Yosry Ahmed <yosryahmed@google.com>, Yu Zhao <yuzhao@google.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:53=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct mem_cgroup_thres=
hold_ary.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/memcontrol.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 45d0c10e86cc..e0cfab58ab71 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -143,7 +143,7 @@ struct mem_cgroup_threshold_ary {
>         /* Size of entries[] */
>         unsigned int size;
>         /* Array of thresholds */
> -       struct mem_cgroup_threshold entries[];
> +       struct mem_cgroup_threshold entries[] __counted_by(size);

Does 'size' here have to be a member of the same struct as entries? We
have nodeinfo[] in struct mem_cgroup whose size is nr_node_ids which
is global. Will __counted_by() work for that?
