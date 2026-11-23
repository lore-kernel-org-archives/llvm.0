Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455533;
	b=iElvBbnrhsQZ0pnMZ/McU697ymaicENmF5kt4uo5KHqRq66smgdW1sNtDzBPxPJ9ajrt
	 AKzfjGntjHgxa+1r8jnEqCNRfzwTMASinJrSb+co0SbIs4tNM3z89kbMs8whDI9Fkata3
	 RcQnzBJnpHslYUU5tnf4aMsP2ieuqblPtLgw70zPSQvRNs/QXYsVt4ZoZS53mYjFq5GK6
	 hurSDx9tUCpXOrA7zCV0TrDkq7zYjK49qo8TXsLGDyss7ZURzkDgfjNSuhtoo2rPeHJBH
	 DMOoM3faI6OltXWG9MBKqh4GDQ5JBxLA1rUJ+VZqlXbt09cNXRgqdiaD3RdiNSFHyhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455533;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=M1jT+G0VMSaygnsbEE6grX37J+IeCer1lhkCNoYHZC0=;
	b=N9HJ7vec1xQ2OSR+lBo9MPaghVRe2+1XTQUzt5VbF8YNKg3un/aOUoNSrJl8KvIsZc2t
	 Rf66fWNSJiW2S9ArbBnmL4sb31Zk72wLLCQhLPCkjWzM/qo20eKd3JsSEDHClcS5rKR3N
	 5Ml5SgEK7bPb0mnIYn1755T5SrNo3vSNYJPCKtrXzAKIi0mhsWKFEgcjDUFio98yeslJW
	 Dr5SeDUHsYsmBI8N85WkRfF3oOW99GFzWbKW5M1rGmFKY4C5yssSJbCzWkxLTJCqdr6RE
	 /InbltYstgPoJ6rNEsEHS3YFG25im0PoMQ1p2c5v7qjYicBFIigpTMI9lV+tQ/UuVSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hn5Guuht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C903606A31E;
	Mon, 23 Nov 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hn5Guuht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1F81F000EF;
	Mon, 23 Nov 2026 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455533;
	bh=M1jT+G0VMSaygnsbEE6grX37J+IeCer1lhkCNoYHZC0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hn5GuuhtF0Nvk2GInTT7DzQmBJO45Vi+1AfuM9SkeHqb+wIg6t/2Y1gu5EVJ5DvL7
	 uJYxgTWAmJNOmvt2L+h9DX6+N0zCDfrVUAMWLD7woBg17IPPxfn4tBRfDc/7vQzk/M
	 T56Cq7wGNnPyOFqAwk23oW0r+wkyPF8xlOCh3NpwnzwyDxoCUnpT2exnJSuevCw2QX
	 1d3y+X0mw1Bphf9phmTDJUEwds0m8po7FxjRjjuBZ29QgQqUyjBBG1rpi/SqCcBFLo
	 4iEkM89mLA3TTWVfAYW5nOGBCV44tNXHQD9oe8rkpCtBpTACr21GwubOjsdLiIhPnS
	 5BjbIETev9FyQ==
Subject: Re: [PATCH net] octeontx2-af: Fix uninitialized variables and bounds
 in MCS alloc handlers
From: netdev-bot+sashiko@kernel.org
To: irogers@google.com
Cc: sgoutham@marvell.com, rkannoth@marvell.com, gakula@marvell.com,
 sbhatta@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 elkin@google.com
Date: Mon, 23 Nov 2026 17:38:51 +0000
Message-ID: <179545553181.3135.4354699424439095142@kernel.org>
In-Reply-To: <20261119170550.1517634-1-irogers@google.com>
References: <20261119170550.1517634-1-irogers@google.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In rvu_mbox_handler_mcs_alloc_resources(), two of the new
  rejection paths still report success over the mailbox.
- [Low] The commit message presents the missing check of req->rsrc_cnt
  against the 128-element rsp->flow_ids/secy_ids/sc_ids arrays in…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the sibling
  free handler in the same file has the bug class this patch fixes in…

--

octeontx2-af: Fix uninitialized variables and bounds in MCS alloc handlers

This adds a default case to the rule_type switch in
rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(), so an unknown rule_type no
longer passes an uninitialized offset. In
rvu_mbox_handler_mcs_alloc_resources() it initializes rsrc_id, rejects a
zero rsrc_cnt and an unknown rsrc_type, and checks rsrc_cnt against the
128-entry response arrays.

> In rvu_mbox_handler_mcs_alloc_resources(), 'rsrc_id' is left uninitialized
> when !req->all and either req->rsrc_cnt == 0 or req->rsrc_type is not one
> of the four handled types. Moreover, req->rsrc_cnt (u8, 0..255) is not
> checked against the 128-element rsp->flow_ids, rsp->secy_ids, and
> rsp->sc_ids response arrays before writing into them.

[Severity: Low]
Can the response array overflow described here actually happen today?

Each loop iteration calls mcs_alloc_rsrc()->rvu_alloc_rsrc(), which fails
once the bitmap is full:

rvu_alloc_rsrc() {
    ...
	id = find_first_zero_bit(rsrc->bmap, rsrc->max);
	if (id >= rsrc->max)
		return -ENOSPC;
    ...
}

When that happens, the loop does goto exit before it writes rsp->*_ids[i].

mcs_alloc_struct_mem() sets the bitmap sizes from the hardware:

	res->flow_ids.max = hw->tcam_entries - MCS_RSRC_RSVD_CNT;
	...
	res->secy.max = hw->secy_entries - MCS_RSRC_RSVD_CNT;
	...
	res->sc.max = hw->sc_entries;

That is 127/127/128 on CN10K and 63/63/64 on CNF10KB. These bitmaps are
shared by all PF/VFs, so the index i never goes past 127.

Given that, the new ARRAY_SIZE() checks look like hardening rather than a
fix for an overflow someone can trigger. With the Fixes: tag on the patch,
could the changelog say this more precisely?

The changelog also leaves out a behaviour change. An oversized request
(for example rsrc_cnt = 200) used to get every free entry as a partial
allocation. Now it gets nothing.

> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
> index cd9cca5a9cf5c..54c1d9809ae69 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
> @@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
>  {
>  	u16 pcifunc = req->hdr.pcifunc;
>  	struct mcs_rsrc_map *map;
> +	int rsrc_id = -EINVAL, i;
>  	struct mcs *mcs;
> -	int rsrc_id, i;
>  
>  	if (req->mcs_id >= rvu->mcs_blk_cnt)
>  		return MCS_AF_ERR_INVALID_MCSID;
>  
> +	if (!req->all && !req->rsrc_cnt)
> +		return -EINVAL;
> +
>  	mcs = mcs_get_pdata(req->mcs_id);
>  
>  	if (req->dir == MCS_RX)
> @@ -709,6 +712,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
>  
>  	switch (req->rsrc_type) {
>  	case MCS_RSRC_TYPE_FLOWID:
> +		if (req->rsrc_cnt > ARRAY_SIZE(rsp->flow_ids))
> +			goto exit;
>  		for (i = 0; i < req->rsrc_cnt; i++) {
>  			rsrc_id = mcs_alloc_rsrc(&map->flow_ids, map->flowid2pf_map, pcifunc);
>  			if (rsrc_id < 0)

[ ... ]

> @@ -744,6 +753,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
>  			rsp->rsrc_cnt++;
>  		}
>  		break;
> +	default:
> +		goto exit;
>  	}

[Severity: Medium]
Does the requester actually see these rejections as errors?

This default case and the new rsrc_cnt > ARRAY_SIZE() checks both jump to
the exit label, which always returns 0:

exit:
	if (rsrc_id < 0)
		dev_err(rvu->dev, "Failed to allocate the mcs resources for PCIFUNC:%d\n", pcifunc);
	mutex_unlock(&rvu->rsrc_lock);
	return 0;

The M() mbox dispatch macro in rvu.c sets rsp->hdr.rc only when the
handler returns non-zero:

		if (rsp && err)
			rsp->hdr.rc = err;

As a result, the PF/VF gets hdr.rc == 0, rsp->rsrc_cnt == 0, and zeroed
rsrc_type/dir/mcs_id fields.

The new zero-count check earlier in this function returns -EINVAL
directly. The new default case in rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule()
also returns -EINVAL. Should these paths return an error too, so that
invalid input is reported the same way throughout?

cn10k_mcs_alloc_rsrc() in nic/cn10k_macsec.c compares the response fields
with its request, so it would catch this. A requester that checks only
hdr.rc would treat the rejected request as a successful allocation.

[ ... ]

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. The
free handler just above, rvu_mbox_handler_mcs_free_resources(), has the
same kind of problem this patch addresses: a mailbox-supplied index into
fixed-size arrays with no validation.

The handler passes the PF/VF-supplied u8 req->rsrc_id (0..255) straight
through:

	case MCS_RSRC_TYPE_FLOWID:
		rc = mcs_free_rsrc(&map->flow_ids, map->flowid2pf_map, req->rsrc_id, pcifunc);
		mcs_ena_dis_flowid_entry(mcs, req->rsrc_id, req->dir, false);
		break;

mcs_free_rsrc() then indexes pf_map without checking against rsrc->max:

int mcs_free_rsrc(struct rsrc_bmap *rsrc, u16 *pf_map, int rsrc_id, u16 pcifunc)
{
	/* Check if the rsrc_id is mapped to PF/VF */
	if (pf_map[rsrc_id] != pcifunc)
		return -EINVAL;

	rvu_free_rsrc(rsrc, rsrc_id);
	pf_map[rsrc_id] = 0;
	return 0;
}

mcs_alloc_struct_mem() sizes the pf_map arrays from the hardware entry
counts:

	res->flowid2pf_map = alloc_mem(mcs, hw->tcam_entries);

For flowid/secy/sc that is 128 entries on CN10K and 64 on CNF10KB. SA is
128 entries on CNF10KB.

Can a FLOWID/SECY/SC request with rsrc_id >= 128 (>= 64 on CNF10KB) read
past the end of these allocations?

If the out-of-bounds u16 happens to equal the requester's pcifunc,
rvu_free_rsrc() clears a bit past the end of the bitmap. The
pf_map[rsrc_id] = 0 store then writes past the end of pf_map. Could that
corrupt neighbouring slab objects?

There is also a separate problem. The handler calls
mcs_ena_dis_flowid_entry(), mcs_clear_secy_plcy() and
mcs_ena_dis_sc_cam_entry() no matter what rc is. Suppose mcs_free_rsrc()
returns -EINVAL because the caller doesn't own the entry. Can the PF/VF
still disable another function's flow TCAM entry, clear another
function's SecY policy, or disable another function's RX SC CAM entry?

VF requests reach this handler through otx2_forward_vf_mbox_msgs(), which
only rewrites pcifunc.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119170550.1517634-1-irogers%40google.com
