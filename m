Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ECD190462
	for <llvm@lists.linux.dev>; Sat, 15 Aug 2026 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786753710; cv=none; b=lC12E9An60iIsM5NgaWpEWHo9qhNmcc44amKIupHSjz4WjOeFK3scaZ26K8iR3jjfdVhvsf8Xw3zvfYSZqB8aq2Xr35NOAhMjKtZKYCih3HMISy2QPuhPMwHDXBxb8BOS7vtodrzJjLqSiKpA0TLVMNXcfCQQXUk1wjU2BYefJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786753710; c=relaxed/simple;
	bh=VdoxyZPOqc4gajM4tWVv7aPhUu3It/yyhy4oJD9Hkqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjtUoy8q8rhbIZQzEOmM/uXUNZJv/9Lv/ZNKjFBkZWdzdG+YgZG66WGoPICQxFLRX6pnJbKn0nW8wtXbYNksd8vnDr30hqD2V/4aRRln8DT2M9SfuhffrE9Tjh1lw0+3CGBQS5W9KdsgWeDk2Tz9sq6s4RkRWZ23TdMn/nngdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrQXemGb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrQXemGb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so14070705e9.2
        for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 17:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786753707; x=1787358507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e5K+G6TwOX21s1Ie3PMbo+iOlYucj/5s5+PZY2NK0NE=;
        b=DrQXemGbjJwqTrvfjQ1vfRo/MqB0YE8RoJqYOL49KRNyvlEwtairQAlRT/YkuJbDrT
         dYKQo+5Ztwe5Bbx0+IliBWHuqd+RR9qhYJRDIL/fmAeA0i4UTv8lrMdoAF+cK3baM9/W
         VnCAqcjpvMj7st4GjEe4TFPNJKK9d+gCJbfdp0WCHmGQBOStMDuBgzIcyb6+nqzG++YS
         IUvvUfJkdjIyxa3h2zuKqESW93CbOW8HfjR7288RIelGhfHfq+ez14fgF63jl/Wnv9vW
         fcV9C7S1gCFqJ+sSr3LgpRBtWNmszY+1oW+mXqcHanS4muHyAeSWisLGXlUQ6hGv/8so
         PU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786753707; x=1787358507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5K+G6TwOX21s1Ie3PMbo+iOlYucj/5s5+PZY2NK0NE=;
        b=qkqVIGkFgV0+tVgnr3EsTJG+t5h6Zg0+IQ30tBJE3avQBFgaOwUAjbhRwCZ8emzcxQ
         tqGAPjM2ToRNTQ/VWRiMPNLyI4mySDlSvLKxg3BlJvRom4rFSBMt4h8vK4ZUDxQtcXw7
         69atieOXp/OruSfP+H7cO5TVnTSHdbAGF8NFxajKoZ5ZMkyTMj0aQzzgAtmNO1Ev0+Sb
         f24y3GtgE6hxHmae4M3n65KsxFvbPM1VRGPjcfh3E3Mj81J3NXtfOIV4dOwaEeTahN5a
         G9gqAflYrs44fWdZvtsY5lBB+Jk7xjjz6JFD5zj8vVP6x78uYHyi0IyIYrZyolB/WLqx
         SEQg==
X-Forwarded-Encrypted: i=1; AHgh+RqHJPSQ8SgBDZkvBlw6hw6DyXSGBvuAD8OhaOHiBkHHgvSNxdfXbBfFchnwwYkjaHaHqpMz@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4a2H3moZn7AqmaAvq3wznrrr8Mls8fYsEIdPUVVK9j3dUHgkR
	o+Zs98iSsVKzutYKRquKatFV7A+iEfYJlNZNBM2gPw9pGN4MnqSLTeRR
X-Gm-Gg: AR+sD13mJ2DJz4H5zaGQIvB5UYmIp3R2s71Y2r6k6PA1QLp1x593Gq9LQJybtnYRJ2q
	36oK37HDxpBZ0hrxd1jXEAPRzvefGeRQp8Zmafs0riD1dpKYYMjmi4x0/9hW4dUnX8MSkbUolLj
	eA1vLMf24eFGiXCbHhfhXMg396RI30+hZDxZ5OsATiJtJkphxmXwJHioc3gqcYjaA0ZBXhNLmjb
	+WDDhYVaby/pQAyMK1WnWa0VgaHTpnQTA77k817nvMgmBUEOreEUDwdaZN//kdF8Jgi/XyNX99d
	SdUaHrx6z3NII7muOvyD3/R2XOFTOz+w/pr9YTgpoNZZYbfE/PoUEvlWQmyGB0snYxoF0lga7Sh
	SrVmwRuUINE6mjlBElkqNZM+2s46BzOCZPwHw12/SNiccoSNTPZhPIAZm81pqRMYbxNr/knwCzP
	5bOhsKR8M2w6uZ6RpAa/ILUooykVDbjGfkl2aLt4BJXfNDOuJQG8YjsAcFdZU6wwyLSf5gnxFpj
	9BaBt6l0ZAnyKKwAjew0f9QmapIKMdNrTdx0iSm59VkKWJlikwuf61xAgho/BZHlSMVVPQnvuuv
	wL2xSUpVla8pgFpoTRxusPfLRquuezQKtjaGh5NbkZhn/M15EEjujI5dq9OV7amGkg==
X-Received: by 2002:a05:600c:4e0d:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-499900c9d75mr3231915e9.6.1786753706369;
        Fri, 14 Aug 2026 17:28:26 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9d7d-f301-9495-44ec-73e6-1be7.310.pool.telefonica.de. [2a02:3100:9d7d:f301:9495:44ec:73e6:1be7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998ba01c62sm58696145e9.14.2026.08.14.17.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:28:25 -0700 (PDT)
Date: Sat, 15 Aug 2026 02:28:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/3] slab: check for ZERO_SIZE_PTR by exact match
Message-ID: <an-yHQe938PS-Opz@gmail.com>
References: <20260811141240.62519-1-kmehltretter@gmail.com>
 <20260811141240.62519-3-kmehltretter@gmail.com>
 <202608111716.0FA9DB17@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608111716.0FA9DB17@keescook>

On Tue, Aug 11, 2026 at 05:17:48PM +0100, Kees Cook wrote:
> > Compare explicitly against NULL and ZERO_SIZE_PTR. Store the argument
> > in an unsigned long temporary to support both pointer and integer
> > address arguments while evaluating it only once.
> 
> Can we move ZERO_SIZE_PTR to cover the ERR_PTR range too? See this issue:
> https://github.com/KSPP/linux/issues/93
> 
> > This also changes check_bogus_address() in hardened usercopy: nonzero
> > addresses below ZERO_SIZE_PTR no longer cause its null-address abort.
> 
> And then check_bogus_address would also catch ERR_PTR.
> 

Thanks, I did not know about the earlier discussion and the KSPP issue.

Using -4096 for ZERO_SIZE_PTR is tempting.

However I found a few conflicts, for example:
  - PowerPC KVM guest kernels map their magic page at exactly -4096. A
    kernel making this change would probably have to move it to -8192.
  - m68k DragonBall has a hardware register at exactly 0xfffff000.
  - OpenRISC could reach this address with an exact 1 GiB direct map.

Linus's original reason for choosing 16 was that it should fault
like NULL:
https://lore.kernel.org/r/alpine.LFD.0.98.0706011554300.3957@woody.linux-foundation.org

I would not include ERR_PTR range for ZERO_OR_NULL_PTR()
globally. krealloc() also uses it, where it would make an ERR_PTR()
behave like NULL and allocate new memory.

Maybe keep the exact check and add IS_ERR() separately
to kfree() and hardened usercopy.

Karl
