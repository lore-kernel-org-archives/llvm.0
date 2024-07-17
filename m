Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B121109
	for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721227240; cv=none; b=J56oBf+Ya46OPflm3yc/OrIxLPRKbwJ4zsj3w6urdPIFpNuL9/e3h+JowQtEzBs+RG3iG3xSN6aIQq+64GvqEtGqwb04ESgzFRyHz2vg93wKWV8CiObifWjzJ/wCVCajqdTWZJLIg5dznOftqWokFotZIc5V+oFOyOiPDpwMQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721227240; c=relaxed/simple;
	bh=+cqM+pZK352HwU5frTpgb4pjngsVXMFRVEWBIdM9+Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/D6gfw6cM31KYBpV7Ac1n3hvUm6QV9TNOeib3Rop99wcdSsiZfytk6p4zKh2QcP9N+Wm5Cvt8/RVO2bSCBezqfbTBNRa9fJyHaGn8nThjL6FZhHmhivR3pnz/8yNEhamnygg2yUCOsmEcwaou/vQGMUcFbUAplL+o3quF7El10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM8kbjXd; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM8kbjXd"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eedebccfa4so51312221fa.1
        for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721227235; x=1721832035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exCaK8M+IVOutz8AA1dE561HuzN3r+WbizxFtXswF5Y=;
        b=FM8kbjXdslg7cYjJ3bhFiZ8+nDgOMA4ZOJajnRzFokKFqUPZfh4S5ADrNRAKLxCS6k
         UFDcpH881LMZfgyIb/W6EWCfl17sRt8NegM4P9Xfp9stmia+reIzAzAzsAg2BE7us033
         cQN8Eq2hymk6HfE9r/BVvLW4n24YwXgKs6w3wUMi9pXI/cI8AYfHE15lIi6JmTNEdMN4
         DKcfWDnDgnUYkSuRs2cGar9NCcxUEwzaNVw/lOgTtdCvWs4OVlFFemVu/nrFXcl3qkYE
         ACfyhCvc+z17uRjYAsFKzEIsAsxVvf1281E2AkWKPyH4N2/ND169P6KEXxL6oTYjgnEL
         Xkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721227235; x=1721832035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exCaK8M+IVOutz8AA1dE561HuzN3r+WbizxFtXswF5Y=;
        b=u4j96sIEBaCBlh5hkwnCO7henFQd1pxLZ1nGz5IjLvXULzEtFTH2rLl7VgltYGxCN8
         Ge1kk5BE68J74bWZB+z0AEn3WX4gW/EBu7W0IJbM4yJ2y34WenUe4Y1bOM6/c2C/tonn
         Lw0pBmUfFa3tESNqqoIxngQmA94xwE/Dl6Xzrh31EyQc4Nj/1hIVGkM4bevdqZDiFulJ
         +EElGzCYDgWnqmKW4w9pPDe8acrDta0Nr5amXwV4rNS0O1YEhcZvPbXVylhmjIMKzdwo
         TBt99+EugGK7qBbLnxD7OCjabHF/znZkERCw491Ey0+uo6yF+R0WDYDoY9tfqYKTVWne
         z+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWiem8GvB6HjVFzgG+Ww8L2QY+bG6V0nFphcO4hpqFT/MZpq0HcT02m1WruWzthF4ZKWxaUaEvz+TihdiTF52+x01591w==
X-Gm-Message-State: AOJu0YyByGIZi1CTgfH5OHn9LfyfdGgxVVxNMOkDLBYfp98cecEKj8xl
	hO89hhF2lmOG5V26UvZlga9XN/3poUqst5PhvlD5H+qe/bcMl1xk
X-Google-Smtp-Source: AGHT+IGlFB/5u6bBosn/exSsjgVwwLykPI+2u+YZGoEyoIoszW9DKCvlegrjxtJe81bngK8nvhddCA==
X-Received: by 2002:a05:6512:2803:b0:52e:9951:7881 with SMTP id 2adb3069b0e04-52ee5411e4amr1515180e87.52.1721227235116;
        Wed, 17 Jul 2024 07:40:35 -0700 (PDT)
Received: from gmail.com (84-236-112-196.pool.digikabel.hu. [84.236.112.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c78076f7sm241275e9.37.2024.07.17.07.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 07:40:34 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Wed, 17 Jul 2024 16:40:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 1/2] x86/percpu: Fix "multiple identical address spaces
 specified for type" clang warning
Message-ID: <ZpfX4KelYaXsHlHe@gmail.com>
References: <20240526175655.227798-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526175655.227798-1-ubizjak@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> The clang build with named address spaces enabled currently fails with:
> 
> error: multiple identical address spaces specified for type [-Werror,-Wduplicate-decl-specifier]
> 
> The warning is emitted when accessing const_pcpu_hot structure,
> which is already declared in __seg_gs named address space.
> 
> Use specialized accessor for __raw_cpu_read_const() instead, avoiding
> redeclaring __seg_gs named address space via __raw_cpu_read().
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> ---
>  arch/x86/include/asm/percpu.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
> index c55a79d5feae..aeea5c8a17de 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -160,7 +160,10 @@ do {									\
>  	*(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp)) = (val);	\
>  } while (0)
>  
> -#define __raw_cpu_read_const(pcp)	__raw_cpu_read(, , pcp)
> +#define __raw_cpu_read_const(pcp)					\
> +({									\
> +	*(typeof(pcp) *)(__force uintptr_t)(&(pcp));			\
> +})

So shouldn't this be carried together with the patch that enables named 
address spaces on Clang? Is it possible that this patch might not be needed 
in a Clang version where named address spaces work as expected?

Thanks,

	Ingo
