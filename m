Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB92C9D
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 19:44:01 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id m12so23008873ljj.6
        for <llvm@lists.linux.dev>; Mon, 06 Dec 2021 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qjCB24p6GO438Z2kHug+W8gH4OI8+jnRhOs5CMlBM+0=;
        b=rwTHQlDpWAlTWiRhyS/YTA9+Gk7OVi1i07q24E4t6+1OZkW3UsgB7NhxJyLzgjIHLJ
         gjwg+GhsR1aB/x4lotXQHzockynCfERZbav10+kby826f0T+CXKsPVtRBdk+emWgFIe5
         2H24aO5Kn4vSCx6DP/lYe1cGw/mLPygFQYxoNuSdkhbwi0hBUZmwsPOZeT9VhxURJEG6
         0kWaekpZGuKl5hjoV3Sa+ni73T5jj+50yg02G+PNXLNEjQWtqZEoxpPnyDz6KchCoMNj
         hjGtCQr/h9cS6IeDob9+52ndrXHo7UC/8kQTzhrCdsciuDzzANzK9BCIhSKDqWGNU3qN
         JUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qjCB24p6GO438Z2kHug+W8gH4OI8+jnRhOs5CMlBM+0=;
        b=pSDpnE+jiIywon5zCcN46cgdoy91DhJOJAZ7W6S6tShKEvRdgFFBKdu1NXun9wM5XE
         AuqKhqsEDtHlGqZusRXF/T/GiU0PqjNi2CH7JtOjnIYPKnJjDo44rI7lFqJtn20Vfbgi
         aCDLIGbFzOLpUuOG4LEtl76ozeBvFJ2hpV8CP0Qot6a3F0bwIJ2Wwz/83hI1b0iU6INY
         ydQU6pbGHGWzhBuirnPXcmZiTet+5pXj9c5x0QVr1RuaJ139y52SyiwczE3e1tOHmzUn
         O4jOAarD6jTgq2IUPQCuvtrvXmL9rR4S/6tiZIuOViwtAEuBTOZMZsBFbyfDN6DgJyg+
         iRyg==
X-Gm-Message-State: AOAM532gQglM5AF7SzKuAGQPrDDjYiss3xzYUbmsvjH0vt/MYZk/3o0Z
	ZPwPkVkQZ6n36AwP2flqkByry3hersh3SzN7KuD62Q==
X-Google-Smtp-Source: ABdhPJyTxO4MSGAXd+LGMzVZOw2ZQorvSdY4Md1d38bw5x5/n/zVWFX69aRilqa8u5wEf0MdLjLMdco8CUw7m3gXWac=
X-Received: by 2002:a05:651c:1b0:: with SMTP id c16mr36326195ljn.339.1638819838997;
 Mon, 06 Dec 2021 11:43:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211206161745.39028-1-alexandr.lobakin@intel.com>
In-Reply-To: <20211206161745.39028-1-alexandr.lobakin@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 6 Dec 2021 11:43:47 -0800
Message-ID: <CAKwvOdnoxaHHYMN-=fW6-W_bN+VrWvD32cidGa7qnYHmR=k2YA@mail.gmail.com>
Subject: Re: [PATCH] numa: mark __next_node() as __always_inline to fix
 section mismatch
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 8:19 AM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> Clang (13) uninlines __next_node() which emits the following warning
> due to that this function is used in init code (amd_numa_init(),
> sched_init_numa() etc.):
>
> WARNING: modpost: vmlinux.o(.text+0x927ee): Section mismatch
> in reference from the function __next_node() to the variable
> .init.data:numa_nodes_parsed
> The function __next_node() references
> the variable __initdata numa_nodes_parsed.
> This is often because __next_node lacks a __initdata
> annotation or the annotation of numa_nodes_parsed is wrong.
>
> Mark __next_node() as __always_inline() so it won't get uninlined.
> bloat-o-meter over x86_64 binaries says this:
>
> scripts/bloat-o-meter -c vmlinux.baseline vmlinux
> add/remove: 1/1 grow/shrink: 2/7 up/down: 446/-2166 (-1720)
> Function                                     old     new   delta
> apply_wqattrs_cleanup                          -     410    +410
> amd_numa_init                                814     842     +28
> sched_init_numa                             1338    1346      +8
> find_next_bit                                 38      19     -19
> __next_node                                   45       -     -45
> apply_wqattrs_prepare                       1069     799    -270
> wq_nice_store                                688     414    -274
> wq_numa_store                                805     433    -372
> wq_cpumask_store                             789     402    -387
> apply_workqueue_attrs                        538     147    -391
> workqueue_set_unbound_cpumask                947     539    -408
> Total: Before=14422603, After=14420883, chg -0.01%
>
> So it's both win-win in terms of resolving section mismatch and
> saving some text size (-1.7 Kb is quite nice).
>
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>

Thanks for the patch.  See this thread:
https://github.com/ClangBuiltLinux/linux/issues/1302

There's a lot more instances of these based on config.  Something like
https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807260475
would be more appropriate for fixing all instances, but I think this
is more so an issue with the inline cost model in LLVM.

I need to finish off https://reviews.llvm.org/D111456, and request
that https://reviews.llvm.org/D111272 which landed in clang-14 get
backported to the 13.0.1 release which should also help.

> ---
>  include/linux/nodemask.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> index 567c3ddba2c4..55ba2c56f39b 100644
> --- a/include/linux/nodemask.h
> +++ b/include/linux/nodemask.h
> @@ -266,7 +266,7 @@ static inline int __first_node(const nodemask_t *srcp)
>  }
>
>  #define next_node(n, src) __next_node((n), &(src))
> -static inline int __next_node(int n, const nodemask_t *srcp)
> +static __always_inline int __next_node(int n, const nodemask_t *srcp)
>  {
>         return min_t(int,MAX_NUMNODES,find_next_bit(srcp->bits, MAX_NUMNODES, n+1));
>  }
> --
> 2.33.1
>


-- 
Thanks,
~Nick Desaulniers
