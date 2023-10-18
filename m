Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4875335CA
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RzmGkPx7"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-79fab2caf70so59138439f.1
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697656186; x=1698260986; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0ky1wnd5GsHa1/Gq5XBn5olLOi5clFpai88Fqne3Ic=;
        b=RzmGkPx72w45ZC3/o0b0+9zPJYQBrst/5902Gv7ojhahJke6dKfKkZBpsf3dCcvvCz
         zSwWCrhi3O1Fi2Ta/35AXm2iP1hqHdLT052oBZjsomWjzwoFPTQqX9NOUO55OcMDwn50
         Msqd4A6XgN+sqS6CHiojpM/v41AzSyQuOEuMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697656186; x=1698260986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0ky1wnd5GsHa1/Gq5XBn5olLOi5clFpai88Fqne3Ic=;
        b=mas7F8l/jTfIsvT0TOtFYEk+z8vu14bmLTjXE6ZI76m2inQNeO4rLLFJQ9+X+RGELN
         sEX1bN1PnW6dprIByIbpKvbCYUJBWlL0cX66pkfpXTs7/5FNxrKa4E+EBH0yLDNv87LF
         TZv86ISIFuuws4uqOMrDnE4gt7nwNIEFes0jL55u3RBR9Mg1rz5EDrsD060Rvb93LxAW
         qVSFVpxjEtxvGag3r7FizuceecWRjVqK7B5Mokc8KY1aqgrbP0kwr/dxFuvPqQPobwMD
         dnPgL/lsUqHQU1u8nqIodknTktPxnCzul1BayUWERb3LNjJL9JswMyXQcR5nOZgcDKPG
         +iZw==
X-Gm-Message-State: AOJu0YzAhYmBuKoVaTnk7G5vF2Wd0JRc55J1BsJ5el7dXCF5oE1oUSL6
	AgGTQ4DQYutuTuJkbdWWHV07WA==
X-Google-Smtp-Source: AGHT+IGoIPCy85/s3YvO+smp2suqtSbF1zjsbHan9WxAd0UULvUIkJocwTzaMM/ukwNQlfidwpLKoQ==
X-Received: by 2002:a92:da12:0:b0:357:4682:d128 with SMTP id z18-20020a92da12000000b003574682d128mr328511ilm.1.1697656186753;
        Wed, 18 Oct 2023 12:09:46 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id y4-20020a927d04000000b0035134215863sm1283159ilc.55.2023.10.18.12.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 12:09:46 -0700 (PDT)
Message-ID: <d686781f-9594-4a57-ba59-9ad26532fd3e@linuxfoundation.org>
Date: Wed, 18 Oct 2023 13:09:45 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests:modify the incorrect print format
Content-Language: en-US
To: zhujun2 <zhujun2@cmss.chinamobile.com>, shuah@kernel.org
Cc: nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20231017020856.7003-1-zhujun2@cmss.chinamobile.com>
 <f1857ee6-1569-4a85-ba51-94c3d841cb61@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f1857ee6-1569-4a85-ba51-94c3d841cb61@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/23 09:54, Shuah Khan wrote:
> On 10/16/23 20:08, zhujun2 wrote:
>> when the argument type is 'unsigned int',printf '%u'
>> in format string
>>
> 
> Please add how you found the problem to the commit log.
> 
>> Signed-off-by: zhujun2 <zhujun2@cmss.chinamobile.com>
> 
> thanks,
> -- Shuah
> 

Applied to linux-kselftest next for Linux 6.7-rc1.

Updated the commit log with details on how the problem was found.

thanks,
-- Shuah

