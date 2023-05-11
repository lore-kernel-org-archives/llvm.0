Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF417722
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 22:21:02 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so64211105ad.3
        for <llvm@lists.linux.dev>; Thu, 11 May 2023 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683843662; x=1686435662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wlwojL1oOxSkE9A9E+XKPYHRgPZOzZBvK0faNul9WI=;
        b=Woh7eW/zLezx+tGcvpmJSrs1YDJCJJCMZAs0advUs5dvcXKQhCet0bdYHjzQ/SQjkG
         MIWaOCgflPc12/F/qzYLnCLtIDDOQeRiGCUq40AjjV43BNkTyHYjlFZIqFrRDescw19g
         wuiOK5rRib4rMTT3f73c0+QQGJqRmqPryqZTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683843662; x=1686435662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wlwojL1oOxSkE9A9E+XKPYHRgPZOzZBvK0faNul9WI=;
        b=Hx4jl0ezPzWms6fubuteKbH3udX+5QOLui/8YhFoSy5gPWPlD90E7Y7JbDFQYP3bRv
         Qi3nvP7/26Me0V0R25KGwwCWqMV1EWz735eOyZkwD+Fbst40hOmcaMEQEqJ5fWpO0c+s
         Bjl2tRnhAomSXMvenH23vJSMBhJVAJF2XRfq+Si8d1ZRmXupPLkNE7jJryJJb83b/3T3
         iACARt9DsM4aZL4h6hO/qis2no5iIo4VXo9o4cLHOuCzbWbI9VwCWi8y3LD0kJd12xgO
         lmJSoxg+d5yWFsO4AzMRAyQUU3w7S+lPdhRUaH60RaEA+S5wWVsQjgsRdJYGR0ocN/0C
         3R/Q==
X-Gm-Message-State: AC+VfDwriWsTjZnSi45gUk/Bou+jDJQqlSevM4VttghHh9qaw10AckOP
	rMLIa4l3pv2Qu6m9ZHK1A1rEkA==
X-Google-Smtp-Source: ACHHUZ5gx/nQTd7MJcU+6HgrvcbdkMWHr+5/LzInvYhhOp0ogFqj0xEE1dO9byBVj8rTrR2lt8KXKg==
X-Received: by 2002:a17:902:a609:b0:1ac:946e:4690 with SMTP id u9-20020a170902a60900b001ac946e4690mr11358838plq.49.1683843662240;
        Thu, 11 May 2023 15:21:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090ad24300b0024e47fbe731sm16068073pjw.24.2023.05.11.15.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:21:01 -0700 (PDT)
Date: Thu, 11 May 2023 15:21:01 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [stable:linux-5.15.y 36/9999] arch/s390/kernel/vtime.c:132:2:
 error: expected absolute expression
Message-ID: <202305111519.04845F7@keescook>
References: <202305111705.8j4cTm2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305111705.8j4cTm2s-lkp@intel.com>

On Thu, May 11, 2023 at 05:14:16PM +0800, kernel test robot wrote:
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
> commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
> [...]
> >> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives does not support instructions blocks > 254 bytes
>            alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
>            ^

Thanks for the report! I don't think the new errors are related to this
removal, though. This patch was just disabling a potential build config.

-Kees

-- 
Kees Cook
