Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2E3C3C
	for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 03:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729738967; cv=none; b=MSLdsMT05+X4Ghj93nh3seCm6LR54kzEHDBd67ewJmFGe3XyZ6lh4nTAFC2IanPoxB10r2b/Jg+95NJxSlR2r9BTFgqWmehrVn6JlbprKTDAPttJkexrx7n8tHXfnNFRGt7UANAbNLY12w04p1hvoP61+/JpzTRfX/UFwWjVh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729738967; c=relaxed/simple;
	bh=eZz8qi/lk0vuQ0JD9LDB4gmMp5okDKHCHmVJlkeHqNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXOB4MJ4k/Yron2b28yeAC5XHgD0ozw/dOymLZM3GcfTafR+nFCuBv/anHiVWrVHS1K9FZBpul4cv6u3MI64tQD4yIcN5chvIMSPiWurL7Em3iKQWa7W313Pg1orKdhA1RJcPtQGbZudiHHuCoUUA6U90g/oZWho0DlOLJV4NGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGzz8tWq; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGzz8tWq"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2e3179b224so533989276.1
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 20:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729738965; x=1730343765; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urQisYN08SbFdgusjdU5j7nsJH7wIPpsrHy/F5fggw4=;
        b=GGzz8tWqgfsJxqc9ifswnlf74pMzssczRYtRzhcKECvVKLQtF6JJw7DMu5EWg57xeG
         frPVy0VjvlFwnBDe5pIwBqvb1oF3u9AgueOqFt3xQbLp7o1Yth3+IwWBq4irOP7iAoe4
         2a9Efx+BsJ4eGYFiC/KdrMLJwDF8OFZGt3WsuPRCv+jQlz7GJNjxGhLUWmmLI9nimJLZ
         1Lglo8kcCoStiPIgfdZxmxX2iPrYjAJLC1GxsTPo/mhFIlDgNFs+hqNZTPqNxisqBHNe
         R68p/ZU5uZS3nj73hdjTW0RU5sIIxT80AJ9kfKXhD+dcxSJPG6zXommTv4AUTZ8h9buz
         cDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729738965; x=1730343765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urQisYN08SbFdgusjdU5j7nsJH7wIPpsrHy/F5fggw4=;
        b=Cpm7g5wN8uCGkopD8KucUhkK51MNUHUtYmy/C3W8JcbSxVmcfS34jm68ZgXKEPmP14
         s6iYnIuNMu1lOABaGQTequTIRNsgIxk/Wg82qmx9msuabBvmeyDwPYDE42ZPaqCkjj/9
         +EjvIWgDy/F8E3FRGxFkx05FWyzW0E2ZOuzs3okyp6Xlrb0mFVYwi6eLyW/+T4cZvkEI
         KwWsnPK+6Vg2OgB1Ue9mUeJcoMyFuQK3HyKJJFRx1FG6F7TIMOwt4aj4MONPMUIdS9zE
         OVQLO9hXtZAU4ZbY+Ov+tUcfuaG7MPg9k3HAsw0iB6VbpVQzOIFp0fjCvP/ueiA9OTVn
         aemg==
X-Forwarded-Encrypted: i=1; AJvYcCVyqcnktt07UZBRdGIBcazaTvt0ACH7wKwg7oqKwmNx02ox4HDw2cV953+6wGKuzaQNp3LS@lists.linux.dev
X-Gm-Message-State: AOJu0YyzU8xEK+7lM9UIOHIkb3GUp8VFhipAdUbg0w4A7P2sn6jEo/1F
	zwF/tIiTNpFeZ0XTNGxQJdyxnvNrFWZySHR3ZNspHu2bz7QZ8+3C
X-Google-Smtp-Source: AGHT+IHB3lKeYXZA+fZYYgAWG/OglEclq8ocXv2DM48o507wdfYI6apamkGkrD3OMV93qeeSAypdyg==
X-Received: by 2002:a05:6902:e08:b0:e1a:e74a:d910 with SMTP id 3f1490d57ef6-e2e3a64fbffmr4594403276.30.1729738964744;
        Wed, 23 Oct 2024 20:02:44 -0700 (PDT)
Received: from [192.168.2.226] ([107.175.133.150])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc9b2820sm1704959276.31.2024.10.23.20.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 20:02:43 -0700 (PDT)
Message-ID: <8a8fdd5a-44e6-42b9-a920-ff00ac7dc57d@gmail.com>
Date: Thu, 24 Oct 2024 11:02:28 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/zh_CN: update the translation of
 process/programming-language.rst
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241023062750.849951-1-dzm91@hust.edu.cn>
 <46e54088-ad96-4387-8a39-2e4686c842bd@gmail.com>
 <345e8f10-fe1a-4736-9468-7c92ac55d62e@hust.edu.cn>
 <e0c34a1b-6801-4ae3-b04f-56dbce5c76d8@gmail.com>
 <CAD-N9QV-EBbSkrZ5TSUt7j3MhsAHMozY59gFOEnSQ1HB9cUsZg@mail.gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <CAD-N9QV-EBbSkrZ5TSUt7j3MhsAHMozY59gFOEnSQ1HB9cUsZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/24/24 10:51, Dongliang Mu wrote:
>>>> Hi Dongliang,
>>>>
>>>> Good job! Most of translation are good.
>>>> Just the above doc seems still English version, give them a zh_cn name may cause misunderstand?
>>> Oh, I see. However, you cannot use gcc or rustc since it already exists in the English documents. We need another name to make sphinx happy. Therefore, why do not we directly use the final version of name? :)
>>>
>> Uh, is it possible to use English version 'gcc' links in this doc? Otherwise,it make sense too.
>>
> https://lore.kernel.org/all/bae3c59c-39a5-4daa-b37e-bbf077d57643@hust.edu.cn/T/#m8a948b24401404806f53e086f57856cf3a56a490
> 
> v2 patch triggers a warning due to duplicate links. So I crafted a v3
> version to use zh_cn prefix before each link

OK. That's fine for this patch. But for long term view, it's better to find a way for duplicate links.

Reviewed-by: Alex Shi <alexs@kernel.org> 
