Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBF1C7608
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989136; cv=none; b=SbyIWggvE/wJ0cImBwQZtWi3g/Oqw+bPrkePtHnEZDL9tiSTPtgWM/XbnqSdQhCFbcl6D83wqorr+2E8njX0gzAIvTmllrHmEkCltCOmRJTdMj7a1abOnyIsc7mjBZ3Vb6nyhghAliVjh1yc9fjnMx6UO+KkloWhDDtCddUitS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989136; c=relaxed/simple;
	bh=2RUa+Wp78UJcnBTaHrcjGmfuvysTndxMqeQSnUj1y4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8WcgMmfB6WtZ/TX8gBzpwbSiT5EBbT/UNfkPUof9TyF2wo5pEYHhT/Qnspk/g0f37IGeqeRVBP1iYVTwoINvLiTJMbjqOATQE4kIZJjYg2SkzZhzuWU31G5nv86/bRNC7tQQV/dIgy+bbYY8uS67Nm3Q9knry92j6RdIpSezs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aB/H8ohr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aB/H8ohr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99ffeea60bso356589966b.3
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 03:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728989133; x=1729593933; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TCL9tE7kD/pEAlw/bIpW3296DIJpWExNiDbcmpjDgj8=;
        b=aB/H8ohr7UmsZWRDqXR04XxhJ/p8/S6cAxUPM+vTG2DGbkjZdVJ/JfvE9frptON2G4
         lpJhwPN0K/vp17RCAQDLvFXkVbdrhvktMCHgp9LpIgaA4sHUq1lhmv/FRoa0ahf16CYI
         RFOWZ7G0bSi9cnWpLkwG4pLcBIJiWueve5sTpv7N1eedxd8qmCeBYleRAxS/wMcuB1j7
         HTmrmykp4wwCqcH3MxIxnXipmnVhTYLzZmwBQgLfDVT5eNlQCIt4Hr6i9pQTKj6YECaO
         A0G6qVb6AEipuANyUhKMqo6xgog/CLIxkL/ZVGbMH+OoJuBXLK/PmoIGfDezXjwkEl3r
         ZiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728989133; x=1729593933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCL9tE7kD/pEAlw/bIpW3296DIJpWExNiDbcmpjDgj8=;
        b=W0Yw33K1CbzN/il6f1XSBlTjF0rqIyjeplDO7myGxhyGtOf8/2l6IkSZw5ZlVDyjAF
         vQRyB/M58W2st7zmcW3WGHmlV8LTHieh0L5lxYgWQYFf3nLyXg+X8spi+gVYWhah3A6i
         rGueFgN8rPGOVU7hUkdHxIZJXryeOsVfPqsYSQq2iMsopEgavUrnMciekPj2Vi/7Ljt5
         VcXBcVSgoOCf5aZQxO1knyPQLw+ArF5oNkszBOLMScJuvJce1gzfH1DIqpGfpxWXwAsZ
         Znj129BCMpOWI+W/SqRyz6m6cRMO9ABl82vq64+ajwI2dlE0OozNcb6gjjNZUPjXcvwh
         5zZg==
X-Forwarded-Encrypted: i=1; AJvYcCU4pp/B3kbgKldraJDx2pC81tgI/rhiKOWlz4W51X6+rNzEyJuSgt+fvDNFMrH4EJyiwKpz@lists.linux.dev
X-Gm-Message-State: AOJu0YwFNhLpk7ToCXT3/c5U6wrLUTz+5Lz1Ip8ckdOakhKdMdAsaOd0
	KJLIHPdrMrFjV2A80baQhEljOsnCnXkeongr4DWH5LJS3Q0vMAbWPtThdznfhhQ=
X-Google-Smtp-Source: AGHT+IGr2iqgWL4Av+20XWPNQ/ZE7fyuLmJsKSn2ZOfDWIZori+kUOfJFFddL5wMKnYz/zgwCRipDQ==
X-Received: by 2002:a17:907:7e8e:b0:a9a:61d:7084 with SMTP id a640c23a62f3a-a9a061d7325mr751772566b.50.1728989133267;
        Tue, 15 Oct 2024 03:45:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29843318sm56079066b.150.2024.10.15.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:45:32 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:45:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: sfrench@samba.org, pc@manguebit.com, ronniesahlberg@gmail.com,
	sprasad@microsoft.com, stfrench@microsoft.com, tom@talpey.com,
	bharathsm@microsoft.com, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] smb: client: fix possible double free in smb2_set_ea()
Message-ID: <c0afa02b-991c-4601-bacb-13ace9cb96f2@stanley.mountain>
References: <20241015102036.2882322-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015102036.2882322-1-suhui@nfschina.com>

On Tue, Oct 15, 2024 at 06:20:37PM +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> fs/smb/client/smb2ops.c:1304:2: Attempt to free released memory.
>  1304 |         kfree(ea);
>       |         ^~~~~~~~~
> 
> There is a double free in such case:
> 'ea is initialized to NULL' -> 'first successful memory allocation for
> ea' -> 'something failed, goto sea_exit' -> 'first memory release for ea'
> -> 'goto replay_again' -> 'second goto sea_exit before allocate memory
> for ea' -> 'second memory release for ea resulted in double free'.
> 
> Re-initialie 'ea' to NULL near to the replay_again label, it can fix this
> double free problem.
> 
> Fixes: 4f1fffa23769 ("cifs: commands that are retried should have replay flag set")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2: 
> - Move 'ea = NULL' near to the replay_again label.(Dan's suggestion)

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

