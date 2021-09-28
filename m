Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC93FCC
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 10:17:29 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id s17so62510583edd.8
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qy/OhkG7/nBN/uH+Xm8mLuhr2toXlD8zRFmyBJAngNk=;
        b=n4R/gO+WpLz/LARVBdI+rPe42jV5ePxKm7MKiEnEa2dA+0AuYCow8Hxg860n7OVWoi
         78Hsl0SMnL5f1vjqdAz2mhEENPF5/usDuSZW+qoJ2dy9aQTIcI7ov4e211r/gyt4ZaZa
         SaEyhxsCzQ8/nivCEy80UNOa2P40ovsbNCCp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qy/OhkG7/nBN/uH+Xm8mLuhr2toXlD8zRFmyBJAngNk=;
        b=PcceDXHXYkEEltHJ8m6fppgIeELOGg2wRTMkTnzZ6UFJwhZLzXamYXDmo2w8wsdFWN
         m757kGsQmF/o3hxrA9EXKJPfJIcv0hIXNPru2fERw6QA/PIgtbqGzjETa2HaIdKXbxp+
         OYMtYPQZNMhhFh9OCK1nE1ojrvQy3RsyXLKF1tyT9CkfTq60v7QFgsySjucO5/fLH/HS
         9rTyHfDDPH2ypHVL0jw4BKZDYjiS3VjcE2eNGfJC9c2SrXUHbq1PkdWjiFRYw4rPsn2k
         mEkCqaVrrxYdpJJU5uEoR4wbsy1g8So/G9FFY19DJEp8m7aKvRtWVEZUHOJHxTLG1o3S
         QywQ==
X-Gm-Message-State: AOAM5334/+Gl/sbdwqJU1zLUAAqS5XrAk+n50/i1mvhF0pNMIZVXMmpF
	QOL1EJDeEKaqYM5e+G3DF02STA==
X-Google-Smtp-Source: ABdhPJy6NZ0BOuVQI1vFfC17Astd6UY/xUNYmy6YlAYEbVdMM3i5Z9Zhg0B+6qxSU9rwMZ9G3PtGCw==
X-Received: by 2002:a50:bf07:: with SMTP id f7mr6555611edk.288.1632824247838;
        Tue, 28 Sep 2021 03:17:27 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:6664])
        by smtp.gmail.com with ESMTPSA id l18sm12788934edw.78.2021.09.28.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:17:27 -0700 (PDT)
Date: Tue, 28 Sep 2021 11:17:26 +0100
From: Chris Down <chris@chrisdown.name>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	YueHaibing <yuehaibing@huawei.com>, Jessica Yu <jeyu@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] printk: avoid -Wsometimes-uninitialized warning
Message-ID: <YVLrttKajDU+1ZvX@chrisdown.name>
References: <20210928093456.2438109-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210928093456.2438109-1-arnd@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)

Arnd Bergmann writes:
>From: Arnd Bergmann <arnd@arndb.de>
>
>clang notices that the pi_get_entry() function would use
>uninitialized data if it was called with a non-NULL module
>pointer on a kernel that does not support modules:
>
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
>
>Fixes: 337015573718 ("printk: Userspace format indexing support")

This changelog should make it clear that this is theoretical and will never 
actually happen, which is salient information for people who are considering 
whether it should go in stable or similar.

>Suggested-by: Steven Rostedt <rostedt@goodmis.org>
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>--
>v2: use a simpler trick of having an 'else' in the #ifdef
>    block, as Steven suggested.
>---
> kernel/printk/index.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/kernel/printk/index.c b/kernel/printk/index.c
>index d3709408debe..43b45a916ff6 100644
>--- a/kernel/printk/index.c
>+++ b/kernel/printk/index.c
>@@ -26,10 +26,9 @@ static struct pi_entry *pi_get_entry(const struct module *mod, loff_t pos)
> 	if (mod) {
> 		entries = mod->printk_index_start;
> 		nr_entries = mod->printk_index_size;
>-	}
>+	} else
> #endif
>-
>-	if (!mod) {
>+	{
> 		/* vmlinux, comes from linker symbols */
> 		entries = __start_printk_index;
> 		nr_entries = __stop_printk_index - __start_printk_index;
>-- 
>2.29.2
>
