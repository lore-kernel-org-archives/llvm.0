Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDA23CC
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647363794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmxYI6ts0ifPqvBUGqySYDpgc0rBSTfKUOaCBQr9r+M=;
	b=b2ihGmTiWo8zyEu6088kz+G03V5Pv+c6Zlnc6mxOW5EAEPIkPyKlRDEnH+B7dxmiicyg4m
	ABvZpexrl4xqaur29yt4sgH5NcbP41h5jN+bGkVSq0So3YtzqXdrJ9IYnxjscnsgk7G7cH
	/mg8asS5C4f9lcpH92eDcJomFtUnNo4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-EUVYbAVcOgy2kLILimqUaw-1; Tue, 15 Mar 2022 13:03:11 -0400
X-MC-Unique: EUVYbAVcOgy2kLILimqUaw-1
Received: by mail-wr1-f72.google.com with SMTP id w17-20020adfec51000000b001f068bc3342so5527126wrn.6
        for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 10:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OmxYI6ts0ifPqvBUGqySYDpgc0rBSTfKUOaCBQr9r+M=;
        b=WRR9fmH5uqhcWRagbJLJp38nF6PgPSW+bRnbUDHKy05XO7AslVhH9Br/fPKIcaE93b
         Rq1gJsPa72c3K4pJOWbQKjHEyxIqFoOOGo3x74Uz5z20A/00GdSWR5d1pN1t/gHTLu0U
         6RSgauBP9JqjzA+/DXNFaqBMJskw5mMuw0ZTBUjW/o4KIkqSmNx3XjQSTzvUdoQ2OHvL
         8UiJf5N0y48w3EZDZklw4R7PEs9JKI/uEYtFrGfhCrhDnP4DfNahFNXuWP8RrS7jCadN
         H84tAW0N3CaBBm09resEnpfw4zoGOsT4DdnxwOEcSrm0wuBZXmLGdHnnM2ihSPgmuTDq
         uFeA==
X-Gm-Message-State: AOAM530zDZ4jU54tlT/X1YYOEjBWhemc7orI5s32LA7S2N3zEtt15WZq
	FlGdWStHYn+Uj4QxcaUwKZbmZvCjQQvFhVyTtny6caXl4uogNMkh9KxK94GOlWAoCQQWBNj7zko
	39e+j6qGSbZ3oWg==
X-Received: by 2002:a05:6000:2c6:b0:203:871d:aaa4 with SMTP id o6-20020a05600002c600b00203871daaa4mr20082230wry.47.1647363790164;
        Tue, 15 Mar 2022 10:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0VnXioS5GPLkgJGEECy6qRxXD0f5fqDGsdTj5oM5pW6HFay89xxxO5qnSXYIleqPeTR4uQw==
X-Received: by 2002:a05:6000:2c6:b0:203:871d:aaa4 with SMTP id o6-20020a05600002c600b00203871daaa4mr20082206wry.47.1647363789931;
        Tue, 15 Mar 2022 10:03:09 -0700 (PDT)
Received: from redhat.com ([2.53.2.35])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d5647000000b0020372c969d9sm15998430wrw.29.2022.03.15.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 10:03:09 -0700 (PDT)
Date: Tue, 15 Mar 2022 13:03:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/2] linux/types.h: Remove unnecessary __bitwise__
Message-ID: <20220315130258-mutt-send-email-mst@kernel.org>
References: <20220315153048.621328-1-helgaas@kernel.org>
 <20220315153048.621328-2-helgaas@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220315153048.621328-2-helgaas@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 15, 2022 at 10:30:47AM -0500, Bjorn Helgaas wrote:
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

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  include/uapi/linux/types.h  | 5 ++---
>  tools/include/linux/types.h | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
> index f6d2f83cbe29..71696f424ac8 100644
> --- a/include/uapi/linux/types.h
> +++ b/include/uapi/linux/types.h
> @@ -20,11 +20,10 @@
>   */
>  
>  #ifdef __CHECKER__
> -#define __bitwise__ __attribute__((bitwise))
> +#define __bitwise	__attribute__((bitwise))
>  #else
> -#define __bitwise__
> +#define __bitwise
>  #endif
> -#define __bitwise __bitwise__
>  
>  typedef __u16 __bitwise __le16;
>  typedef __u16 __bitwise __be16;
> diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
> index 6e14a533ab4e..6c18c54e7d7f 100644
> --- a/tools/include/linux/types.h
> +++ b/tools/include/linux/types.h
> @@ -43,11 +43,10 @@ typedef __u8  u8;
>  typedef __s8  s8;
>  
>  #ifdef __CHECKER__
> -#define __bitwise__ __attribute__((bitwise))
> +#define __bitwise	__attribute__((bitwise))
>  #else
> -#define __bitwise__
> +#define __bitwise
>  #endif
> -#define __bitwise __bitwise__
>  
>  #define __force
>  #define __user
> -- 
> 2.25.1

