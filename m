Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DC42D59FA
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766128104; cv=none; b=FuZ6HeTPJt0yIEMzZMwJzwNrU7myRef9pG8m1oYNN3oqJT3goPtIfdBPLViC34R7a0yFDtybPo4Xh2ZVI15gmqYvgocynvRlqDEpRT4t0tUwClG2n5PrUkRklKhN+hAfO807WE8uwGbhjI5v/BHJnvXBWvoVlgk1wQzPLXSl5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766128104; c=relaxed/simple;
	bh=chHA3d/r7DdTP2+uwfGEKmhVONsNEHk52FbSC3FS8p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOR3jbAukqxnFUz2pnz3w95zCCAdvfnvwkuA9xrpnmfZA5b1e0NeEXvnoAXd+Ot5vhyALO5qwH69mI5ho5CwF8J9hykW1waSnwe7oxwXH8OxKKxu3huofMcEmJBH+4CHVNjw7P/JvKcMIYBYJTonf4YWGlrwHtA5WNKcUwtxIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnqUGPBW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnqUGPBW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so9508265e9.2
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 23:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766128099; x=1766732899; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NAJFCYxG6tBk/5BjvMlMhhFWKmM1Im0nbCMAsTTFzMc=;
        b=JnqUGPBWra3Yr7pNAkdtRll7pYXCTaU3LxQdfl0Kg5flxxds6V7W01v248g+avSpgg
         3JfGj0MpS1t2wsYkvM+r+T09PewrMvVvyltCWQzDrygh9epwD+DJLqsY6wcSmRXZVHwx
         4LO4iO3G0hasQwaF4AKM4cbf/fbUNt1YL+NW+iU/urz40ITfeNdeH/G2RYYSbexPxYjF
         gYF2Juo5eYVRaqL/qwUMJUfE7j27KDeCbvJm7CEIFSQefdU36V7HsYvREANxkTQ4YgjP
         Tw2YiVk8viY5m9QRGgay4Za5Au1iRuulL/Mg2PDrXVqZok+c7vNVBG7jzN+y8ivaQvIV
         uEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766128099; x=1766732899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAJFCYxG6tBk/5BjvMlMhhFWKmM1Im0nbCMAsTTFzMc=;
        b=EWQ5qaAaM3Mx8/jkvq9yzakAS0Q7wB2L18RTlE/WpUcgzKKGcPrfXHryxV2uHCRraw
         OozSUFUN4/vw1bOmaz9zNm+pBhfKsqLlLMcCiGjg+AsXz7WH92pxf/W9CaBFJkG8Xkvu
         sVKWg7pTCREoTDzExarGSpRzgnxeAWM6HJwUtFjc4ph1UKqopU8TC26u0g+xp8K7hUBi
         gq4gM65nChvXFIVWO8CdhJM/ACmTYRRaCfItr7RbNrJXzXYPSopNPt9XLIUPjPh6s454
         +YAKR7PEGiNZ3fCAO+VejFNjfa6kMSq5meuDo4tJPhqmz6HwfUcTCuLb7Wiij7uk9rWw
         NT5g==
X-Forwarded-Encrypted: i=1; AJvYcCUhQsAtnnJAGbxKwsifHiXNvshDOixJBEAFsw1dj7xyqnfKLPbOwEH2YfmVNHciscq5xvOi@lists.linux.dev
X-Gm-Message-State: AOJu0YwNoSfM7i+v874TLb2weg2Eg9N6hc7enZHzns6nICqIy/hBg1JD
	6FfbX6NbSByY5bUrojk27ofUmR16udltkUnzlrPGT24KfQZkkwB1haZtnwbsk9VJaRM=
X-Gm-Gg: AY/fxX4i6ConR9RxGHlmkXj+ImahCRJaH5yDwq01HD6K7PMRuZSUWc7gv3Z/oNcHxlQ
	o/2ZPkPCL30MGzpijx54WYPZgdQ3toK/OnEQ7FaXAGsnHpP2V1mcw9aWtuxRtsh9ZohBfuHAahE
	O5Jy053e53drGF3U8PfjQPZPTDAiUj4I0mVYSgapvA65l8ij/uPRTdtfHAvSRCYo0jU4DriDLwN
	mMedD5KJvBkNsJfn/0qCwBb828FY2VZU0+XcO4rDGYNQqhSaWtW+SbAvkc/WK6AovwpDIZWXSzl
	wX5jZOflpbuUmN067T3w3hYNWwgle/HWNY8e0m8MjPTSsnSyn34DmLXupQAHJs0x9Yj9XMck/Yu
	eC7fUxtxdF/FUraoPoJn8GcMvY2dW35ZlTdS6fMFVNnRxB0SRsmeNWiG0fkOvnkDGMV+9qsKYbd
	bqVHE5Dj61zYfReIpH
X-Google-Smtp-Source: AGHT+IE7nLrq263HAsObO9ho2ijSSwzHrCJiIV0bJrGj7M+qZEd9hC4pZGfJYlq78GqHGGWD40y0tA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr13555325e9.34.1766128099504;
        Thu, 18 Dec 2025 23:08:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm81591275e9.14.2025.12.18.23.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:08:19 -0800 (PST)
Date: Fri, 19 Dec 2025 10:08:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aUT54I0fD0aqBVyw@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin>
 <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
 <20251218220651.5cdde06f@pumpkin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218220651.5cdde06f@pumpkin>

On Thu, Dec 18, 2025 at 10:06:51PM +0000, David Laight wrote:
> On Fri, 19 Dec 2025 08:34:05 +1200
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
> > >
> > > One possibility is to conditionally add _Pragma()  
> > 
> > No. That compiler warning is pure and utter garbage. I have pointed it
> > out fopr *years*, and compiler people don't get it.
> > 
> > So that warning just needs to die. It's shit. It's wrong.
> 
> True - especially for code like:
> 	if (x < 0 || x > limit)
> 		return ...
> where the code is correct even with 'accidental' conversion of a
> negative signed value to a large unsigned one.
> 
> clang seems to have a dozen similar warnings, all of which are a PITA
> for kernel code - like rejecting !(4 << 16).

In this example is 4 a literal or do we at least know that 4 is
non-zero?

I really thought I had a check for that in Smatch but I guess I
don't...

regards,
dan carpenter

