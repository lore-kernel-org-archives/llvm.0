Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7B20F8;
	Sun, 26 Mar 2023 12:46:56 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id eg48so25100753edb.13;
        Sun, 26 Mar 2023 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679834814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rSVPQZLvMg8MxPtgtJhR5Wq1fUwwDFt0dAXT8YpYgaU=;
        b=iB8dEQPl+YY+fah8Jik5YmwFYZ1C76EJD+O2kEfEkm3OinnmZIBJ1N+GC97dDhRs0K
         iA7Vj8rZVgRWrxUl+H9jwetFlxrbJUQo+KVJntA3aBgLbtGFbvAMVoDHlysV/RFlbj7Q
         hzqvDUdZzZy3KZ6wBvgeykVDK4T7NeHKsm6KFhjA7nPc4tOWCWFUsXTbGQO2Gb5twdfx
         PYA4MQKqwECT/J9+s3A+IBPXDXtiCn08dG4NGunzQwfjiX5BiS2555qz13T+qdUzMeTB
         JKagAXQcLnz1XIFKSuG0caB4AZBX9c8+AM6PuQlrPllBhZx++zsjdeuybOf/UWZiwy1s
         CAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679834814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSVPQZLvMg8MxPtgtJhR5Wq1fUwwDFt0dAXT8YpYgaU=;
        b=LHyflW8eiVPdTr+rdzgbEGnkqaoyrRrTeTyqu5TQOYXCDAzTwMbdbwozxT7C6kNsg8
         GzDc27jc7qLyTklmvFha5zBz+nI8UNKob2rzyFePUtvHXeBjFySp1eAH9ChTOQjLP8Rp
         W7BnrqAGXduc5Ec/lYlQ58cCUwZN3O682MSqGGBnLHCAZppGrI9y4wFShJ5Cgmw1tMwr
         ZPCpgnEbdy2gnG5GcEHG+tDWUH3diT2gvx9CRyPPjnvxq0RhrdiLwFHWVrmaMY3ni8jW
         locX8PyexspxIjrBKbo/Y9inNcWpD7yUN7XzfzQtJT3s54PYi9bCur9aaM7cl67WliLl
         huYQ==
X-Gm-Message-State: AAQBX9dmp7DX6HGHlG7KFUrRnXz0FdTN29Vhg3YoGl0mEMNCQu49paoX
	hnHaM3gFvLuGVWTTfrvBt5GJP6UA9oM=
X-Google-Smtp-Source: AKy350b9q8sglt0xIXc0mxLMsKwZNW2bmLY3U2biBD1vzDSd9YwwZ8EPJNpAnwvcZBW8x8cqNSArrw==
X-Received: by 2002:a17:906:fc1e:b0:92b:f3c3:7c5f with SMTP id ov30-20020a170906fc1e00b0092bf3c37c5fmr8581612ejb.53.1679834813916;
        Sun, 26 Mar 2023 05:46:53 -0700 (PDT)
Received: from nam-dell (ip-80-113-101-30.ip.prioritytelecom.net. [80.113.101.30])
        by smtp.gmail.com with ESMTPSA id f23-20020a1709064dd700b00931536d461fsm12885452ejw.20.2023.03.26.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:46:53 -0700 (PDT)
Date: Sun, 26 Mar 2023 14:46:52 +0200
From: Nam Cao <namcaov@gmail.com>
To: Tom Rix <trix@redhat.com>
Cc: gregkh@linuxfoundation.org, nathan@kernel.org, ndesaulniers@google.com,
	artur.bujdoso@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unused pHalData variable
Message-ID: <ZCA+vIjUFHZFUFPC@nam-dell>
References: <20230326122321.1352337-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326122321.1352337-1-trix@redhat.com>

On Sun, Mar 26, 2023 at 08:23:21AM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:23: error: variable
>   'pHalData' set but not used [-Werror,-Wunused-but-set-variable]
>         struct hal_com_data *pHalData;
>                              ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index e36f8c369a04..0cb2adcc1f78 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -1179,10 +1179,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
>  
>  void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
>  {
> -	struct hal_com_data *pHalData;
> -
> -
> -	pHalData = GET_HAL_DATA(padapter);
>  }

If this function doesn't do anything, does it not make more sense to
just remove this function entirely?

Best regards,
Nam
