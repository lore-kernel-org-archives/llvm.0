Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA06EAD2
	for <llvm@lists.linux.dev>; Mon,  3 Jul 2023 12:42:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so36093735e9.0
        for <llvm@lists.linux.dev>; Mon, 03 Jul 2023 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688388154; x=1690980154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XFpyBBKRCRxMK5NDafYwUBbAGkW92zQFpIIitblDTU=;
        b=TQOz34arDctByX03GqE4gew0cK2eEd/da+QRoo53Fgy/ZionE5Z6h1o2FiuB46TnNI
         isUtX8mVzbQhs8T0Zm640m7uc5PXuNPlseOiwIVErmlk1kVW0asPUynkL0kTo3N5g4sx
         R8Vmhx+hVGxounKVqwNP+DRuBDwKkALS8ukWwcxoFqWA3pRus2l6uxbQoMMJqyY4avx0
         CT98nunTuCEfsGHhHbzVcxz8EkpPElEcPTP1hEwr/QVmHDhE7Khouln2mFrtVivbzAzd
         vmS7lHcXNtJcPJUbi7kIvLHEcmxriYVwqBGd5ccG/O3Tu+N1qDFvE++2Dc5P3hW8rP3a
         OGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388154; x=1690980154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XFpyBBKRCRxMK5NDafYwUBbAGkW92zQFpIIitblDTU=;
        b=aAlZNO5jiA4YC0nwhRn+vGfvl33J7IEmmAXlFtutyXLMPlYxh2bkOYx46Y38kwG0NS
         1tGVx6/4H1dly50fgAIcz//9xeqIz/St0V95EaRzwAftLjgi771EOdOXdX95iPsXm4Ny
         UNtg1Xa+ZMZfQni7rm/KhiNjBIBjDL8EPG9P/Ynsc4k4LjBSXf/ZsG/yAmVkLzkeHNZs
         Xz1kgzu7ClSTKkjZNELgAX4LBnFRDm5ZSI/KBNHBg7PCP1xEbdp7F73gx1C0O3hjoOoX
         7K/Ppf/r22vtA6RF6aibH71MzbIpKGuPL8IIeLMWnCuaOE55KvVErRJveiLUOVmV+2cd
         /AQw==
X-Gm-Message-State: ABy/qLZaMC7Fx08GRaRMA/gwpKDgmUyKz1z6b5Xr/suEMS1GBgziWByh
	hJ+9ei0GML72MaqCZIVO/sRu0w==
X-Google-Smtp-Source: APBJJlHmKXwYmc6bUIZGLmaOqk9O6Fh1cerKmaDJcs/cHxEJzg2Trr6gyCR/U+D+qz+dlnaf36IChA==
X-Received: by 2002:adf:cc90:0:b0:306:3352:5b8c with SMTP id p16-20020adfcc90000000b0030633525b8cmr9514161wrj.7.1688388153797;
        Mon, 03 Jul 2023 05:42:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y7-20020adff147000000b0031438e42599sm1866268wro.82.2023.07.03.05.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:42:32 -0700 (PDT)
Date: Mon, 3 Jul 2023 15:42:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Neil Brown <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Dan Carpenter <error27@gmail.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] sunrpc: avoid constant-out-of-range warning with clang
Message-ID: <6b963674-fc5a-4abb-8678-a82d35a3f3fd@kadam.mountain>
References: <20230703113737.694995-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703113737.694995-1-arnd@kernel.org>

On Mon, Jul 03, 2023 at 01:37:22PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The overflow check in xdr_stream_decode_uint32_array() was added for
> 32-bit systems, but on 64-bit builds it causes a build warning when
> building with clang and W=1:
> 
> In file included from init/do_mounts.c:22:
> include/linux/sunrpc/xdr.h:778:10: error: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>   778 |         if (len > SIZE_MAX / sizeof(*p))
> 
> Shut up the warning with a type cast.
> 
> Fixes: 23a9dbbe0faf1 ("NFSD: prevent integer overflow on 32 bit systems")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/sunrpc/xdr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/sunrpc/xdr.h b/include/linux/sunrpc/xdr.h
> index f89ec4b5ea169..6736121ee6a03 100644
> --- a/include/linux/sunrpc/xdr.h
> +++ b/include/linux/sunrpc/xdr.h
> @@ -775,7 +775,7 @@ xdr_stream_decode_uint32_array(struct xdr_stream *xdr,
>  
>  	if (unlikely(xdr_stream_decode_u32(xdr, &len) < 0))
>  		return -EBADMSG;
> -	if (len > SIZE_MAX / sizeof(*p))
> +	if ((size_t)len > SIZE_MAX / sizeof(*p))
>  		return -EBADMSG;
>  	p = xdr_inline_decode(xdr, len * sizeof(*p));

I sent a patch for this last week that takes a different approach.

https://lore.kernel.org/all/2390fdc8-13fa-4456-ab67-44f0744db412@moroto.mountain/

I probably should have used a Fixes tag just for informational purposes.

regards,
dan carpenter

