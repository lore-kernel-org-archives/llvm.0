Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A71E833A;
	Thu, 27 Feb 2025 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650780; cv=none; b=VIO+flqEqPy9DXkJFe+ukK8Bihl6717dK+nVkMl5O0sSmTarVHroiKrpwGs3YeAhjD4jzTBeraWNri35LdH3CVgvWGH8HAp4Gx3J8QapCOfJAnzYPl1XM76iTzmc5beM7jqz4NJdpnmSF6rKKZy+HdCJ7IFS7PpkzabJWeLG1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650780; c=relaxed/simple;
	bh=pEP+vhbhTTs4L+MB01lcliTsLO1SSLw/IdC11pBqmGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=If0kN3gNJMq2KNEVFckEX/og+PANNImeSTs88P4EcEOTbHEs1VWxtv98u3nUXLfQ8nIUmVszgt68JI8y3U7Z/J8yK0z8oiIwFLfM7DLMojuyqRbrQuvn/OSQAbWdNBDUortfaxOsZSHa6TkCDr0C9Bh6uff4oSIAoBUWLInK4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7POdo74; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7POdo74"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso110102166b.0;
        Thu, 27 Feb 2025 02:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740650777; x=1741255577; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5mvrEbwu4TOisLOydnd4/CSlfw2DVpwzEYHRajJrJE=;
        b=c7POdo74yjmXhkxAZXxg3REZRZp4STF8WJO9CyMGthVd/iZ6fwW4hg710WlmXf6chC
         gnvCYTCkYLPPwpEGGGXbb+KaV5jrs0JLy15CezuUf3bYxyOROkhkMTf6GW9o/xYtBk+a
         MI2JvQc0rAf+Uef/CE0nZDhaHMX4cnMkUmtLlT7qRWTRe98pSDQGF6dvE8Cn0h/dpHJr
         MXQluYJp6T/0SEL7GAbYES/m+hz9X7y3xWCHbnFz+M2s/r4LTFvgfqGRsn5hmRLXUlHr
         aJUuKkL/I7etNHZ2KN/dcOHxCX4PDURIu+77pxWuk3cOMh+I3vNEwp5FD+P8pL5z5WwA
         Fncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650777; x=1741255577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5mvrEbwu4TOisLOydnd4/CSlfw2DVpwzEYHRajJrJE=;
        b=xFRUhyVqFG82I9Fdo2mrHTWm6bH6QUt4fYhTNB8PMbi0qctAsbzybs8MWa/KMqJgUw
         35RvrtIkpreW15YsDrWiuQN0v8AyaMchXU4ShqtKseOEbVZLHfxMrjhdcKsLWihgGRI6
         u6bKEaGUBOQ+hA3lY5zkrpVUuWf49zfCdLSOTbhQJhhd56E5FrsnTwna7Ij209eChATn
         vKKSzG0JPtwKiUTKIzdC8iQjEK+tBC6oMXlj7uJkPrUSRbRh71lCRKFyQuBCiP/vMCAf
         Y9XI1ciDtEK0O28acBkXDUv8MBl6xbjd+mh3of2WRqgEb+8fvwk/Xjsy0c9CU2RH3wOC
         dObg==
X-Forwarded-Encrypted: i=1; AJvYcCXyZVH6z1XsO/n966tjQ/FO+GaYXIaSUsSUxazcfJwDMLX1LSn3CBVZo7XaN9U9c6mRlCR8sYoj8SeVYwHE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx53vYkPIUsxQYWN/VJ0zsBFkKeyRReMWTGMsSum4nyN6i/NPYq
	HbymwBm25CVIZcjNEM0BzP94BRZj2vgFYlpbPLfOVKE92jeKsktsiBNX8w==
X-Gm-Gg: ASbGnctt/wZZrVXs+KYdL5Ekq8EdWVb7UqoWq2XLGv7+LLK0amWJP0fFzflRlaraG0a
	ATwLwaGeK3czXw6OPBXiTY6KbuVVeUNL31uNS2SsRrcMSZK+kOkLp7tqNrPlW+oVpamlTfFlneD
	cDBi4LwsOiPhgRsOhQBvgW+v/ujpu8fvcVE8J05BdfxOTGN3QfvksKPAs412o2agA0fmKIXlL0G
	7doI1XDK7+YKgn8peDcOYAqCmfBNZ9CUhK9cf1odz76p7VShc/6niNgVZ6D6Z3P+DXMj7NUkAMv
	0gub+GRxC0Wn/PElW49WgUs8t6WEO7UmjyKCvyts0ABLcdu+1YXAVSunQSk=
X-Google-Smtp-Source: AGHT+IGgKopderXuTIKklUyo7qkm1wHvlawkRYBo5ORJ/9cId56FxoxDQ0r23w1fGtBvZj+xtfHziw==
X-Received: by 2002:a17:906:6185:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-abeeecf50f0mr885964066b.12.1740650776746;
        Thu, 27 Feb 2025 02:06:16 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:4215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc240sm98204766b.59.2025.02.27.02.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 02:06:16 -0800 (PST)
Message-ID: <5f2ede96-183a-4dc7-94b5-d4ec00d38c08@gmail.com>
Date: Thu, 27 Feb 2025 10:07:13 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.15/io_uring 55/56] io_uring/net.c:719:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is true
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
References: <202502270853.xYltEB97-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202502270853.xYltEB97-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 00:12, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring
> head:   7eb5bb749ed945ead6a089e18e1d1da74523ac9a
> commit: 68525267875757520752ff1abbda0af58fc172b9 [55/56] io_uring/net: unify *mshot_prep calls with compat
> config: um-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270853.xYltEB97-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270853.xYltEB97-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502270853.xYltEB97-lkp@intel.com/

Not a real problem, it's just the compiler (understandably) can't
derive that the block is only empty IFF io_is_compat() is a
constant false.

We can initialise the var and let the compiler optimise it to
silence the warning.

-- 
Pavel Begunkov

