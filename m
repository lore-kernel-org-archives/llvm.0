Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287E2D7DDB
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263854; cv=none; b=RF73jbQ0Ua+L0ZGpTKt/j9GOr8DIAcp4RLEV4IXtpwiURfuYnDoD7L8Lg5Q2WajUxisAl/CuRmpKT1dQQskMK4q8QB/e7SMlXhwJV2iLxmDQ55sR8cdLROVsVU5pUAElx6ytmmLj3ZIypjkC0gfdu/WnlI4lXCuDfkgA8Frd+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263854; c=relaxed/simple;
	bh=fYX0YsAcdzC3xGEnENhr8nj3ott/n5K1kE753y4IEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUHFJn+zn7F3R01N7Y5pQF2W2qEjMoR3A9MLjck81u/0EbvNTes7Ef+rbfOxHACeC4Q1aGK8fK+7fzgklOPWG6HKrUkOvWTNNbhH/RgDT6uI2OT91hvNmwuUuJ63+E54eRuZxzIFskKP/mDlXAYavo2LPg5PsozI78fk8IWhork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Qj0tOsjM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Qj0tOsjM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5cad1a6baso44463355ad.3
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788263852; x=1788868652; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhTA2r8ETchpWXwEm0IQgD6dzKUlsK2Lh7nqwYCs0is=;
        b=Qj0tOsjMVQRD5dGrEnEfUDGJYB0Y7bKiMEMPbvbhUy6cWu78v3dy2pna3LvLJBWA2h
         BR9D6AB7+zz7kqiZWfJTXCvRFr/eprJe9+qOesrSRFBPQRJZ3pDjs9+hRyrmAaE9ODjN
         zkWG0xabh0HZBPh6i2+2AFM/uv0OHUL3OmPqjbgADOmFbp0DNRr+lSzxhyiUX+EtQyNN
         2GQMtR+LOuaRB3I8t8hWEIdNPqacPMPxXtnJTEsYTK0Ybea10JDNfi2WMrGdJzjJ2fi7
         B7YRmPEv0HUeL04BeHBEo0aEjtKzzpbMdwyxf+2Tystxo/eV+ba43xqRmim4suUrOJds
         4mGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263852; x=1788868652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vhTA2r8ETchpWXwEm0IQgD6dzKUlsK2Lh7nqwYCs0is=;
        b=ZnJQ2w7DTvp4LE3xy6HZkhWGyaT9JrbKUdgpYY9fxZezuqkTXxjri36CWfjYcNLm/X
         u/g7vX8369PabHFsDWQSM1dVNkvCCyFxQNzzyWjzld4Hike6YQt/qJFtGZzWZ1EKvyb3
         Wkd+60RMcnOgZVF0qM4xH+Dkk9Zbc0/jAWWgsia8lPsG2kTPptTIsemN6lP9JSus4oo2
         I4ZcEzhWnQ6o+FOOlCB/CI/oW1z1fPzeF0lQLY35nEVRBRVOZ9bC/bjleY3LVZfbp5n1
         7gdXwAbBHLWDfO6LFd1aTNEuxfG7RMLbHAwe2l1Lb8iYK7EvV60YqzhaQCVunPFU1LLf
         F1Tg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0vj40mn57Gw9NOS1KQtA5uO/56w6FfX9dp5ZkFdntrjGoJr7meusa3UUNRcKjzi8xEeZl@lists.linux.dev
X-Gm-Message-State: AFuF++mtivvN7RiTgNyGyllk42by/WIuRA6A+pyv7xR0buab2dXZUf1s
	RRok/m0ScIl6B0ZSwQhGtP1iGiZqevWzLYZgNUn+z7KHKBdzYVDrophqZhZ98RlBvwo=
X-Gm-Gg: AR+sD11sDNfROETVsPnaHiXrhaS7HA0rwI9626Pre7rcZ4zm8/C7LWhoL2sJGuHdxlo
	vkgapT+h/HHS8AHGfvIEtiiCZrtvlU8FZBhv4NqvgOZAhPdJnTJBgBkw+gtB4VoAyD/KjpgWM76
	mUmqzsEHtrIlIGZT/1e/0d7jfqJVVb23ra5zqkA3aIitinPd2uHmITGQbXwS/95vI4ZvVrpI1nk
	zTow+ogrLQJpGzmLPKWiLWXWv10hyrpDDW0AY8z78rabwUVRPfQRt4FNJvzsqG2sExA9Y2Ro/5i
	AjvPjVhylOlttPDf4XWIBHiU2Nmhr2ZtCJON3Hmm0NXHAxjOMkz75zZL0+6HPbvbQ36u0p+rHGW
	oFyniljo8tr3phEp4rXIDA5y0kRkZi+8dtH7bOi6eaR39/KCVZ6XpIi79rhjd+4LG9T8anX7dsA
	Bwc1GfzSbpXYmUdzl5lKIGkj94eysIupDJzHTQYRCRDA==
X-Received: by 2002:a17:903:350c:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2d94a90e6e6mr107425595ad.17.1788263851931;
        Tue, 01 Sep 2026 04:57:31 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d911a9651csm34613995ad.21.2026.09.01.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:57:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 04:57:30 -0700
From: Joe Damato <joe@dama.to>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>

On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
> On 8/28/26 9:08 PM, Joe Damato wrote:

[...]

> > ---
> > v4:
> >   - Moved bp->max_tpa_roundup_size init out of the early return path and
> >     documented that TPA is unsupported there, as suggested by Michael.
> 
> Clashiko quite convincingly elaborates that the above is not enough:
> 
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
> 
> Could you please have a look?

I looked. There are 4 separate things Clashiko reports, so in order from top
to bottom:

1.) "This isn't a bug introduced by this patch, but the line right below the last
context line here still uses the raw firmware ID as a table index: ..."

This seems impossible. If FW emits an ID > 1024 that's a firmware bug and if
we wanted to guard against that possiblity that would be a separate patch and
a different Fixes.

2.) "This isn't a bug introduced by this patch, but the loop count here changes
from bp->max_tpa to bp->max_tpa_roundup_size,  ...."

I mentioned previously in my v3 that this is real, but is pre-existing and is
a different Fixes unrelated to this change.

3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
device whose firmware reports max_aggs_supported == 0, does
bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."

Michael commented in the v3 that this is a false positive, hence why I changed
the code from what it was in the v3 to this.

4.) "This isn't a bug introduced by this patch, but the loop bound grows here
(for example 64 instead of 48 when max_tpa is not a power of two), so there
are more mandatory allocations that can fail, and the failure is not
propagated by two callers...."

I mentioned previously in the v3 that this is real, but this is pre-existing
and unrelated to this change. Fixing this would be a separate patch with a
different Fixes.

Michael: please feel free to confirm (or let me know if I'm wrong here), but I
think this patch can be merged.
