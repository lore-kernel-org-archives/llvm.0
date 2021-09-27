Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A03FCB
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 13:38:20 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id b26so21067284edt.0
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vfh9KgsSP5BS01eoNyHXbYSyVcws0Zy+EOjKOnp3P8E=;
        b=OrR/WvkvrCcU2JkTzAR28z5yCEBU6NmpL8A9PQ/OezThMZ73yeCPVAWA25UTs+q1y5
         rWcmEX3ByfwWpUUT1+3lMYA7uvsWMbE8cClXS18a/aICVYB0l73Mw8ZWHpd9xJic4FSy
         xrqHvHJqnT+FmJOExmkX4OwVoJU8Pkne59NCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vfh9KgsSP5BS01eoNyHXbYSyVcws0Zy+EOjKOnp3P8E=;
        b=w/plO+8EdyhYIURgJZyTBNIaxlDplclWP893AWWE9+7n2lNIGgc5xhDJuKB9GamiDx
         CeQb4YUedW97jclVbzlGLWihnSLNYl2xWa8yOAOUKcLf/Ww6eW9kIJVAd6ScCnapK/K2
         FvUKo3rZWxNJ50+0RoluosgCnP3H01vyMoJ3wXIh+/hNyZD3vtL5z4Pi+Cj+R4LoBEVL
         qIdijrcsHpWBigmK0NVST5YyjDDT66oZLKEGcTuTCq8oPEV2C5ghoilSqpXBwER/9PKK
         cbkMlj5Sq3qGaeGf6Ag6ASjQHEiUBtWTmONRBCeDkE+WkKq3tFZwkOBpOfTPFsiSKyP9
         exnw==
X-Gm-Message-State: AOAM530K0FPU5YBJwCBDuKLuN7+VE7Ceq7HCZuySQ6bXDnluBPPOvGuJ
	C3s6nRTUzfgVKxnknMpJKbaCqA==
X-Google-Smtp-Source: ABdhPJw8T4czYppZUGA/cNfzdAv8mXU5pSwjFFaXF8JTL2wc1biR2uhah7881crI+rmaqRn6SGsN9Q==
X-Received: by 2002:aa7:c2d3:: with SMTP id m19mr5923709edp.267.1632749898737;
        Mon, 27 Sep 2021 06:38:18 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:6664])
        by smtp.gmail.com with ESMTPSA id u19sm10910035edv.40.2021.09.27.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 06:38:18 -0700 (PDT)
Date: Mon, 27 Sep 2021 14:38:17 +0100
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
	YueHaibing <yuehaibing@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] printk: avoid -Wsometimes-uninitialized warning
Message-ID: <YVHJSXYXl4QnF/7O@chrisdown.name>
References: <20210927125007.1581919-1-arnd@kernel.org>
 <YVHE1qclD6ZyjvvD@chrisdown.name>
 <CAK8P3a3_0njnrTokeXmOuZ1vA00Nk9pqbxsOZw+6QcCL-Ng=xg@mail.gmail.com>
 <YVHILl7E5RI3ohyX@chrisdown.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YVHILl7E5RI3ohyX@chrisdown.name>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)

To be clear, I appreciate that some tradeoffs need to be made for the nice 
warnings that clang gives -- and to that extent I'm ambivalent to the patch -- 
but I object to "Fixes:" for something that doesn't fix anything at all.
