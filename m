Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFBD17D6;
	Thu, 15 Sep 2022 05:22:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z97so25279768ede.8;
        Wed, 14 Sep 2022 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bawdnIjfKz33ojyf705csFhkx59BIjWvsi4wT6R34Qw=;
        b=h5+gNK1sFlerSVwTN98fYxt5n2ZOqH+fljDjoZn2OL82l8dph/15pnqNYDHWPt46O9
         lJYrEFP2kHvWM55vTa9YBECWA8ZVKYuYGZRW3lpgSBcKE/YWoZc/+u5OGUN2fOBQrmun
         8A4LiOOw9j5EJHo9782itKSBhm0yY5kfr6vDG2VRxyh52IIVWQhkf1uJV0RxclfuUQv/
         3INypFM5MtZc9Ek/s/PZeb4YehjCd6IP9xEyeDsNRf7p53lV7agE7STOoXynjNKZpSx+
         ssrFK25t5zeaF9pi4ZdStYkc4U3+VMrQFwFXtLdgi9GUlkhYzec0VLNIp/kXwXjAnCJA
         0VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bawdnIjfKz33ojyf705csFhkx59BIjWvsi4wT6R34Qw=;
        b=PJjGHvItAihIYlW1bKY5hI7pqZCDe3o+BIdOQXSAut3d0CNmRpK4k2ETKK+0DSok8w
         dsf7Snqgos7XEMSiJoH8s+obWlA55jt202Fa0EEh/TuuI3/3nNj0NzncmMVQ4O6012gq
         57fcQuezFURIgG1J2PGF/+JVM+2fcaM/os1q4IOASM5EddUSF4FRURFdYD0NBX0L84xr
         InjeCzfoIIBboZl5qHoiNmw5YlVqX0v0WzU5kRAlvxF5LX5W8y9J0ptptaxmnxI0lxb1
         25Ez10Io9dzpExDUMuVKvD/0wvrKqXAjz0dtQeVudfecdYLhxW3yIUe4adtCMl5AQpI4
         adyQ==
X-Gm-Message-State: ACgBeo3sA/0ZH/HgLj3OEG2uApraB8A6tM8QVzyU3IDSo5oWrt0AKj7b
	KLs3A50Mj8tsXaR8NRx8JAQ=
X-Google-Smtp-Source: AA6agR5Y0nPzvS7ZZ9p6COwdpBEC1wQsJmHFI3LvTFvNo1F/CfMESdwrQWgkb3VoGngbFSMTvNaeUw==
X-Received: by 2002:a05:6402:1ad1:b0:44e:8dfb:2d04 with SMTP id ba17-20020a0564021ad100b0044e8dfb2d04mr32739346edb.400.1663219375494;
        Wed, 14 Sep 2022 22:22:55 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id lb21-20020a170907785500b007801ce34311sm2710256ejc.19.2022.09.14.22.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 22:22:54 -0700 (PDT)
Message-ID: <f1e0405e-eee8-ede4-f28e-bb3c80a88ef2@gmail.com>
Date: Thu, 15 Sep 2022 07:22:51 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] staging: r8188eu: Fix return type of rtw_xmit_entry
Content-Language: en-US
To: Nathan Huckleberry <nhuck@google.com>, nathan@kernel.org
Cc: Larry.Finger@lwfinger.net, error27@gmail.com, gregkh@linuxfoundation.org,
 insafonov@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, makvihas@gmail.com,
 namcaov@gmail.com, ndesaulniers@google.com, paskripkin@gmail.com,
 phil@philpotter.co.uk, saurav.girepunje@gmail.com, trix@redhat.com
References: <YyEPaMVRmdGQdoql@dev-arch.thelio-3990X>
 <20220914211606.423959-1-nhuck@google.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220914211606.423959-1-nhuck@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/22 23:16, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of rtw_xmit_entry should be changed from int to
> netdev_tx_t.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changes v1 -> v2:
> - Rebased onto linux-next/master
> 
> Changes v2 -> v3:
> - Updated header file
> - Add reviewed-by tag
> 
>   drivers/staging/r8188eu/core/rtw_xmit.c    | 4 ++--
>   drivers/staging/r8188eu/include/rtw_xmit.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 98864fc55b25..ea13f11b231b 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -2289,7 +2289,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>   	return true;
>   }
>   
> -int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
>   {
>   	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
>   	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> @@ -2323,5 +2323,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
>   	dev_kfree_skb_any(pkt);
>   
>   exit:
> -	return 0;
> +	return NETDEV_TX_OK;
>   }
> diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
> index 8f54c41ba927..82efcd54af3f 100644
> --- a/drivers/staging/r8188eu/include/rtw_xmit.h
> +++ b/drivers/staging/r8188eu/include/rtw_xmit.h
> @@ -368,6 +368,6 @@ int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms);
>   void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status);
>   
>   void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
> -int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
>   
>   #endif	/* _RTL871X_XMIT_H_ */

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
