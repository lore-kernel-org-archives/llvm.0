Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C92A21
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653404950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEo1NssAVGQZOfwlIMOHsifxPwTmlidTFKTUs0/1OgM=;
	b=Oqavv9gQWUiUqxNsopNoi7/e2HoRAECKKcbj5aEeml1g5X+vYfth/NMsAzwJRV/W4wZXQt
	rk2Kuvg/jH30j6Qsh2RhMFH9bBVu6h9jFzz+w7RKy9gzYmYzO9cheZ2AUIzoLH1BsWBk4+
	JJl1+E0yxIIMdtMinhm2xJ3+Eox6XvM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-5qyvqRl5OHG1nEIwhgU6oQ-1; Tue, 24 May 2022 11:09:09 -0400
X-MC-Unique: 5qyvqRl5OHG1nEIwhgU6oQ-1
Received: by mail-ot1-f71.google.com with SMTP id i1-20020a056830402100b0060aedabf08dso4054175ots.14
        for <llvm@lists.linux.dev>; Tue, 24 May 2022 08:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XEo1NssAVGQZOfwlIMOHsifxPwTmlidTFKTUs0/1OgM=;
        b=AS29wrOo1MSaytOsmAE6JUPLx5FsyN1M+atnrzUr7H0ZF3tiIZJrRcZfDEr2ECR8J2
         aTez6PiViiaU6bZENiWKH2t4dbtxhRW2Lo3tBiuSMN5i6p/ubYuWHw2MMe8yswq0nE15
         s6F2gtUg9RGo6nISpks42TM9Fe7dvfj8ipUJz6iAEh2TMrlJ7njJ87SZETuTy5it4WOt
         zj6bWJDFA6n+hU7CaVwmOTLT8fFwYl0VVe6TAGZj2azFS2EN0k7Ht38stObEHmP5LiEi
         LkAPGupTLrXSnr4aDn5Ec1MOQ8DmNu98art4qFZ36Nymk1Hlph5SioNA1gAbbN861H+l
         ghZA==
X-Gm-Message-State: AOAM530MG7ldkLajdbYn5H9Sd3DqOj8bzTZTrPasvQaaRVx8eO7retVH
	NTCzr9+lNIYRAiCq+zclj2WAzyzvLifQOlWZwTQFKXe5Al3u9HNR7crkgUgTAnCTGwwKGzcF5JO
	cTGh10xTELtq1EA==
X-Received: by 2002:a9d:811:0:b0:60a:b6f2:ab85 with SMTP id 17-20020a9d0811000000b0060ab6f2ab85mr6516329oty.9.1653404948235;
        Tue, 24 May 2022 08:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2Rrz8fDExW7WCjRqyXrFYjg5Q3G0iEtos25IWByh96ynkYINF5ql63GdcjlrT4RcCKJU4fg==
X-Received: by 2002:a9d:811:0:b0:60a:b6f2:ab85 with SMTP id 17-20020a9d0811000000b0060ab6f2ab85mr6516299oty.9.1653404947414;
        Tue, 24 May 2022 08:09:07 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id k17-20020a9d1991000000b0060b0b638583sm3021001otk.13.2022.05.24.08.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 08:09:07 -0700 (PDT)
Subject: Re: [PATCH] ath6kl: Use cc-disable-warning to disable
 -Wdangling-pointer
To: Nathan Chancellor <nathan@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Kalle Valo <kvalo@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "kernelci.org bot" <bot@kernelci.org>
References: <20220524145655.869822-1-nathan@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <c7a804ed-e00c-8a32-db21-c689312e0073@redhat.com>
Date: Tue, 24 May 2022 08:09:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220524145655.869822-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/24/22 7:56 AM, Nathan Chancellor wrote:
> Clang does not support this option so the build fails:
>
>    error: unknown warning option '-Wno-dangling-pointer' [-Werror,-Wunknown-warning-option]
>
> Use cc-disable-warning so that the option is only added when it is
> supported.
>
> Fixes: bd1d129daa3e ("wifi: ath6k: silence false positive -Wno-dangling-pointer warning on GCC 12")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Tom Rix <trix@redhat.com>

Thanks

Tom

> ---
>   drivers/net/wireless/ath/ath6kl/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath6kl/Makefile b/drivers/net/wireless/ath/ath6kl/Makefile
> index 01cc0d50fee6..a75bfa9fd1cf 100644
> --- a/drivers/net/wireless/ath/ath6kl/Makefile
> +++ b/drivers/net/wireless/ath/ath6kl/Makefile
> @@ -38,7 +38,7 @@ ath6kl_core-y += recovery.o
>   
>   # FIXME: temporarily silence -Wdangling-pointer on non W=1+ builds
>   ifndef KBUILD_EXTRA_WARN
> -CFLAGS_htc_mbox.o += -Wno-dangling-pointer
> +CFLAGS_htc_mbox.o += $(call cc-disable-warning, dangling-pointer)
>   endif
>   
>   ath6kl_core-$(CONFIG_NL80211_TESTMODE) += testmode.o
>
> base-commit: 677fb7525331375ba2f90f4bc94a80b9b6e697a3

