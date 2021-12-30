Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134F29CA
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 20:06:32 +0000 (UTC)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 32C9F3F175
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640894326;
	bh=GNWzUrlrK9iApcC0QIt7hy4CWeyRUiCxofVD3uisya4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=IQ0XcJkyjY35RH82W+KcSDToOvW8gpc1+D8s2XE8QiRxzgBMArbosRdYWRJRr1hUM
	 EjC13HVx4kkYU3P2gyH4FsFPUx7X8mwhrXXyg2I94H27jRDbTX2tIObJISFcWEeips
	 tFjt+WW1y00eslzFdEZKLNsgiKXIvQFtwtcqV9esj7NwiU/T+qQWo0TMwJvK8f/10i
	 7JwiitkuMLMLR1wgUfNbTaC3xu8zRLGZ20jSsmRgwp8IsLc2goaF8xNUPY2ejzsfZ9
	 dQaFZoaKat4LeXcYj243dA3R087vNje3ItgKKzqwwQ23an2lIjE2TRCVqyfFfTgvT9
	 bc6JhD1WxNlJg==
Received: by mail-lj1-f200.google.com with SMTP id y4-20020a2e95c4000000b0022dbab5f69eso5733726ljh.14
        for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 11:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GNWzUrlrK9iApcC0QIt7hy4CWeyRUiCxofVD3uisya4=;
        b=APsYRb/XeSz4gQcANGCyd5lan75QuhMeaMV4tK9INqS2Zlo7tfYq1vZDjquqVvuPQz
         zeYn5jnCxxCEXwSlf0eV9ZEInYJN/6xm57n8kXtWCw0eLDN/uAR2KEpVbl76GS2EUtFv
         Ny3wKMmMjqkpzt5Ezgd/7QuWs5ITmT/EPdHrNcORWIy3BpQDXX32VMR8mxCWi0BDvoN8
         rj/lKAjI1DyugEzdVM+78B9Bp5mC+Iof6FJb1oc2scmQesjmA74Pv+h+rjnxbgFPHZNs
         99qQHC5SpIbnF/nFl2TiVOBOMXW2zikkySnno3Jwrbkitkl5lYJ6MUmp9yYTnHoKW5fR
         0poA==
X-Gm-Message-State: AOAM530/b73MOKb5j50YRXjhEEabdSsWHpu0czIDAUjRcrlWPPHZAzlt
	PcIkf8t8lPyPbPWSV/Q72DUvQP0HsS8lrntBMmVerEPYLjF9EMS6RCts425LWAp25w86B5YCnfb
	k1JMbLFTbyzWNE7FCrT8vA+bmc+3aG88=
X-Received: by 2002:a05:6512:2311:: with SMTP id o17mr25992431lfu.256.1640894325566;
        Thu, 30 Dec 2021 11:58:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSa/wf1cnt5j7jqACUSdQ38QoQdVyafz5ZdxBfdxwsi0qKJ3PwI4Qbtw2FxwfqCGrdy+92UA==
X-Received: by 2002:a05:6512:2311:: with SMTP id o17mr25992421lfu.256.1640894325422;
        Thu, 30 Dec 2021 11:58:45 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z36sm2571458lfu.182.2021.12.30.11.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 11:58:44 -0800 (PST)
Message-ID: <eb2f0bb7-46ee-2290-6b60-90f555e4811c@canonical.com>
Date: Thu, 30 Dec 2021 20:58:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] nfc: st21nfca: remove redundant assignment to variable i
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211230161230.428457-1-colin.i.king@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211230161230.428457-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2021 17:12, Colin Ian King wrote:
> Variable i is being assigned a value that is never read, the
> assignment is redundant and can be removed. Cleans up clang-scan
> build warning:
> 
> drivers/nfc/st21nfca/i2c.c:319:4: warning: Value stored to 'i'
> is never read [deadcode.DeadStores]
>                         i = 0;
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/nfc/st21nfca/i2c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
