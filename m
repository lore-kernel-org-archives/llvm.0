Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD189383B1
	for <llvm@lists.linux.dev>; Mon,  2 Sep 2024 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725247272; cv=none; b=ECbVNSQBgZfA1fK8/UzV8Hja2rllwR468FyCfQgYfmYcRUt9mg52Y8GBBQMm3XOTiPxSgn86LnuLTm29U9VKa7NYUYjcw1KKnI+/8fo7nrritYLzMg5NRiFjFc8dj2cEp9LSCqwTWAWh45ZDIQZdaM/8OzetXjT0J3QpqGEerkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725247272; c=relaxed/simple;
	bh=y9axUGR8EfqxZAHiydHEX6vOQWDyEvg4o2WuDvwdcn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPCdfe1fNtxOEea+YJJrc/8DCefJvFnGG8YrifvoYy4/e4jearJHJj37jOyoOq/xUUBAJp1HOlPpm0KJg4fYEA3oYhseJh7PO/WeM7ZLcraE9LsitLwnHbeA4uZLJ+X0/0PTWKUoHB8Toq2YSr6yI93FebNZpZIgwXC/iNW0djU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeODPB6q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeODPB6q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d8818337a5so1382603a91.1
        for <llvm@lists.linux.dev>; Sun, 01 Sep 2024 20:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725247270; x=1725852070; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=io0s+dCAmw2DOjaXylSZmDvypE1DTOx04bqDl4bOCME=;
        b=BeODPB6qUR2bhz22DGw2GQXKg672wbvQ/ZgaLD0T1puqwEwr0/rnraa3V/wxfJtlZ/
         sRqCKkRbpZZ3gQkXMrSA1ojLko/igfQxMfFwu7J6ezx3HAhveQ4BwpF8enQvSJyRVVw4
         Q6vxXgaOGKf8gDX55+K6TiiY6LQgwdKXotlWleZbj3166s6KmUkQxy3qjDmRBbdEuxQD
         /snoHOoWz3yXWl2gevTk+CWgcxxdSpseKtGuimPAKkaEW018HAUV2xvSSfrohoLDwaUe
         VPhKEbj2/U2/6SYo+L2QYTFeJqrG8BaO+QgULcbn3yCv//nqEE411Tl3FeERMORvPzHM
         X4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725247270; x=1725852070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=io0s+dCAmw2DOjaXylSZmDvypE1DTOx04bqDl4bOCME=;
        b=PnkOpGzyc+i0uqkicC9cRI4HDAd0ks8H6WYoj9F1TUhxTaoBLS6Swgno2PcOtPJ8Lh
         WY9NKCwGu7QtrSZSnmhPtfnpcVTn61HscMxH8AdjCzsNEA9ZJkbDopDbgHmLl8KUtLrR
         leN8oG4cXcWuOjDauqynr6ruktAGqOTr7z9LRQlak8IGsGOIVT6q7omNlTzp1ohbbH0S
         XdkjVql8YRxU4zYyWmh5OGsvSLzL9KwS8rlLFxr1lVm2sm8ILueTgw99i3TqRUtSKkjG
         +ctym1DvEkyRB+gHmqiO/JUjKkUM1uiKTLIjf1U80smDpE173e0OXICnm8NMjUNMn5af
         Y9rg==
X-Forwarded-Encrypted: i=1; AJvYcCVD5+MbbmMFsRD2uQ9mdipYb4+erIxyrWWjGak8ONd/eLLWsRJ2zKppUuTmeFGEgnYW358p@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq5SN+BbptHlCG70sHQ+C6D7IevDIya3y7M8lNlbmQsqk1Kt11
	Ck4JddbXBDjZt0tFPgrE6f2frm150dF0uBZy/4t4lCzSVdNCSouq
X-Google-Smtp-Source: AGHT+IGl3cgFt0BFw7/Mok21dhJTcmR4ZEFf8lmZSNP541apI10NG7rJBtzmFKS+934r9Yn3AxsQSg==
X-Received: by 2002:a17:90b:191:b0:2d8:90c4:8a9 with SMTP id 98e67ed59e1d1-2d890c40930mr9938904a91.18.1725247270003;
        Sun, 01 Sep 2024 20:21:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d84461411asm10441678a91.24.2024.09.01.20.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2024 20:21:09 -0700 (PDT)
Message-ID: <129f741e-ab25-4954-8d30-39746dea2d3e@gmail.com>
Date: Mon, 2 Sep 2024 12:21:06 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: add the translation of
 kbuild/gcc-plugins.rst
To: YanTeng Si <si.yanteng@linux.dev>, dzm91@hust.edu.cn, seakeel@gmail.com
Cc: corbet@lwn.net, hust-os-kernel-patches@googlegroups.com,
 justinstitt@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com,
 nathan@kernel.org, ndesaulniers@google.com, siyanteng@loongson.cn,
 alexs@kernel.org
References: <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn>
 <58b7c7d2-f60c-4a2d-9cb5-d583182bfef4@gmail.com>
 <65f5467a-5c31-4d35-b0a4-e163429e98c9@linux.dev>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <65f5467a-5c31-4d35-b0a4-e163429e98c9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 2 Sep 2024 09:32:08 +0800, YanTeng Si wrote:
...
> 在 2024/9/1 14:03, Akira Yokosawa 写道:
>> Hi,
>>
>> I'm not Alex, but let me chime in.
>>
>> On Sat, 31 Aug 2024 17:34:11 +0800, Dongliang Mu wrote:
>>> On 2024/8/31 12:11, Alex Shi wrote:
>>>> On 8/31/24 11:48 AM, Dongliang Mu wrote:
>>>>> +目的
>>>>> +=======
>>>>> +
>>>> there are still a lots of sign incorrect. Please be sure everything looks fine in a web browser after you 'make htmldocs'
>>> What do you mean by "sign incorrect"? I check the html rendering in the
>>> vscode. It seems fine to me.
>> You are right.  There is nothing wrong as far as the reST specification
>> is concerned.
>>
>> Quote from https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#sections
>> (emphasis by me):
>>
>>      An underline/overline is a single repeated punctuation character that
>>      begins in column 1 and forms a line extending *at least* as far as the
>>      right edge of the title text.
> Yes, I guess we should also think about the reading experience
> of readers who use vim to read kernel documentation.
> 
> Because Chinese characters are already very neat, sentences
> and paragraphs should also be neat, otherwise the reading
> experience will be poor.
> 
> Let's take a look at some examples: (copy to vim)
> 
> 整齐
> ====
> 整齐
> ====
> 整齐
> ====
> Great!
> 
> 
> And
> 
> 
> 不整齐
> ============
> 不整齐
> =========
> 不整齐
> ================
> I think this is a bit difficult to read. What do you think?
> 

So you are talking about your personal preference, not about what is
technically correct or wrong.
And you are exaggerating by collecting them in one place.

If they appeared springily as title adornments, they would not bother
me at all.

At times, especially with a very short title, I'd like to have a way
longer adornment line to make it stand out such as:

  整齐
  ------------

Of course I don't have a say on personal preferences and I think
maybe I was stupid making a *technical* comment here in the first
place. :-/

        Akira.

> 
> 
> Thanks,
> Yanteng
>> HTH, Akira
>>
>>> Dongliang Mu
>>
> 

