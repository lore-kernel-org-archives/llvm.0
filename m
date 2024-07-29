Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72D188CDA
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722289149; cv=none; b=tzsTElAV+xPwDHP4fGfoDXivoZ9euUsYnMFfuE/BYnY8z+qQ4pU+Mr4+BHUIotkwPPFmGpk9DJGrd+Ohq18D/XPG3RXd7m7iZJ+yAglhV7zXtKEtJS/O9lDau/c3NsGdHTeNMtU6ZsweTf73zpZ0nQW8sTo1ivGVnq6b9WtUxr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722289149; c=relaxed/simple;
	bh=ZKY4QE8q3VAnLTSURlWscP30jdf97HBeG7B0gjM2qT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itL+YR/fZ3F5YXSMZxQILb5ghxpOIGdta72L8IyV26qOIy4Sy5Yv86BnIOd9/uRPjKCwZ0rEGCrHGd/9nHPZvkJyuq2jXW9ZJ7c03RdSk0Ig9AbTfROCSahdkD5m9hGwc4c6sf8ieaIrsVvZPk4Ur8TgWz7biiHxagefMQUYcXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTiljMoe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTiljMoe"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so511830066b.0
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722289146; x=1722893946; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xbu478JrkZGqTN2SecfNLUxeWNK8IU0WdYOsK9KhOXk=;
        b=PTiljMoeb3ER6jL31fr8E3dOp7jrT3s74enoapyWdkkG/lsazYAccgUEbs67wvfkiF
         gV6ZYtbkL3PE4atnj2d9C06sGKQr+IaL3JlvC+L10Ad8wnaJLzVfDmh/CgDENWOG5smR
         gHs+E9qn2ay6Q5ngofilmFT2VdkY88gj8/RqhOEGbZ+It/W8R4kVzpNVd1Pwv7U9Em/B
         1ziO9r6aw02bDH7Zqg8eLU0cKKCN5F4aLaVX7jf7iLzsLY+VOGCm5dWpQ0j4nBTsBOVd
         Bn1ivqeMLTU79rp/zvBAzDkgkjxB0Hp6LumuhYkQQdNha5sc2Waa28WO3f1p7hWYViHP
         xfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722289146; x=1722893946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbu478JrkZGqTN2SecfNLUxeWNK8IU0WdYOsK9KhOXk=;
        b=GFvDVSzRxuMkxU1ijT7yXxlelZJas3EjG2OIxtQ4kjDeM02wQzZgu+3ThP1am36XIv
         DDjziaoQD6UlTWXp5Of3o52F9s5byxSZKHffMv7mJDd/Z9cx7eBpK52SgnO9XxxLX+eR
         dvICkE7wBKxQpvI/DgW4GB76PdqcEOOJ7mD/j1VvFLkUMdXRqtAufSEqyyCZsmrx26sA
         ojmHRo96+wg9zGFzICoOf35dWsRC5h8FtSRunZna6BmpIoPteppvL3yo+8WmjlVE/kPp
         crnr1As1hUyX2I9Y3veT/MQaZA+mn3BnZodLioFQBdb8LvRaRK+xfHCq5jEFO7SrDnLQ
         ztcA==
X-Forwarded-Encrypted: i=1; AJvYcCWxDeB6wAM8wrBJuOgLmRxzuHiF/CMyH13xQhNm10KUQyuo28Ey4T02zFGXuXyhJt3tmPG+rNctG3atQgFxZuuVU1FCJQ==
X-Gm-Message-State: AOJu0YzLQCvzk9qVscUDjtC51MqalUsGqVHnJXItU13JaOGkg6O78DdW
	52/2U7wx24iVwOMBcifw1/FQ9UcbnmdpPW7qjgyQ5IFH2FRvlpIm
X-Google-Smtp-Source: AGHT+IEZFU76rsbjWXI+oaAFvgWT6s+1N+HIyBNRXxzXfgCzC4udfKj7bBkOXZCqGHkgVami9ZYrgw==
X-Received: by 2002:a17:907:d8c:b0:a7a:b385:37cd with SMTP id a640c23a62f3a-a7d400a0393mr445509666b.30.1722289145503;
        Mon, 29 Jul 2024 14:39:05 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4148fsm562108766b.121.2024.07.29.14.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 14:39:05 -0700 (PDT)
Message-ID: <17e81b06-7778-44f4-94cd-6a2b1fe5c7e0@gmail.com>
Date: Mon, 29 Jul 2024 23:39:02 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clang-format: Update with v6.11-rc1's `for_each` macro
 list
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240729-clang-format-for-each-macro-update-v1-1-9c554ecfec3e@gmail.com>
 <CANiq72kFpS5BE7Ea8=Z6SUi_Y2RAt5wsssHyqL3ocgR1UOHJMg@mail.gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <CANiq72kFpS5BE7Ea8=Z6SUi_Y2RAt5wsssHyqL3ocgR1UOHJMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2024 22:14, Miguel Ojeda wrote:
> Hi Javier,
> 
> On Mon, Jul 29, 2024 at 9:56 PM Javier Carrasco
> <javier.carrasco.cruz@gmail.com> wrote:
>>
>> Note that commit 4792f9dd1293 ("clang-format: Update with the latest
>> for_each macro list") added the macro `displayid_iter_for_each`, which
>> is not part of include/ and tools/ (it is defined in
>> drivers/gpu/drm/drm_displayid_internal.h), and the shell fragment used
>> to update the list will drop it. In order to keep the macro on the list,
>> manual intervention will always be required.
> 
> Thanks for the patch!
> 
> That macro was inside `include/` back then, so now it should be
> removed from the list.
> 
> Of course, if we want to include internal headers, that is also an
> option to be discussed, but we should be consistent either way.
> 
> Cheers,
> Miguel


A quick test threw 326 extra macros that are defined in internal headers
under drivers/ and arch/. Including internal headers would remove the
need to update the list if a macro is moved from inlcude/ to an internal
header, but the list will need to be updated much more often.

Best regards,
Javier Carrasco
