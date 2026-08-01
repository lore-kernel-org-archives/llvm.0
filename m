Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751393054EF
	for <llvm@lists.linux.dev>; Sat,  1 Aug 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785554006; cv=none; b=GQr4j96BVmd4YHfRgX7dK/X5raK5On9yerwxBRdOpFw/oTTGj8c8MOVGcMAXJJxCFWwURPBgCphAcvt+dWz8RFIA5wQ3SWJ5AcF+u/nGSVQ0RE9XjBiwVusziM4TFCxwiH9LvskmUa8VmvOZ4rZU8BJA6wT6zAYkxFCB0acOglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785554006; c=relaxed/simple;
	bh=M/NbgXygmZlvsXYn7JhUqYNmLBcTfBFy6CdYk+FSEBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKNpHK7p2FU8/8+STUlaPdYqUIWy5AanV9KG6cCL93Tw3m/ttgetbqc6n8uKyc3oQcmP/RqRVAfH9vqRLl8meeuxzs7Q4s7fEKDH3ODMotdg+nQ0+Q8GMHqmWOnUUAM3yaLGZ1hy6h0s1dUp4NSBSC6yBSmTfnsyAu2Lc6J98Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWC7YAjX; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWC7YAjX"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c2a76536bso15300741cf.1
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785554004; x=1786158804; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OFQi86wobJiii7OnOtEvTy6WOJzLS6xjh5R9rXpZtc=;
        b=fWC7YAjXV+4kBL5yuDDI2gLOpB87qRUm3MaQ3RZQ2LzQ09OrPXwcnWHki6bvbIYOej
         vGbRzY4mUK1lnzh9V0q0a17mnkvq903gzT7ChTPAbV0ogdqRLNM77IdyPro/zviz3Zky
         w3oJhxReSklBUXIYWeDaTbrSJ3qJEQ/blOu6UWO0Dcq/m96Trxuk0nZIyUQq5MqBxNXt
         bdy5+AuX24XyjdfIW8/N63FriUTKT2UhnMtv/JYkk71VnQNSrJScd5RDdH2Tn8mIiJg9
         mgVr532rocmNeHbiHJlZqv3QCdFVE/m/RDRWj4yelKSA37qjH/O4VDxCgAgw+rkdpIBm
         d39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785554004; x=1786158804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OFQi86wobJiii7OnOtEvTy6WOJzLS6xjh5R9rXpZtc=;
        b=sG3A388eDO11wgeRfZI5KyUholwjadYAgXhAkKGB6tbpL8eiXD5AenwhBhus30O2t+
         zT061Psynf3Chew9m3iCVdnUrO2pi+laOWGKGkdh8xVprqP3L/BhwT3eqIvMpUpsrJ4r
         QUuMbUIN92mwhoFZ4YbpwvfQprPlbPEbcfVIQAKNq/1ixIbOEePNum3DPi4KmbGmlCHN
         oxmfCUXv9xBjxQ1A8tw+/HNIb3kKgZzb0SJEDCwfhmBhwh+G8QKSo8MTbIB9hoXaM34q
         qLtDe26RleOu3+5cVreOVfL8/Y5lYis2T/Yn3GPumQJWTHdryhaxAJ82jm6cz7xCt6B/
         Lpgw==
X-Forwarded-Encrypted: i=1; AHgh+RpowiTUIaTGljYIQNK6LJc/pH51A/4oj+5WI4ezADQhCB8DZO7h7OEFW5uxh5KmudF8zp2n@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb6iRKdkI779mp9fRSJPfjqlGNaIpsmZm5NJu0mOfE/LiKnBAs
	HkwKlT7ZgfJMAaNOzk9Cc53jHXebn28gXZXXLvTt1EYxUV1aTVL5bOR/
X-Gm-Gg: AR+sD13NtzgCgMsLAZfsyfIseMink97JM9CTnH+K7g8dslcGin7yt9iDFLTEwxYcrkP
	c4ISKngbqOJhjPdPEoMmxYMAmW3KEdj+KXwsntAbMepk/aC0mpPTNjrcq+skateh6o9/7Ihz6Hr
	tvGWF0z78XHvlQbVol141zw9tx3K2fJ4VhpGU1ziLrkllyI0TqQTqgdk2pDZti3tn/jiO8R3ayl
	CuXxLeFLof2izQQJp8Rthhv9xuPnyo1QDj08PZv4tuM/mYsjH6KWdEltaeRE6egcqGqwbsXAQxU
	MfwqNYbjiFN1Q6zn2ho5TJIV3rbFTnFtCO5XT0/WFM2pU0rjelU8oSjn4rDLniE10UtTeq2xuEK
	IyZcpc/w68SpfpUOR8FADFRNTq8+Yj6LBsIDkBJZ1nWB3uRcBwHfi7Uyl+ZWK5JSr4KM9y4Qq1W
	gx/7Zd02213uBbIEX1X97Ge6mOZ9g62rOoGSst1Z+DTc/CjSj4yiUQ5oGgtkVWiJ2RiujYTkEQr
	/XMDUua75QxbydmJHbaMCAijlwNMfhYWaX5vTsnPejRLIZI
X-Received: by 2002:ac8:58cb:0:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-52b5666b75emr44233251cf.3.1785554004223;
        Fri, 31 Jul 2026 20:13:24 -0700 (PDT)
Received: from [192.168.60.12] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908436072d7sm24632176d6.49.2026.07.31.20.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 20:13:23 -0700 (PDT)
Message-ID: <4ac9ffe4-0f14-45d7-9a62-7a5fe7c40bf3@gmail.com>
Date: Sat, 1 Aug 2026 11:13:14 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v8] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: platform-driver-x86@vger.kernel.org
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260729044332.382862-1-alexyeo362@gmail.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <20260729044332.382862-1-alexyeo362@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Please disregard this patch.

What I have found is not just a fan control method, but a set of methods 
to control active and passive cooling policies for the cooling device + 
a way to cap processor power and unlock it.

The reverse engineering notes are still relevant, but I had clearly 
missed the part where the fan code is in proximity to the code that 
toggles the power limit.

Given this, I no longer think this belongs in thermal or hwmon. 
platform_profile appears to be the appropriate fit, although I will 
continue investigating.

Apologies for the confusion. I will redo the patch with further testing 
and data.

If I do move forward with this approach, I plan to submit this as a 
completely new patch instead since the current subject "add fan speed 
mode for newer models" no longer applies.

Thank you,
Alex
