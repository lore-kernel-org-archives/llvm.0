Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD901383
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 02:33:31 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id e205so6305124iof.1
        for <llvm@lists.linux.dev>; Sat, 08 Oct 2022 19:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKgMiGJ4xMxKYE+sQjNHKzDaMNVrm+oHUpyMXCSQTDs=;
        b=NYxjOsB+i0Q2ncUgRrwdIlyCeHGXDiDQMmC2QhU/GxeAdvqZz4Jqs83TVFyc/xxPHF
         xoxeAcjCNNk9cT36I2UsTNFh1MpzMgFw2RqsKQP1t9QKQfWaF0oQFKYuULT+bPNb1ULK
         olXhHsfMph/NoI5REHcWMZwWXYzwhSec67GlMSVFje4mN5bn1i/18t/EQl2LTQPy5372
         Dcs3UhVWPx01WuR08asoh6m4cksqAs92QVS7BkG9wHbGdNS9kcSRc31yPGsMdTjFkINi
         pyG1PqaxlVn2HM/r2L5klq1kOrBxlJvCN1+E29HNVzNNUff5699oF8Z/C7MNgI+vRbyN
         lmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKgMiGJ4xMxKYE+sQjNHKzDaMNVrm+oHUpyMXCSQTDs=;
        b=4ijBYB30FwYa2LUlGmYJKz1tyIS1uLcWSY7K4sDGFKTrJSB1vXj6FI+c90PrWe5Acn
         CpDGepiP30rlPX6iwTAIwj20TD4uDhwdhC01I9USSJxYeT3LFJ4/LH81Y1FRwP9uPOmQ
         NLqxkv/wBuJg3LRP/TKNnqbNn/8TNUfyU0oYJv0dRXiUNzcta0capyVMUg2TUq5uxAs0
         puje779vU7cLlwSH55K1q5veoGNBdT8aJXLX+PePdCZdzGve03dItuUJwZ6ZWcHfRGLX
         HT4lQ+KDz6ihrJj/uhomLxByFYNy3l/H/uOuBQf4Kutc3O3sVaV+luGpGsG1rj7SBL60
         /++g==
X-Gm-Message-State: ACrzQf1M5frcVIJvRZYBFnsCpXW4YFZytzI3v4vYsecV6XAC6fjfsihM
	zuHIKZRaHAVN2lIzCKR4Ubc=
X-Google-Smtp-Source: AMsMyM5GzbjwHI/Y3eo0drTr+O2Tna+hX32qEn8v3GHuwVNW5h74J0HM80QYq2XPcO73lKQxp6N5LQ==
X-Received: by 2002:a05:6602:98:b0:6a2:1723:bee1 with SMTP id h24-20020a056602009800b006a21723bee1mr5195402iob.58.1665282810832;
        Sat, 08 Oct 2022 19:33:30 -0700 (PDT)
Received: from ?IPV6:2604:2d80:4d87:cd00:9f51:32d7:1177:67d? ([2604:2d80:4d87:cd00:9f51:32d7:1177:67d])
        by smtp.gmail.com with ESMTPSA id v14-20020a92ab0e000000b002faa9fe86bfsm2449714ilh.56.2022.10.08.19.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Oct 2022 19:33:30 -0700 (PDT)
Message-ID: <f488fa30-a307-96f6-fe85-271cdc48faa3@gmail.com>
Date: Sat, 8 Oct 2022 21:33:28 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 1/2] power: supply: add Qualcomm PMI8998 SMB2 Charger
 driver
Content-Language: en-US
To: Caleb Connolly <caleb.connolly@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, phone-devel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20221008183753.249514-1-caleb.connolly@linaro.org>
 <20221008183753.249514-2-caleb.connolly@linaro.org>
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <20221008183753.249514-2-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 08/10/22 13:37, Caleb Connolly wrote:
> Add a driver for the SMB2 charger block found in the Qualcomm PMI8998
> and PM660.
> This driver adds initial support for detecting USB cables and managing
> basic battery charging.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

I can confirm that this driver works as expected on boot and when
suspended/resumed. Tested in my Xiaomi Poco F1 running postmarketOS.

Tested-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Regards
Joel Selvaraj
