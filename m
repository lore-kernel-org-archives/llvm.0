Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5B2AF0D
	for <llvm@lists.linux.dev>; Sat,  3 Aug 2024 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722691268; cv=none; b=gA65AzGOaUX1eo5Y+m3X4KgC50A/fC1b8fHdi7VNsqzC+NusWh9++PT1svH60SM8UhJA5pj85tuq1OxZ93hgJxfVF6MqVqupudIs1ERpApj8FUZMoXf9g7uFja7YLAAE9U+IW/mOt2r2eAdSkkLJagad11rWknrEY0zKYzKTXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722691268; c=relaxed/simple;
	bh=f6R35pGQnEE+OUaUdiSnnzokVlXIPFeyl5dRZpjvRWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWcNOVbo8gzzrUDVoYRY3IrjKyiUI2yUeZhHX0YDWpp0FfFEkuLzgioLxc332US4xu+WGXjuwmlFC7aY75xEQi8zNLlgH7i63jLztb+OJ8CQW++YXo2/FfDCTGL8+wkbuPhSf3gKfvA08L/Ic6Nk/jGugThGqxlHtIG396rIk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgAJAz7s; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgAJAz7s"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d162eef54so6467616b3a.3
        for <llvm@lists.linux.dev>; Sat, 03 Aug 2024 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722691266; x=1723296066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rSxbAxWiCYHnoojmJCKUKHvb2mNiQ81YKSAEmx498m4=;
        b=LgAJAz7sNR8Z87YP2xL+4getE4YSnOsXo+Ce87XtmesMMEE4EMFjRWf0entdJeOqGv
         QsqPa3P4X+utWZ26puEl0KSeid2ePWObpDeWDTTUfxacc0Pyhbm2fT5Cfy8Cz21G2lB+
         HQypImJKrCJeyXhX/0N8rMRLW+kKA2e+F918YBxmNQAO38X2Mt1msnia/06Uyo6g6T1e
         nOBbKOZpTBQdWenRDkN0lkhWC/J3KDyEQVh6E/mcJ8tpemWCaScY72hrDtn61qMSLXor
         xlrLTPubo8uJj6ohmTjdGWN+djt0Q0qmOR5s+n7GVCM3P7KeTxvYeLtYbomjzCxNrmQn
         MOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722691266; x=1723296066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSxbAxWiCYHnoojmJCKUKHvb2mNiQ81YKSAEmx498m4=;
        b=F1XwQ+mYQonuFRCXrSs7z8QABxvbYKZ4zQ6bhjbqg0S21qzRxDCt7ah/4d0mtiq+HP
         r2rvwq9R2zLqqYdXEmUYCNCq+H/6Fx3wbCnONHi+Jq1mDK+rm+EPvAZqqaT3Wycqv+YC
         +2elPmoKVp4ywtTCG0OztxF2vrXPh1zfdFn4i9jmv5wgzNsByV1wMNmTZ+3gMx4huDmn
         6vOeyR5c0+kAAw8idV5Q3GhkyXrKlkmI8pFS+C/wEFc9Y+/a2+tQD3/XSGYYq/8XmdOo
         4aUAqkKJYmgUo/u1Uu4iFgRJ0TKCaCghxxj+8cVyLEH8qMRQa5+s7RyH1AJs+/f2JliA
         yAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtIT/jbSjpCw/gcSFhoxTnYSQ4kbYRPXfqP3nCCNMmXU/818iykx1CS3AbvsiY9M2l1aV2Er8qkVcRg47YUUzCvFK6ew==
X-Gm-Message-State: AOJu0Yykk2NkX+IIvUnOpAeCHKE8ZCx4Ro8WPNZ/9xpU0RWz263f0pFO
	RK+5zeVnIOUxN/7qslutnDjnZybCKQx3cHK5EBiRsf09tnWw7KiE
X-Google-Smtp-Source: AGHT+IHCwgmBveAW2qJ+PiL/7zd0ZtGuSdGk5zkbP7ueLupnEbZEFoDjfebhz0nHcq1iusormWcvrg==
X-Received: by 2002:a05:6a20:d80c:b0:1c4:bb9f:c574 with SMTP id adf61e73a8af0-1c6996279b8mr7374455637.43.1722691265989;
        Sat, 03 Aug 2024 06:21:05 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592976b3sm34608455ad.252.2024.08.03.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 06:21:05 -0700 (PDT)
Date: Sat, 3 Aug 2024 06:21:02 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 3/4] cpumask: Switch from inline to __always_inline
Message-ID: <Zq4uvqU3yg7bJ1Lk@yury-ThinkPad>
References: <20240719005127.2449328-1-briannorris@chromium.org>
 <20240719005127.2449328-3-briannorris@chromium.org>
 <Zq1NdFXhN3IoYm3M@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq1NdFXhN3IoYm3M@google.com>

On Fri, Aug 02, 2024 at 02:19:48PM -0700, Brian Norris wrote:
> On Thu, Jul 18, 2024 at 05:50:39PM -0700, Brian Norris wrote:
> > On recent (v6.6+) builds with Clang (based on Clang 18.0.0) and certain
> > configurations [0], I'm finding that (lack of) inlining decisions may
> > lead to section mismatch warnings like the following:
> > 
> >   WARNING: modpost: vmlinux.o: section mismatch in reference:
> >   cpumask_andnot (section: .text) ->
> >   cpuhp_bringup_cpus_parallel.tmp_mask (section: .init.data) ERROR:
> >   modpost: Section mismatches detected.
> ...
> 
> Hi Yury,
> 
> I'm wondering if you've had a chance to look at this latest series. I
> believe I refactored it the way you recommended.

Yes, you did. Applied in bitmap-for-next for testing.

Thanks,
Yury
