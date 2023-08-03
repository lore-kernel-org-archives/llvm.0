Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA197E
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 09:10:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so7482595e9.3
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691053849; x=1691658649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJpah36ty+h1V+d/yS60/V9o8V1RRKpQA+HMeX/JC0I=;
        b=zRU32KM/s4kejwypSNsftglC4dId0r9jmFUNmjuS56xQIPZKXicT/nxtm7K0Vo7rmt
         e7H37M922zt/gFoHsDGnUXQLs+jyzey5hfJLzRcvYwBowjqlU8tySGn/7oiJafC/5tde
         f0qol4Y3xusJ/wEZBTGEpSqzTQrZyMkwmTnWZt8bZ3Tewr+DkOsdty638egRkk2g/4RZ
         Gp+cfU27t6obG+V6TwMCjrKMsu5o2Q9dpUtpXZ7eTD7DWf6DMOf/+GepJGqhF1etOI8/
         fW/zxjuzkaC17izXgyg1IuPbrUX7RvxojGxpwHiLncGwtQrfSDDRQxYkZnkgT1TZKiEn
         hHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691053849; x=1691658649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJpah36ty+h1V+d/yS60/V9o8V1RRKpQA+HMeX/JC0I=;
        b=buZg+Nk8qY213ZQp+ItdGmnMVjcpeCDMaZ/SZjqGe4Mq8WjmEYi4JMDUFJMIlokc9S
         X9lZiS+0xue1PF/JeeiXi3pnmuw5cQAirlEofdJ9sYDkNFRWlds9pOz0Bow1d3elxOs0
         h82GNlIRdxjnFP6RRwkk/2Wa83A1nlFW79/ar0AhbNYxyvNBB6oYc1Ic0zvlraxb0C86
         hqpZRu7x1O0SKocVp1W8hZs6lUutPPCyBL98vvJUkpTXkUQIXWWNJYnB2Sms4WBfXg3k
         Ct4Q3/oDkUHd9fItWsodpNeWr4jxW7kd1yX4pgJWjU7QDxWuXGa39CGB3lB29P6FNo3h
         2BYw==
X-Gm-Message-State: ABy/qLYilnUFh4638ahZn9kuV2U65cBugiwvhy/07seafT00nKdkmawg
	MNi5kUEHJTSk3aFaSjaJBPxu8g==
X-Google-Smtp-Source: APBJJlG1QbuLw2+H8HhnJeVT1Av59WDq9CwoIWlgg+11h4NWNHUKX3rJlFzg7p+nNHtO4/ZveaIgYA==
X-Received: by 2002:a7b:c34d:0:b0:3fe:179a:9eee with SMTP id l13-20020a7bc34d000000b003fe179a9eeemr6942588wmj.30.1691053849395;
        Thu, 03 Aug 2023 02:10:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bce0e000000b003fbc9b9699dsm3702132wmc.45.2023.08.03.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:10:49 -0700 (PDT)
Date: Thu, 3 Aug 2023 12:10:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, chuck.lever@oracle.com,
	jlayton@kernel.org, neilb@suse.de, kolga@netapp.com,
	Dai.Ngo@oracle.com, tom@talpey.com, trond.myklebust@hammerspace.com,
	anna@kernel.org, nathan@kernel.org, trix@redhat.com,
	bfields@fieldses.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs: lockd: avoid possible wrong NULL parameter
Message-ID: <057a4eea-d55a-4402-81c1-46b04b405a73@kadam.mountain>
References: <CAKwvOdnRwmxGuEidZ=OWxSX60D6ry0Rb__DjSayga6um35Jsrg@mail.gmail.com>
 <18edc2c7-2fb0-493b-9a9f-549acce4e87a@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18edc2c7-2fb0-493b-9a9f-549acce4e87a@nfschina.com>

On Thu, Aug 03, 2023 at 12:16:40PM +0800, Su Hui wrote:
> Should I send a separate patch for this bug and add you as Reported-by ?

I feel like neither of us know if we should add a check to the
intializer or remove the check from dprintk.  If you know the answer,
than absolutely, please send a patch.

regards,
dan carpenter

