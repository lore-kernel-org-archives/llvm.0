Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F08A56
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 06:51:33 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p10so10077503wrg.12
        for <llvm@lists.linux.dev>; Tue, 24 May 2022 23:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qIXc7ckxpaycTNNbZsrqsqmLIc4KjcKf1nyaCXgDayU=;
        b=PxD7sci0Bq2POIbrsPMW+iWZCSTfOsDIVvFKGjw49Ahm8pqpniCGwYDCw+2KtIVleB
         0qCulIvvsv+s1wP9Yh7ZUma01jn/KHaaEEwY821VadTnviuAbRDeytg04PzNy3Mkxtfn
         3XQmX9/fX4rBBAolCfsXHHufUcyYBqF55VG0QqMQyDUCzRsiCfV69G/2DeK4rVAfYUUN
         wiXLPuKYv0lLFZiwjnke60NSfa+1KNUMKU0bq2uhEDmghLGmoNZUN/wYwVnRCIJa+Kps
         aiQJK6ZqD7rzudwScV1/dXvH5t6Zkx98QoD1QlRXm3WUQR6qS5Nk9xFZE6NYZQGIc6Su
         MWDQ==
X-Gm-Message-State: AOAM532OhjE3fFckqr4DQ8UPhS7xZNFSh7qAB3A+M/ZKLOZchHhDURcx
	PHAPyi7S+IS+RG5VWlhvFxA=
X-Google-Smtp-Source: ABdhPJzjgBw8F3g0LVeI/WFTG/JhCJXju5CTp4OT98sW0FAjmZZeiN2PfdDBVCtCtRFQm0oaJnvsew==
X-Received: by 2002:a05:6000:1861:b0:20f:c91e:bd3b with SMTP id d1-20020a056000186100b0020fc91ebd3bmr15504720wri.705.1653461491247;
        Tue, 24 May 2022 23:51:31 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600002a800b0020cd8f1d25csm1471671wry.8.2022.05.24.23.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 23:51:30 -0700 (PDT)
Message-ID: <b5c0a68d-8387-4909-beea-f70ab9e6e3d5@kernel.org>
Date: Wed, 25 May 2022 08:51:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] linux/types.h: Remove unnecessary __bitwise__
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220315153048.621328-1-helgaas@kernel.org>
 <20220315153048.621328-2-helgaas@kernel.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220315153048.621328-2-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15. 03. 22, 16:30, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> There are no users of "__bitwise__" except the definition of "__bitwise".
> Remove __bitwise__ and define __bitwise directly.
> 
> This is a follow-up to 05de97003c77 ("linux/types.h: enable endian checks
> for all sparse builds").
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>   include/uapi/linux/types.h  | 5 ++---
>   tools/include/linux/types.h | 5 ++---
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
> index f6d2f83cbe29..71696f424ac8 100644
> --- a/include/uapi/linux/types.h
> +++ b/include/uapi/linux/types.h
> @@ -20,11 +20,10 @@
>    */
>   
>   #ifdef __CHECKER__
> -#define __bitwise__ __attribute__((bitwise))
> +#define __bitwise	__attribute__((bitwise))
>   #else
> -#define __bitwise__
> +#define __bitwise
>   #endif
> -#define __bitwise __bitwise__

Hi,

this broke userspace, like open-iscsi:
> [   34s] In file included from session_info.h:9,
> [   34s]                  from iscsi_util.c:38:
> [   34s] ../include/iscsi_proto.h:66:30: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'itt_t'
> [   34s]    66 | typedef uint32_t __bitwise__ itt_t;
> [   34s]       |                              ^~~~~

It looks like we need __bitwise__ back.

thanks,
-- 
js
suse labs
