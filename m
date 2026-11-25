Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625140;
	b=I2H64gdxQsngScGSzo9jySdVysO2sDhgYPWnnKhnwBiYRCsZiLxoVTZb9Rp6/5tDK50x
	 SrEVfBFTVYs8ie89Le/KKa3wyVnPJA/SXzvDPRiZ7itNfcY4958JwJWT+Sm+jrVDdYnZW
	 /HI76VTSxTNtc8+hE7OJ+nQBSWtHNEIYRDPa2XwPENk6IIDQ4/lUN6f7Sx0Ocz/b8PUIg
	 JBWCSUx9n7aSGe+VouTHv+DN3mdVvJJweV6vWcAzim9MNhHsYEFR7CA5CjjjgdTRW70ip
	 UG09IYcA7uc4jvS/kG5G4HwvM6M4y4AmB9t3+vc0u21GbdMZ7jVrVWw4GQ98qlZ96Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
	b=FpHbc+mT7FS5/a+x2/i4zifLJhY9YrtsNxKkDaPg3FkUm/SPZ8MuKidTcnzI4kqyeJcH
	 de6mopj8qQQtwHvtzInNGsij6wtJGNHc05kn0HMGCL7Ju0DatgUAZwXR8nUtrLSrtNPWB
	 e2zpWgiG9kcBjRNkMmTjt+4gsJCcwUvJzjJG4jvS2yaYrjR2KCKUhyqAEm66n1FwqjNWE
	 KxWD01SNHRNUUpakSKhAZB9TBWwb4/B7x/Di2W+xaezxVBTTe55H58WVwgbk1GwHSskUO
	 NmXmcNddN7qlIHwpRlG1BjDFudAJDuiXBJfG8RAuMKNtErieERswCMpq3NZrlFNt1ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fmEuK1QL;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6FA606A6BB
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6FA606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fmEuK1QL
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4919335f8f.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795625138; x=1796229938; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=fmEuK1QLmlLAq/P+t6kh+4fIQjC1e5omaCg7xDC4ubv3Vsz43A97SvAPvSzJJO2r3j
         bQoNwF1sOlukl99+hsyinZOLMSNxmDQ8mLEiLjjdTMeILCu19Jhgi6fFLsCTpF2mWtka
         KhYaut9ygyT/TNjZhS5yDaaBdpXjkck2X2Zk2sta+uXBHAIrbRxmSzgx5RDhWhMytHhv
         +HLRwceuSBfYJi+LUIZZLHcPGwo8uWnSuzdTGFtr81mpuZUb4F09u5WHPzDzQd/AaXiv
         9Y0Dy6rgyXGGQyn8J5w1kPOiOp/Zf98dCyZD8rOFjPeeFx2jTM5qrV/39rLUT0nNuW3k
         qyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625138; x=1796229938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=QLaMrmJ6S1R59wgQBhxto/nOjR6Q/hh9kOAcLdUZenZhPb3GrUyl9kzysZb2GAqA9v
         cCJHeVBrub/b7iBtv9o94vfstn6LCLLKYvWyqnwvIkggxLup1D7KXEUKmEm0WztljZ8M
         RT+NR/v7IwVlNAFbt/q4KhuBFtrimdC1Y1AtVZs/YCrGi74nT7J9/Rl60fjqD94KzYEy
         5mQXoKjC5HG+BeREK6Zfyub3mK5d0pX8XHHP+iuS22QBdd9vrXdnZL0notgrrsRg7Ied
         +B+k4Gu2VRK/Z/ZOEO3MxZrR1HNayr3xPcqrqr+t6jzALcf9T1fwMA2oTyHxQ93zx0yh
         l95w==
X-Forwarded-Encrypted: i=1; AL+hErFzqPeZmQzNVVV1KmbLMFVwA+dZOmHtX3iZfcTb0Rfp/oLOqeFxw9DyryF1McqZTfAoz0yV@lists.linux.dev
X-Gm-Message-State: APuU4Z9utq73teZXX2gxqAXPikzCV1/OuLE/Oaado+LQ7EMrzyMQMg12
	hY2cC26TUASsVngdxyaDtATDbjmmT5WbNECowIw4l9omTINS9WUog5KmcUYKh2AUMTU=
X-Gm-Gg: AZFdTZeHToqXKtaHEcwh4P48RsmilIXvDkUOgtsAPI+uj67EI0a/lqwtOMdgz7xHJ6q
	xpe8swiemL5uVz2lCX8gU8s51KKB+XE+ETHhorrnKgS6CUbsKFBGnKKNUauFe/QvlLH3PJAs1XW
	Q5Iu1+AIjd8OGRgQX6gYZszi76a+bG+nNvSONGRq6CAojwyTlpHCZvSbJqElyBHFn9AhHECF/6i
	DP882r7DnXcbYwP3N6Ng5rV5HQAvBNSJn/N+Q6U+ZM8NQYBai+I2+i6W1iaVOhaLPHjUW7Fk4oh
	SHiEjRakDKbW6UD0dIj7EBfB6cWm09C0xxx1NO+CH/NB08c1wrCXKvVUEDd5fn9bc4klxUdBDc8
	pwt8Ari2ZEhIWcpqFXbX7LvAEbQt43ctW6eJyWSh31fve/BEvtNOyBNk7ysYMRzoL51zh48TOYl
	rjy0588v1bpNyIx4kWB1YReteKiP004xyYYo/6W/JQ8ZRjBuTjSgfHtQDVM1GSUUpqvjejcuyFK
	FHTtKMoDVGXg1S5HCHKX5zgU3SHoR+rDGq5qFvFfN02KD6woWQLVoVFCoWuiCxeLxgYynxv5VQ7
	cXVdj2r+8HxpJ0vnV3bchMWBRKjDLNpGfYpfqRia87DS/MpNLq0DOZe9lrKZHLoRnQ==
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr35982135f8f.27.1795625138335;
        Wed, 25 Nov 2026 08:45:38 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm34852448f8f.37.2026.11.25.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:45:37 -0800 (PST)
Message-ID: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
Date: Wed, 25 Nov 2026 17:45:36 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 David Laight <david.laight.linux@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 11:12 PM, Samuel Wu wrote:
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
> 
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
> 
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
> [...]
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index 1ff8ce857d92..72006c9bad42 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
>  	return -ERANGE;
>  }
>  
> +/**
> + * module_kallsyms_find_name - Find a module symbol by name or prefix
> + * @symnum: in: index to start at; out: index of the match. The index
> + *          counts the symbols of the searched modules in list order.
> + * @q: name query; if @q->modname is set, only that module is searched
> + * @value: set to the symbol address
> + * @name: set to the symbol name (KSYM_NAME_LEN bytes)
> + * @module_name: set to the module name (MODULE_NAME_LEN bytes)
> + *
> + * Undefined (SHN_UNDEF) symbols are skipped.
> + *
> + * Return: 0 on a match, or -ENOENT.
> + */
> +int module_kallsyms_find_name(unsigned int *symnum,
> +			      const struct kallsyms_name_query *q,
> +			      unsigned long *value, char *name,
> +			      char *module_name)

Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
with similar names. Adding module_kallsyms_find_name() adds more to the
confusion, being similar to module_kallsyms_lookup_name() and
find_kallsyms_symbol_value().

I suggest calling it module_kallsyms_query_name() to match the
kallsyms_name_query parameter and to express that this is a structured
query, as opposed to a simple by-name lookup. It might be a good idea to
similarly stick to "query" instead of "find" in kernel/kallsyms.c.

Otherwise, this looks ok to me from the modules perspective. Feel free
to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
