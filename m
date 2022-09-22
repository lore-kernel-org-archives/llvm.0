Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277B28F5
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 09:23:58 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id p3so7155489iof.13
        for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eq1ulTtXYhBmIV3Hec+MzaFRLDXw1vSRF6+bOMmPhJ4=;
        b=bE2W6qfxPeZ5hG8th9HBte8uWTQjYuCcr36yI1hhiheOM64/zofTi1amyoUC/YRb+J
         NgesQGAjTL00GMSehk4Np33KVgoKvpm/Mh3RSzMdF+EkL5Y4k9K6GB3q17DXyKsUm/6E
         tSUleWEaIUryrEiqLEE56d9SYCS/YFMrs6gU37f7Pqu7tr26K2zmBNy6tAGoGVxQ5f+n
         DlMD1/oSQBrQp/QHyG7CgFktY+50H+Wm33tTFaH8FxMf0iDQdWTe9OU6Ok7FDH/xYrVm
         +Y17qm2jbLBl43Ckz4h9g/NlAB7oNcZMDPJUHArvKPR8Jrr0Y7Jjk4kBCdA2lo60DN3B
         Aphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eq1ulTtXYhBmIV3Hec+MzaFRLDXw1vSRF6+bOMmPhJ4=;
        b=B9lxAZJPwskSwYyS77BQXwVPpwU7K4GpzByXvuc5zQA6pceLaw1B8FkKqKkogQAjck
         NqUBnIHO/hNzuqLLcEUHsCdyj+IbBqCEDRLpl9hf4bWwJTisjtgs/w9AUfQG58Ealwqp
         puuufbOq2qTCM4RM2VtFvoe2xZZCmDQSwY8V/1jw/datwpVyaxt7L0sEyAlekTXjtNEx
         LgkkFtWbrdb4oHvLegqmCElJi+DzXr3tS2dSo86GmxJiJz5LRCttsCqJJejGtlZUNfVr
         gPlbVGoqgtXSkoQsDteMUM3mQ5pc3+qqXEURplZZ++A478U1NBrJryWX3dQh9hiLWo2b
         YRsw==
X-Gm-Message-State: ACrzQf1gY1Caq4XdFkLnyTbwyQfDYu/2qwbQuM52jmD6t76XMCrjZYGf
	A/PORNpa99Bw9DfxIEOY/ohJMLYPaIlOhverplk=
X-Google-Smtp-Source: AMsMyM4VmAwcaT5Lc+Ww++2Y7GpjHXOf8JO1cC9hLR1vHps4lN+vAXggqFNSedolxw1DncuzKFlDGIHvcmXTBzRY/kM=
X-Received: by 2002:a05:6638:dcc:b0:35a:7ba6:ad51 with SMTP id
 m12-20020a0566380dcc00b0035a7ba6ad51mr1404409jaj.256.1663838637536; Thu, 22
 Sep 2022 02:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220922031013.2150682-1-keescook@chromium.org> <20220922031013.2150682-12-keescook@chromium.org>
In-Reply-To: <20220922031013.2150682-12-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Sep 2022 11:23:46 +0200
Message-ID: <CANiq72=m9VngFH9jE3s0RV7MpjX0a=ekJN4pZwcDksBkSRR_1w@mail.gmail.com>
Subject: Re: [PATCH 11/12] slab: Remove __malloc attribute from realloc functions
To: Kees Cook <keescook@chromium.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Hao Luo <haoluo@google.com>, Marco Elver <elver@google.com>, linux-mm@kvack.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Elder <elder@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, Daniel Micay <danielmicay@gmail.com>, 
	Yonghong Song <yhs@fb.com>, Miguel Ojeda <ojeda@kernel.org>, Jacob Shin <jacob.shin@amd.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-fsdevel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	dev@openvswitch.org, x86@kernel.org, linux-wireless@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 5:10 AM Kees Cook <keescook@chromium.org> wrote:
>
> -#ifdef __alloc_size__
> -# define __alloc_size(x, ...)  __alloc_size__(x, ## __VA_ARGS__) __malloc
> -#else
> -# define __alloc_size(x, ...)  __malloc
> -#endif
> +#define __alloc_size(x, ...)   __alloc_size__(x, ## __VA_ARGS__) __malloc
> +#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)

These look unconditional now, so we could move it to
`compiler_attributes.h` in a later patch (or an independent series).

Cheers,
Miguel
