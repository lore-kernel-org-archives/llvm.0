Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586747462
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 15:12:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n8so2164571wmr.5
        for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vvnaISRyDO+wyF/zyk6fq41j/OaXjIWzqbLONv3536s=;
        b=fsTHogJl2vm0IGtQVzBEIlBvrN6arirK7KE9uUIUIdD6XO3LoHVFspMWJnMYobEZ19
         Tnr01VwqhlyLxilXd+cGXfjZEH0W7tq4wSM6uMOY/BGHNqlz0OBgn+w4r0oW8tH/tT+h
         b5xdW+IvasH4FdhqnPLbqRfQSSon7EoEmRkVt23gWu2A51wzPCBCuqmSct0T3gOZvRmj
         6dTZYuSlcbD5ZnCPzD0un7fSx4UMiNv241APtXLWqXgmrN4KpoQ3kD8cRk7oUVRa0VUO
         c+hpt1nMUt4svsYp6EPIXTARQdwObZrIVByp7HclH7wUptqVNnxFp/BObzY4R6PCyb1F
         VNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vvnaISRyDO+wyF/zyk6fq41j/OaXjIWzqbLONv3536s=;
        b=FQcguvOBoQhP0DS+0qajyD8nqkR2saVnoT1S8cGNSSD8WTyt7Uc4sR7xhIXbt6vhvR
         Zf5i15p+nVjvTfl9k7cMI56WviQs72v6CRN+j/K1BwJJ3rlpL5aqE4m9WWuZ5aeSKdtz
         IiSqZ71TH8+disKUAC6IhVB1TqxfMQH6qHZ11jSqzwJsYunPd+8Tc11e6Cy1Yfd6TfiF
         N+qDeXR2qsU2QGf3L0hlFlRdpxw24yf1hP4uoMjFtqXsiZUn2XSITcONGWXR5f1HsoEy
         ZTNYKEKZ/h4sySfCR2StkPVgadQKPC8s7bXHpb2d2lYfS9GuugqRdr97paFcptBrNnD/
         nGWw==
X-Gm-Message-State: ACrzQf2xEW08quBRVS/NoCNY6pIkEnFq2cSmuMHgzNv0YTtIqega8D5u
	EN6ySiTkpQCF7hHgjTllQr6E6Q==
X-Google-Smtp-Source: AMsMyM4udr1W3bHW44bQQIPh2gcs1ur29uywFTAjmVPsve4+Yljn0LIt7TSumHS1ZcgmvCCXEU2gvg==
X-Received: by 2002:a7b:c34b:0:b0:3a6:8516:a729 with SMTP id l11-20020a7bc34b000000b003a68516a729mr2888644wmj.83.1663686773575;
        Tue, 20 Sep 2022 08:12:53 -0700 (PDT)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id ba5-20020a0560001c0500b00228d183f9c2sm282541wrb.89.2022.09.20.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:12:53 -0700 (PDT)
Message-ID: <af301902-1e54-13cc-0a4c-3d724f1cb835@isovalent.com>
Date: Tue, 20 Sep 2022 16:12:52 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [bpf-next v4 3/3] bpftool: Update the bash completion(add
 auto_attach to prog load)
Content-Language: en-GB
To: Wang Yufen <wangyufen@huawei.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev
References: <1663037687-26006-1-git-send-email-wangyufen@huawei.com>
 <1663037687-26006-3-git-send-email-wangyufen@huawei.com>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <1663037687-26006-3-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tue Sep 13 2022 03:54:47 GMT+0100 (British Summer Time) ~ Wang Yufen
<wangyufen@huawei.com>
> Add auto_attach optional to prog load|loadall for supporting
> one-step load-attach-pin_link.
> 
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  tools/bpf/bpftool/bash-completion/bpftool | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
> index dc1641e..3f6f4f9 100644
> --- a/tools/bpf/bpftool/bash-completion/bpftool
> +++ b/tools/bpf/bpftool/bash-completion/bpftool
> @@ -505,6 +505,7 @@ _bpftool()
>                              _bpftool_once_attr 'type'
>                              _bpftool_once_attr 'dev'
>                              _bpftool_once_attr 'pinmaps'
> +                            _bpftool_once_attr 'auto_attach'
>                              return 0
>                              ;;
>                      esac

Reviewed-by: Quentin Monnet <quentin@isovalent.com>

Thanks
