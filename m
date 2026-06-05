Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86763815C3
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623439; cv=none; b=EQINrdZSRx4rWI+hULOXi4jF2sdF4VKYTGh3SXHE5oBqcZbmzqX7fYxSuBEfQ3BDeNgKoymylfnUIfv0JSf1okC93mnfpGXa/DQlL+j+8JuoHTiiPPG2RLW8sr8BlT11nPx1NfkvfVNBv3BIFOFDxmvuJxwjw5ljHVbiE3ANscI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623439; c=relaxed/simple;
	bh=p0gghpvPD3+GfjmZjN3CHuee0D96vimcY4fMbwhUbeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp+40B8Xt/yZm38i76o4O4jy3VXSdBUuFdHOw7Njnu9wia1bZyqgOrgSA+tnKpeNiA54/1/nohtKryjSXJlKf7GiW3khpFDGCR5FyzDn+n9v3eIF2XQPcbu242HJG07uIfqoETKiMk/eGqaAWaVloH/DTl0UaMSUienyzby8vNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b=Yyqs0wcM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b="Yyqs0wcM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso623021b3a.3
        for <llvm@lists.linux.dev>; Thu, 04 Jun 2026 18:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20251104.gappssmtp.com; s=20251104; t=1780623432; x=1781228232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3YJVB0X+wOpRvyKCo/LAB/oLyFtsEoBhz1pZ3Gryj0=;
        b=Yyqs0wcMoCvlRsViYdxS76URLgIJn0mn2IqBMxjMmFhtIadJEU6QUD/hK84HnJ/ShS
         KsQ1WO02+ntNN0/14TBPrbOSD2I65eENdDF/1DQO3vb7+mK0irQXRP4sWQtEVC7UKmHG
         gfALfzt2B9ElIa8fDYGG6hKR0blxRGA5KiH8d40M4zEaa32h7YRD9G71qczLkhvlNQOg
         l7WtwAYO3YdnDb5rZWp8TIpNQrPsuc1AEaSO9lbCOkZCvFHNlPPBHsFTdvwhHRZ+UKOM
         IDOnXt06bncytUS6ZaND3Ox1FpHKoVbaSOsLgNeqkOL2TWuuvXes88eHQWCTYfTfL+7O
         UQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780623432; x=1781228232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3YJVB0X+wOpRvyKCo/LAB/oLyFtsEoBhz1pZ3Gryj0=;
        b=e0XUToYiFTghMA8o5q+hUfyekyjw9uhQlPmWQlTdVW/wbIfg83Jeu7nWkLUrULkgG7
         E8BtK7A3DABvSD9o1cGI1NUaR3VsX0N0++K9qFy8RLKt7Furxpkj7mvPIgswDsUlWCx0
         BKqLuVDrGgzRPIpJbTst3hs0m2a9UikqWVw6qUhLnnpwvDGyNiSNVKiG0sil1d4Liwry
         KjPdtowYnbX2UASlFcem6HAN4LkyowdDj/9r0Kc8cuhPZF+tqinpps2kw1E9XdJbVvOx
         LOvgBV7PdOdhnH4+9D/vukTSc400+HR2yQtYhDtUnOAI80Dxc6rFO1W6hrAjC0D7yjFz
         Oo4w==
X-Forwarded-Encrypted: i=1; AFNElJ9pDv9B1QDh/GnPOQgEbJ69GvGGGO77GPn2HKzd+fTvesVERvFz35z/5ys+mpV3Wkwhmof2@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv8MYDuVj8+OPjQdxxBfRh3bL4bVjL7h8eycAzAJHabhfs2RCr
	dfN0g/HjUNJUfQabmH4bZl8Jz1r7v1gDo7s5a2HKXquqrvvv/rQdk3MaO2aZaPFg5fc=
X-Gm-Gg: Acq92OEjbcy4jGYmWEkeRHx0SYTFucS+viHO60P5fbaMAZntekXubKip6vVtcGqoicy
	03u5rlWlVJDS7arZqYEdsgzHmrPH/P58oEiIr42QBdPBWcLzIAH6AiplSvVV045qoUCH9vFH3La
	TsYxpqNKQDXAPVQIsaXO4JDSL63pfswLnIHrnmVD2+n3Dsii6K7u30vB+9JtyCFk5kFKokU4TGH
	AIkBaUhnhFxr1YbajGfAKU9H1vvwSPcuhy0Z95R+jrr8qrX1EUxMxc+JTW4oeI/a2DwiBopU/pv
	Uhst0xNXQ5N5V7JBVqP1w3fKnhMgcOItnQ51ZnW49Vpodz9brn3AGlDF6BnR3tVqO/SN6GCICYT
	ixq9W49tRgqy9n279nf3C2cCfO39kTdStcRCTlyomGM+74atX6EZnuJKPb0n/jr2vvX/+gGjWLR
	b8gAB69jWWmFnXFMBLJJHM/PslgHjtmv+mVODQ4p4K1sBEWNr7/oC8c+NIdN0KfLn8t+qmOW7P0
	iCaQHJeddP5Xeqx4IBdELDcHdb+XYNAz8jIMSo3th4t
X-Received: by 2002:a05:6a00:418d:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-842b0e1fd5fmr1106286b3a.4.1780623431696;
        Thu, 04 Jun 2026 18:37:11 -0700 (PDT)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm9107777b3a.61.2026.06.04.18.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:37:11 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:36:58 +1000
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Arien Judge <arien.judge@morsemicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, ayman.grais@morsemicro.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH wireless-next v2 12/31] wifi: mm81x: add mac.c
Message-ID: <melvfwusxqypnswfhlapfi2w2awyw6zyc4lkvi6t4sog5njvb5@d7qyhc23sgaj>
References: <20260430045615.334669-1-lachlan.hodges@morsemicro.com>
 <20260430045615.334669-13-lachlan.hodges@morsemicro.com>
 <e964f5728bde677dc837f55617a83b63c364cbf3.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e964f5728bde677dc837f55617a83b63c364cbf3.camel@sipsolutions.net>

On Thu, Jun 04, 2026 at 01:46:32PM +0200, Johannes Berg wrote:
> 
> > +static void mm81x_mac_ops_flush(struct ieee80211_hw *hw,
> > +				struct ieee80211_vif *vif, u32 queues,
> > +				bool drop)
> > +{
> > +	struct mm81x *mors = hw->priv;
> > +
> > +	/* We don't support IEEE80211_HW_QUEUE_CONTROL so flush all queues */
> > +	if (drop) {
> > +		/*
> > +		 * No need to call mm81x_skbq_stop_tx_queues as mac80211
> > +		 * has already cancelled each queue prior to calling .flush()
> > +		 */
> > +		mm81x_skbq_data_traffic_pause(mors);
> > +
> > +		flush_work(&mors->hif_work);
> > +		flush_work(&mors->tx_stale_work);
> > +
> > +		mm81x_hif_clear_events(mors);
> > +		mm81x_hif_flush_tx_data(mors);
> > +		mm81x_hif_flush_cmds(mors);
> > +
> > +		/* Reenable data, not that there will be any */
> > +		mm81x_skbq_data_traffic_resume(mors);
> > +	}
> > +}
> 
> Doing nothing in the !drop case seems questionable - mac80211 uses this
> sometimes to e.g. make sure a deauth frame really went out before
> shutting down the hardware.

Yea I agree, we should handle both cases it looks like need to
rework some of the hw queue logic such that we can handle the !drop
case.

> > +static void mm81x_mac_ops_sta_rc_update(struct ieee80211_hw *hw,
> > +					struct ieee80211_vif *vif,
> > +					struct ieee80211_link_sta *link_sta,
> > +					u32 changed)
> > +{
> > +	struct mm81x *mors = hw->priv;
> > +	struct ieee80211_sta *sta = link_sta->sta;
> > +	enum ieee80211_sta_state old_state;
> > +	enum ieee80211_sta_state new_state;
> > +
> > +	dev_dbg(mors->dev,
> > +		"Rate control config updated (changed %u, peer address %pM)",
> > +		changed, sta->addr);
> > +
> > +	if (!(changed & IEEE80211_RC_BW_CHANGED))
> > +		return;
> > +
> > +	/*
> > +	 * Simulate the disconnection and connection to reinitialize the sta
> > +	 * in mmrc with new BW
> > +	 */
> > +	old_state = IEEE80211_STA_ASSOC;
> > +	new_state = IEEE80211_STA_NOTEXIST;
> 
> No real objection since it's driver internal, but note that this
> transition is normally impossible from mac80211 since it doesn't go
> through the intermediate states.

I realised not too long ago that this function can be entirely removed
since this path is not possible in the current S1G implementation,
atleast until channel switching is implemented but compared to
regular wifi I don't think it's as important to have. So I'm just
going to remove it for v3.

lachlan
