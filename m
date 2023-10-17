Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF04448F
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qe2xT+ea"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7a66555061eso4485539f.0
        for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697558070; x=1698162870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4G1qT6aCa9jONcb1w7B7j7yaP96Lr1tt891SPK3dpg=;
        b=Qe2xT+eaev+BNLXAA5x138aEhfjYD0C3wSR2q8sNoRvZCzOqP626NSd+zItVILliG4
         rGr60W07rxAEk97J4B+4qAX7sxbVNE7VRX6HdxHfURbr3ui6ODAjZjpecj9F9lhf+4PT
         3dCXLiA6vq46aVSXz/mADNFjWhKizAKJDSMys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697558070; x=1698162870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4G1qT6aCa9jONcb1w7B7j7yaP96Lr1tt891SPK3dpg=;
        b=mVtLYlXbzykwYTrxNM9FIPXN5BQJKNDF7ru25eTFCNrFEyybIUIHQjxfDKF9RMuwyQ
         5o0KdRrE68+ON+CoUlAvoMoA4/qbVKdBblmeCEYuBPmcq2vYuYZ5ozwxuFZNogQ1zB6f
         ug3If9ebBd8tNzaFz2mHFKPVIP9d7/a7S6hLnVPN6qZpl/j53H14E14GdPXyofg/AZa0
         FM+YVAvYqfrGSv+ap6BllN4DXxe66uUakQPBKpMzQxyU01JAC7V1RIbcdS65sXV1TAIK
         B12ULqRJ5mMcNk1idhyXcB5TTux8K8+ZInqpRdOcvvGfJA/a8RjZvKBV+YGscQTQKBrk
         g7YQ==
X-Gm-Message-State: AOJu0YyF2FInaVgQcSz/ulrsX363f2dSzr6Dhqd6CBZrU9yWqrjARnYu
	PVfZkT9YiUWLcIKF3+RAcWLP7g==
X-Google-Smtp-Source: AGHT+IE1gm5UPb4UgknT2djO05i1WKcZkMahvgNJZx0obMBFURyRnux/GWy/wHUc51MJlLYA/ThrrQ==
X-Received: by 2002:a05:6602:1513:b0:79f:a8c2:290d with SMTP id g19-20020a056602151300b0079fa8c2290dmr3370902iow.0.1697558070367;
        Tue, 17 Oct 2023 08:54:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id fj1-20020a056638634100b0042b4f9ddecasm597648jab.85.2023.10.17.08.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 08:54:30 -0700 (PDT)
Message-ID: <f1857ee6-1569-4a85-ba51-94c3d841cb61@linuxfoundation.org>
Date: Tue, 17 Oct 2023 09:54:29 -0600
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
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231017020856.7003-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/23 20:08, zhujun2 wrote:
> when the argument type is 'unsigned int',printf '%u'
> in format string
> 

Please add how you found the problem to the commit log.

> Signed-off-by: zhujun2 <zhujun2@cmss.chinamobile.com>

thanks,
-- Shuah

