Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAF155CA8
	for <llvm@lists.linux.dev>; Mon,  2 Sep 2024 07:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261173; cv=none; b=mn/XgGPsGAPhV91IlIrDVuQkwBVAA/CbGvzHLUgH0fydwxoynWAdU9ZjJrC/m4Zs+BYkrU3HmOTQa4k/kjPaiOeXvsdR5OMxNu+OJzLNGpc8ZCN0yAGy8maEMzMnbe4iEjgn8rJSsFJxMGPphMum2tsFbePk6QVZV0MiDQsk8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261173; c=relaxed/simple;
	bh=FKep8l+oV7HR/Wfto8Gbg+6ucFn4AA0TMQUicSzBqf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGTEZgLO3pt2jMBwTUVGV95MRKicJFY5iqDYCaKEJFHY3vNC5t0e0CHTDCKEmbAv0B/5lR7qh5WvOFgpKv7cYbA8IUKMRjXqb0h5fN4ofQlWJQFFWK1Kp9bncaMgOtgp1ZLC9VDWtmXjePPWFFNlcjMmI3z8qy49dIr3WeSqhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwXANCvR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwXANCvR"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so2650763a12.3
        for <llvm@lists.linux.dev>; Mon, 02 Sep 2024 00:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725261171; x=1725865971; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPJjH6wjnaMmhjF7ajp9QxgpTUkbKcRgs08eMqfuzp8=;
        b=CwXANCvRf7p6li6pXlg8jYMZSzzCBpqpbakSGFCQp8oasRsD2aoe4uwuUPLepQLTZ8
         7wbBDOF3FPz7SeayvOEEkoF0cEttIVZejI8Oiyiurz4xDHdvuGGa3hy7K15kj1b3w7YD
         bvfuXCPO7J4931lJLtDPp7ODnpijOGUZs1smua9EehjBqgwYeRzIAP1st3VGixZNLdfO
         hSDpkDZwhB/rCgi8tzaT4qy6t/Zdd/w+yqHkdbfChGbIEmZoROJHo/1NkjqVcl1+ZqU7
         AAEyfz24AdKlLzeEh2uofolxFGG/i5D0IYSfIi/MxWbugiiafJwQn4n87S8IsIPeI4mB
         sp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725261171; x=1725865971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPJjH6wjnaMmhjF7ajp9QxgpTUkbKcRgs08eMqfuzp8=;
        b=qLS/C1Va6BpuISYqoG64h3Ci8z67qZjYtIKosg504oyhX4J5+x8YLu3I2QHR0oaYMf
         dobU8wmO8jDnxldW/qAJ7AJ3Pp+MxsMpwEUntkiU2E81ClIB3lA7TXfjOHtXMnpQmiae
         jMCc5OOZtqEzE4nvIyzG22fhQ37vbB76eU9XfmpcN74d9BxLpbBEALwVitgqJxTeF941
         eKOoQ2zGf72ZwFTsIj1m5N4UnXcmEC6U77ACXd8pX/ny2qH8/lZhgaeqy5EIfjDqVd8K
         hKN5IuAQ7C/rO+tv4wy/sAKti6QirKWEwjkHqqRicZ1TR5/ZbF/cXMnTdzrcGmPrZezI
         23IA==
X-Forwarded-Encrypted: i=1; AJvYcCWrenZnH3yrWqMCsWXDu3QlFNknQ0oJckZao1oViT9jACKWlRgZ1ue5OQc0dDsxzBkbyHQf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo9fHAtgBBsrWvRApj3+u3f5F7m/hddzwAfa27hjF0hTOWy9WP
	zfoLc4YFjTnuX4DNXMlOZyxTMrh49L+f0BXcOQK1jdL2HaFWjr1Afr9M6w==
X-Google-Smtp-Source: AGHT+IFXZKM/8IqDv+Gbczy712NDtwg2wdVmlEzcNwDgfNYlgvz4awzr7Hob1IucqFMlqVTHUdpKaA==
X-Received: by 2002:a17:903:22c7:b0:205:6f2d:adf7 with SMTP id d9443c01a7336-2056f2db09bmr32015405ad.21.1725261171328;
        Mon, 02 Sep 2024 00:12:51 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2055553958fsm24736575ad.99.2024.09.02.00.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 00:12:50 -0700 (PDT)
Message-ID: <14c9d71e-e953-493b-a581-141a58a15b49@gmail.com>
Date: Mon, 2 Sep 2024 15:12:45 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: add the translation of
 kbuild/gcc-plugins.rst
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240831034924.3729507-1-dzm91@hust.edu.cn>
 <0a434542-b207-4bb6-886e-74eff6cc9f39@gmail.com>
 <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/31/24 5:34 PM, Dongliang Mu wrote:
> 
> On 2024/8/31 12:11, Alex Shi wrote:
>>
>> On 8/31/24 11:48 AM, Dongliang Mu wrote:
>>> +目的
>>> +=======
>>> +
>> there are still a lots of sign incorrect. Please be sure everything looks fine in a web browser after you 'make htmldocs'
> 
> What do you mean by "sign incorrect"? I check the html rendering in the vscode. It seems fine to me.

vscode isn't good to show the correctness of the doc. Please try the thing reviewer pointed out.

Thanks

> 
> Dongliang Mu
> 
>>
>> Thanks
>>   
> 
