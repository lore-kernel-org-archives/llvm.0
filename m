Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D61867;
	Wed, 20 Apr 2022 17:40:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id y32so4282645lfa.6;
        Wed, 20 Apr 2022 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fDm0hCeP1iuF9WL7RiqDe/J3rtlxPQX1zeA/vezHRa0=;
        b=WA6ZRCaU3cdlumlpbvWHxfloi03BAMhbknENhqsaWPbHRTCv9SZOTLs6l5atjl/rNB
         WhDgJgxuFoJ/Qjj/q6o0HjImWWNexAoe3iis41zRi8T7cp+cNxoIeLsaIrzGx7M+aP5f
         yTAUWAt+k6SrK4lNorKyp7zkayVMzWGHtU826B3wT4VF+PqS8rhJhhQw+6nzVJOpHjPO
         Z+fl0//75bOefoMVkqelSYCTT7/Fe7c10WZtohovtXDzsn3PyILek6foHM5/OQmQFSLW
         u1+mJd34DWLpm19EGHWC0J1RcHPjVNnGwatLnAkk0E4lmNtGfNVpgiVhfCCchSqTE+cC
         Tr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fDm0hCeP1iuF9WL7RiqDe/J3rtlxPQX1zeA/vezHRa0=;
        b=WMEi57qSd9EkeFHulpYq+I8GI/7Dyrqw8rpQZMk5iPwa0aPWIAhDUAeVKlI7f4ydlm
         qRoRQLKBFGfYjj2jXICSpJErIaiBa2OC7sGFwsLlEzaTq9Y0ff4T0HVn+uG2h41mzFuh
         SiSTCqoyQCbadkYUSlEqv6V/cE0dJcb20ejmUr7YijtKJe5qBLlgniYYXqXIT4Q+pD8D
         jdUCMH5/ku2X5e1EUaexF9QO1fZ1xMGom7Kza5pWfCFD2nKuFI3UxxlDhBErCE0nOclH
         fyR52W9OiPSupTNPk5iABW6cEtXvNp4dZpOmIG6nAj5pJ3x9k7VuLC73T97MrvLXwUyL
         fi/Q==
X-Gm-Message-State: AOAM530v76bN5SEh3pN8le9pnJQNBsjkJaPyTm01vPme7/CWdhcI/bnd
	yJNsgIFXH/jBYWWvqF8Yk9g=
X-Google-Smtp-Source: ABdhPJxge8XTkpASmraJ0VjrGWjf9n/ju/ayI7pvlM3z8AJpfQOWU1Cqk3TRPVw0hpSrfMk+YQhJmQ==
X-Received: by 2002:a05:6512:1504:b0:44b:36e:b50d with SMTP id bq4-20020a056512150400b0044b036eb50dmr15640332lfb.558.1650476402746;
        Wed, 20 Apr 2022 10:40:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id s17-20020a195e11000000b0046eec768984sm1785063lfb.200.2022.04.20.10.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 10:40:02 -0700 (PDT)
Message-ID: <90e11a93-4f3a-2209-2bc2-acfb791b8ac0@gmail.com>
Date: Wed, 20 Apr 2022 20:40:08 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fs/ntfs3: remove redundant assignment to variable vcn
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220418140038.82843-1-colin.i.king@gmail.com>
From: Kari Argillander <kari.argillander@gmail.com>
In-Reply-To: <20220418140038.82843-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.4.2022 17.00, Colin Ian King wrote:
> Variable vcn is being assigned a value that is never read, it is
> being re-assigned again in the initialization of a for-loop.  The
> assignment is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> fs/ntfs3/attrib.c:1176:7: warning: Value stored to 'vcn' during its
> initialization is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>   fs/ntfs3/attrib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index e8c00dda42ad..fc0623b029e6 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1173,7 +1173,7 @@ int attr_load_runs_range(struct ntfs_inode *ni, enum ATTR_TYPE type,
>   {
>   	struct ntfs_sb_info *sbi = ni->mi.sbi;
>   	u8 cluster_bits = sbi->cluster_bits;
> -	CLST vcn = from >> cluster_bits;
> +	CLST vcn;
>   	CLST vcn_last = (to - 1) >> cluster_bits;
>   	CLST lcn, clen;
>   	int err;
