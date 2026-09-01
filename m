Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E80425CEE
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275038; cv=none; b=lOLwJ3TGkz5p+wUkWbWc1QTiIGCsJBV9DobA9lH6NVOQv712ZHw+b1P9DM6YtoLwcvCl8Gesyg9EWClyvd7XnG3ybbPIhfw8yZqv2UXcXtinn7l1iCQlU/MQgG6OgqeAm1I3pDPwg/jkfEfXkYe73EkeaDD6uNvI+UaIbWbBoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275038; c=relaxed/simple;
	bh=EV0luyxrE4VBTkjaX8NMlEgGp6/Xt54MDGLWoiypEoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H97vVPGMhzDoBCjTdh7JF8Q8+WanzF15bd6+GQ39EdtQjlUJXfDMMIgCBesAbwjJS++8oORBAIwkLC675ncLGq7i0HdnO1Up+7RC/QRM8IGazP29Vq4sE3dIarz7WV+X+uTx0nLXsqFkod4aDM3y4R+x4EgHDK16jLaTXoUgMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=yvP6Gaz2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="yvP6Gaz2"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so5681736a12.3
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788275036; x=1788879836; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYjWdRobMhFwnScsH6QAuV5nfOH/dqs6pUr1givzmCo=;
        b=yvP6Gaz2vmxjecN+Ma+fQ91r02FnVrDCpYbjwsELIUTxbWISak2SKQEClzJoG303ha
         DBEBlGLMxQgb3yub7ytQZ8JP1F/RdRWIIGaf+cJVdgDWbjFDfQmAUQjPlqKEFS606T7/
         qErHu0Gu34jm5APZI01fwoCfCaqbIbVxwuyVl06oVkFvx1ywekM9vU8bwqVR90LV2r13
         th6UiqMoWD8ImMzeXHSdlTlt70qc/EtqQPCMOoroBqji6uDfWfqGBVWoBJxvLOd5pbw9
         4360vtbjrPZT75WQxY1G62tA0vOV1hG83vppdrtOPMe/O1dXfGGCTAOqbAmwCyJkNJoD
         pIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275036; x=1788879836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nYjWdRobMhFwnScsH6QAuV5nfOH/dqs6pUr1givzmCo=;
        b=pT+BpBJf6IU6AKRaZm616BjDbN/vter28wmKlI8+yqH6mU1mXwG4A83ZZLeZFmxtsG
         2PKYZyl2Maz7qixop3HvJgVXJAuO5nFkBWH6qLDzwa6ekav9EpnhANEj4/YK7sfGHeVk
         +vMZUlf24C+nfilAn9hzyieilvtZt7abqBPHJdK9mw2aqjZhCLB1Z17EP6LRhiCPQM6f
         Pbc/vSrBHXdu6e3m0JQXFd7WffvU/fA+7G5EJhwMfU/1tV8NWlWocTvc5q8N2PoFfFxb
         NwBIn1reJ0ccNXFykEVOV5mUiKgdoB2unwBaU4IUgQ7yZ3gokHXbtM7xXGfbHW4YWcxS
         2Dqw==
X-Forwarded-Encrypted: i=1; AHgh+RpZGdVWY3NZLVP1kHyDj4J7tt1bZtalD/5diI2sCK1VqmU0Cbpd6w6nAQq+rTMofXrhCF8P@lists.linux.dev
X-Gm-Message-State: AFuF++mVce/LVRC35yThpJ0TcA98YiP+JB8lO2gTA0CuhBHRP28oGFA8
	FRdiI1A9Bi4inatYUCUGtjRkeJXJjrAmvg3VvDyeWrG6LPRe/0lNQH8h4oHwiGvHavw=
X-Gm-Gg: AR+sD13fP0IarT/OTWcLwcsTkPfsXqEhJ3mMK8W3NbUm0avQIOu+5xXyTWJtj7LtkIu
	gK0+MCytnP087HQzfqIH3BnPoIpr8HrmjloWGjpvNL1LwNlb8UsN4ImhIgPVdnqK/Is2uVlW9/6
	NU0ARr7Lw07bO+p0R0zf40T7GSC5aldVOc3fxupHs2EyFrUkilZiDYGqUuL0ScRWUXKnZ5dc55/
	uxK9dfxTs675EK+nh5pN+z4W6e9HDyz/MLm6cmrbB/49Rmpz7rh7OuY2Pmkn5i5EVNpyzYWV5Fo
	HOcpJSUIywYUnmSR/uC3Flu55AwhFUoN09/VUSyDCaGqhczjZM8/c2E6gavW4q4QmNmXPlbcrYU
	2xxNSB2iBrEjBLocrx/j/RUekDj236Pj9RtPfbZLlbQ+FNFCav5o7+mNnNau4UjLVdl/QxcpAZI
	GQxs4mJhl9sUwgHGCdy6o4xNadreK4U8HhNJQeNZPPdrM=
X-Received: by 2002:a05:6a21:a0a:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3d7ad788edbmr15943018637.2.1788275035650;
        Tue, 01 Sep 2026 08:03:55 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f727bsm6432687a12.7.2026.09.01.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:03:54 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:03:54 -0700
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
Message-ID: <apbpWrfu3VQu+CUz@devvm20253.cco0.facebook.com>
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
 <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
 <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>

On Tue, Sep 01, 2026 at 02:10:04PM +0200, Paolo Abeni wrote:
> On 9/1/26 1:57 PM, Joe Damato wrote:
> > On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
> >> On 8/28/26 9:08 PM, Joe Damato wrote:
> >>>   - Moved bp->max_tpa_roundup_size init out of the early return path and
> >>>     documented that TPA is unsupported there, as suggested by Michael.
> >>
> >> Clashiko quite convincingly elaborates that the above is not enough:
> >>
> >> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
> >>
> >> Could you please have a look?
> [...]
> > 3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
> > device whose firmware reports max_aggs_supported == 0, does
> > bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."
> > 
> > Michael commented in the v3 that this is a false positive, hence why I changed
> > the code from what it was in the v3 to this.
> 
> This is the comment I referred to.
>
> AFAICS the problem is that the driver sets
> 
> 	bp->dev->hw_features |= NETIF_F_LRO;
> 
> regardless of the supported capabilities, and that seams to disagree
> with Michael.

OK, after re-reading this here's what I see: NETIF_F_LRO gets added with no
capability check and bnxt_fix_features() won't strip it afterwards. I think
the fix there is to add a BNXT_SUPPORTS_TPA() test, as a Fixes for
f0aa6a37a3db ("eth: bnxt: always recalculate features after XDP clearing, fix
null-deref").

I can send a separate patch for that, but it is unrelated to this patch which
fixes a crash on boot for Thor2 devices.

Maybe you want me to spin a v5 that rewords the comment Michael asked me to
add which is currently technically incorrect, but will be correct after the
separate bug mentioned above is fixed?

In other words respin this to make a v5 that changes the comment to:

  /* TPA is not supported at all, so there is nothing to
   * allocate.
   */

And then when a fixes for the above commit is proposed, the comment can be
re-expanded?

Can you let me know what I am missing here?
