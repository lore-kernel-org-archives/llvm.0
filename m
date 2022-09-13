Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFFA1854;
	Tue, 13 Sep 2022 18:48:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u9so29687454ejy.5;
        Tue, 13 Sep 2022 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XBHLZTWZOIl8sDgOr6oowMYyKC9CQNtQkXOucXD0z+E=;
        b=p/NojyPyvsHavYWQqzvNw0t2GK19zTWTnyuY77SdFIhq/FLzli8enBq8DKYnQvkbAT
         lxbpEmooS27xid9hxCQObiXdDCYfF0oHZzJLRwNE8flh8HTb7Ly7O9I7tBlYo3dCP0n+
         Ue6trZpizZbivVxJrXCiVtlLsd3T1v8q1eB9hi+GU75gHYuj+nkJk2IIXY20IfDrtd+z
         Q7/16/u/NLcKUofr94vRpbnUJULupk0grmQOyLh5/vPGewSgh8T1KZWJ88F6FXEiYh8o
         FtBFMW9wJgXhwQ5KUg3KOaZVU/dlNLj7LAIn0Yu4ksHllVnx80BCDxv0R5aIkegLrAVV
         YYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XBHLZTWZOIl8sDgOr6oowMYyKC9CQNtQkXOucXD0z+E=;
        b=5nT3UQcs+kq1zQvoJw2GcP4TBcq6L0Y6E0f6Vw1xTkcRoIVbA1OZhRBJ1pxG2r0era
         yNzf9DLN+e+lqiO6e+5krSA0ejDs8WfMXOgCLAT8uBgx4b1FIt5xkFxqCY6U3NqIfGpJ
         Ko2/ABXbhCSZzWO9QcuHOFqGUopDCuQ8FeCGdzfPxkmDL38feNOFtR48bMzibd9Iz27x
         N4qPwqYMsum2GEskCMbrfLtRoG0rmM7HCHZ5OssicpzpLdfNgEx9wWpCsd+7ZzaMciVK
         su5hRWuHJISa2z7K4JzwZWfm2dR0CB2ipPYrolnh8oxj8m95ASfWnxRQJFsbYDXI5UQI
         Y6RA==
X-Gm-Message-State: ACgBeo0psmIn/RNpFg9xjTzalW18+fmmjHGgD3B/QVXyNUZjFOl2v6dv
	WQS50AGj98nEGCqwIAyUsTc=
X-Google-Smtp-Source: AA6agR74baFVWhcfvop5PJG0F+DYWr+HawnGmOdMlTQLdePatB9kl5dQ1hcLIMe2N2lYaDDGNTA0qA==
X-Received: by 2002:a17:906:8a5c:b0:77c:9d8:6fbc with SMTP id gx28-20020a1709068a5c00b0077c09d86fbcmr10110272ejc.500.1663094897009;
        Tue, 13 Sep 2022 11:48:17 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a20:6823:7621:36e:ae26? (p200300c78f3e6a2068237621036eae26.dip0.t-ipconnect.de. [2003:c7:8f3e:6a20:6823:7621:36e:ae26])
        by smtp.gmail.com with ESMTPSA id u5-20020a1709063b8500b007336c3f05bdsm6558209ejf.178.2022.09.13.11.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 11:48:16 -0700 (PDT)
Message-ID: <3b60a44b-2868-ba93-bb0c-d937a209f03e@gmail.com>
Date: Tue, 13 Sep 2022 20:48:14 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Staging: rtl8192e: Fix return type of rtllib_xmit
Content-Language: en-US
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Felix Schlepper <f3sch.git@outlook.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220912214548.929144-1-nhuck@google.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220912214548.929144-1-nhuck@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/22 23:45, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of rtllib_xmit should be changed from int to
> netdev_tx_t.
> 
> Reported-by: Dan Carpenter<error27@gmail.com>
> Link:https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc:llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry<nhuck@google.com>
> ---
>   drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> index 42f81b23a144..1b665afd309e 100644
> --- a/drivers/staging/rtl8192e/rtllib_tx.c
> +++ b/drivers/staging/rtl8192e/rtllib_tx.c

Hi,

I cannot apply your patch.

Applying: Staging: rtl8192e: Fix return type of rtllib_xmit
error: patch failed: drivers/staging/rtl8192e/rtllib_tx.c:962
error: drivers/staging/rtl8192e/rtllib_tx.c: patch does not apply
Patch failed at 0001 Staging: rtl8192e: Fix return type of rtllib_xmit

git remote show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
my branch: staging-testing

Bye Philipp
