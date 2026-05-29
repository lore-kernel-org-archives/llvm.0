Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F61624DF
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058148; cv=none; b=UbWX0VrIQ5XXHGQ7+aKFNrHbPizC5w19VW+Ncr5yqtLtxN/i+BU8R43linySGh2QgSZpRmzy4tc7jiX36fqVe4SNn3Ihmt7DELzUyLXvU0p/QBWlmcFu/kGCttdFIVR/2y/cqg4dXqNd+sI6EeuMBQAqHRurkWArzE2vsC/vkMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058148; c=relaxed/simple;
	bh=Uu0pOOe3qel1vCkqwx+k52targ03de26WlHCo/vfDlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSTX7xUNbNXL8zrjI9GE1QRQbU5LNAIsk8z+0XRD9im6CvqsYvGfC6zprLtEWDd36WnNite7eW3HVyQCKqLbEQLw5ej/ZLMlys7Idptwud5aGJ2FT9qb2zdhhmsZxEF6TZD/jGlFjJfmvfFAJ8uaONADlSiOWTlUeSPbCRrDSrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=BXMS2dia; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="BXMS2dia"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-914ae4101b4so1003380885a.2
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1780058144; x=1780662944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8tyG14nP5ARAFOFatQyu1rvTUj9VVrrHucz+LTuvp4=;
        b=BXMS2diaph4Dtzopoq4HgeHmAL4IfpNhhI0JnvvrXHwhJTRIFHFFzpD+mR4ykLQ0Gn
         JpeT6ti3rnP8CNh5LAEqM0ru67jx9I1K8u2lLi3ZFJmed0zvA+jeOFED3jOJngRXmKng
         msNKR2b9rXO2bWpiTtAHpgswkeAx/fd41SJ7/dKEsSxUYExZGA/s1VW80DGer4w/VGbg
         lH5OymtFZazgdXtKF2NwrJcb3mAoF2yApIUxY3roSE5LkVFdATM6axwiuPzwv5S8wiMs
         KnYN87rQ10EQXE1+7yfDVLANrQY43Y8h8NUlFgcq4t25AAszIx+emz9sNUlCeP+0RoS7
         stUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058144; x=1780662944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8tyG14nP5ARAFOFatQyu1rvTUj9VVrrHucz+LTuvp4=;
        b=XphpW/KHssvGxgIHC6RDPBXeAx+3cYTw3GvOD6xfFVnXxyI/Jl//JBiRCove3UjvER
         XkDi0xzSL61BeUDkFOXfEWrs2FLgzoiiwUgBP8j61DB3AaUenJHmqqCVFRxigxbBm8FW
         2Wm5j17z0GIRK2MT1g50dQe9XkSidj9SHVb5zzVxlfxEj8cN3AjGNzwJq8hgF6tVBrEx
         ZEabtS5vLh0uk8HTQZ58njoYBbS1xkJ9o9TuW0MRpFQx6o4G1SYbnYsN6vUkV0d2DRqz
         VkFGAReqPh1El4i9NCY0hnVl0P0msJjSjgKlAm9AupF1GHUKd2aiohrn5ZEYlGEhgd4d
         nPwg==
X-Forwarded-Encrypted: i=1; AFNElJ/paiP1VUqPU0evw+YoguiNRpjmSFOSgLxfdRgiI4HWOI5KpPQjbm6rR9nPRN8eLqeyTKMp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8m6ao9TvAhqUyi3mHfY8u3HoQ8hNWeG+zbj7onzzq7jRocmDX
	BqIgD0+UulDK8Ngly6zj20XJHDTTYpJyKoB0MO5IkC4B8QWkq4M8kiIUnWbvISMtcZo=
X-Gm-Gg: Acq92OHu1kQOI4aL3EgPXpoSTdS0cYV1WJjypF2RFW8Jqv596BJk4pOzytgJen9Q963
	yI2X/rKsm3bR+eJ1NI9J4j0RU198278Qtj06UIwGfWodSawVAO+feV6k1kBMJpEJ8uoUR7VHRMU
	15GU9VzoStJNmq0PXP1Arqh00CDjWoScmgWY7ODCrvS7Qs0vGAlHR2Mz0VTGsJ7OfY3RZH3l1su
	h3GeqrTefBmdCflRTdgXzGe8GDbMi48icYetWo5COc6pIGFh+F8INErFB2qRdwEBtzj0IygvpZq
	oNkQDR4HfnsF0OAAypplfnA16v9ECwiyxu8GZIN+1mSJkJK5Axe3eJfobhkg2kr7pweeniGopnn
	NwGBAd+90AHhq7SgE0EjT+7ZQ/elGyXubPQK9crhyrpDNcJqUCGyPTnZchyMviZV7GKGApbiK6c
	l/epFG/F4OygWMbVgMve8hOQoKfQjxaNIx
X-Received: by 2002:a05:620a:2982:b0:914:bd3f:b6d0 with SMTP id af79cd13be357-9152fdf204fmr323840685a.31.1780058143430;
        Fri, 29 May 2026 05:35:43 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153262d1b4sm172594285a.39.2026.05.29.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:35:42 -0700 (PDT)
Date: Fri, 29 May 2026 08:35:41 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	mm-commits@vger.kernel.org,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Subject: Re: [akpm-mm:mm-new 429/433] mm/swap_state.c:468:19: error: call to
 undeclared function 'folio_memcg_alloc_deferred'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <ahmIHZUg2IRrSgnm@cmpxchg.org>
References: <202605281620.lc3rtkBm-lkp@intel.com>
 <20260528151618.7aa255415825c8d1de6ca437@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528151618.7aa255415825c8d1de6ca437@linux-foundation.org>

On Thu, May 28, 2026 at 03:16:18PM -0700, Andrew Morton wrote:
> On Thu, 28 May 2026 16:15:31 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   d7d405cc33d6e3eeba2d6ec8f0b595da2a5c600a
> > commit: a5e62d9e00dac6f96174c397a82da30e7ae53064 [429/433] mm: switch deferred split shrinker to list_lru
> > config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20260528/202605281620.lc3rtkBm-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281620.lc3rtkBm-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605281620.lc3rtkBm-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> mm/swap_state.c:468:19: error: call to undeclared function 'folio_memcg_alloc_deferred'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      468 |         if (order > 1 && folio_memcg_alloc_deferred(folio)) {
> >          |                          ^
> >    1 error generated.
> 
> Thanks.  How does this look?
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-switch-deferred-split-shrinker-to-list_lru-fix
> Date: Thu May 28 03:12:45 PM PDT 2026
> 
> fix build with CONFIG_TRANSPARENT_HUGEPAGE=n

Thanks! SJ also sent a fix to this end. Either of them will work :)
