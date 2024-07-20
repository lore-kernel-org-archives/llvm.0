Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D499449
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 03:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721447445; cv=none; b=Kaf6HYjdhPt/pTF6jSoLxih/Ur5WuVFQZBU0NKwBYKnQGo9Xrj7yhLNMwb8iAecW4GwQdtd+1yiyoQRPB0lkEhEB85cfAjuwINh4XTAOYvrP97xxMOdpLAVuD+Bx9agRbrruSUf2R2kwH764GbJuea+bWi8sL/9HrrvWKstgd88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721447445; c=relaxed/simple;
	bh=J4ex2F29/lCR/6YCIoO7elnvD2zeWnJc1AzOwzxW2Zc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NEac4Oxs8ZlkHtoXQI/Uf237Dz/Js42Ux851oconOaDmtGoX1BbiVdQUPNvoxZ9WbWasCUzTeAMelAF834ciBsg2P+uwg8ue3CgjPsYDHoQBaDr6h7WVGfqf25WuHP9IVstNcmdZBEAXOOkmg7G3E+avmWsVFo86rJ6YxnaRKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JirKPXaz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JirKPXaz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc4aff530dso365525ad.0
        for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 20:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721447443; x=1722052243; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgQ+bqKFrMl3Lq4YXQJFKFvrCLKIS6LwGYzQ+/HXsEs=;
        b=JirKPXazCrTr6VPE+SgsbKFpkVXsfjPrMdCDhDwbtjLPMAuWjBhVscVXPo+DjeQpsw
         Nyet+ROPwQLEcGUJrstYFcASiiAFOR3u4DMdCDlnaXLg/LrAHPdnOP96KqN+VMewkN+o
         UXVWGyG+xt829AZQnOOtj2NXollfvo8bLzJqdXIvcg7c8gYYrOb74rF9oftFTXY5T2WT
         BQIM1ptY+P82AODq2GukJ3cHfe5BnEgjPpns1sU1Ce1c0SJjkgv2d7JTE6yqWlzvrkSa
         jUt/qmcTQsN3npstjcjf67nYFQfAq5wMeeuGkJlcVANX3nys8yiwLSPi4678qhFs+Adn
         JReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721447443; x=1722052243;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgQ+bqKFrMl3Lq4YXQJFKFvrCLKIS6LwGYzQ+/HXsEs=;
        b=osQs4X250Ch4N5fjYA4VBUzro1C7oMhmXmcF9P3O2QfbFrpJSjmh/2dYiTKS5r791J
         W4/040LHrrTtXhksesYbYmvCZR/sr64hyn28n9qT8XPDuvtAfU2m69uK44wfGNvzfgQm
         otnn/6IaEXBx1lnOn5Xn2Sf6ABAUseYoaB+4ZgwgNXyje1UOPIMH36qi3XWBHS5vnZsZ
         kwSlmkFGPspbKIyMmh1SbQmsmYTbMmflUVyYtRNm58d6oIKT5Xbuf9nFhZtGdgL5Tg8w
         CcW9i0iHqywCpgFSW0kqZOcaDTyzSOSBL800ug35EfD1+v5a9t6CW1Y0whKBtKQk0MD3
         6YoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhZv1M8HldOf0ucdkqAJ3BMogEYTDViFI/5N9KHlwIrkh4UYHhCxu8gSXlXRW3MEw9B4JmD+IQZvj1URf5o0cjtLWdmQ==
X-Gm-Message-State: AOJu0YyBi6cQMXScE79UO31iCXoBmQuXtnHh6Xfw1LnpiJc+VL/BK4jU
	A2RphW8WEkcJl6PYnxcSb9ZOaL2W+YSdChEugl4Ua0QfHJTkZQS5pDOFkHDRew==
X-Google-Smtp-Source: AGHT+IHEokE74H5QtFVoBeTaSZMI1xJoxtvJ+TwGyHBeFZo1COTFEtdls0gjNPTrhi0Y1hLNOUbWWA==
X-Received: by 2002:a17:902:f68d:b0:1fc:548f:6533 with SMTP id d9443c01a7336-1fd7fe836c8mr69765ad.3.1721447442700;
        Fri, 19 Jul 2024 20:50:42 -0700 (PDT)
Received: from [2620:0:1008:15:652e:fdf2:c177:d5b1] ([2620:0:1008:15:652e:fdf2:c177:d5b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb77504fa2sm3651308a91.46.2024.07.19.20.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 20:50:42 -0700 (PDT)
Date: Fri, 19 Jul 2024 20:50:41 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Kees Cook <kees@kernel.org>
cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, 
    Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
    "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Jann Horn <jannh@google.com>, 
    Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
    Marco Elver <elver@google.com>, linux-mm@kvack.org, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
    llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] slab: Introduce kmalloc_obj() and family
In-Reply-To: <20240719192744.work.264-kees@kernel.org>
Message-ID: <cd446dfc-d6b6-781f-3a07-5af1edbf2230@google.com>
References: <20240719192744.work.264-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Jul 2024, Kees Cook wrote:

> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 7247e217e21b..3817554f2d51 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -665,6 +665,44 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
>  }
>  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
>  
> +#define __alloc_obj3(ALLOC, P, COUNT, FLAGS)			\
> +({								\
> +	size_t __obj_size = size_mul(sizeof(*P), COUNT);	\
> +	void *__obj_ptr;					\
> +	(P) = __obj_ptr = ALLOC(__obj_size, FLAGS);		\
> +	if (!__obj_ptr)						\
> +		__obj_size = 0;					\
> +	__obj_size;						\
> +})
> +
> +#define __alloc_obj2(ALLOC, P, FLAGS)	__alloc_obj3(ALLOC, P, 1, FLAGS)
> +
> +#define __alloc_obj4(ALLOC, P, FAM, COUNT, FLAGS)		\
> +({								\
> +	size_t __obj_size = struct_size(P, FAM, COUNT);		\
> +	void *__obj_ptr;					\
> +	(P) = __obj_ptr = ALLOC(__obj_size, FLAGS);		\
> +	if (!__obj_ptr)						\
> +		__obj_size = 0;					\
> +	__obj_size;						\
> +})
> +
> +#define kmalloc_obj(...)					\
> +	CONCATENATE(__alloc_obj,				\
> +		    COUNT_ARGS(__VA_ARGS__))(kmalloc, __VA_ARGS__)
> +
> +#define kzalloc_obj(...)					\
> +	CONCATENATE(__alloc_obj,				\
> +		    COUNT_ARGS(__VA_ARGS__))(kzalloc, __VA_ARGS__)
> +
> +#define kvmalloc_obj(...)					\
> +	CONCATENATE(__alloc_obj,				\
> +		    COUNT_ARGS(__VA_ARGS__))(kvmalloc, __VA_ARGS__)
> +
> +#define kvzalloc_obj(...)					\
> +	CONCATENATE(__alloc_obj,				\
> +		    COUNT_ARGS(__VA_ARGS__))(kvzalloc, __VA_ARGS__)
> +
>  static __always_inline __alloc_size(1) void *kmalloc_node_noprof(size_t size, gfp_t flags, int node)
>  {
>  	if (__builtin_constant_p(size) && size) {

I'm supportive of this especially because it will pave a pathway toward 
future hardening work.  Request: could we get an addition to 
Documentation/ that explains how common idioms today can be converted to 
these new macros for future users?  The above makes sense only when 
accompanied by your commit description :)
