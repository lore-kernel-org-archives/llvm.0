Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBC213F43B
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557323; cv=none; b=Xqql70ClZ/kZ2HTCo3LynPM5ASzWiiolGKpWQBl6fTXEp3Nw1XBWuAf9UAJlun2KtkwKEiqnoL/Y3Ov6lHwLnxfm+b/JYofhiA52G54mDo3k0eCm4DZv3ZLFTQ+trMA+JQYPdTYHFNsTW1//VDZZ8KnkTaQzhNfqIlxcb21ev7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557323; c=relaxed/simple;
	bh=B6TBOvniiIY4yBsFeLV75HI56BIl5JHOPJ2OBmxRZh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkayyXBBEypFQGq34Nz2fBi7WEUBi0U6gjqtavkRfHHSK1QsYaD3i84K0Y4c9snI/pXUEXDIto0ADGsw42MdGt+dLtf50BlLK2l4gTpgBvvp1/w39M3AmZARr4FdRos/nGDMgyycZ68pbI69Tr/UK72wy4hDkW2ggnCPHRouCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J7Qzq2u/; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J7Qzq2u/"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7eeecebb313so21642939f.3
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720557321; x=1721162121; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Uw/sa6sLips5jCn0SIjbZbXatTX5nFO4bBzPwrcrqQ=;
        b=J7Qzq2u/Blw+IaxMR25K0SQudOv3gdLL2QDKEQ/WznhtfuSCEzBpUWvBnFtaZvzvnL
         hQiEU/0L2+1n/GNHvX3HMw28u4f/ipyRhXW90dCZDv+uWYTUDaghHeeEVNnZSh/2AGP3
         3HRcVNe6OaKevZiqXMJ3uDmKSepRaxbRyCTKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720557321; x=1721162121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Uw/sa6sLips5jCn0SIjbZbXatTX5nFO4bBzPwrcrqQ=;
        b=ENnsG3WSf3oGhZotW9zriNgoOf7QhV37iPjztfXrLSHFISGV8SYW7fP1Y9hiXIwVNr
         V9q1kJKdrxehAfn/iIRjKxS6dnHZuxCrTlHDRFYuDPYMq1aOj9rzG64yE1zAJLzVNb9Q
         imDfZdvDAqPRi3vwot/AYgmq57ZtGJ4wfIKr3t9WY8bMC+nelnXnMIlSHJsKTnrfWGKI
         fGGUNk8jIoOsZNea8lPaK2jZ0g0E+65pVrvw08F5aC9DcMJQrB6QyJP9reXb7/VW4/pn
         UtnA/qE0XUBG950fsXK5z8Jdsy3+vvLV9i5rRGmm5MliT8BChlcPEOdQuoxRGmuuUPlS
         IgQw==
X-Forwarded-Encrypted: i=1; AJvYcCXQtZ3cy+7z1kTXXwA6Rlt4m2JtMEXhDu+c8ET+H1wjwY86nY6jJgJHXe8GLCO1kn/2fTa/Ss7vq04ylnG4J4AHWsPSrQ==
X-Gm-Message-State: AOJu0Yx3wAkF5uXXLvjiTXUp5s8pTD6+3kbQPpjZ/0EAQ85YctOCSbVy
	mpzJ9Kod5hGZi8+cZPGwK0b4blWtKCRWteJJw1nH4C6lXdPiYcDNmLUPdDh3eLw=
X-Google-Smtp-Source: AGHT+IFSFdPJDDf6UfJgdzx9C/1pJLpTxO/0uyjQPpSaIATfc7XdSOsrOKq9Ub2TUBKnYOM2bXdgxA==
X-Received: by 2002:a05:6602:6103:b0:7f3:9dd3:15b2 with SMTP id ca18e2360f4ac-7fff92c5be4mr394599039f.0.1720557321484;
        Tue, 09 Jul 2024 13:35:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1c138eesm683371173.151.2024.07.09.13.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 13:35:21 -0700 (PDT)
Message-ID: <b8af74c6-1489-421b-8495-0056ecf144d8@linuxfoundation.org>
Date: Tue, 9 Jul 2024 14:35:20 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] selftest/timerns: fix clang build failures for abs()
 calls
To: Andrei Vagin <avagin@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Dmitry Safonov <dima@arista.com>,
 Thomas Gleixner <tglx@linutronix.de>, Valentin Obst
 <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704025247.86418-1-jhubbard@nvidia.com>
 <CANaxB-zk-j2E8D0_4x04WL5Jbe08SD39jqBLbehBYWedFg+mMw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CANaxB-zk-j2E8D0_4x04WL5Jbe08SD39jqBLbehBYWedFg+mMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/24 21:44, Andrei Vagin wrote:
> On Wed, Jul 3, 2024 at 7:52 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> When building with clang, via:
>>
>>      make LLVM=1 -C tools/testing/selftests
>>
>> ...clang warns about mismatches between the expected and required
>> integer length being supplied to abs(3).
>>
>> Fix this by using the correct variant of abs(3): labs(3) or llabs(3), in
>> these cases.
>>
> 
> Acked-by: Andrei Vagin <avagin@google.com>
> 

Sent in for Linux 6.10 fixes update.

thanks,
-- Shuah

