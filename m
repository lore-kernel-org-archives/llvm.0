Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15ED339BE
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JvfSAVuP"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-79fab2caf70so31704739f.1
        for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697483815; x=1698088615; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8eYRGRtH2Fn/z90b+vACllQCdROhKOQRPM4SZCUCIQ=;
        b=JvfSAVuPaKYIUUWRz8eEt2NS9u2OmnPiUxSO4x4fGJQd6CK/z9azY/yclqME9i9Ay8
         tomj6aGWuDOfSTDZ+I4flb19xxFMnynMbpS2SwGu+nkKtylDAfZnO9t4IZ3f1Zhonf1e
         Z8D5ETAnEYA918FysM1jyBdqelIjM5zRBHUto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697483815; x=1698088615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8eYRGRtH2Fn/z90b+vACllQCdROhKOQRPM4SZCUCIQ=;
        b=uYRp/s3l7B3AcEDR4YlMeAdOd7Gmb6GDXruUWCz+38RWZQAsk9waOgrsFN+3chHTVq
         9jBcoZp5LjftBKGT1r3oPgFcHmxEFbyIxbfjsk67ILG2XpyL20yHJBHr1o+hbyy3Pqe2
         gXkvxC6NsyzwWkhG8FZEa9krQB0YANjDwKa7xDX1Upw/9IfvErLFrEYPSjjXG8nYtcqS
         1HTGugTA8mMl9WZO/1UXUtnaxcHn8RLUkA+kTEnnsAg4VMKGA8KJIPjCE+UL+AU/YMGp
         mQJfM1ZFRR/prFAuG82f4UcFu/jdnGWr5wpOh1RcEP7yNfUrpESXbsKBSLQclw4g0VMu
         a2tw==
X-Gm-Message-State: AOJu0YyuCF3oiW8S2EvRTLnDoiApqjW8nMuuCFmQOHRKpjGB6EIt9y7h
	Rq4fA6lIKGi5PalnHUb4LQN8Fg==
X-Google-Smtp-Source: AGHT+IFn1ecQPDmAmDXWidaDLU/nr0Tzhtrs0dUVOUBVzpssFg4fsI+vtOqUvgh1sUS+F79tV8d5lg==
X-Received: by 2002:a05:6602:35a:b0:792:7c78:55be with SMTP id w26-20020a056602035a00b007927c7855bemr190345iou.0.1697483814866;
        Mon, 16 Oct 2023 12:16:54 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g21-20020a02cd15000000b00458e239fa31sm1109479jaq.55.2023.10.16.12.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 12:16:54 -0700 (PDT)
Message-ID: <148d2485-798a-4258-bfa2-870b7b6b95a3@linuxfoundation.org>
Date: Mon, 16 Oct 2023 13:16:53 -0600
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
References: <20231016025038.1677-1-zhujun2@cmss.chinamobile.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231016025038.1677-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/23 20:50, zhujun2 wrote:
> printf %d in format string requires 'int' but the argument type is 'unsigned int'

This line to long. Character limit is < 75/line.

How did you find this problem? Please add the details to
the commit log.


> 
> Signed-off-by: zhujun2 <zhujun2@cmss.chinamobile.com>
> ---

thanks,
-- Shuah

