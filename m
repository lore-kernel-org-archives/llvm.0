Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B638FA6
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sdf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NQ1MjstO"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-56fb25fdf06so2000655a12.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 14:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696627076; x=1697231876; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8YyZNdSqKiy5DzZ/PIG6aNvb3OwzQTDwFSCpe0do0I=;
        b=NQ1MjstONKvacZ29gnNEscyt8Zinn+/dOaMY+ri1e3YcN1b4IRMH5kp0ul++iYI+zY
         m/mRDNHxypy4JkgZPFKsi4TszrKdMia+A1KO5cEOVsBUHmyKl6SAyopmYdMFoMByOo7t
         u3et8kcwWAL6AkP2g692uAOTghEPmlBEoutrCYSI+Rcuk1K7NT/0di36BMT7PH4rWvXM
         4sVI8Yfv+EAbuJNmySMEU19VARiAJwlzce41IMLr46S4tA4zYxaaQs0qrGYx5IM156g6
         dhMK578FRZ8SH04QZKqlhyMIiL6BzvlUa8Y7Z2Xly/6odQTYHYarrQTFZs/1YsZyHbpL
         w+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696627076; x=1697231876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8YyZNdSqKiy5DzZ/PIG6aNvb3OwzQTDwFSCpe0do0I=;
        b=V0chbZxTvb7EXWqvjNup+3pIludOvTVem8x3xTBqxviyGanvKDHKiOPInnLtKCz7B8
         YIrw6bO+tTBZmS1XDqp1sOn3piKPYiwkL8hINVdn7d1IMOOAoNxLJNzgvJVio80Z+6xZ
         fqIXZiEA6e4rmVkAw7REet/XrextqVTrZgR/f1puf+qLCD7VGQWSLhgXuOv57Cqlg8m3
         oHqKVCLntW5nrzIEkevTv1ley4X0vFKkphIq1iqcUHO83Vb++Wqm9N+g8yIoThh91Zxi
         Q1eqBY7MHNi5n/UC7Dng2LqvzLnjVAieZh5AvYxGYkn8NsNzvXpu8vWMl/CApYQOuUrf
         Qr/g==
X-Gm-Message-State: AOJu0Yy179KU7/xTtqgVFw0J0rIzS+ODZbuSVqK4Z8lz4ZxBFn0Boeo9
	AfsEwD2FfA9wZyTt0t6h8tMaQI8=
X-Google-Smtp-Source: AGHT+IGnmD6XCIMe/EZKQtEqPeVmzgwcfi0GavAMqiLOd1teM7yDtIh3f0wNuZUWye4WBFumI9XzkvY=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a63:4e4d:0:b0:589:86ae:2107 with SMTP id
 o13-20020a634e4d000000b0058986ae2107mr57778pgl.9.1696627076618; Fri, 06 Oct
 2023 14:17:56 -0700 (PDT)
Date: Fri, 6 Oct 2023 14:17:55 -0700
In-Reply-To: <20231006201657.work.531-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231006201657.work.531-kees@kernel.org>
Message-ID: <ZSB5g6CmpjS-l5nK@google.com>
Subject: Re: [PATCH] bpf: Annotate struct bpf_stack_map with __counted_by
From: Stanislav Fomichev <sdf@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, bpf@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On 10/06, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct bpf_stack_map.
> 
> Cc: Song Liu <song@kernel.org>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Andrii Nakryiko <andrii@kernel.org>
> Cc: Martin KaFai Lau <martin.lau@linux.dev>
> Cc: Yonghong Song <yonghong.song@linux.dev>
> Cc: John Fastabend <john.fastabend@gmail.com>
> Cc: KP Singh <kpsingh@kernel.org>
> Cc: Stanislav Fomichev <sdf@google.com>
> Cc: Hao Luo <haoluo@google.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: bpf@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

TIL about __counted_by :-)

Acked-by: Stanislav Fomichev <sdf@google.com>

> ---
>  kernel/bpf/stackmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> index 458bb80b14d5..d6b277482085 100644
> --- a/kernel/bpf/stackmap.c
> +++ b/kernel/bpf/stackmap.c
> @@ -28,7 +28,7 @@ struct bpf_stack_map {
>  	void *elems;
>  	struct pcpu_freelist freelist;
>  	u32 n_buckets;
> -	struct stack_map_bucket *buckets[];
> +	struct stack_map_bucket *buckets[] __counted_by(n_buckets);
>  };
>  
>  static inline bool stack_map_use_build_id(struct bpf_map *map)
> -- 
> 2.34.1
> 
