Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6377173
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 15:46:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k18so17251675wrg.11
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+nUfroBA5dnOzmQt6qJzThSCFeTi3yMn552LUIzKkMI=;
        b=j0dA03crvqc2AxJFJDkwJuC7YsdxUkaH/jV/JJN2Jos9wA8mafZmV9kfK6HJHTy0UY
         X8br4266acaPNh1woC8ksjCXQK1PG3eJaicmEAXCKOEusp0LVvDlapC7+Euv4s8aZtn+
         +XieI3k/YTKmvyI0mHHmEfmk6eE6jH9E+nuMXHMicU7CDwNDwTINw6B0A5l2nXgbSykI
         c3Lo9sIJa1X/Brwir/lUb7YBRcwHL75fePHupfCFoLdOYb9D2UDO9aBqwAQwhkDDFaVS
         F9f2Ck0x5FSmel60zo9cmpHjk7kM2S2iQvZxJcQFiJR2g59J5maGpkTuSdFAhKKc8zrr
         XOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+nUfroBA5dnOzmQt6qJzThSCFeTi3yMn552LUIzKkMI=;
        b=zXMrD7YpZWxoZikC6c8QAXy9r/vfThNiC9OTo9TQU+V0Gh3+NNguqfTRRRuGr/m7Fm
         Hr5sKw64NSc1BmXgdr02gcr+wAU2g5nyPXDuhCKH0RMQUg/PvHfkkuywHI2R+jL1VmG1
         gKBCJ7jYXEP9ETEUdYpzVSX2ROZLKl5V+ax/GEnKlAMZqv9E2Fj4yWMiKOHdREzlr15k
         LjQpJJjVg/g0nJdGt5WBJ+hyBZiidjmlSWIivzRQCpayMggMBXEUBoK+ryx2EPyGHiqJ
         pTGia8ou0I+GKrh8NCrkPCzT5cluxdvnI9wCky9SMFWlHQAQc0THitW//IbnDibAqR4o
         XsHg==
X-Gm-Message-State: AOAM531v2S8UTR2fsLj5MAGDKpS8ahiKI1tEBlRwiSn2h4NdLlLa3hIJ
	N3xWzej8trOlyCyGjG+eMI8qTg==
X-Google-Smtp-Source: ABdhPJxrmoC2/r3N4ofOHzLqqYiSFPiGjG8H0UCP9omFngTKn6nvFQSOKG7w/shWu9mAyve08cUnMw==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr55917500wrw.615.1641656762100;
        Sat, 08 Jan 2022 07:46:02 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm1855348wmj.44.2022.01.08.07.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 07:46:01 -0800 (PST)
Message-ID: <6c44bf59-3ee9-3055-c2c6-cf497a39ca05@linaro.org>
Date: Sat, 8 Jan 2022 15:48:12 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 3/4] wcn36xx: Track SNR and RSSI for each RX frame
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, kvalo@codeaurora.org,
 linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, loic.poulain@linaro.org,
 benl@squareup.com
References: <20220107153323.1807905-4-bryan.odonoghue@linaro.org>
 <202201081611.NwbnsnbW-lkp@intel.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <202201081611.NwbnsnbW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2022 08:41, kernel test robot wrote:
> ret -= ENOMEM;

nice catch
