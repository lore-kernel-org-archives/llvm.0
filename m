Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BFD342538
	for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856044; cv=none; b=CrVL25poW2tbVnPFJ4RhNpRJIM1amWhDU/3NOwPOH7x3agxHZGTvBuUGuIJXtRlR5A7T4RVGMgtj7csNtMpYknbZMlIiBEsJsWMgRf5biKfqzQvBUnG/wf7LmjkxBpY3esGk9T1TJtgW4WKv/an3mzF7cNBQxuX8XuZsEfpQR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856044; c=relaxed/simple;
	bh=s38raES+aYLadiG+3JXZ2zNKydA9RD56IOss05saA6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMhpthh3jwRK39vRyIcc2B97ZPVRO4HkqvzE+8/A/FDioDN1t1q/ZGxeOmc2L2YazA7YIhTpS3NV+2b3sjEfB8jSYoGp0EcxCpO2SRUIqwe3BTB9tntLDMPI2MCWxDlz5FuGaFbFx/JX9rrzlt9scAKFU7aXy57N0fvZX94khJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=SCh2Vmuy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="SCh2Vmuy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d01663d816so1444705ad.1
        for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787856041; x=1788460841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XejAmH/KP2JAkT0dl9by3HENDzeG7XsT4Hjw5tlQtvk=;
        b=SCh2VmuyglLKSBl2VBG/UM8jSot4ukNkUfNkXldbGTaEcjjNYkgwdulZaW8lZAp5Z8
         vmM1EgcKwNw4kNTGqbuoWjg2abiryIlOAzoZ9/wxNJweQdZa6unKs14Zlh6IhMGFCtem
         GD2el7Sw5hpucLTB4MIvFVUoalKuwWJb1o4ArVVHoRNQqAmqknC4f9wUY1Ek3vt/j8FT
         nuVOCwgMvCo5x2tWicSD2rOD7omPkKKEIsAyY+Yutz5+DwiSZk95i5iNIF5wcsPvXDUu
         cAFs5tMIUqjjUNNuRsca6ZeoFzq9Ehkh/4GQS56RIgsag58i9FnE7U6JchGESc85bO8i
         eiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856041; x=1788460841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XejAmH/KP2JAkT0dl9by3HENDzeG7XsT4Hjw5tlQtvk=;
        b=VfHP/qon3VtfyNB1jUFC5hJIXr1pEXhnKrQ/U88B+F5VrBfz8I69t8XHOvSg51pN5B
         75CP/+IWBZ//8CPLj9EcVvGeZloeE4iNeJD2ugge2wBelw0nFRDWeXvcHx63dEmf+uk+
         +rGJZaNNscIUWN3W3ROlUO8txxa42xvuGf6OzByCLb3+det/6ys0jhq6jtgsAkYgTaLo
         vpLVvdmKUqg+EkM8v24NTFDxj1A2B2H1U9+p4/fIrdTQ/Obysdfp2b4JPYCf4lC4L4XF
         XG32VDM4lTDyoA9aZOaAE3VRCQFCbdwO4SZwCoMzXsVNTPlhtZC6L3wNn8tRu8q03pUl
         wjjw==
X-Forwarded-Encrypted: i=1; AHgh+RqOJJ6qSk3k0hHSKel2C50E+SwdVXe68Y1fAkhVp6HmS2vdkJZesOZZaA9HiKxarasCc5qg@lists.linux.dev
X-Gm-Message-State: AFuF++mcgtOhmz7/jMVZsFAygdkA4WY1JWN89Oo1MczFP67CUVr8jwtO
	WQt829zYZ9sFIzl5WIPmlhFYNN1IeV/jhbSPR+hHg65uQwy/ezXkJ781LEaL75es5O8=
X-Gm-Gg: AR+sD13aAkc+wIqPa1TSUMA4JH0ikh3acxRMCvFNhW9evklvxl/mPBpt7MLuDnu1z2t
	4cM8wlV0PBjEDzjmWjJOC7e08pQ3P4CxxF7Jj2jQvTByEf/sou/xJQHDzrYwzC26LnpXINVkRj2
	xukYj9hbZC+4/lADS8WejjIyFxcflbMHP4O0CQfm3gpDVPkF9j+vlsszttpKN46xSUmvfv8dq9D
	40orwcmzqNU2/aBCh/QT3atdqBN7msBogpTW9U+OFsuxAy3etuniIGZ3rJZ7Sk7p00Uh4DOm7j5
	Zqc78ZjgwKB5TcZip9NnH65BsDtnmdUanA7Od9IcNJ6lnQYVQCqcVJxmgUaTXVEvtSsB/elRVlv
	2NCGpjgKa6M2dlaRFQd5Y1WuWo2+CyGAC7AMfW93f2U5zy6cCE7bDvFiyQk396Gje4ZCSg23Rcd
	Yzfr5jTmgIaGWRLQop2LT7yUdacEvFHFN9HdMBm8wY1Q==
X-Received: by 2002:a17:903:324c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d74df1c634mr18207755ad.14.1787856041391;
        Thu, 27 Aug 2026 11:40:41 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm20150005ad.31.2026.08.27.11.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:40:40 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:40:40 -0700
From: Joe Damato <joe@dama.to>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com, horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v2] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apCEqAkcuo27VOp/@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com, horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260825001842.2501798-1-joe@dama.to>
 <20260827083139.91346-1-pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827083139.91346-1-pabeni@redhat.com>

On Thu, Aug 27, 2026 at 10:31:39AM +0200, Paolo Abeni wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> ---
> bnxt_en: Bound SW TPA IDs to prevent crashes
> 
> The patch allocates rxr->rx_tpa with bp->max_tpa rounded up to the next
> power of two, stored in a new bp->max_tpa_roundup_size field, and masks the
> firmware TPA ID with that size in bnxt_alloc_agg_idx() instead of using
> MAX_TPA_P5_MASK.  All of the TPA info allocation and free loops now use the
> new field as their bound.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index 9c2cc50276a59..ba710704b1921 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -1517,14 +1517,16 @@ static int bnxt_discard_rx(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
> >  	return 0;
> >  }
> >  
> > -static u16 bnxt_alloc_agg_idx(struct bnxt_rx_ring_info *rxr, u16 agg_id)
> > +static u16 bnxt_alloc_agg_idx(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
> > +			      u16 agg_id)
> >  {
> >  	struct bnxt_tpa_idx_map *map = rxr->rx_tpa_idx_map;
> > -	u16 idx = agg_id & MAX_TPA_P5_MASK;
> > +	u16 idx = agg_id & (bp->max_tpa_roundup_size - 1);
> >  
> >  	if (test_bit(idx, map->agg_idx_bmap)) {
> > -		idx = find_first_zero_bit(map->agg_idx_bmap, MAX_TPA_P5);
> > -		if (idx >= MAX_TPA_P5)
> > +		idx = find_first_zero_bit(map->agg_idx_bmap,
> > +					  bp->max_tpa_roundup_size);
> > +		if (idx >= bp->max_tpa_roundup_size)
> >  			return INVALID_HW_RING_ID;
> >  	}
> >  	__set_bit(idx, map->agg_idx_bmap);
> 
> [Severity: Medium]
> 
> This isn't a bug introduced by this patch, but the value stored is now
> bounded while the index it is stored at is still the raw firmware ID, just
> below the last quoted line:
> 
> 	map->agg_id_tbl[agg_id] = idx;
> 
> agg_id comes from TPA_START_AGG_ID_P5(), whose descriptor field is 12 bits
> wide:
> 
> 	#define RX_TPA_START_CMP_AGG_ID_P5	(0x0fff << 16)
> 
> and the table it indexes is 1024 entries, immediately followed by the
> in-use bitmap:
> 
> struct bnxt_tpa_idx_map {
> 	u16		agg_id_tbl[1024];
> 	DECLARE_BITMAP(agg_idx_bmap, MAX_TPA_P5);
> };
> 
> Can an ID of 1024 or above write past agg_id_tbl[] into agg_idx_bmap?

I don't think this is possible. bp->max_tpa is min_t(u16, bp->max_tpa_v2,
MAX_TPA_P5), never going above 256. 1024 is 4x the headroom and if FW returned
that, it would be ignoring the count it advertised... which seems like a FW
bug.

> The same raw ID is used for the read side in bnxt_lookup_agg_idx(), whose
> result is used unchecked by bnxt_tpa_end() and bnxt_tpa_agg():
> 
> 	agg_id = bnxt_lookup_agg_idx(rxr, agg_id);
> 	tpa_info = &rxr->rx_tpa[agg_id];
> 
> The commit message says "TPA IDs are generated by FW and can be up to
> 1024", which matches the table size, and I could not find a capability
> field that would allow firmware to emit an ID above 1023, so this may not
> be reachable in practice.

Agreed, it is not reachable.

> 
> > @@ -3784,7 +3786,7 @@ static void bnxt_free_one_tpa_info(struct bnxt *bp,
> >  	kfree(rxr->rx_tpa_idx_map);
> >  	rxr->rx_tpa_idx_map = NULL;
> >  	if (rxr->rx_tpa) {
> > -		for (i = 0; i < bp->max_tpa; i++) {
> > +		for (i = 0; i < bp->max_tpa_roundup_size; i++) {
> >  			kfree(rxr->rx_tpa[i].agg_arr);
> >  			rxr->rx_tpa[i].agg_arr = NULL;
> >  		}
> > @@ -3810,13 +3812,14 @@ static int bnxt_alloc_one_tpa_info(struct bnxt *bp,
> >  	struct rx_agg_cmp *agg;
> >  	int i;
> >  
> > -	rxr->rx_tpa = kzalloc_objs(struct bnxt_tpa_info, bp->max_tpa);
> > +	rxr->rx_tpa = kzalloc_objs(struct bnxt_tpa_info,
> > +				   bp->max_tpa_roundup_size);
> >  	if (!rxr->rx_tpa)
> >  		return -ENOMEM;
> >  
> >  	if (!(bp->flags & BNXT_FLAG_CHIP_P5_PLUS))
> >  		return 0;
> > -	for (i = 0; i < bp->max_tpa; i++) {
> > +	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
> >  		agg = kzalloc_objs(*agg, MAX_SKB_FRAGS);
> >  		if (!agg)
> >  			return -ENOMEM;
> 
> [Severity: High]
> 
> This is a pre-existing issue, but this loop now runs up to
> bp->max_tpa_roundup_size times (for example 33 becoming 64), so there are
> more chances for the 272 byte kzalloc_objs(*agg, MAX_SKB_FRAGS) to fail.
> 
> On failure, bnxt_alloc_one_tpa_info() returns before rx_tpa_idx_map is
> replaced, and the caller for a queue restart goes to the cleanup path:
> 
> 	if (bp->flags & BNXT_FLAG_TPA) {
> 		rc = bnxt_alloc_one_tpa_info(bp, clone);
> 		if (rc)
> 			goto err_free_tpa_info;
> 	...
> err_free_tpa_info:
> 	bnxt_free_one_tpa_info(bp, clone);
> 
> clone is a shallow copy of the live ring made in bnxt_queue_mem_alloc():
> 
> 	memcpy(clone, rxr, sizeof(*rxr));
> 	bnxt_init_rx_ring_struct(bp, clone);
> 	bnxt_reset_rx_ring_struct(bp, clone);
> 	...
> 	clone->rx_agg_bmap = NULL;
> 
> Only rx_agg_bmap is cleared there, and bnxt_reset_rx_ring_struct() does not
> touch rx_tpa or rx_tpa_idx_map.
> 
> So does bnxt_free_one_tpa_info(bp, clone) free the running ring's map here?
> 
> 	kfree(rxr->rx_tpa_idx_map);
> 	rxr->rx_tpa_idx_map = NULL;
> 
> The live ring's own rx_tpa_idx_map field is not cleared by that, and the
> NAPI path writes through it on every TPA completion, in
> bnxt_alloc_agg_idx():
> 
> 	__set_bit(idx, map->agg_idx_bmap);
> 	map->agg_id_tbl[agg_id] = idx;
> 
> with a second kfree() of the same pointer when the source ring is torn down.
> Should clone->rx_tpa and clone->rx_tpa_idx_map be set to NULL alongside
> clone->rx_agg_bmap before allocating?

I think this is a real bug, but as mentioned above this is a pre-existing
issue and not related to the patch I posted.

I can send a separate patch in the future addressing this, if desired, but I
don't think it makes sense to try to address this in this patch since it would
need a different fixes.
 
> > @@ -3843,6 +3846,8 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
> >  			bp->max_tpa = MAX_TPA_P5;
> >  	}
> >  
> > +	bp->max_tpa_roundup_size = roundup_pow_of_two(bp->max_tpa);
> > +
> >  	for (i = 0; i < bp->rx_nr_rings; i++) {
> >  		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
> >  
> 
> [Severity: Medium]
> 
> Can the early return earlier in bnxt_alloc_tpa_info() skip this assignment
> while bp->max_tpa is already set?
> 
> 	bp->max_tpa = MAX_TPA;
> 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
> 		if (!bp->max_tpa_v2)
> 			return 0;
> 
> On a P5+ device whose firmware does not report max_aggs_supported,
> bp->max_tpa_v2 is 0, so bp->max_tpa_roundup_size keeps its zero value while
> bp->max_tpa is MAX_TPA.
> 
> bnxt_alloc_one_tpa_info() is also reachable from bnxt_queue_mem_alloc(),
> which is gated only on the TPA flag and not on max_tpa_v2:
> 
> 	if (bp->flags & BNXT_FLAG_TPA) {
> 		rc = bnxt_alloc_one_tpa_info(bp, clone);
> 
> With a count of 0, does kzalloc_objs(struct bnxt_tpa_info, 0) return
> ZERO_SIZE_PTR and pass the following check?
> 
> 	if (!rxr->rx_tpa)
> 		return -ENOMEM;
> 
> And in bnxt_alloc_agg_idx(), does the new mask become a no-op when the field
> is 0?
> 
> 	u16 idx = agg_id & (bp->max_tpa_roundup_size - 1);
> 
> That would leave idx as large as 4095 for the test_bit()/__set_bit() calls
> on the 256 bit agg_idx_bmap and for &rxr->rx_tpa[idx] in bnxt_tpa_start().
> 
> BNXT_FLAG_TPA can be set in that state because bnxt_set_rx_skb_mode(), which
> bnxt_xdp_set() calls on XDP detach, adds NETIF_F_LRO to hw_features without
> a BNXT_SUPPORTS_TPA() check:
> 
> 		if (rx > 1) {
> 			bp->flags &= ~BNXT_FLAG_NO_AGG_RINGS;
> 			bp->dev->hw_features |= NETIF_F_LRO;
> 		}
> 
> Would setting bp->max_tpa_roundup_size next to every bp->max_tpa assignment
> keep the two in sync?

OK, this is real and I will fix this in the v3.

> > @@ -4554,7 +4559,7 @@ static int bnxt_alloc_one_tpa_info_data(struct bnxt *bp,
> >  	u8 *data;
> >  	int i;
> >  
> > -	for (i = 0; i < bp->max_tpa; i++) {
> > +	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
> >  		data = __bnxt_alloc_rx_frag(bp, &mapping, rxr,
> >  					    GFP_KERNEL);
> >  		if (!data)
> 
> [Severity: High]
> 
> This is a pre-existing issue, but this loop now performs up to twice as many
> GFP_KERNEL allocations, and the queue restart caller ignores the -ENOMEM
> that follows the quoted check, in bnxt_queue_mem_alloc():
> 
> 	if (bp->flags & BNXT_FLAG_TPA)
> 		bnxt_alloc_one_tpa_info_data(bp, clone);
> 
> 	return 0;
> 
> The open path checks the same call, so is the missing check here
> intentional?
> 
> If the first __bnxt_alloc_rx_frag() fails, the remaining rxr->rx_tpa[i]
> entries keep data == NULL and mapping == 0, and bnxt_queue_start() installs
> the array into the live ring:
> 
> 	rxr->rx_tpa = clone->rx_tpa;
> 	rxr->rx_tpa_idx_map = clone->rx_tpa_idx_map;
> 
> Does bnxt_tpa_start() then post a zero DMA address to the device and a NULL
> buffer into the software ring for such an entry?
> 
> 	prod_rx_buf->data = tpa_info->data;
> 	prod_rx_buf->data_ptr = tpa_info->data_ptr;
> 
> 	mapping = tpa_info->mapping;
> 	prod_rx_buf->mapping = mapping;
> 	...
> 	prod_bd->rx_bd_haddr = cpu_to_le64(mapping);
> 
> When that descriptor completes, bnxt_rx_pkt() uses rx_buf->data without a
> NULL check.

This seems like it is real, but also not related to this patch and this would
needs its own fixes, so I don't think it is worth wrapping that into the
proposed bugfix.
