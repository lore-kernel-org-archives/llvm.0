Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CAC28E4
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 19:50:49 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id j83so9283828oih.6
        for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yhjO44+D0aYcdcE6np5+AvBqPKTyqdOVFrzIZ1noXSA=;
        b=D1Z0ZOmohogqX9cY1Fn5MmdsU63Ql5MjmB2/cwbcNP79oqgulB9P5vq4095xzwX70F
         mE8qYfHlBI1vzgfkPA+4TMRn67kB4oLbrgGT44kywmHKUL+nq2hWJCfeiRohpnj7PDhH
         pAfuMXJuxOWD22YmZir2dZgsEwUI8KdXF3u78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yhjO44+D0aYcdcE6np5+AvBqPKTyqdOVFrzIZ1noXSA=;
        b=5QYR1ygPHM42SC1/U7sAZOkoKo+FNH91Yg/6duQsdoizFgSWRkpi04D6pVTy4ufZAk
         ThGJzkY2XHIlrUIhmQ2f/6SSTl9Z2UPx3JEySKpP/FtB39rvLTo5WwzprHqF2Y71i/sw
         Zoyv4c9XgeKeKB98XAXsVzd/eV+Uh2yUfys22InVrleNjBNLiujVQUNlT6dGcdicc5Ta
         pU7w0e3h3C00ZwEQwtjz236pSxvEvlqC+7EZinH+S8os44pPW0/s3Mf6lGCe/pLhwTHS
         nJvOif22laUHOk4aq6Ou7bI8YHTI3zDEfpzPQvi7FMX54OCV452BkeE0BjPZyz4qxoW4
         VNcA==
X-Gm-Message-State: AOAM533E+ZyJdK1zQpOGGx7RU66D4S2U1RE4ue4OrhEDomIfZwmQbTve
	D6Ad/5ljMn9kfk+0wEN8CTqmXg==
X-Google-Smtp-Source: ABdhPJzl0o/k3dhCX11aBLeVLMykkE17NaTFp2/mx4UDZ4KUorNcH1gIJsPkfFCAaagVqRtdWqBJRQ==
X-Received: by 2002:a05:6808:d51:b0:2ec:b129:1197 with SMTP id w17-20020a0568080d5100b002ecb1291197mr834192oik.12.1648237848423;
        Fri, 25 Mar 2022 12:50:48 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id g6-20020a056870a24600b000da0df8b3cesm2950982oai.20.2022.03.25.12.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 12:50:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] selftests: fix an unused variable warning in pidfd
 selftest
To: Christian Brauner <brauner@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20220324223929.1893741-1-axelrasmussen@google.com>
 <20220324223929.1893741-2-axelrasmussen@google.com>
 <20220325152117.mxp35mdfxcgsow6a@wittgenstein>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5733cfff-d20e-7792-f809-14cc594a1afe@linuxfoundation.org>
Date: Fri, 25 Mar 2022 13:50:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220325152117.mxp35mdfxcgsow6a@wittgenstein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/25/22 9:21 AM, Christian Brauner wrote:
> On Thu, Mar 24, 2022 at 03:39:29PM -0700, Axel Rasmussen wrote:
>> I fixed a few warnings like this in commit e2aa5e650b07
>> ("selftests: fixup build warnings in pidfd / clone3 tests"), but I
>> missed this one by mistake. Since this variable is unused, remove it.
>>
>> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
>> ---
> 
> Looks good,
> Reviewed-by: Christian Brauner <brauner@kernel.org>
> 

Thank you both. Will apply it for Linux 5.18-rc2.

thanks,
-- Shuah
