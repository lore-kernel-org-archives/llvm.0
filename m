Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB17B
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 16:47:47 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so2011756wms.1
        for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWHjfdnMXLnQeONF9Y7BIQMZus7HNyosrdlc0gUe7+g=;
        b=J/jK7AjKWop+Rl0aFS17ZsocQqSdyG1w5Ph6rCrHVj4dfmwrZUj8WVXY9XDg7gZMrA
         vQoxexjnBVZU3MSWcWeLbtkg2EZd+EK5hpBv70HKajGab90wUbTNbtZ4/GxnC+G+f+EG
         zOl45XKkBDDTN2JXq1NTuwEWpb1h3RC5w+bug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWHjfdnMXLnQeONF9Y7BIQMZus7HNyosrdlc0gUe7+g=;
        b=4yzXpV2eZ7lAEIil0F+I1B7GAhp/Ayc8fMCraBfz9qrDoOJolLXsYA/92s7neqod+Y
         iII3tfi5uob7tdLpjMSSdyUmtk/7Zud4XLiVtAQvd3FPtVmwVq7w2KrFDlY5/8YvSW+q
         I7WwsX3YpkMl+wv/jsb4sUv0P5Kyg0W1kvqHA7HA3e9Wp8CL/mjQWTaYrKYLh6mrwDGL
         qinIp7Q6Xx4utJ1veKzcnSZb7YZVaqXUxcgFwvI1EPykhVbR6TPn/C+rrqEI3OzbOw8n
         /dfa2ELvK0qUlO2McYDJkr7cHiEbqY5Ua6xFRHxrzl24fU9AaVu8enEEKOK3DoG022X6
         Klyw==
X-Gm-Message-State: AO0yUKXiBkZcQLXVstJ9x51XGwYNe9PFaKbMpypXiiKcTL32Jgg+XvhB
	jIdlueuaTBRHtvZcCOmKlCEygw==
X-Google-Smtp-Source: AK7set+MohFiDvkgUEA4Wr16OZCzBJtedjE0Hptcz9oaS3aTwTVVgZk8Ofwc7gmlHvDYCR8plie/NA==
X-Received: by 2002:a05:600c:4747:b0:3dc:4042:5c21 with SMTP id w7-20020a05600c474700b003dc40425c21mr2562744wmo.6.1676479666061;
        Wed, 15 Feb 2023 08:47:46 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::4:270c])
        by smtp.gmail.com with ESMTPSA id he8-20020a05600c540800b003e208cec49bsm566397wmb.3.2023.02.15.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 08:47:45 -0800 (PST)
Date: Wed, 15 Feb 2023 16:47:44 +0000
From: Chris Down <chris@chrisdown.name>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: mcgrof@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] module: Remove the unused function within
Message-ID: <Y+0MsMomkcDBdjNI@chrisdown.name>
References: <20230210064243.116335-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230210064243.116335-1-jiapeng.chong@linux.alibaba.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

Jiapeng Chong writes:
>The function within is defined in the main.c file, but not called
>elsewhere, so remove this unused function.

Huh? It's used by __module_text_address(), no?

>kernel/module/main.c:3007:19: warning: unused function 'within'.
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4035
>Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>---
> kernel/module/main.c | 5 -----
> 1 file changed, 5 deletions(-)
>
>diff --git a/kernel/module/main.c b/kernel/module/main.c
>index c598f11e7016..062065568b40 100644
>--- a/kernel/module/main.c
>+++ b/kernel/module/main.c
>@@ -3004,11 +3004,6 @@ SYSCALL_DEFINE3(finit_module, int, fd, const char __user *, uargs, int, flags)
> 	return load_module(&info, uargs, flags);
> }
>
>-static inline int within(unsigned long addr, void *start, unsigned long size)
>-{
>-	return ((void *)addr >= start && (void *)addr < start + size);
>-}
>-
> /* Keep in sync with MODULE_FLAGS_BUF_SIZE !!! */
> char *module_flags(struct module *mod, char *buf, bool show_state)
> {
>-- 
>2.20.1.7.g153144c
>
