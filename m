Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878D16405
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 17:34:19 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-760dff4b701so29679039f.0
        for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 10:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690565658; x=1691170458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJok0QwvQYR36IKSjL8u59VRoTv1ncFddhWzUUY4CBU=;
        b=XtTBKKi+apn2fenZceCkRVw6TxyPthsMizJvUJrPqjkPN2XI4pbqgSDa4uDCTSd/FZ
         Luwhkl++4arII4ixaGEnK+WoPSnFplB1+9+0uYlYuXC3ax638pDV07ieqSvgaYshQcyp
         rzWhvpVh7VgJH0aZBOO0gZz5olNyXWLlSAzTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690565658; x=1691170458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJok0QwvQYR36IKSjL8u59VRoTv1ncFddhWzUUY4CBU=;
        b=l3CP3P4t+pNFRigVoKoR0MM35IpBIJl5YJ69oyJcJvoZ3/zoVVAqhOy7hLCMBGWq3r
         YkGm8GIdfP42zI6isJVgoyAfDTC/eXfRLA4IkVf3t34854sx+1WILUywbqDlL7nTWRyk
         /7BEwTn5KD0aXHVaOGft/GSBM57jrJyVCRdEA9IhWmqlgjUS0x/2F+DACpAoBsg6G/x4
         tbq5fcmmo4NPZCpYIPtZHuamR9BvZsaktJqFMzlTet2w7yTEzRrTcbSshkCVL8wM3gjK
         B/UklEGMN6bJG9OhyP2Smt9dW4LMq+nsbQ4zg1ax3bI0SaTB3BtXDXp0/Bki1tNfKGj2
         +UAg==
X-Gm-Message-State: ABy/qLbdL0abDwo87oLSa3EFAc5Q5aapJ2cylddGE47mM5ZDalD+qx7z
	So9UP7oqQuMKCTSlvTA4wDDS2Q==
X-Google-Smtp-Source: APBJJlGurOK8bCZ2RudKd5/e+thD+HiWjwVIx2Tiv/Vlhq/itMoQKBCYEu4Myp6ksjRe3coqJq70vw==
X-Received: by 2002:a6b:3b09:0:b0:780:cb36:6f24 with SMTP id i9-20020a6b3b09000000b00780cb366f24mr199256ioa.2.1690565658763;
        Fri, 28 Jul 2023 10:34:18 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a10-20020a056638018a00b0042b599b224bsm1244019jaq.121.2023.07.28.10.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 10:34:18 -0700 (PDT)
Message-ID: <b247219c-f988-bcc2-36f5-22659e2ced96@linuxfoundation.org>
Date: Fri, 28 Jul 2023 11:34:17 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: selftests: connector: proc_filter.c:48:20: error: invalid
 application of 'sizeof' to an incomplete type 'struct proc_input'
Content-Language: en-US
To: Anjali Kulkarni <anjali.k.kulkarni@oracle.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
 Netdev <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>,
 Shuah Khan <shuah@kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Liam Howlett <liam.howlett@oracle.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CA+G9fYt=6ysz636XcQ=-KJp7vJcMZ=NjbQBrn77v7vnTcfP2cA@mail.gmail.com>
 <E8C72537-4280-401A-B25D-9734D2756A6A@oracle.com>
 <BB43F17E-EC00-4E72-BB3D-F4E6FA65F954@oracle.com>
 <799d6088-e28f-f386-6a00-2291304171a2@linuxfoundation.org>
 <DD53AFBE-F948-40F9-A980-2DA155236237@oracle.com>
 <20230727194311.6a51f285@kernel.org>
 <5844361F-E776-4C52-BA8F-7E13D6B4EDE1@oracle.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <5844361F-E776-4C52-BA8F-7E13D6B4EDE1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/23 10:46, Anjali Kulkarni wrote:
> 
> 
>> On Jul 27, 2023, at 7:43 PM, Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Fri, 28 Jul 2023 01:38:40 +0000 Anjali Kulkarni wrote:
>>> Jakub,
>>> Do I need to revert the -f runtime filter option back to compile time
>>> and commit with that disabled so the selftest compiles on a kernel on
>>> which the new options are not defined?
>>
>> I'm not 100% sure myself on what's the expectations for building
>> selftests against uAPI headers is..
>>
>> I _think_ that you're supposed to add an -I$something to
>> the CFLAGS in your Makefile. KHDR_INCLUDES maybe? So that the uAPI
>> headers from the build get used (rendered by make headers).
>>
>> Take a look at Documentation/dev-tools/kselftest.rst, I hope
>> the answer is somewhere there.
> Ok thanks, I will look into your suggestions.
> Anjali
> 

I sent a 3 patch series with the fix to this problem and a couple of
others I found during testing.

thanks,
-- Shuah
