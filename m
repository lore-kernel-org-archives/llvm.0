Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845EB19B
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 16:50:11 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-177ca271cb8so2329920fac.2
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679676610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1DGyIN34KgC0DU/dG7K0bXU7qcx4+HSMWL/GkKHyPhI=;
        b=bVwiBdzRLa1lsfOcclAi6GO+XbR6MVA+A6vuIkAiHb0mxBUtxOM1o+zrR8eExLmPMy
         QU4tTuE9ywhDKtQEbvYF2Fikp0sWcexTw68YVUiO0vwQGyWvABK/Qc5op/kOvpSKUd2e
         VlsVl/ClswPrkfpaj7k+YqIFu496lXYE39yXf1gHk9dHgbk9dDMBYmuEm/wUitBVVd+X
         lKc9DWaeVXTmkPwH1wUc/J3H5VE7UvDnSDdefpnrfjH+9FaMpH/xdjh38E7lXBASsZSI
         iN4Q0YP8WpCt2moeemCX8OJY6fxC5jvC/51XqI9uTZjRbiCh1pUdoV5iKUjd/7aPhNqi
         GhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679676610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DGyIN34KgC0DU/dG7K0bXU7qcx4+HSMWL/GkKHyPhI=;
        b=n6Ik0ZJRyRbBhN0FbLXlQTB4Bx7tewMMKt+fQ76wr7zpYlW3jrFUg7PaMp2C4kvtuz
         Is5D61LLL/ftkswPAoMhMkfaxQk18VZFw1gpbn0/rmZ+PG7aAkH/SSI90c2NFwy0/Uya
         o1hIaB+gSZTw10DLhHs9a1tg8zocbxjteXj+ju7Di9+zUDbdObbyEUVrJCZv+Uec1BXL
         uiRa8cy3UIGRAJsVPOvE+kGYqQ8GwBXa+hYZxG9D8RAW0J564+9+GlInuP0Siiyg9vcP
         Q5/OLajzC/VJRHrVhjwNtpRmwyTp+TSe1dGaAixNxeq7Y1ZPl8Ck924hkOGRXSt/M+2Y
         BIHw==
X-Gm-Message-State: AAQBX9cdpQSechLTkeQPaP04pLNga7BOMGenTW2dTw2mK6mkcLoYB2nR
	5E3OAmpUJz6lhZJ330ThYBY=
X-Google-Smtp-Source: AKy350YegC9Y5rZlLkkMA6KNYBOntyayTAXqWSJGwsQUTpx9mVId6Lbu7ZViY22SLpFM8rSCQ2JFTQ==
X-Received: by 2002:a05:6870:1608:b0:17e:9798:6e34 with SMTP id b8-20020a056870160800b0017e97986e34mr2398934oae.32.1679676610509;
        Fri, 24 Mar 2023 09:50:10 -0700 (PDT)
Received: from [192.168.0.162] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id ea43-20020a056870072b00b0017e0c13b29asm2345970oab.36.2023.03.24.09.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 09:50:10 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <892fdfe5-ef22-a37a-20bc-912e67d6df4e@lwfinger.net>
Date: Fri, 24 Mar 2023 11:50:08 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] b43legacy: remove unused freq_r3A_value function
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, kvalo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230324135022.2649735-1-trix@redhat.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20230324135022.2649735-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/23 08:50, Tom Rix wrote:
> clang with W=1 reports
> drivers/net/wireless/broadcom/b43legacy/radio.c:1713:5: error:
>    unused function 'freq_r3A_value' [-Werror,-Wunused-function]
> u16 freq_r3A_value(u16 frequency)
>      ^
> This function is not used so remove it.
> 
> Signed-off-by: Tom Rix<trix@redhat.com>
> ---
>   drivers/net/wireless/broadcom/b43legacy/radio.c | 17 -----------------
>   1 file changed, 17 deletions(-)

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

