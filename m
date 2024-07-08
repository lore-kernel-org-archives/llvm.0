Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9DB1487E1
	for <llvm@lists.linux.dev>; Mon,  8 Jul 2024 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720467688; cv=none; b=TMEdVnBSqv3ixnZ39mBmcIKKcoeyvZFIVZgBWZi3IoVBMv6dgBkQ9LPdFH9swkkXyo6iyx0q7xIXNmatDo1rIffCqsMbGHvX7dZ5PCmN1rTJLMzJTOUjtlworu2Mj48LihgINqZ53A0Havx8LMydSa9Kf+P9yUxT2Ryu3m6bt8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720467688; c=relaxed/simple;
	bh=J7SMmk8dkfxhtog/4tWjeMnExbVnXCqmGT5M8Wv6bCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8uVvrExMDjxfye6BCl6T6SOlmnrOW4iAaLGg4EYb3ST0lB2292c/rTmpjdJney+4XSNSLGaeVh8WxgQgRI9Xf+2j+OGUxeAf1hShV2T1w1Af7hmuvibP96wYrx3rkFqtwCsqjJ1SoM2A13LnIaQn7oQMCYMPqBGH9CJ5vAm+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g/zQZwHf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g/zQZwHf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b0013cf33so2886966b3a.2
        for <llvm@lists.linux.dev>; Mon, 08 Jul 2024 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720467687; x=1721072487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVILaPzBf0V9Eob5sjaqfm/n4CHzoRJIANCVQTtCSIs=;
        b=g/zQZwHfeiTEzHEUg+F+R+BLwjBso2GgSRHUyZBrQt/uE619LuZB05g+XB6TapkIaT
         ziiuuwlZZzPuO0HlCJIBECNJLoya+7uuPnVr2gb/JWI7Z/rKdz+UdpHM/cBJbAVSpjHC
         4bc5AgWMrzgo+b/EQasAU71KCBS70Lz5RjhWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720467687; x=1721072487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVILaPzBf0V9Eob5sjaqfm/n4CHzoRJIANCVQTtCSIs=;
        b=CPZzl8R6bIxmap7LaLQEhqVKEIkd2R2PYs2vUzhtVGWhOe8lBrGn1mGEN6g2zF85gW
         r0H9c/VFDmu6nY1cLtafvbYphzjiO7ONufn1bvaayCOhItQ9hoDpdKdmSz4HQ5/e+prb
         3JAECY6n0wfWXbA23Bhd8YZTpkGcpI4OwnlC+cU+ip8mFksbwupLMKCT3wKMFhXA88Su
         0TE088QX2QF4WctR7iPQ/yZdDYBTvMviHyfjJlt0tatRbMxDRx1bs/y/JwPn4gDOQ9LL
         fsAcCcYlMvJz6gm9MHjV2TlaJsvcN04k1eHfPZ1z3BDaw31iFsAvT3fsbMIde4ioGaKz
         E5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUenyBZRpH+q1p+4W68ptMLxbK1ZDAisf+afOYCC5BxDrscNCQb0Oh113805pCX+2ZyodiC0sf7U2N67tAtqbaSU+GDVQ==
X-Gm-Message-State: AOJu0Yx7emqcs7RoA1IEBQvaqJjYG3R+wLbi0fAqiTMwD37M+hjSvFK4
	Ea40igflDRwXDnytM8H1TUiF7boMaQDjZpxsKTQxC7B8mqay74HBqR0e4vJ2fw==
X-Google-Smtp-Source: AGHT+IGFI+xvdFWrb7IGzUvJh5OcLaq0riRRLCgKBNM5auJrGfeuMLRHx5Co1Yo1+Ag27hiq8HMFKw==
X-Received: by 2002:a05:6a21:4d81:b0:1c0:e5b9:404d with SMTP id adf61e73a8af0-1c2982211e5mr392455637.26.1720467686832;
        Mon, 08 Jul 2024 12:41:26 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:3e22:9cde:6b65:e5e8])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fbb6a12ccfsm2414365ad.47.2024.07.08.12.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 12:41:26 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:41:25 -0700
From: Brian Norris <briannorris@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] cpumask: Switch from inline to __always_inline
Message-ID: <ZoxA5cPpfcpKkzSM@google.com>
References: <20240514204910.1383909-1-briannorris@chromium.org>
 <ZnsML1RYMmEhhdPP@google.com>
 <ZoWhPFJIvGpMGKm4@yury-ThinkPad>
 <20240703195724.GA292031@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703195724.GA292031@thelio-3990X>

Hi Yury, Nathan,

On Wed, Jul 03, 2024 at 12:57:24PM -0700, Nathan Chancellor wrote:
> On Wed, Jul 03, 2024 at 12:06:36PM -0700, Yury Norov wrote:
> > On Tue, Jun 25, 2024 at 11:27:59AM -0700, Brian Norris wrote:
> > > On Tue, May 14, 2024 at 01:49:01PM -0700, Brian Norris wrote:
> > > > This change (plus more) has been previously proposed for other reasons
> > > > -- that some of the bitmask 'const' machinery doesn't work without
> > > > inlining -- in the past as:
> > > > 
> > > >   Subject: [PATCH 1/3] bitmap: switch from inline to __always_inline
> > > >   https://lore.kernel.org/all/20221027043810.350460-2-yury.norov@gmail.com/
> > > > 
> > > > It seems like a good idea to at least make all cpumask functions use
> > > > __always_inline; several already do.
> 
> > I feel that if we decide making cpumask an __always_inline is the
> > right way, we also should make underlying bitmap API __always_inline
> > just as well. Otherwise, there will be a chance of having outlined
> > bitmap helpers, which may confuse clang again.
> 
> If this does not result in noticeable bloat, this may not be a bad
> idea. I seem to recall this being an issue in the past for us but I
> cannot seem to find the issue at this point. Commit 1dc01abad654
> ("cpumask: Always inline helpers which use bit manipulation functions")
> comes to mind.

In the above quote, I already referenced Yury's previous post to do just
that (__always_inline for all of bitmask and cpumask). I don't know why
that wasn't ever merged, so I instead chose a smaller set that resolved
my current problems.

I can dust that off, rebase it, and give it a bloat check if that's
preferable though.

Brian
