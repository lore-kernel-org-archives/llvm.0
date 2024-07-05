Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D34716D33D
	for <llvm@lists.linux.dev>; Fri,  5 Jul 2024 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720198394; cv=none; b=IHv+ET9L29zpZHb7P/i9FWMPfwn6guKc4jXdHYT3j7iecJQYtvHHgPvBZK6byWcI0b4C6OBWDG74ztihvJMTYybvVeWNMEk8iDO4TjM6m9wmjzhGikliDyrrUD9WRrLHSXkowCr4OJuHwJOvtqD9OV2yR1CUDImnFdvY7sHqVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720198394; c=relaxed/simple;
	bh=RncQKJYbfy5H0b3XrKMgUXVHO/dixUXWg65oa+C6FdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX97OlvthFG14482Lexx7Fej5E9fCW+j+DNBw1r5arsr9loAieEgy0AGxZygOqF6NugatB6Rb3W9RO5ZE3Ea6lIrEQTv2E2456MI5aR/f1HQNvaLbyg4n/9+iLGAfLWrLzASfuyIsXivM7PPiJtf2J7YHSAbHeC/F7swjQVLdaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B5l+sgVn; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B5l+sgVn"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-380cdc44559so971765ab.0
        for <llvm@lists.linux.dev>; Fri, 05 Jul 2024 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720198391; x=1720803191; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DLrD/RGWBG3HDOWPiY9D8ry94UHKUAljIHl+MpL5ZcQ=;
        b=B5l+sgVn+BSSfiQJwSp34OWP0LXmLKel8klIR7OzTmWZlyMOJg/oKGiHDXi/3ujGpN
         t+XxD0hva0Ej5irUajI+Af/4W08GX4lkD+/7eO+9dWMS2+ZLPrs179vLlhc/yP2HLagX
         4o4gpxT/V/pj3RKKFJMJ3ntH/qxkg520ycGlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720198391; x=1720803191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLrD/RGWBG3HDOWPiY9D8ry94UHKUAljIHl+MpL5ZcQ=;
        b=UsX9mWzB/JG7eeFK0f75rWHLFy4D/9wmZrYYb9fGWthmvKSgNyJQYGObsEVzS5mvlI
         aruvmh4b6SfjyAUOAzp82wr3bc+gDlOzFdK3slPph0B+EhooVe9gtQ5ogjYNkH9dQ25o
         x26VuHM8Q8zmC3EsGNwUXrZ5p+WMievwOF7rk+n2tt/z6QS8D/EEhqIxocYd7XckEZZX
         y1bzcIZIE1P+8YIr2UmVlB0BY0Gd9hb7u/8uAUVr+0Tojw3pxDHaz3zo5UooD9ZRqw09
         2gLOojYSrbSvZq8fFdc8aYmClZzPQmwQl2yxvs/QT6iA2ZaqvLMPbWmDHyJvzghsC0A7
         3W5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXsYtf461yKgLBpDpYx7xFXNotEmXg71VLROzuD2cmgq4zZm+DPuZfY6+p3mb94UTLAa8uKVmzdpp9T/3aktGOa9ctWw==
X-Gm-Message-State: AOJu0YzV/AuXLno9Dcl9Z8xi6JTK0gpCCIrHWorms4RdCw1wtXp2Cx5e
	7DfH5HVeVP55gRWrLUF8wEGZo1s9RdBMV4Dt5ZADAdF2Pk4q9GEltozSV5bIQRE=
X-Google-Smtp-Source: AGHT+IFnMHVSBiih/3sZgpAFXUvJl8b4JDQIC1sGK7IOw0ZIUebUnheLQu/ZKBtQd2s/VP+yFXOJbA==
X-Received: by 2002:a05:6602:6398:b0:7f3:9dd3:15b2 with SMTP id ca18e2360f4ac-7f66db3caeemr477668639f.0.1720198391430;
        Fri, 05 Jul 2024 09:53:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb73fa17cdsm4449380173.119.2024.07.05.09.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 09:53:11 -0700 (PDT)
Message-ID: <5a3a3c0b-2c72-45bf-91c5-0d5808e3bd14@linuxfoundation.org>
Date: Fri, 5 Jul 2024 10:53:10 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] selftests/timers: remove unused irqcount variable
To: John Stultz <jstultz@google.com>, John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704024202.84726-1-jhubbard@nvidia.com>
 <CANDhNCpEvPL+b1mve-YJp4+yzQU-BAaAQLr1-G6Br7i83zaQaw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CANDhNCpEvPL+b1mve-YJp4+yzQU-BAaAQLr1-G6Br7i83zaQaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/24 21:11, John Stultz wrote:
> On Wed, Jul 3, 2024 at 7:42 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> When building with clang, via:
>>
>>      make LLVM=1 -C tools/testing/selftest
>>
>> ...clang warns about an unused irqcount variable. clang is correct: the
>> variable is incremented and then ignored.
>>
>> Fix this by deleting the irqcount variable.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Acked-by: John Stultz <jstultz@google.com>

Thank you all.

Applied to linux_kselftest next for Linux 6.11-rc1.

thanks,
-- Shuah
