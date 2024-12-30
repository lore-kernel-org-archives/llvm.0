Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83E15E8B
	for <llvm@lists.linux.dev>; Mon, 30 Dec 2024 21:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735593202; cv=none; b=h2ooNJnE7AVvJFbwV0h67QTEZgVpLqX+ZvNW/ylqoHoMSThr2F8xtX5ZYuNySu88og379+NHL/fxMKkXxWf4K//Y5xooL5JPSRFa8KGLJ7Sb8n0a9xY/dWUh82N3EQTSQcSSex4F8XD5TJFW8iXcYWAzo3S7ZBi4GVAR1IYeGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735593202; c=relaxed/simple;
	bh=US/njxnskLMRQWPbs6FYhXrTfTlwiqhM9pzSV1hoRRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcK3YnZArtD4qQEnZDtHzwFGaswLaVJtAq5RTL2Pbo1goAS5AzgTS9PunD7nGekwNCWimEAIiJ4KR0MzMyuiLpsAwT7MfoT4nGa6Nwq44YTbaKtdNTQUYtfzmlKyC5AFMlkHpzZwaayzld7f49BEV4d/wbLHiftjii/qBLOK78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dw1m1X3s; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dw1m1X3s"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385de9f789cso7200218f8f.2
        for <llvm@lists.linux.dev>; Mon, 30 Dec 2024 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735593199; x=1736197999; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBOnxzfVApiwH05Ju0EksnOX35OwJEW50GNlErilOTU=;
        b=dw1m1X3ssi38XMzG0NN9JWZC4CDio8orJ6ZomVmO7V9O+ue4fcHTYFV41u+BeXXVIe
         kG1OEv1zrzzKQSzU0oHtzRMsSR4+qbKfzQALhwbDyAnux3BhGKbL8VCsWzfU3tBcuspT
         5/YLjRQR/XP0ThYLsSi1a8XuRsKgu86tcOVWznfgDCnLU8BhMQOQWKDbzMm67upQwgrP
         v7NwXplqVSdScPzRUGtOgZUeC99W8MLytlJdtxeZV8UOyhzMFw8bJD+nVzsjZbnR8byr
         IWYUBMLaqykRNSvIx5yIONrmdfz1OYcoNEFTZmniH/+BicrZ4D+5oC21KIA9uifUBVgA
         W+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735593199; x=1736197999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBOnxzfVApiwH05Ju0EksnOX35OwJEW50GNlErilOTU=;
        b=NDa8zWI6fNM012IVYDVtlGZ552GZ9vD70NvmGvTp0FPrdr6pwM+yimPMjHFafrzbXE
         Z43F6f0lYdSvphe0bGEDeBE05+wLYggVDYk8PkYew2x1l50pcJuPyxVmKoVWn6mjZl+V
         lzHY+HJQrCnk3wxAPd6ipU03kx+jhsfAXUkyRdDe9YqA5EtkUGlw7G2C5X1pd1PZInCt
         NrS+okOwWqYbtH+q7NSyzx8ZNIpddgMiqAYRdJEGPQgwF6Z8vB6vOtLMk41HW1h0BPCj
         vw9cM4qzGEZJls1e+IHkS+uqxdcT7VD43h4xk+zCqWPPfLv0K+APpljk6Ihj89gnL8+i
         34gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk31O1/x+TiHaWAgCofSIvA3Xv8Zt++iE64ufF5FYCZGvhC+QrMxkilnfp7fN3B7TE2XqI@lists.linux.dev
X-Gm-Message-State: AOJu0YwfIO+hNxNVy7pszLQ34oiZvpeeTDP6bGlaLMyk76RQ8OyTVvFe
	JuW7MvasrKFrYYObkDP5JqkxRgYHs0eJCFpwxS4tA1NhgU8w25ROkYhY9jtfSeQ=
X-Gm-Gg: ASbGncujeeKS2eZbqsIjULibNMU+rWf+qPKXnmyndkMCqAx9h5QBeEuSzsf1/oRmzXp
	9wjp98RMksBDYOBjf0wOiS9wELC6aOA51cqa8P22vLFzAsxZMfOdDcHokAcaql5iOoSKC6qIrSt
	raRJUanYbK5/CxdgJ+RYVYQM4xdPNm9YhyAmiQioJQnmOl7mycB/UoJJtZbUhnp5GOotKmkBcHJ
	HJcEAz5n4hl0+soo/pQOhWzQFyQZb61G6EYnshx7FzBlm4NFPEl3LCgZIVu
X-Google-Smtp-Source: AGHT+IF7h5BI1NldJMda9Dqho2Xa7ov7jxQIUb8SRuudW0sdbf1kjSQV/G1ZAAp7Zun0c1Ok5OtEEw==
X-Received: by 2002:a05:6000:184e:b0:386:3082:ee2d with SMTP id ffacd0b85a97d-38a223ffb7dmr22972983f8f.41.1735593198569;
        Mon, 30 Dec 2024 13:13:18 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm365070905e9.36.2024.12.30.13.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 13:13:18 -0800 (PST)
Message-ID: <24b66f6c-b8db-4f2d-bd46-e4417cda7ef7@suse.com>
Date: Mon, 30 Dec 2024 22:13:17 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/28] cfi: Use RCU while invoking __module_address().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Elliot Berman <quic_eberman@quicinc.com>, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 llvm@lists.linux.dev
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-29-bigeasy@linutronix.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241220174731.514432-29-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/20/24 18:41, Sebastian Andrzej Siewior wrote:
> __module_address() can be invoked within a RCU section, there is no
> requirement to have preemption disabled.
> 
> I'm not sure if using rcu_read_lock() will introduce the regression that
> has been fixed in commit 14c4c8e41511a ("cfi: Use
> rcu_read_{un}lock_sched_notrace").
> 
> Cc: Elliot Berman <quic_eberman@quicinc.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: llvm@lists.linux.dev
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  kernel/cfi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/kernel/cfi.c b/kernel/cfi.c
> index 08caad7767176..c8f2b5a51b2e6 100644
> --- a/kernel/cfi.c
> +++ b/kernel/cfi.c
> @@ -71,6 +71,10 @@ static bool is_module_cfi_trap(unsigned long addr)
>  	struct module *mod;
>  	bool found = false;
>  
> +	/*
> +	 * XXX this could be RCU protected but would it introcude the regression
> +	 * fixed in 14c4c8e41511a ("cfi: Use rcu_read_{un}lock_sched_notrace")
> +	 */
>  	rcu_read_lock_sched_notrace();
>  
>  	mod = __module_address(addr);

I think that since 89245600941e ("cfi: Switch to -fsanitize=kcfi"), this
can be a call to rcu_read_lock_sched(), or in your case rcu_read_lock().
The recursive case where __cfi_slowpath_diag() could end up calling
itself is no longer present, as all that logic is gone. I then don't see
another reason this should use the notrace variant.

@Sami, could you please confirm this?

-- 
Thanks,
Petr
