Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F79A3E6DE8
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814379; cv=none; b=WFeBz5cgwdvntScc/6EOE02OP1gm9LepHFQOFQZfh1ojCC2NJCYj6NOt/riq+OrMjHxxc7n3QquGd+PTW0zcCmMg3SPJoDMNqNJdM5C5jVYBpfDlXw5z8Pnp4O3QTOJJyUK42SJmj94d9LYAs4sM00s7Dt9uraa9JDOjNjIEvNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814379; c=relaxed/simple;
	bh=HSRA27bv0CSjidcVERjNYFlK+wUZ6/j+WxBFA3lQiNg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gndhys4Oe2bhgDu3P8ufFj9Wgbg6DQ/6l21ELnyDh7RpO/wEhARPKKi4ufDQTnu4gmp7pi88lr72DEK3BXtdkQUsbZ+9FZ3sFj6sib0azm8RiSpUmANU+OGOqAfxAAu1AEWIE6/JM8HyAjWG+TTkwDd57sSaKKpSb1RuwqiS8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEv6KBn/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEv6KBn/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso32353045e9.0
        for <llvm@lists.linux.dev>; Mon, 07 Sep 2026 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814375; x=1789419175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQjT79f/PL7EerkiFGV6aTGjf3ylMrdZfagr1i24BYY=;
        b=cEv6KBn/Nax4WfReLOilrlMPR1rnoARLS1TGbZBDoeU8v2CeVdDjucdOmAaMTMU+fJ
         UWz3a5RTrFVHrRD4xyl3ZjNLp7bmMLLr6YGhiX14DS23qlwrTs/McGiyh1GA0rZlni/r
         agvivM59I1iloSN37alcmZbNhrqyLpfNWHoA+lDM9fqHAo5ujVLS5c6zzuCi4XvT1V+H
         pLZU7CqoQmKqU1AHGQxPX9MU7LccsjcVF0QiXcnidtPB6RJMS24Ig9lbrF/wjgJ5npzC
         mLocBoa6p+Twv1oo8B7VBECcembFhCPWh/qIs5fV7Im3aQzqNNSWpu+HNEHl7LrMzdDb
         pdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814375; x=1789419175;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQjT79f/PL7EerkiFGV6aTGjf3ylMrdZfagr1i24BYY=;
        b=LScVLExILUbuZD+IQslhHnJQshwAU1PYmebsltGUXw1HK3G168X984xvmKR5c2Cycn
         8ECPfiui3OLSOlK6CA2IJYa3GaYjcmB/kiHg1CAvUc7iCWMFQcLLRhalh+sPmSFFAuu5
         R50JBi780XZ4cu2XQSl/axOASCEpGeMKidVoJj6z89JkTeFOXgEHMxighT319VLhNvVN
         KqAu2TxmGV+0kc6PhokgKbzI/HI10GdxYuGhUvFm1snHZpvUUnYB6W3sAYM1Eb8+qWZ0
         v8zN7SzrVI1KENZMdpWS3FIpU1WUKyWBEWJSVezDElraGTmOaOcr/LFdU5q614PXTy44
         CUuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfQmxrN9EWV/y7GwsN4giMhe38xoDhbjqtJPIbj1TKKPqg0iI7VtHbYypvL+dN+/Zd1VVk@lists.linux.dev
X-Gm-Message-State: AFuF++mj7LP8H/otaMibIKSugM8y1FBhZuN2iFzI2PuHIj0okZW8eLxZ
	IqMKljno1MW0xaMjWrxUXwkuKUa/0v4anr28M/5e34V/1mnmW4VZsQJe
X-Gm-Gg: AYBFou2YlGgw2u5s8dfxIwS2uhoFtayNedGvOaKVUzrz9WBfM5uNnvQyU+NDwkIHm17
	vSKOVj3L453qyt92jni/uAeye+218H6MYLJ1FTsgrat6BP5Z4Jo6WqgeYSlAI/6KfJZ5pHV7RmS
	1jzI4I6CidnMdqFm8JtiFn4ykJJm0tEfHwCr5IwyEEnxqVDqI0qICvDJXte4TOihVKd2gZvGenA
	iCvK1jfKww56+TFkt0fCfxveseuMfolTqYoEslNqqVcsDfJaxJM6nfG1ud8MUokIWLRVpdxjZVf
	8T8p47CEiDCQ5AvftrIGTqUf+ziapPsaBeY2b0Lnu5QRlxAlcEO/KAdVv1YbWdQS+ENdS2zrWFy
	psqazMoPUl+6ooemwwyoAzfMzUW1uH/tc6NxqUXYzTzgzlC+Y6rBBuWZ/MSpOs89uy+HI9Hukr1
	XqS91c6o9i/SA5rslh0A1tfvvQNVK1NcPXS1Q21W6yiWWQ7rv3sxlBRBayVob5RZU2rLGEb9I/R
	xJyFvpghTZlfMKCUmEBGVyK+3SB8liA00Z+Va6BK7wFlFZeauJE9SPL
X-Received: by 2002:a05:600c:34d0:b0:49c:fc6e:a3d3 with SMTP id 5b1f17b1804b1-49cfc6ea71amr202238935e9.18.1788814375238;
        Mon, 07 Sep 2026 13:52:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm462304515e9.1.2026.09.07.13.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:52:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7d625678-18e4-4231-b5ad-d840a37cf029@gmail.com>
Date: Mon, 7 Sep 2026 21:52:53 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev
References: <20260907103739.23212-1-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260907103739.23212-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 11:37, Erkan Erdem wrote:
> Kconfig separates a function name from its arguments with a comma, but
> the caveats section uses Make-style whitespace in its shell calls.
> These expressions expand as undefined variables rather than invoking
> the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> example fails to parse.
> 
> Add the missing commas to the shell calls in this section. Keep the
> Make examples unchanged.
> 
> Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
Reviewed-by: Julian Braha <julianbraha@gmail.com>
