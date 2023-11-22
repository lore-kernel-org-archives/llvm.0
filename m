Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056664E624;
	Wed, 22 Nov 2023 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFYNZMKG"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so88651961fa.3;
        Wed, 22 Nov 2023 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700669751; x=1701274551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaNA+1kUhGp1TWlPIHpnCP3XDdAFKSdhNs80LYurPRo=;
        b=OFYNZMKGHz3/KUmZLZkDEeUcgped9McHpe0RNUVaRMt2T1UaRB/ByGUIhOkjINLTAv
         cvercr4SqZWJxAjhWcJKHS5lHsM1bFJQis300mDqD5pcyQBnvZ42tdNUXNShbIfiA5XS
         Xh7Nxa7UekqiD4xak+3Pi0IiDe6fxIh91sb7wm8wXNo/L+l1nPqltrejnNysg19t7G65
         s8Hdp95Y9Jj7heyzQe/8dpHb8nHOcOsO9ihH7lUIFaXNE2kvwoV4FuC+E/U3+xiS7M4k
         cgnJAfdMUwflvHcmv1pIS6CQFSgyua7KzJo/VEkqrSYrjO/DDSKI77YcwKwSn4vXX1BT
         8YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669751; x=1701274551;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaNA+1kUhGp1TWlPIHpnCP3XDdAFKSdhNs80LYurPRo=;
        b=S8dhKBSNXyw/JTEOWdg5DtuRD2PfyUpjvkBCZenSQLL50NQ9T5+9t+Sx0rFrUpHnsp
         Awsfnzr42CM6HY2MD1G+SeqYvKQGvZ9Im1aa5O5BQCDQkORzWKgczADVonwOkTxo929K
         6iHK10C5INXsDuhEym+Oj0sbxSbHjUxIu86mL6BSy1jCgG0W/lUbxOgUAlFEwxBqoWcj
         ZmYwb7mx1GVNWRMhFusiXqOtVMap5RVi9QmBq679lKzfytuj+IXBRxvEhQnh4TxwaQQe
         l3P9pRhucpU1LafvuFstg5902J3C4zBgWCNPZHmfJAPqO7Vch+NeVCmCsnH2HfAGWdoi
         xksg==
X-Gm-Message-State: AOJu0YwDNI/2Pus1CMioipdiakD43EYc9DqvemCqTjzTrdK6PnHZTtJZ
	hvxajHN1v0uxLwvCFUa07Uc=
X-Google-Smtp-Source: AGHT+IFN4P3XRSZ/At5FqUEE8wIqo3jMlcrSAt8vmgIza+s/70PuIihltvHjFK4RjasOXMgJPAr91w==
X-Received: by 2002:a2e:3513:0:b0:2c7:b9b6:85ff with SMTP id z19-20020a2e3513000000b002c7b9b685ffmr1935778ljz.36.1700669750755;
        Wed, 22 Nov 2023 08:15:50 -0800 (PST)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d5381000000b0032f7f4d008dsm17543459wrv.20.2023.11.22.08.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:15:50 -0800 (PST)
Subject: Re: drivers/net/ethernet/sfc/selftest.c:48:16: warning: field ip
 within 'struct efx_loopback_payload::(anonymous at
 drivers/net/ethernet/sfc/selftest.c:46:2)' is less aligned than 'struct
 iphdr' and is usually due to 'struct efx_loopback_payload::(anonymous a...
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Andy Moreton <andy.moreton@amd.com>, Simon Horman <simon.horman@corigine.com>
References: <202311220537.geMTr31W-lkp@intel.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <3f42dee6-a6e2-1b35-674f-309aae042ae7@gmail.com>
Date: Wed, 22 Nov 2023 16:15:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311220537.geMTr31W-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/11/2023 21:25, kernel test robot wrote:
> Hi Edward,
> 
> FYI, the error/warning still remains.

As I've argued previously, this is a false positive / compiler bug,
 and there is no way to resolve it without making the code strictly
 worse.

This:
>>> drivers/net/ethernet/sfc/selftest.c:48:16: warning: field ip within 'struct efx_loopback_payload::(anonymous at drivers/net/ethernet/sfc/selftest.c:46:2)' is less aligned than 'struct iphdr' and is usually due to 'struct efx_loopback_payload::(anonymous at drivers/net/ethernet/sfc/selftest.c:46:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
 is complaining about alignment within an anonymous struct, which
 only ever appears embedded within a larger struct in a way which
 maintains the correct alignment.

#ifdef RANT

Indeed, the only way we even *could* create an unaligned access
 out of this code would be via a declaration like
    typeof(*(((struct efx_loopback_payload *)0)->packet)) bad;
 because *the struct is anonymous*.  And if that happened, the
 bad declaration would be the place to warn, both because it's
 incredibly ugly and because it's the place that's actually
 wrong.  The struct definition itself is entirely *fine*.
The compiler should be able to detect that, and if it's not smart
 enough to do so then it shouldn't be trying to warn in the first
 place.  Quoth Linus[1]:

 "And if the compiler isn't good enough to do it, then the compiler
  shouldn't be warning about something that it hasn't got a clue about."

The anonymous struct has to be there so that we can placate the
 memcpy hardening, and it has to contain a struct iphdr at a
 4n+2 offset because that's what shape the on-the-wire packet
 *is*.  To avoid the warning we would need to lose __packed and
 memcpy all of the members in and out of the buffer individually
 to explicitly-calculated offsets, which is worse code.

#endif

Either fix the compiler to not warn, or fix your automation to
 ignore this instance of the warning.

-ed

[1]: https://yarchive.net/comp/linux/gcc.html#13
