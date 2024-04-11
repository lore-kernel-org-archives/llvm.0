Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F314F65;
	Thu, 11 Apr 2024 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712863289; cv=none; b=igwzdrylBjDJw8GM9YasBuE193bVBNjXBmfKD0niPqptU2atJTj7Z3TL+q5W5UvLX4E5tENIFt8AhZPwGkKc06tB/POB7WfZHX6i6ElaBFjXnatLD//bX3iL0uUwwwjdh49BdoFKfe2m4Wz+iFucyANbtADwjodXveSO81/ynBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712863289; c=relaxed/simple;
	bh=Ik+5avN+F3onRNtV1PB619O8pLeIV7AzjthBG+4V4qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hupFVnWasve/7JKn8rQ6PdB+KeCvvwXvCVE6Ho5CDccH8gz1DHzBdBDnJEJ8pi+mqiGKv4kvOlQApkErMNtNnK4yDPzP/n2xLFp5Ffrbn3wcFqBdBd6hpy7Is/MdXefNrnLPZhrGaClsys5ZIkyykDr4OeuYyw2iMf/SvmYMJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZE3zeIZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZE3zeIZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-434c3d21450so521101cf.0;
        Thu, 11 Apr 2024 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712863287; x=1713468087; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UM2zuMgd2tTJ9l2V10ApEN63oRSs92Yz7I6KOrw/UzQ=;
        b=IZE3zeIZJPnNibj1UXJYjZ1Ka4bKsw29wQkICAfTXPXs+Yj9Pqjuo7xM2ICv4fz9MC
         NcwYnz4Q51R9FD/+6WKBg8UE41TWmBR4opj5A2UZRH4jv3K/sVh84n179JoSWW6N9FHO
         f3uK1/AdNaX6p1rbX+rVg0TW5lxS9keTi7sJBe8rdoOnc6PDxscj9KpScoqDqpar4XAq
         vkYUDeAM3xu4xKoEQzsI34mC9gOJApyekyTWBi0WYzMQrkRL3LMy5F8i33Oo0kSUGCiL
         A8eQ06L6UU3gOkZCeWb3P5Qf19e/0nhkFJfO41TPUtCVr8j9NdaEUuPjDCeyPDlqIrwU
         c4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712863287; x=1713468087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UM2zuMgd2tTJ9l2V10ApEN63oRSs92Yz7I6KOrw/UzQ=;
        b=E3GxExR9z8pbWsufKK73aBPHGzfnNTlsGf0GGJPww8MzrceUUQXmg6lcKUXIEu2mai
         2y9tGg7mRzR6TOKOT+DIN5a1Ttn4DvQ+5gBBxmrifle8c+pwzS/7y5KlITAgM9lk1R27
         pcqbR8aB+229wPPyMkX+AZdqTL7AvsX5jHmu7ZTh2aHrxZPM7zoC1qAGSxRcoPvza7wK
         Wa0mq75wQJE+25mp2HG+ATO+ct0T7eTg5fqLWl48GZesX1qhh1OvXA6V0Sm+LtYnDdlx
         4ZFeZeSripUtktZXad5VCGZsZ6X3+VhgCe2yCdu+aWZSNqkLZ7dWh3oqwj0fw9kC5212
         H3iA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3qyWDQQu2oc9Sa7/I50PKfZRv6P+wsozorTH/iyH8XxZBR/iCEOfRZ5awA4vZLZD6zUdnUsB0migCGvqKtslwrGJMBwgox3paRzv1bJaRhRCxPUyfZOP07XGyv9hUOY7+jY=
X-Gm-Message-State: AOJu0Yz5D9UzceqzWAmuynE5XZWxxdeOapisN9AsGKj/AMeRkKtduNeS
	pB5i1ebDBQ293KLipuq5MujWG/eHsmzuXqpdOAv0GsBQvlv6Rtt9wZNV2A==
X-Google-Smtp-Source: AGHT+IGvHxA54aKOClekMdzRkSKoQQavDjhgxAQk3dRTaypFZBWOKdo0kFNXxP05O1GXsQzB8/QW1Q==
X-Received: by 2002:ac8:67d7:0:b0:436:8736:f0c1 with SMTP id r23-20020ac867d7000000b004368736f0c1mr150864qtp.47.1712863286926;
        Thu, 11 Apr 2024 12:21:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p26-20020ac8741a000000b0043123c8b6a6sm1274004qtq.4.2024.04.11.12.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 12:21:26 -0700 (PDT)
Message-ID: <a59e2164-7159-445e-9f87-fcf6cb4b57d6@gmail.com>
Date: Thu, 11 Apr 2024 12:21:22 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next:main 26/50] net/ipv4/tcp.c:4673:2: error: call to
 '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx)
 - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_...
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
References: <202404082207.HCEdQhUO-lkp@intel.com>
 <20240408230632.5ml3amaztr5soyfs@skbuf>
 <CANn89iJ8EcqiF8YCPhDxcp5t79J1RLzTh6GHHgAxbTXbC+etRA@mail.gmail.com>
 <db4d4a48-b581-4060-b611-996543336cd2@gmail.com>
 <CANn89iJMirOe=TqMZ=J8mFLNQLDV=wzL4jOf9==Zkv7L2U5jcQ@mail.gmail.com>
 <20240410183636.202fd78f@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240410183636.202fd78f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/24 18:36, Jakub Kicinski wrote:
> On Wed, 10 Apr 2024 19:33:54 +0200 Eric Dumazet wrote:
>>> Jakub, I do not see a 32-bit build in the various checks being run for a
>>> patch, could you add one, if nothing else a i386 build and a
>>> multi_v7_defconfig build would get us a good build coverage.
>>
>> i386 build was just fine for me.
> 
> Yes, we test i386 too, FWIW.
> 
> Florian, does arm32 break a lot? I may not be paying sufficient
> attention. We can add more build tests but the CPU time we have
> is unfortunately finite :(

Yes, that is why I mentioned multi_v7_defconfig, you an see the build 
failure with that configuration. Of course Eric fixed it now, thanks!
-- 
Florian

