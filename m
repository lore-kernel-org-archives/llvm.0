Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9CF3FCB
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 13:19:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id dm26so35073696edb.12
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TGkYYxYMY9704XpvY0f5AEHt0EkjStSYqCKUbuGu+HA=;
        b=b4wG63MDZjK2m11e8k6xAmyzN38yWDpm5ZjOxm6OyLrntdchH9Pl+ZV1dp9spFZoiv
         X2whDFMFl1TxP9GDNrVD9Vro59sb5pEXMAjAwh9yQ8OqDFmgoal1pc+mcjxZdTt/Kpt4
         cJjP0GLP94JUw65TLWB0hnNYhEFJFznQSP1Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TGkYYxYMY9704XpvY0f5AEHt0EkjStSYqCKUbuGu+HA=;
        b=qJ/HA8EqvR+qWiKWT2eyj4SG3Acoz96F4vIJdDyem0BxbqNtQ3tdMRKvSMJqmoQ5Hf
         CJxcnaEsmJgI04+Xll1pQa74LZvB0vMatUUBv8j28cFfB/GHgOrpB0dMe0vhIh+D+xaP
         lo3vFQUXc7A1PrLx/JjFdtDLtGu4RRx+WO9mYXnV61ZlIvO2zFCNGlFjZ9sjWAivkr6t
         NBTM7ZRUAG+TSL0X+/MDewPDWWlAxS4NkpaEYKpV+nELw/60/1ZdCyk43mGeZg05GPGd
         3j6Yhf+8KyuoBfyUnbwFjvJiAd4h//DlPwTYttRKonuDlyooBxgfe/6AsllZWASOoHgZ
         LFbg==
X-Gm-Message-State: AOAM530gKonODdxmOU/ezvcWu9wRM1yjvBmcO831bGwe9uJqP+1j5rFo
	tRS0nJmH9Xz1/MXFSxHlZmeD1w==
X-Google-Smtp-Source: ABdhPJwu3oh//1+a0FRI2G9uEQnHh7+1y4yE8IakxkxjuNBnuw+cVYa4H9XHGCGcdnOTZMGhFC2UkQ==
X-Received: by 2002:a05:6402:1607:: with SMTP id f7mr23223447edv.187.1632748759168;
        Mon, 27 Sep 2021 06:19:19 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:6664])
        by smtp.gmail.com with ESMTPSA id p8sm8726489ejo.2.2021.09.27.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 06:19:18 -0700 (PDT)
Date: Mon, 27 Sep 2021 14:19:18 +0100
From: Chris Down <chris@chrisdown.name>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jessica Yu <jeyu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] printk: avoid -Wsometimes-uninitialized warning
Message-ID: <YVHE1qclD6ZyjvvD@chrisdown.name>
References: <20210927125007.1581919-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210927125007.1581919-1-arnd@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)

Hi Arnd,

Arnd Bergmann writes:
>From: Arnd Bergmann <arnd@arndb.de>
>
>clang notices that the pi_get_entry() function would use
>uninitialized data if it was called with a non-NULL module
>pointer on a kernel that does not support modules:

On a !CONFIG_MODULES kernel, we _never_ pass a non-NULL module pointer. This 
isn't just convention: we don't even have `struct module` fully fleshed out, so 
it technically cannot be so.

>kernel/printk/index.c:32:6: error: variable 'nr_entries' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>        if (!mod) {
>            ^~~~
>kernel/printk/index.c:38:13: note: uninitialized use occurs here
>        if (pos >= nr_entries)
>                   ^~~~~~~~~~
>kernel/printk/index.c:32:2: note: remove the 'if' if its condition is always true
>        if (!mod) {
>
>Rework the condition to make it clear to the compiler that we are always
>in the second case. Unfortunately the #ifdef is still required as the
>definition of 'struct module' is hidden when modules are disabled.

Having IS_ENABLED and then an #ifdef seems to hurt code readability to me.

>Fixes: 337015573718 ("printk: Userspace format indexing support")

Does this really fix anything, or just clang's ignorance? If the latter, clang 
needs to be smarter here: as far as I can see there are no occasions where 
there's even any opportunity for a non-NULL pointer to come in on a 
!CONFIG_MODULES kernel, since `struct module` isn't even complete.

>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> kernel/printk/index.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/kernel/printk/index.c b/kernel/printk/index.c
>index d3709408debe..b4d90bab6d4d 100644
>--- a/kernel/printk/index.c
>+++ b/kernel/printk/index.c
>@@ -22,14 +22,12 @@ static struct pi_entry *pi_get_entry(const struct module *mod, loff_t pos)
> 	struct pi_entry **entries;
> 	unsigned int nr_entries;
>
>+	if (IS_ENABLED(CONFIG_MODULES) && mod) {
> #ifdef CONFIG_MODULES
>-	if (mod) {
> 		entries = mod->printk_index_start;
> 		nr_entries = mod->printk_index_size;
>-	}
> #endif
>-
>-	if (!mod) {
>+	} else {
> 		/* vmlinux, comes from linker symbols */
> 		entries = __start_printk_index;
> 		nr_entries = __stop_printk_index - __start_printk_index;
>-- 
>2.29.2
>
