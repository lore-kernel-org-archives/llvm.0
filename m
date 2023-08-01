Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94452440C
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 23:23:26 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-55fcc15e109so3629326a12.3
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 16:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690932206; x=1691537006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D88o907lNN2lO8wyEg1oXR0GwGcoGl4Tzq1oVFdFa+o=;
        b=dnNV7pA35f1M0jMWau8ZRI9GGZKRqimNDPv+Fllq5iSjgYxhduy9tcuK3Y9vtpEykF
         ZC/kgWVADa/lLoUX3IFWCEdXn2fwEwIZMaBk1gnqlkyzEeiXk+UC8HZNnx+qxzhvibem
         UY7btp3+43oW2IwUT04bpuckBLtoXGaws4XkrGvQqKyN52hoanQIYUBNYBO5m/vx+XUf
         DCwxaJtuvkIV3EDjj6LQZqdp2qHnDwBOJg3Bb4TvjeI6WivQIOV0ThoFIlEwINt7J4ZF
         2/2EynhCTDQZYMrIB+xnOnjPvAyxh3Iz29c8g25VphbG/Q8AIWKK8xus/c3B+qPaqRTY
         8JRA==
X-Gm-Message-State: ABy/qLYB+IdOzP0x+N5V1v3ssee0pgxkasxLj7Nzx80KhGU9PbtVvkke
	jrj+vFqyHvfkwER5XVs8mxg=
X-Google-Smtp-Source: APBJJlHaRLFkt7gDfX7uryX/ds/6acyxNbGLePDypJ8k6akLl61wLJ0WvJEaL/1JNtvsaobKFHfRCA==
X-Received: by 2002:a05:6a20:a104:b0:118:e70:6f7d with SMTP id q4-20020a056a20a10400b001180e706f7dmr14628412pzk.10.1690932205565;
        Tue, 01 Aug 2023 16:23:25 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id iw14-20020a170903044e00b001bb54abfc07sm10923944plb.252.2023.08.01.16.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 16:23:24 -0700 (PDT)
Message-ID: <8f7404dd-dab7-e599-31ff-3204b6a11943@acm.org>
Date: Tue, 1 Aug 2023 16:23:22 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] scsi: ufs: Fix the build for gcc 9 and before
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Avri Altman <avri.altman@wdc.com>,
 Bean Huo <beanhuo@micron.com>, Asutosh Das <quic_asutoshd@quicinc.com>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Arthur Simchaev <Arthur.Simchaev@wdc.com>, Can Guo <quic_cang@quicinc.com>,
 llvm@lists.linux.dev
References: <20230801201337.1007617-1-bvanassche@acm.org>
 <20230801215240.GA534984@dev-arch.thelio-3990X>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230801215240.GA534984@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/23 14:52, Nathan Chancellor wrote:
> On Tue, Aug 01, 2023 at 01:13:23PM -0700, Bart Van Assche wrote:
>>   static void ufshcd_check_header_layout(void)
>>   {
>> +#if defined(__GNUC__) && __GNUC__ -0 < 10
> 
> clang defines __GNUC__ and it does not sound like it is impacted by this
> issue? I just built with LLVM 11 through 17 and did not see it. Can this
> be made more specific?
> 
> Also, can we use IS_ENABLED() and not rely on the preprocessor? This
> appears to work for me.
> 
>      if (IS_ENABLED(CONFIG_CC_IS_GCC) && CONFIG_GCC_VERSION < 100000)
>          return;

Thanks for the feedback. A new version of this patch has been posted.

Bart.

