Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485A1E520C
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766127372; cv=none; b=TKP67fR0ZlV3SaBIMqPrCqZqCmuLDB+rtGW1drdAIT+OnYcI2FgGaUVxrxGWZINUEXI9NmHoApcGuvjTtnQ45bvZ6y4tC4NJj2LVHqOQRF2Ik/6su3C1Rwv4JUo28z5+6CSwHxnzKsYUuMaX4oblSepuErbsA43hacwy7tja/DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766127372; c=relaxed/simple;
	bh=rK2YSV2LQI36XGOcBtrahoUPHaJW1KtgnbjA4zRpGec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmGo5+tjzzTtvNc+qHHQUg+GnxQQecx599fb2QPFGtLrVFi918BAWxJOVPCDwe02sqNDbYVMiXmSfLNJLYaSNRfXpkHpjcHu4Um7tMEFXwcduDVkAW1HzmGiS/Il0unImR8wdrEx/OTGO0OTIgkQJABv5qj4vtm20yPMhRHyy2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p4FnLFdv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p4FnLFdv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso5558865e9.0
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 22:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766127369; x=1766732169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uvUrNBTPpChg3H7Mj1KDqnB8rAwuiPMf9e+Kj7W0oA=;
        b=p4FnLFdvQSAU33C7GYyQ2YVS8iVE9NVwajM0mECewwx/3C2CLcoV9RU6RmBNdBbApH
         RIuYZOF/BJ5qbACz3++LQOV2/tG7CnYpg5KO95QTiMVY0uiz2wktM40zVAJMFB8T2NFM
         Ygv4VqDfGRRwlXXx07muipXYLWBc0Rzmlc6GViNmyvVnHa3i4PeDRjk99vpqYIziNqqh
         45tpUhSNPcEhSz9jbCkuqKoc1aA9A4uTcTIn6+nWih92a3EkS/H4nZuunrnhtexOh40I
         +O+ksrB71KQepkd6Dmd9Du+70sz0gdMyY2QdO3wSU0HUuHNQsdVlJaUn3YpeWZOGxFEc
         wBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127369; x=1766732169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uvUrNBTPpChg3H7Mj1KDqnB8rAwuiPMf9e+Kj7W0oA=;
        b=oyTBzH4HxMgcC1oZogdGARZE/TQEUy6iSSiWC1djGjzeQPRP9CD8LfFPT323hXkmsJ
         GK6fL2bKtH39eJZCyx6/K1i73jDpRPmCuXYbSKr1XG/T5pm2cgQkOkqSOHks1/2ILgnR
         NpmDGicZ3B3ll6nrELfXzI4t+0EuubQOMf0dIBqG88cA6FkBfiaPH/3YXklAG1UnNMOt
         jXGUOAg5cT+nAsYQJfnJmDwiddhY30o7QFECoeyZuWcmrwyFP+MVE6dJTN9x3fpqxQu1
         PHcDXHk+mxm5ca+bLnkRL56nWWDjoWQeExzd/fNvK+0FjhLr4Ll95s0KnM38dXg2FoC0
         0eTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1geoc2vkfpbHitOsqMbm/isTtbUH2GtCdMVuJ+cxtYdnpJG/6QqV+8/oz2KNblDn6N9BN@lists.linux.dev
X-Gm-Message-State: AOJu0YxRRZOv4KLFe8vMsxe0EBzMf15dwXY9mfK2fFOzBNr/TLAh7dxy
	Ouu0EuHhpAKPBnUledi67jKhnC5Fy/zMODjiJB3dO0vIuQOEhM+EY/PHGuI8sudl5uc=
X-Gm-Gg: AY/fxX5FDB6Inptawm2tIv5hO5wlvdW3FxvaAPnXw9Z/wNfxEcvpZChPbHw+gInz37N
	WwXeYfnoLQxk07rS1ma1fpROsUr8QQ0r1+1UJwk3eM0ctNpRRYSnXevlji8RemreP2ECz1oHnQZ
	j9HkVezpswbXYzCtK/oB/DrBfcpXAyILNIxs/X2GgEF9UOuSSNQfG9LbwR5ea7lnyVIHhD9uwwJ
	jRscMUFK8GkoljC8vzj32wNuOVo/qh6D7DkJGuAR8qNL0pQQWOKZoTMsBepBtYYtPc0ARgeQ9M9
	5Z3K59NuGMrFYeQf/VvJ7zID2dKF2buY0HLqkvwFkMXOV04tHi5XcqFL7WXocPxQD5qGbcy/G1z
	mPe1/+FAAog6iFa17ssd+ZONGmqa9sJI23pBXmFTvLkex06YDrWDZUoQrLeKG/43geRqbKDHjxF
	3PgwMBPLi0AJmxNsjq
X-Google-Smtp-Source: AGHT+IETUnYjoqlX0nTA5YutvCCmQpud7Xc95qZZjrAyjw0urEK/i2B0DG8TW5LtsWwvJaxJadbpvQ==
X-Received: by 2002:a05:600c:45cf:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d1954a550mr12510385e9.12.1766127368714;
        Thu, 18 Dec 2025 22:56:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a0fb5bsm30212905e9.1.2025.12.18.22.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:56:08 -0800 (PST)
Date: Fri, 19 Dec 2025 09:56:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aUT3BYAT1bLCk1w9@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>
 <aURXpAwm-ITVlHMl@stanley.mountain>
 <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>

On Thu, Dec 18, 2025 at 11:31:40PM +0100, Vincent Mailhol wrote:
> Hi Dan,
> 
> On 18/12/2025 at 20:36, Dan Carpenter wrote:
> > On Thu, Dec 18, 2025 at 07:50:01PM +0100, Vincent Mailhol wrote:
> 
> (...)
> 
> >> With this, remove gcc's -Wtype-limits. People who still want to catch
> >> incorrect comparisons between unsigned integers and zero can now use
> >> sparse instead.
> >>
> >> On a side note, clang also has a -Wtype-limits warning but:
> >>
> >>   * it is not enabled in the kernel at the moment because, contrary to
> >>     gcc, clang did not include it under -Wextra.
> >>
> >>   * it does not warn if the code results from a macro expansion. So,
> >>     if activated, it would not cause as much spam as gcc does.
> >>
> >>   * -Wtype-limits is split into four sub-warnings [3] meaning that if
> >>     it were to be activated, we could select which one to keep.
> >>
> > 
> > Sounds good.  I like your Sparse check.
> 
> Does it mean I have your Reviewed-by?
> 
> > Maybe we should enable the Sparse checking as well because it sounds
> > like they are doing a lot of things right.
> 
> I am not sure to understand what do you mean by "enable the Sparse checking"?

I meant Clang...  Sorry.  Doh.

regards,
dan carpenter


