Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8634215DBB9;
	Tue,  9 Jul 2024 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538756; cv=none; b=D3xjZbmSz87bZvYs7THS9JUwOg2ey7LqReARwAzFcMUwhaUQKEVjOJQGsJM2UxomMH6jRqael6fOzKEV4TDGaDFTQkgq7GimhpxKP+MFLEFG/LUdoMeXM+Xd09EElCo6vWTzHUN96eCE7j3ZNEMYgx/I315Y8BRo7k7h75RX15g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538756; c=relaxed/simple;
	bh=uYI1VF4OgeMzpAHhQoBVxsymSg1MML7D16rAqKWGrW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aahq5kGrBXlBC8H9IeCHVlWjRnc85PZkob1okypd+zBpp4xa62RkK3vbDalvWIaURyUM3W5mOoJ7b1UXWyS7Fh+gv/C3zFlB7j1oPh+pj8g7yVF5vmw1BMoE1I8mSVpDHJsfwW3akT8PBa4TIo/DuavWFAkMI6jgvUjDt9/ybpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COdzAas4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COdzAas4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4266fd395eeso8149675e9.3;
        Tue, 09 Jul 2024 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720538753; x=1721143553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEP9HFUIvOyMzrlfw2zh4onk/mGWAtEnPNTkOS2BI8k=;
        b=COdzAas4v0nLB35I6VEgbpJ6LSYElAgqFCV22ampEvpm35l3ZbX3+M8evMQhxFgvGx
         4fb/QixrtxWA9McQhPG+aG4S4sjpBaU73xNcAdSMOj7BaFQDT4twrU/wbSlcHrHf55zR
         cHE1NwCwznf+4yci0HN8r1QLPMR9zL7flhp5M8IDbmTPHE/o2zT5dxjpKfDxnud/d1HX
         UAYGTE88DJXDa2qydccZr8tpHoWG2yJu+dfFD5TVygWhhG7FVo/IGn9MgyP+YbRsub32
         ID2Vhkn8OkAfxru/aGC41tE4RXcZoEm/br/oEd5/t7eLiQOhmfz/YoLXa4XR18tGgdUt
         2I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538753; x=1721143553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEP9HFUIvOyMzrlfw2zh4onk/mGWAtEnPNTkOS2BI8k=;
        b=Zv1QiJpzuOK5WqQiteVDNlfQAjbQW+H14AEIyBbR7zdO0hj7iMi0GsKaJlwc3g5y+Z
         xS6vzXrNiFXcmm6+fxzsJh1DGbALC/kSAqkx/FKHBv8RNmg3m3gms47ea7wU3pjD0B42
         /EvrV9WflsyO9TbU0uFc0BDT+xng8z9AQTjMqYUnHWLEuPDE0S8mLxM34CzIDyIkpmCY
         wwq/eaLWIAkW7LQgIuQ2/wp1KMFV8vYbuKaKbt2Xllf5t2QY0HfNeISbM5Tyy3EwoRKj
         tmp/Ffulu2gQvSfZtJTP6haUvwAqVzcZUbzJq2cbxXvOWPkSzpxr+klRaseib9VZQpFF
         p7jg==
X-Forwarded-Encrypted: i=1; AJvYcCVbRHwLv7sAxYJmK63Ch89E69S/2TkesgJ0aEr1YDZKIDB5agN9LCMTFHYR5nRfV/+qnd7TcLOHumxcUGdcBN2G1r3Ri7Fm/v1JsNymtPIjPMfZm6o7ADDAsOb3jk4bNktHq+0=
X-Gm-Message-State: AOJu0Yw1HAVTCbztJqkqS+twHUy+NRJW3OauF//71BctBj/GFyX3mCYd
	KrEcgsPg7ZbWAqsWRja+WtCW6PNSIwFbjuNCUv2uVVIMAtozWBNc
X-Google-Smtp-Source: AGHT+IGaU+IhfijAp8zflrrfJXXMbDU1JKbjE4Rpg8g3NjL5OvpVpNRl2dIMiWa8Bd6kfcsTT2jamg==
X-Received: by 2002:a5d:58f1:0:b0:367:8900:c621 with SMTP id ffacd0b85a97d-367ceaca897mr1943578f8f.56.1720538752641;
        Tue, 09 Jul 2024 08:25:52 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab136sm2849553f8f.98.2024.07.09.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:25:51 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:25:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kuba@kernel.org, horms@kernel.org, Roy.Pledge@nxp.com,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240709152549.3yak6yeij7x5dlal@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
 <Zow5FUmOADrqUpM9@gmail.com>
 <20240709135811.c7tqh3ocfumg6ctt@skbuf>
 <Zo1UC/grXeIocGu5@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo1UC/grXeIocGu5@gmail.com>

On Tue, Jul 09, 2024 at 08:15:23AM -0700, Breno Leitao wrote:
> Hello Vladimir,
> 
> On Tue, Jul 09, 2024 at 04:58:11PM +0300, Vladimir Oltean wrote:
> 
> > On Mon, Jul 08, 2024 at 12:08:05PM -0700, Breno Leitao wrote:
> > > I thought about a patch like the following (compile tested only). What
> > > do you think?
> > 
> > To be honest, there are several things I don't really like about this
> > patch.
> > 
> > - I really struggled with applying it in the current format. Could you
> >   please post the output of git format-patch in the future?
> 
> This is the output of `git format-patch` shifted right by a tab.

I don't want to insist too much on it, but this is not correct. In the
process of shifting the patch to the right, something ate the leading
space on each patch context line. The patch is ill-formatted even if the
first tab is removed. Try to keep it simple and either attach it or post
it without any change whatsoever.

> > I have prepared and tested the attached alternative patch on a board and
> > I am preparing to submit it myself, if you don't have any objection.
> 
> Sure, not a problem. You just asked how that would be possible, and I
> decided to craft patch to show what I had in mind. I am glad we have a
> way moving forward.
> 
> Thanks for solving it.

I mean I did suggest dynamic allocation for the array since my first
reply in this thread, which is essentially what the patch is..
Given that dynamic allocation was already mentioned and then you
suggested to replace NR_CPUS with something dynamic, I took that as an
alternative proposal and an invitation at using VLAs, which is what I
was commenting on, and what I was saying I don't think would work.

By VLAs I mean:
-	u16 channels[NR_CPUS];
+	u16 channels[num_possible_cpus()];

Anyway...
