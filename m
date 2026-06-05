Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D4405C23
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640792; cv=none; b=HgSgqWyEhCCHHslvdWHx+eWimAhlBsN837I9vHL4GduNo665++yZ5b6N/oPftkf1Y7OYf2jF4xLGTlAmCV1dwnavaNCCf7m5s6I+e9yTClHRFM2iAshGkNdNwDg8bNH9qIhwgUc1+O+v3TIbKIsE5zu3IKxwINNU9YapRXjiKL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640792; c=relaxed/simple;
	bh=iNh/mb2eiocXb4S+1yThHgdvvhY1IocXV2BZgTAkwK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT1DXEB/rdlbPtpfEAvKCo2z+0dTG0sfVhXbhgESbSyVaTq/vYAoowWRqDQAe/7g+jJQKcNiti/dYuvVTPz/sAKxCi4oFAHb2mbdho4feUOXjqOQauCbMi5tyyzRRTfsr4DzAnWtH564lN3fKj3sINPw0946MAUhczoQqxPnHCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b=Zz3Q5WBv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b="Zz3Q5WBv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c3184c71so12187185ad.1
        for <llvm@lists.linux.dev>; Thu, 04 Jun 2026 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20251104.gappssmtp.com; s=20251104; t=1780640790; x=1781245590; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3Fr+w0Wf3CCQXoGfTaQ02R3tpfIPjjorzQJs8m1zi4=;
        b=Zz3Q5WBvx68T9/W7S+0uocaKrQsz0Hu574W1Bn04gmMEGH9JG7fofVgPq0v8xr1b6t
         rhNCCqhc5FSceShGe2DrqfWCZI+cu1jhNXqCAgA5qHIvmLEFOVU3kl/D/2JYko3CBNNX
         TtLCHGtbOSUxOO33RzTxi+SBdQBX/QjSzTuY8/J2emJruknxbEXXDg7hSv1aOQe3p9Wl
         xKdZLWyYxO+B4B15h/MM95KV8rSlAeij6dWqchrYPV3lgeT4FvqXOrxehhhmVdVDPMo2
         yKLz+r6+gWab/WiKw3q8LEgwPbVBl+CLbKLg/7dIr6MPyWRcdJnvyITYAuBeBWMlm3ob
         h50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640790; x=1781245590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Fr+w0Wf3CCQXoGfTaQ02R3tpfIPjjorzQJs8m1zi4=;
        b=l02CZYI+Ejegp/cJx14zPmpJkhlau9YWhsXXKpJTxRzTz6APe8pbXZnvrJ+DMEtcg1
         Bv5dHcN1ACZ93aJEnQFm6bwD9lJpdkHlAI7FwgGIZ5gLFLEBr2jvqcj3ftq4ROMemFU+
         XlLSPQmaAWoHkXqACpkf6LW80oPda5AkkMzn3BZXFx0iz6cBpZmZriCQgiE/TcNPrLuD
         1EB4LdKKUDGM8UiqWGJqNizFkEVeXTwPKdisUKh12T6hXNmsJNdMaVSZ3r+mWHojRPKw
         mhVtni0oiJ2M7BGH2cO4wrGhTBLF7POIaeUVYoA/bALJ7/554Y+6FfiMewUoffDBdX/F
         uDCw==
X-Forwarded-Encrypted: i=1; AFNElJ/nP/kjc6w306TBcKTpTxz+juQM/plb8SS2p3KYMgVgfayaYdH8U9LHw1f8ui0/py5YxK5N@lists.linux.dev
X-Gm-Message-State: AOJu0YyFiOshFH1iF+wN7/8G/pZxb/3XfX518UKCdlDCFYH7MJ4qYjkT
	C9q71G+ZQYrEj6r5HycDEY5gAft7Ghl3KhCrpSUNxnO7FBp0ryqrqg439Wbg8NJ+B3E=
X-Gm-Gg: Acq92OEENVPZqqUB68DrBZ/RP86muydZ0A+X8IdyAlyAMVJJ41wRmR5Weozay5zrrI9
	d95eqWk81IiryvVSx3dheAT9VtRo5XP8TTckQfkQv6ZKDhJYZvAlvXOY865wLgxmi2x2D5n+RRa
	VZGSFwqRi3U0Wlkw7jwMFGj9M0MzEOWuZGHDcp1tARwhuWVr+lEX9Zxp+eCKnIhhzxAtmw1Gl2x
	Q4Cx7MdpJEjnbIlAjf9QC9p/jFtdx+uCcIptvroF2Xwo996RHdEgpfWqWOv/5+J6JEcWwsitWBb
	D9BAsDC92sEmhaYY72oPc6Vkvsd9bQgrbKl/zC2bN7AaIkzBIV3Xj8lsVbHY/36iS1GLaMPHSv6
	i6kBebs0f+qfOh7ZRc2aEu2w6cEWXcPW11gjsTjdRN/c1MiZX0t3E23ZjGyL8Y0CbOdbB9QZU7b
	i9n8MqUXrKe6Rr08IWjvsUDadjTvhj9NHmv/nseIYEVTcshmpqwh+wbrQ8j3ZQQEszA3jhblzki
	5wpGJalqyDwqT6aWYYonZF/HQIqXqJwqg==
X-Received: by 2002:a17:902:ecc3:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1e8339808mr21810535ad.33.1780640790120;
        Thu, 04 Jun 2026 23:26:30 -0700 (PDT)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cf89sm78782835ad.56.2026.06.04.23.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:26:29 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:26:24 +1000
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Arien Judge <arien.judge@morsemicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, ayman.grais@morsemicro.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH wireless-next v2 12/31] wifi: mm81x: add mac.c
Message-ID: <aqbfc2k7xdlggjchxuuklzliuu7cutoqwemjc72zrghhrvwf5f@gqnz7wyqirxx>
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

Hi Johannes, just having a think about how to do this:

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

What is the consensus (or I guess your opinion) on using
read_poll_timeout() with a function that isn't really doing any real
I/O but rather just reading software queue state? E.g.:

static void mm81x_mac_wait_queues(struct mm81x *mors)
{
	int remaining;

	if (read_poll_timeout(mm81x_hif_get_tx_outstanding_count, remaining,
			      !remaining, MM81X_FLUSH_DRAIN_POLL_US,
			      MM81X_FLUSH_DRAIN_TIMEOUT_US, false, mors))
		dev_warn(mors->dev,
			 "Unable to empty queues before timeout. Remaining: %d",
			 remaining);
}

where mm81x_hif_get_tx_outstanding_count internally is:

int mm81x_yaps_get_tx_outstanding_count(struct mm81x *mors)
{
	int i;
	int count = 0;
	struct mm81x_yaps *yaps = &mors->hif.u.yaps;

	/* We only care about data + mgmt here */
	count += mm81x_skbq_outstanding(&yaps->mgmt_q);

	for (i = 0; i < ARRAY_SIZE(yaps->data_tx_qs); i++)
		count += mm81x_skbq_outstanding(&yaps->data_tx_qs[i]);

	return count;
}

It is fairly easy to opencode something similar, but this looks nice :)
though I can't see many examples of using it like this so I am
a bit cautious.

lachlan
