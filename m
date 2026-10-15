Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A94C6531
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076240; cv=none; b=uomTgtOexT2I8IATsfZaZRjhnpwmlxMEh/MU7nKbdJez7Gj+0p4O5Af+vohKxLzhk7zwV7XTGYcSAZ0BdwDzfc/Tj+lmqtuVp+UEiNYxhimj+S2Zs82qDxm52Db36jZhvG8D3lrfl6T5ctKvgQ9tNPpYHO2GHr/CN7Jso0u7Z6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076240; c=relaxed/simple;
	bh=8E8Fes01P0FnMokny4ycUlekwWtVOnV9rLiH+P2xHXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lejjz0GDliR1Ewi4H4+rvw6yD05KWHcAcF7rQ2eIq07lXYhauwb0grLb1DG55zD5PNhoC7nutY00XLWabqcmHznZ1mRw7TYcqVeWHDZv+ua5iQ4bSfIqmUhmhXpXZ1ctFLGgbs5qSdupMAKa60lW5YqUcrmC7vsjBGmYTU5PmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UUqvguUE; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UUqvguUE"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5350c1b9e0dso18299891cf.0
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792076235; x=1792681035; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdMD7NIIHUonWBQ7tMxlfEgdY/tQZaBr/YCC0/JY/pM=;
        b=UUqvguUEjpcZhSRUNOx6njOEx6d2AyxDOjNhMvz0pZQGjPyQbG/w763IqaWI4Z/J8S
         cOX1kxC2rGX7aNaikqaowiWS97njZpBZ7AKeQFkvfTDlzsitVERq4zUTCYXSRs3o4x9d
         C35rFyulAkiiBsM+823IreUP9TzvchZoAgAbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076235; x=1792681035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdMD7NIIHUonWBQ7tMxlfEgdY/tQZaBr/YCC0/JY/pM=;
        b=kRLedjHf73S+xmKOmjgTOlPQ9f6kTiW0IPlq8bYPM+6AcZpwaeIytJCahGFgp7DqfV
         KXFnYb8Ji4Mc59GzAP92vvm1r/O8D/3p8eqqlLry8O6r+34bBKDh/+Di/iwpZIAtZffe
         ZiJVwDqYo5OrVeNc99lRi+/+bXwIpSlRIIuPc48KOl9adAFd8IEul5rNd1vwQnmqHxMS
         qHmDxlsMuczml/0qe/W+NUmzXL9NyO0JP7iFXi+F9gipQols7st47/zicbxsGwzPB0hx
         p38ePlWh7Bc+oToep/zRmtg+jHcNXGRAc2XT2sH+w4HzMW8y9QPBMf2vE8nWbT/WEBFE
         EbMA==
X-Forwarded-Encrypted: i=1; AKwUvByw78P+lYoftiCYDcvEkIiCs2nmerzeL54tyQ8TRemdevuCZ+MOJiCXB2h1NnadL3GCghJV@lists.linux.dev
X-Gm-Message-State: AFq9FYIEIgFJNVac837Tbb5dIC6+eboBKsUUBG/vgm0mOuFw/u6VRC2+
	O3SqPq3/ylopuO2sCdylhRf0Dym9h62ezOrW3+3H8bGajQaY3E2l2d/mu64eTk8yCxw=
X-Gm-Gg: AYBFou0TFHoldricIqS3wzy4lJ9r+qo7pF/X7cuidYTOVYdtyJHt/zZhIRfJ681SvGJ
	otG9ngofkAR7yQsN3vTJ8oOGnO059bSsJqUCS/GVDZCgu1JAZ1XR5kR9sw1SWLnDgR/2iprhkwz
	lhI+en6BzuikLEWoKd985veCTz1lfFxWKePREfrYoHC2qj1BMmMYMr+3229t0+ERovKyZooDHsA
	b2ZHh5i1b/NPTiv+Lk75gEKJAizody+cICBp8rwcYX9YvzoHH6aFq6PFv91geFxCFU0UewETuhm
	b+eGEae8EQXxAk6uWSJd4ikDly+vZjhPGXj56dy6A6IMSqSoKsUYJsRNUWDK+JKMsBaPbseXz65
	XII9ouHcpBKAq0R6/gp4V1t8HVIkaFdeg2Qz8rAbIgsLeXOKfasAfyetUnzwNVSipBxynrarpdK
	42sevhkhBhMIKJRbQdPCF5mH7FZHr6QyHYEvNepse00ztVgZFQQqX0IgKhVMAwFKB5H73wBEC7t
	6+MME/y
X-Received: by 2002:ac8:5f92:0:b0:535:92a6:22e7 with SMTP id d75a77b69052e-5359fb4794cmr295144001cf.42.1792076235184;
        Thu, 15 Oct 2026 07:57:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53612830ec3sm27558151cf.27.2026.10.15.07.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:57:14 -0700 (PDT)
Message-ID: <8aad13a4-1097-40d1-a0ed-c44ef84838b4@linuxfoundation.org>
Date: Thu, 15 Oct 2026 08:57:10 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Nick Desaulniers <ndesaulniers@google.com>,
 Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Guillaume Tucker <guillaume.tucker@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
 <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
 <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 10:42, Nick Desaulniers wrote:
> On Tue, Oct 13, 2026 at 3:01 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
>>> On Tue, Oct 13, 2026 at 12:40 PM Mark Brown <broonie@kernel.org> wrote:
>>
>>>> +       clang_target[riscv]=riscv64-linux-gnu
>>>> +       clang_target[s390]=s390x-linux-gnu
>>>> +       clang_target[x86]=x86_64-linux-gnu
>>
>>> ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
>>> `-m32` get set somewhere?
>>
>> Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/lib.mk
> 
>> I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
>> fix too, or am I missing something with how it works?
> 
> Ah, no looking at
> commit 624c60f326c6 ("selftests: fix LLVM build for i386 and x86_64")
> 
> it looks like selftests have i386, x86, and x86_64 where x86 is x86_64
> IIUC.  I see you also have a distinct i386 target.  My bad.
> 
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Thank you. Applied kselftest next for 7.4-rc1

thanks,
-- Shuah

