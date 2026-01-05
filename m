Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED201643B
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767597977; cv=none; b=uiuZv6PDk8r40eepC95aJ0CwjqKYgyDZMzDNtFAD30jUGamsX/1j8wRPhfgpV2G5fHPBz6tIiTPwsLxR6Ytw/UsK39FdCBdButrVEksulwPeqUjTfOBZCrRNQimJB79MdEdKAQiLN1oA1bpTPpgkV4dw4lUJygokxBZTVPXFWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767597977; c=relaxed/simple;
	bh=J+0zgzblPWcILdaJe+sS8PZ3YqSBzV7Z4n11YbyV75A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJFBHV3UEThWJX+Qtr7Fz9qd4KNjiRkmd6DUiiBsCHIUEzMX4NBNlv5+hyL8TWylSY/VQQ57zT7NziL5j8vf2l9sHmZc+lbUPtjNVYHdKQDfhsDrxUA1VB5YRrkIQImEKDj8n3Mnq0xVS0VY2gH59vgQPD+XdmJ3Q2uvwbFhvYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LME0Y4sX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LME0Y4sX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so74004825e9.1
        for <llvm@lists.linux.dev>; Sun, 04 Jan 2026 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767597971; x=1768202771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tqXPGRlmqIR2c73hehXqAT4WnRWsCFlwnXSzbZ1gZgI=;
        b=LME0Y4sXJVLH3/43zJfcB5CwRH+uuk3DWznC6Z7Yk9+/pgNRqwYYepsNy63VNIv8Dp
         f6KooxzMI5vRYnmuhlDEH5/JzUTYzweVwSkKpM8g5P5I9PlIs55bFCdqtJerujenXE9j
         IcGOh3o2h/LsRw1jvnzK3HiABAgpQhk8ATfpd1eMH+4r81vov4rc0j+KccCvEqD3doo2
         inZBMc2LxlYajNsqqpLb9wcNs7TsJl2jXzfZ9EBeNSlyF/RggMdkJl4CbR/hnfB90dnw
         PdCuWso3BzWlT5l8FNrT6iaCNgnrC7U3lnH8xwP+nj9YukWtPoZ4nOiCvlt7S5t87pUd
         mnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767597971; x=1768202771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqXPGRlmqIR2c73hehXqAT4WnRWsCFlwnXSzbZ1gZgI=;
        b=nol5H/VUL0pNz2F4eudj3d2YERpOWjRd8d4EqwxPpqxqWKG/NXmbGrxck33M52luUM
         fOca3OQp4xlyKHxD0BnY1XbA6rVThtXu8QjYePVzikPPTG8swKJy8Ua4seNHRgOK/397
         PGp2sxmNEUqclDLe1KDxlXfzvmze4/wCPB9w1Bqx5E2OYYroQCUMw9ZgHX1HJUZA+mQH
         htMha+WsrmXaxLDk4nU/M5ED4IN+X/h/0YKhCWz38oqe5PEoDvtUM37wBuU8YM6KyF4V
         76n9c8DL3kpjVB6FX1PL514kqwz1fEA03TWhGiJU9ZBBepeoeFn456cIpLkiWWw/YZjB
         Ih5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQUUvYMhNcL2puNEI9MdqirJ0sfX0yU16h/0jCd/xwO38MvJ39uFWU87d54E7HRYAg8wL/@lists.linux.dev
X-Gm-Message-State: AOJu0YzFhirlEwQFfbkDFZGXvjE0C3nPhsg9C+kGsM76209VolJHDno/
	j/wLzLn2q3EieV1v6PS10fJegUiMiyhD0IdfCnnNipSmtiSobvFtLA+t2FWRmZLI4FA=
X-Gm-Gg: AY/fxX4AqObll3H6UyMELS4J+/cWqRQ6beYHud1hAbWVgxx9ClCfbEcyvJWwaUjk/nv
	wJPqvi+Lsxv6ftQe2p9W/00KSvOVDwr80MyfDlOLeCLq5ylNDJCgMvU2UiZJMLensb4x1DBGW28
	LtlhRPW7/G/bzFP59+x0cyjEdkmDd1s/KLtFmgUOMAwDJLfUOHt4EoDzlSYRqEg4+BrJ5AmQp8q
	auKDmh7MZ5A+FI5ebx+7EJpfA8nWP5n70k7BvzXbYb8xx0iquAQw1/N5oS9w/2SFMDScerpExlV
	9W4fA2SOa6aTforDWIyv2FTYCh40ul2WamxwlaTITpAWhB3XOswcZgIQyT13xrZn/GJU5I5Y9Fv
	MXSIMdyg5XGcO3u3zvLI+P9x5o0gE37ZTiTjw6ySGhcDSSfCTZlHqJoJ3B/DUlVwa50cOpgF+8b
	9KBZsTE3QX9eJwxPK8
X-Google-Smtp-Source: AGHT+IFrdZFxzxTrmRZMpsP27Ztfl7Uoc6pbDtE/T7BSP5JYGzpyq/KpLAX/yGG7sIYcOpNE6ZVEuA==
X-Received: by 2002:a05:600c:1d1d:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-47d1957da90mr604728865e9.24.1767597970515;
        Sun, 04 Jan 2026 23:26:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d45bb57sm148423745e9.14.2026.01.04.23.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:26:09 -0800 (PST)
Date: Mon, 5 Jan 2026 10:26:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
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
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
	linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <aVtnjgJOjMp9cMDn@stanley.mountain>
References: <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
 <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
 <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>
 <aVlKTculhgJzuZJy@stanley.mountain>
 <e66bd09b-9879-4562-a71e-a1e1a964f3f2@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e66bd09b-9879-4562-a71e-a1e1a964f3f2@kernel.org>

On Sat, Jan 03, 2026 at 08:40:17PM +0100, Vincent Mailhol wrote:
> On 03/01/2026 at 17:56, Dan Carpenter wrote:
> > On Sat, Jan 03, 2026 at 12:10:45PM +0100, Vincent Mailhol wrote:
> >> On 03/01/2026 at 11:02, Dan Carpenter wrote:
> >>> Thanks Randy, for sending this to me.  I'm on the sparse list, but
> >>> I've been on vacation and haven't caught up with my email. 
> >>
> >> Welcome back, hope you enjoyed your holidays!
> >>
> >>> I can easily silence this in Smatch.
> >>
> >> Thanks. I ran this locally, I can confirm that this silences the
> >> warning. So:
> >>
> >> Tested-by: Vincent Mailhol <mailhol@kernel.org>
> >>
> >>> diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
> >>> index bfeb3261f91d..ac3e650704ce 100644
> >>> --- a/check_unsigned_lt_zero.c
> >>> +++ b/check_unsigned_lt_zero.c
> >>> @@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
> >>>  	    strcmp(macro, "STRTO_H") == 0 ||
> >>>  	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
> >>>  	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
> >>> -	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
> >>> +	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
> >>> +	    strcmp(macro, "check_shl_overflow") == 0)
> >>
> >> But, for the long term, wouldn't it better to just ignore all the code
> >> coming from macro extensions instead of maintaining this allow-list?
> >>
> > 
> > Of course, that idea occured to me, but so far the allow list is not
> > very burdensome to maintain.
> 
> Indeed, but my concern was more on how people would treat such smatch
> warnings coming from the kernel test robot. It is very uncommon to have
> an allow-list hard coded into the static analyzer. Actually, this is the
> first time I see this. My fear here is that people will just uglify the
> code rather than sending a patch to extend the allow list in smatch.
> 

People need to learn to ignore false positives.  The zero day bot sends
a one time email and if you just delete it, then it's gone forever.
Forget about it.

It's really limitting to try be totally static checker clean.  Things
like passing a zero to ERR_PTR() for example.  It's a perfectly valid way
to return NULL and the fs/ subsystem uses this a lot.  But 80% when you
see it in new code, then it's a bug where they returned the wrong
variable or something.  It's a high quality warning.  The solution is to
look at it one time, when the code is fresh and then never look at it
again.

In this case when I disable the unsigned < 0 checking for macros then it
means that if someone does if (WARN_ON(u32_var < 0)) { it's silenced.  I
don't want that.

I could create a much better way to silence false positives like this
if I passed an expression pointer to the sm_warning()...  It's a bit of
a re-work.

regards,
dan carpenter












It's really limitting
if we can only check 

> > I maybe should disable it for all macros unless the --spammy option is used...
> 
> IMHO, that would be an even better approach. That said, I am happy
> enough with your previous patch which resolves my issue and which is way
> better than updating the is_non_negative() and is_negative() comments as
> I did in my patch!
> 
> 
> Yours sincerely,
> Vincent Mailhol
