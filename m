Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A401A277CAB
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 19:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766086572; cv=none; b=E6kpBSzdjtkzbElIl0PL48vZllMslJCP6WPDmRCarvwZM/W0XSkb7F/GQqVoSjnMsnBO4mNk25fV6xr01pPqR1otN23bMgFogloYeCe5ZJbCy2S8ZwsVBLzHO0F/3rCEcIazF9wiW4laAu+QmE9j+ycpkc87JL9iqeGnfDXwGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766086572; c=relaxed/simple;
	bh=gtsgVIH7cjnvnUoQ9+ZBM3YPEjvKI+7T+Jy5w4IfORE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJiIckLdaYRr/ZS4RpWGY726I8jHMh5JWGjgNcJVx/vt8tYK4z1h+9HoHII34oXF+0VpGvFoSI7IsPnvRI5JpmXQutFK3s+nkuC09ONmAWcQfAfovnLM0y5u4qiQoVVAi+7VyUPMMFemVw4ov9CRcn/YVjMDIUaTwrmTupBJoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AY4V/WaX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AY4V/WaX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so6357465e9.3
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 11:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766086569; x=1766691369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxp4Ie+boIejqpFbsPiC20+/Xw7M9cKxZsjEWRRRwds=;
        b=AY4V/WaXt0kGQRYzSV07VNo7m/BSddYSgiuEFwkm3EiNbPj+BD1l36joZYXkui10Xk
         2MWSnFSUdelIZihn123DWzDFDwut0NoOxnvZdiKZOPNN7m4dgZiW7KrHjYj7JQGvmva2
         s48L6XrwtKR5OKXJRntBBvlWUyxMW9db2dRWMRgKxBHMX6fDSaO1ibDnKdqWspAXQTXO
         H2bIQyIvndI2Sla5F9yxujHlESJ/4OJLN8BtElpaQgULKJl5HLlkqIoawVCn5dt9UiId
         9dbdLovQfG9FfetMf9vb6927HRXk5impITqfOFyzgTLJcSID+Ghiuv6hcwYbWclF3Z0r
         ah7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766086569; x=1766691369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxp4Ie+boIejqpFbsPiC20+/Xw7M9cKxZsjEWRRRwds=;
        b=EXKyXzE8iENrYIiHFCUEDZCdop0CJCtAOMvYcn4jYevUGLdfV6vuj8ItHDKlPamdzX
         KOVOAk4iiHIgEfmjYdG+UbnqWVD4m3z4LHDOHwOy6Dt+1Cim73zu3Z+mI1r577Yd7Lrn
         HqWcNmHeNxhmmD8zXmuft78W58A9lLsmmUVhbMaT1Qi4Io6+2jESbdO5n39zjId5gOpF
         dDD906DiDzDkI+fkBkh7ajBOpUGVJLUMZb+l7wbWS4idtprIPRoJ1sWBxOLv6HiRQfd+
         Fr21gao9wi+b7wM0ArcQBB3zHNyjwsJZVFzlzV213hwKSpiSU5s7jeB8lkMqDKq7BZ5e
         q74g==
X-Forwarded-Encrypted: i=1; AJvYcCVQR5N/U61n95XlYE6vb2jWpqBC+T9CzVcgL9CskgOQxR6eiMpsrz9Fz+XA5oN4KeA2hxPo@lists.linux.dev
X-Gm-Message-State: AOJu0YyYq+1CfhA8N4/xdZUaWTfuqUBLMbtopczAyAGQWfpJbHmJKlUX
	paoFphTV/JPvhBjBVqXHDBgE0xPx0jLX7dqYaxCPOouSk53VIEI7NlTY+6QQW8JMW14=
X-Gm-Gg: AY/fxX5Z/ROz/baLXHHYfcMSXvCElsx1AATNMU/qxpaXE9zOX0R95zDarofjwJ5/SsP
	lcQVXjfNxlM50nkorzU+UNsUF22LXqmGEXr/0y4zfHx8QTYWa7VC+L7fF+lwGb/hcPxW0z1yWwc
	XzAzHXk7cXgaV+2lbVb0m9/6f0gEDW9/I3nms9qLgioXkenUXsundbqT5ddKnxSEw3qvuKB7UDe
	CL5ZtSXnYSjRjV2GLkfcJd9I6mB7yJ6ZUXpjkV5ig/60gVKqaiL6YGebOYGmtnBr13sas7XUTSu
	R0zqhO+kZseGlk1Z0Y6HRpHVzYgAKsgo93H/tY+JTCx88O5k5rd9K8pJPFfa7VoAauTXlQB5YQd
	ff9Zh6BRhRiqeNArPnOVOAQyrL+cyzGaWze9gRd4IZ2o1O6I/TZUzu0I14qlfm2qXgRmD/0sOYW
	bopgjMrcX4CxOYQKnUT44hSGpl4zg=
X-Google-Smtp-Source: AGHT+IEWnJ+smox+Awq4YY2u+tYf4kZjFoSNBjl69Zus1TVDvNF1T4vaSgqJeTV4pQlOkjzV9gYE1A==
X-Received: by 2002:a05:600c:818f:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-47d19538725mr2627515e9.3.1766086568848;
        Thu, 18 Dec 2025 11:36:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm552594f8f.35.2025.12.18.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:36:08 -0800 (PST)
Date: Thu, 18 Dec 2025 22:36:04 +0300
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
Message-ID: <aURXpAwm-ITVlHMl@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>

On Thu, Dec 18, 2025 at 07:50:01PM +0100, Vincent Mailhol wrote:
> W=2 builds are heavily polluted by the -Wtype-limits warning.
> 
> Here are some W=12 statistics on Linux v6.19-rc1 for an x86_64
> defconfig (with just CONFIG_WERROR set to "n") using gcc 14.3.1:
> 
> 	 Warning name			count	percent
> 	-------------------------------------------------
> 	 -Wlogical-op			    2	  0.00 %
> 	 -Wmaybe-uninitialized		  138	  0.20 %
> 	 -Wunused-macros		  869	  1.24 %
> 	 -Wmissing-field-initializers	 1418	  2.02 %
> 	 -Wshadow			 2234	  3.19 %
> 	 -Wtype-limits			65378	 93.35 %
> 	-------------------------------------------------
> 	 Total				70039	100.00 %
> 
> As we can see, -Wtype-limits represents the vast majority of all
> warnings. The reason behind this is that these warnings appear in
> some common header files, meaning that some unique warnings are
> repeated tens of thousands of times (once per header inclusion).
> 
> Add to this the fact that each warning is coupled with a dozen lines
> detailing some macro expansion. The end result is that the W=2 output
> is just too bloated and painful to use.
> 
> Three years ago, I proposed in [1] modifying one such header to
> silence that noise. Because the code was not faulty, Linus rejected
> the idea and instead suggested simply removing that warning.
> 
> At that time, I could not bring myself to send such a patch because,
> despite its problems, -Wtype-limits would still catch the below bug:
> 
> 	unsigned int ret;
> 
> 	ret = check();
> 	if (ret < 0)
> 		error();
> 
> Meanwhile, based on another suggestion from Linus, I added a new check
> to sparse [2] that would catch the above bug without the useless spam.
> 
> With this, remove gcc's -Wtype-limits. People who still want to catch
> incorrect comparisons between unsigned integers and zero can now use
> sparse instead.
> 
> On a side note, clang also has a -Wtype-limits warning but:
> 
>   * it is not enabled in the kernel at the moment because, contrary to
>     gcc, clang did not include it under -Wextra.
> 
>   * it does not warn if the code results from a macro expansion. So,
>     if activated, it would not cause as much spam as gcc does.
> 
>   * -Wtype-limits is split into four sub-warnings [3] meaning that if
>     it were to be activated, we could select which one to keep.
> 

Sounds good.  I like your Sparse check.

Maybe we should enable the Sparse checking as well because it sounds
like they are doing a lot of things right.  I think Smatch catches the
same bugs that Clang would but it would be good to have multiple
implementations.  The -Wtautological-unsigned-enum-zero-compare trips
people up because they aren't necessarily expecting enums to be
unsigned.

regards,
dan carpenter


