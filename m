Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F411186C
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 22:46:58 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bf48546ccfso18179035ad.2
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 15:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693262818; x=1693867618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jfbVDtnUzC7S/98XQMX9mkLUChZIIcF3EqTa705rK40=;
        b=DpUgaRdGmyys0YbzcJ+/+C/4TT7jf1NRTxh6quRzHmf0W7ShC/TICRXTpcZ+bfooDZ
         MGEwb57HzW4HbsZv5qXAym6Vuj27xlfQRiC7IqWvDgw6tbgIsCaLtpawdHEDSOzx6h/C
         KdyPPAxwPmi/1KKanDD8q1ldw/5UXMQMWlcwjeePUW9NFPerJvASgEvRs1+i1viJg2sW
         4M54QrmCfMkGjh1r23unlGBCYVLiyLoj+GtplXm8aPBKD0pPKmqMO1jqR/CZrZyGuecf
         NHMVctNEvEYrD6lKE8Ul/08Ky52jOkCUMqMH62NW8vYpwWQcamzhUW4QOVJJStjHcvjI
         BlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693262818; x=1693867618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfbVDtnUzC7S/98XQMX9mkLUChZIIcF3EqTa705rK40=;
        b=F7wu8iEj8Murq/5OAeN+oa4il+lT4wnlNO0CKgdqbMdAxlDSfvBiOlzzrhz5f5zKr7
         sfRV32wtb33vM2GN1GELTR4wyrdwGWIupG8SLv4WwQl9Myst3JyQcbePH31Jzn2syGnY
         etVfBc4oHvIKeHeASiLRsReqqnFfm0A1E4Y5eZLegDM1s7svdmrb658g4Evac+ZzWaCg
         es06HzbjfgsoTDTRU7N2ksX0iaV5K8n19dt+vCpnv4ME84HUYxdUxgldPkVBZ0kIzps2
         gjrDSQSKaYQ1GUApuO8fVpBHPwmfJcJdWJXaWNQZeOQTm7GMCfeSE4U9pMGP8M4KRSt8
         UeqQ==
X-Gm-Message-State: AOJu0Yxvdnf0kTZMDk6+EqsJCroJpTZdsY3x4+cj7kvckZpwabTPm+LI
	Vqj2MNqptm/I+W+1VcNcj9H3lw==
X-Google-Smtp-Source: AGHT+IFspYfjLzYgSOwGtPHy8bxl+y+5JkPrvkKdfXKLBR1uq/L9AkoAEuEDtgywPH8Tn+brWT5PnQ==
X-Received: by 2002:a17:902:dacd:b0:1c0:c86a:5425 with SMTP id q13-20020a170902dacd00b001c0c86a5425mr11041619plx.19.1693262818063;
        Mon, 28 Aug 2023 15:46:58 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:b64:7817:9989:9eba])
        by smtp.gmail.com with ESMTPSA id jg12-20020a17090326cc00b001b8b07bc600sm7904627plb.186.2023.08.28.15.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 15:46:57 -0700 (PDT)
Date: Mon, 28 Aug 2023 15:46:52 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>, Stefan Haberland <sth@linux.ibm.com>,
	Jan =?iso-8859-1?Q?H=F6ppner?= <hoeppner@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, nathan@kernel.org,
	llvm@lists.linux.dev, David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH 1/1] s390/dasd: fix string length handling
Message-ID: <ZO0j3M8KFWeEznXy@google.com>
References: <20230828153142.2843753-1-hca@linux.ibm.com>
 <20230828153142.2843753-2-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828153142.2843753-2-hca@linux.ibm.com>

On Mon, Aug 28, 2023 at 05:31:42PM +0200, Heiko Carstens wrote:
> Building dasd_eckd.o with latest clang reveals this bug:
> 
>     CC      drivers/s390/block/dasd_eckd.o
>       drivers/s390/block/dasd_eckd.c:1082:3: warning: 'snprintf' will always be truncated;
>       specified size is 1, but format string expands to at least 11 [-Wfortify-source]
>        1082 |                 snprintf(print_uid, sizeof(*print_uid),
>             |                 ^
>       drivers/s390/block/dasd_eckd.c:1087:3: warning: 'snprintf' will always be truncated;
>       specified size is 1, but format string expands to at least 10 [-Wfortify-source]
>        1087 |                 snprintf(print_uid, sizeof(*print_uid),
>             |                 ^
> 
> Fix this by moving and using the existing UID_STRLEN for the arrays
> that are being written to. Also rename UID_STRLEN to DASD_UID_STRLEN
> to clarify its scope.
> 
> Fixes: 23596961b437 ("s390/dasd: split up dasd_eckd_read_conf")
> Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>

Thanks for the patch! Nathan just reported a bunch of these. I took a
look at these two and thought "yeah that's clearly a bug in the kernel
sources." Fix LGTM.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/1923
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I also like David's idea of passing `char ident [DASD_UID_STRLEN]`, too,
but I don't feel strongly either way.
