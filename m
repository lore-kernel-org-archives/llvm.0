Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043428175B
	for <llvm@lists.linux.dev>; Fri,  5 Jul 2024 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720210603; cv=none; b=Geyc8S2+cF+Hv2uMOLcjXJ7NpUGUZiCsIvheXkQMM/5DsJqBhm0bXk5AIa0UIEkiDGRNQMyS8eTFioJNnTrVcIOR4LU/bqR8MxVF6+CqANoaS53Q5Wcm9fJIVuCyk9Z7ZzdSII9Goz1GfP8tnDqTDqr4uQEMAgFIlGCSxRVmLCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720210603; c=relaxed/simple;
	bh=T0Yezoe/XJwes714mKbKM0egw+ZynvAnNMtDEZXPuzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8ckmGWSO38Vr/LiIlLc4pFSivPRv/Z9dfkHXTDQYWPJsF8hRG0aePC1aiLiCw2wP2dfAcmVUbw89+GTmxFoAcfmkiZTKKoxmJ55dkz61H38F8iWg0MWeaxJFpWXEoqoiqKQWk0ZYtmzw2cRgweJPPAWJoyQeoZznQd+gpb8H0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JJ03O6Kv; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JJ03O6Kv"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3748ec0cae2so1326585ab.3
        for <llvm@lists.linux.dev>; Fri, 05 Jul 2024 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720210600; x=1720815400; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hICKxoDUywMdQbtGCI28pRH9+4hLvJaqbu+wfwSzwBU=;
        b=JJ03O6KvV80Rc+O4QrQ3+3LHUU0I4DRzkQcbo8RhpEQGaTqHPtykResEnidvtt/3Ai
         a1nRdr+KDT499E1l6AisR/WnccwVOVxAEqgQXQiSvbcCwnuK1JklgDlZlLO/4DvVD5cq
         q7qEedwwEOt5QK2wALFWKC8JMEIQ7KeRR1UJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720210600; x=1720815400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hICKxoDUywMdQbtGCI28pRH9+4hLvJaqbu+wfwSzwBU=;
        b=sdAu/fxNFScvIyT90KuuokNKzUnLvssD2Jxxsw/5HcHBLJ9t3Klth36fRgexoiL4s2
         dzY+wwUN5Y6ET0jQGMPppAY+QUtzcT9xPdxYqsZyZdtMac+0dQzn8Xqti3fBJB7cexP6
         UyUoWQ33pWPRxWbIlApW5gX016i1PkNjOMwfczm2FWOf8BocrgFkaSce4aLOpK7onNKB
         BxMcHkGaPuDWcYRSaaFKhfOYGJFWXBboCdNdbv19wWmxdtz7uET0ssUCgWg7roQg8l0e
         REPyQhIbjT4COFbgKZtV8i/C3Wfq0Lo4G8nOsZoSxX5Gv5I2uVia1rMETX7urgSYergv
         Rw0w==
X-Forwarded-Encrypted: i=1; AJvYcCUmzMVC2iW1iGpIs2yqp2bLIA0gwHWlrDgrU7A3o9LHRYtf/tO/stpaCcIR+1q/V3f1ZVv5zWGmJ1LRabqildLk2NYHQA==
X-Gm-Message-State: AOJu0Ywo1kMRxa9MZS3GbV8t0okp5wlTui7csZbWJW7Ze9YXTRuwoHS2
	/ojRjK0KK5438di5ozoiEsgIVlHFEKz3FQvgFUBBHXfsukc89iuUH+J7+XUt2bE=
X-Google-Smtp-Source: AGHT+IFxJeifz5EcUyoQ7zGXVAt/YfV1u/9+SuLU0gHe+drTSap9H+MC4G0IQtB9rf9SBDEaRTKPgA==
X-Received: by 2002:a05:6e02:128c:b0:382:56bd:dfb8 with SMTP id e9e14a558f8ab-38398710577mr53428745ab.1.1720210600102;
        Fri, 05 Jul 2024 13:16:40 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-37ad22cb6b2sm40055505ab.14.2024.07.05.13.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 13:16:39 -0700 (PDT)
Message-ID: <d99a1e3b-1893-4fac-bf05-bcb60ca7f89c@linuxfoundation.org>
Date: Fri, 5 Jul 2024 14:16:39 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] selftests/vDSO: fix clang build errors, and
 Makefile cleanup
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Andy Lutomirski
 <luto@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240705195736.34039-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240705195736.34039-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/24 13:57, John Hubbard wrote:
> Hi Shuah,
> 
> These are for 6.10, as we just discussed.
> 
> Changes since v4:
> 
> 1) Subject line on patch #2/3: s/mm/vDSO/
> 
> 2) Added Muhammad's review tag.
> 

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/?h=fixes
for Linux 6.10

thanks,
-- Shuah
