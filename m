Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864A91872
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 10:41:35 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso71422015e9.1
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690972893; x=1691577693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YgNcim2dL7pjjmrHNNKr7SZxjAPH2vynKbx9rcM8Mlw=;
        b=YWplNLg7UPqde5B60m6OlJf5GN/pzFSb0R/iqkm3PB+Aa3UMsWIbRcf1T/qla7arVx
         GQ9twU0WygEmXeQtFkliWx6MNXs7fNpNcQqGnGlMmC6tpgp8+EzJrH1v8gU3Flkl+tdm
         9sayaVbI3FrfxwxpFiWaQX0p/aRVAdhbfS34vwd8iY4O+i+jGGRxXpDR89h07/u1fKkv
         tQuGN4A97NkVLcgKW3yJ3Byfl5QXCh0xw+kzT7ZFo+CsmYnp0jHYJFxTBeMQVbINlq7A
         FL68fC/rQwsdl7YoIwjSklcDptw2lXp22joZ/efQNyQmG4GVqv1hExYeL1shzWkT10VG
         HhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690972893; x=1691577693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgNcim2dL7pjjmrHNNKr7SZxjAPH2vynKbx9rcM8Mlw=;
        b=h2kwHNDqLl8K2Vsdnd5sidHfHQ/Y/LhxpFrlrpvmoHkv7o7AIpVCNBF6kxtYMKaWNS
         XT2JrIqz6dFcggD5sSUYEvPk+07OA2+c1ifJzdwz8N/yi1nO8u7w309h3wnSpvD+IwRi
         Sj6cj5ju2cDLRqWgbkHfUS18rP5Rnjuwz0n73MmkD5CZaicogylgXWewzDhKyiEPyQ/n
         wef2/4kkSuV3YVy4WnIESvbv/SVHZJkdqLqiObkzXZrDBw84hpmf93pIbJGprCAo7SaG
         U4he3jPlsIVz8H0pUwEYecLgSTzDtMxWhC6k7RhRJIWj1KcfiQlBeL7pDQzvJsJ+WLP+
         Dlww==
X-Gm-Message-State: ABy/qLbhhwVC6LHZba25rzgRE34ryhLsnbq9zucIGAikenVtRolLtoKS
	zWLCrRXf+HtOerOeorUg+VmEqA==
X-Google-Smtp-Source: APBJJlFWb9PEPbh90efGD3Dx/+mVuVjkBG6YAYZKDfYBbdL8Q9HknA2mANvJ1hlVkV/DhTtPLlvnsA==
X-Received: by 2002:adf:e792:0:b0:317:69c7:98ad with SMTP id n18-20020adfe792000000b0031769c798admr4622443wrm.3.1690972893500;
        Wed, 02 Aug 2023 03:41:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y1-20020adfd081000000b003179d5aee63sm10531548wrh.91.2023.08.02.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:41:33 -0700 (PDT)
Date: Wed, 2 Aug 2023 13:41:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de,
	kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com,
	trond.myklebust@hammerspace.com, anna@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, bfields@fieldses.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs: lockd: avoid possible wrong NULL parameter
Message-ID: <0bd584fd-74ac-4b08-ae03-12e329ab186e@kadam.mountain>
References: <20230802080544.3239967-1-suhui@nfschina.com>
 <531df8ee-ba09-49df-8201-4221df5853c6@kadam.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531df8ee-ba09-49df-8201-4221df5853c6@kadam.mountain>

There was a big fight about memcpy() in 2010.

https://lwn.net/Articles/416821/

It's sort of related but also sort of different.  My understanding is
that the glibc memcpy() says that memcpy() always does a dereference so
it can delete all the NULL checks which come after.  The linux kernel
uses -fno-delete-null-pointer-checks to turn this behavior off.

regards,
dan carpenter
