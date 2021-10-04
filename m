Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748D2F80
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 12:31:35 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id bd28so64067213edb.9
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j3+NTrKGFxPGR5lMV22TDnmiT6BfVPVV1SDrEBp3aXk=;
        b=O6lUjgv5/RmkoDv75GKCiEFyuEGSKsFUCencENjUDqGrkgJQVkxIZtZjU8VnAdfwt6
         gEyzSam26qVPlIwwtf1K2Ktx8bYDsaB7oFybuW8dtS3OOngk00UZ8MAKDs6oKGKgZ0pA
         eY7mnh5tym7TIsoWXHX6zo8RKhK7g6aBiBpQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j3+NTrKGFxPGR5lMV22TDnmiT6BfVPVV1SDrEBp3aXk=;
        b=1wR23pIY2uNpUfnHreh24kc1aikMg0KJ2oXHlH/kz0pmuKSxuXWnoU6CpYxFQ93vpO
         bkjlXbjqQOVP/Az6M5l97zE6kVgw909W5EvmvoJcYi3Mgx25AInW8yR3JFkr36T2VH0A
         R6oN10oWZDP2Og9L8IRjZLhMdTc1ScQhWLIcdGsGjBjn4u7C0SbMR7pPahcDkPdpVhZu
         Lwq1Q/0zplhx0pAF9NH/MOYdBYj/L/rrGJ3U8NyWuYMYI0lgexMIuqWMEH4s5Uc0Kh/h
         FYwfKSraOKJ7IvTNnQWYq8uTzkJgHOi5cwpT3+9io0W5Fwmm1W1ETW0B3gJfEJRYX+lk
         8FEQ==
X-Gm-Message-State: AOAM532HxcMZh0KP/XeTDC0UaCP/BrIzR2eI9FvHBTFlBt87w1yOBtCH
	NBliV5Chr3gGpOEcoEA59pH/6w==
X-Google-Smtp-Source: ABdhPJyCTMYab3bhdSRWmXA9IxDIE79OlIAQP4zIl/PVIgqhZErhowcR1kJRIn0y6/gf+MUY2jp7eQ==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr17910180edj.95.1633350687042;
        Mon, 04 Oct 2021 05:31:27 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:d19e])
        by smtp.gmail.com with ESMTPSA id s21sm4658614eji.3.2021.10.04.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 05:31:26 -0700 (PDT)
Date: Mon, 4 Oct 2021 13:31:25 +0100
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	YueHaibing <yuehaibing@huawei.com>, Jessica Yu <jeyu@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] printk: avoid -Wsometimes-uninitialized warning
Message-ID: <YVr0HRnfzttC/wqX@chrisdown.name>
References: <20210928093456.2438109-1-arnd@kernel.org>
 <YVLrttKajDU+1ZvX@chrisdown.name>
 <YVrH5MUdS6uE/zDj@alley>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YVrH5MUdS6uE/zDj@alley>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)

Petr Mladek writes:
>On Tue 2021-09-28 11:17:26, Chris Down wrote:
>> Arnd Bergmann writes:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> >
>> > clang notices that the pi_get_entry() function would use
>> > uninitialized data if it was called with a non-NULL module
>> > pointer on a kernel that does not support modules:
>> >
>> > kernel/printk/index.c:32:6: error: variable 'nr_entries' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>> >        if (!mod) {
>> >            ^~~~
>> > kernel/printk/index.c:38:13: note: uninitialized use occurs here
>> >        if (pos >= nr_entries)
>> >                   ^~~~~~~~~~
>> > kernel/printk/index.c:32:2: note: remove the 'if' if its condition is always true
>> >        if (!mod) {
>> >
>> > Rework the condition to make it clear to the compiler that we are always
>> > in the second case. Unfortunately the #ifdef is still required as the
>> > definition of 'struct module' is hidden when modules are disabled.
>> >
>> > Fixes: 337015573718 ("printk: Userspace format indexing support")
>>
>> This changelog should make it clear that this is theoretical and will never
>> actually happen, which is salient information for people who are considering
>> whether it should go in stable or similar.
>
>IMHO, the sentence "Rework the condition to make it clear that this
>is theoretical and will never actually happen" is rather clear.

Sounds good to me, thanks!

I guess it's unneeded at this point, but feel free to add:

Acked-by: Chris Down <chris@chrisdown.name>

>Well, I am not a native speaker.
>
>Anyway, I have pushed the patch into printk/linux.git, branch
>for-5.16.
>
>Best Regards,
>Petr
