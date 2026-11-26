Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.156.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658444;
	b=28ybK8ZLL/v8LairvOdWKouAx/1NPbvLt9D+Ly1WD/Of8L9fQLHTJwoJpATVtPtdgwjx
	 KClDul9skq2QQh4+W2vQnvCwsUJH5ovBPilHDvjZSgDvRsClwZ1CnP3HB+xrTcWAjR0l/
	 s/f3jeHK0zEQgt3Of1eYzTSSwDXSHiA77DWzGpQqnhTg/XxWMgAI/3PkSP798M2Dd8SNX
	 jDgOMQqdECCTLC65JWQkOQZypb8RspW22gkqzhT/bMW02k7P2Dv/ipQGMgR3mtDWdMX6Y
	 wioBr7onx4M6RJJNKxvo6HUmOmv1wAKYpSedioMuLBhR1EhRiOOpZ2nozVa8vB6quPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=L6goEdFq7O5GDRozIYCd7HLSe04ZuUddA+kdR8LBkqQ=;
	b=B2g2HhXM4mqPDKmS2Qtk+ZWeHMrSQN2JD79kE44LuPZwz66OkUGNhyFjcVuH8I/hJF/X
	 3C9koo/6VEkI5vma/sQfSLpAV++nJbXpVnp7E7zqqVzbhMKGxBaB9dZ13tz2jG2lQcWro
	 KvE3pDHrw2mH6/yp+2zrXWIWnpjlxE53LT2SCfNqCQzMxCRK7z7JCHD9ZJFiEipHUbIsA
	 bS08EAHhOcyjkTIIhYHzdspNTLL7+KWOSvIIdoKXTSBYIiCfp6BNORmho4Bgr07FbHeRl
	 L6EkZwgZcGTZLVYINtbvuZ+GvjDD7hb/ODI1yrONXQFJTB/vnnpQX84HRR3gklMbZ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=LBR1EYMB;
	arc=none smtp.remote-ip=67.231.156.173
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B23606A321
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 02:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=LBR1EYMB
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APNfsSP3980007;
	Wed, 25 Nov 2026 18:00:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=L6goEdFq7O5GDRozIYCd7HLSe
	04ZuUddA+kdR8LBkqQ=; b=LBR1EYMBX0kGCUBHBWt/+33QhDGfpdqXJkVcYVKpg
	g0Rds6SxIyS/iVQspGZxlrfuNUJk1HoOp+SVTZM3eiQby1Pl+c83fsyaLffU0n4i
	YTXJyBpG/mQ/tOIAq5A1xfvJrxDmEDsdzDsogirAWSVn3yDvrIZeNNDI0oKxxxLr
	eNLxcSMfaOR5xuP5pJcM9uMK7sCb3qXxx70OuoGEf8B9CcyJcPKDCU4OnKw0sTpB
	MsOAQTZf42n6A4ubh795V7U2bOwvstKrLJL0gN9FQKsOr9JA17rdRjZXMPSzPc+8
	p9wl8RfTF0Wk3D4ZbRWUjfauDpSNzBgkwKEGSiiTmds2A==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4j5nhg5bsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 18:00:22 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 25 Nov 2026 18:00:21 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Nov 2026 18:00:21 -0800
Received: from rkannoth-OptiPlex-7090 (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id A230F3F704A;
	Wed, 25 Nov 2026 18:00:17 -0800 (PST)
Date: Thu, 26 Nov 2026 07:30:16 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Ian Rogers <irogers@google.com>
CC: Sunil Goutham <sgoutham@marvell.com>,
        Geetha sowjanya
	<gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, Elkin Cruz
	<elkin@google.com>
Subject: Re: [PATCH net v2] octeontx2-af: Fix uninitialized variables in MCS
 alloc handlers
Message-ID: <aweSsCquVuAOvvUW@rkannoth-OptiPlex-7090>
References: <20261125004227.1007723-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261125004227.1007723-1-irogers@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNiBTYWx0ZWRfX2IWq3yDnsrRL
 eHDx3jtFsXa3Ix7pu/3AEVVa/KslZMUzQd4KiLGugr5V037jLFC1vW3YbQHNVSbhBGEYrtwvsC+
 u2M1QJaSOQF18gJL6GDTs+CyDSotr2d2koLpCClDpS3WkO9BgaCKejLEZX+4o4AGvwFMMunwL9/
 qdqgA+1d8QC56oIzfOhC8JrvEPQi2wOiGvMsZbtu+99AvuWPD9ke5KWyIVTxiAqGE7S7IIbAYEo
 stEPi8Ox0C/YdJRDP/jvQUj/p9AFm/ceU3kemFssUPZpS1yY9laDRMBJ6ajUZ1aWVAX0J3bZ6Xj
 KAL66hN869QTe/Ym3NZikqmJZdgBiu37gJpRjGONCiWAx6U+jD2Y25LssdbefrOR2xPV42MA5er
 6lzG9+T0kqVt6ieXRYgKWkiXazyBlEV2FI3yfR5TwzWx2rTuWNCpFOYtVJkGL1gtOFAETv55kgk
 Y5qpRItQ+4b4z55aQLg==
X-Proofpoint-GUID: OM6vz0pOG0NPddNM883AYxlCtsb-MBes
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNiBTYWx0ZWRfX1BYYKQyq7/bb
 BYJsQZhbJRaFWVEpawqiAeO7wvukzCFYFVugTELUjpss5osQdpMmIzyC5B66s1daRVBY6jkyD/0
 OQJpcNYOebKRWDUxvOXXKZG2CNFqm4s=
X-Authority-Analysis: v=2.4 cv=WtC+otfv c=1 sm=1 tr=0 ts=6b0792b6 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=QXcCYyLzdtTjyudCfB6f:22 a=1XWaLZrsAAAA:8
 a=M5GUcnROAAAA:8 a=N5rkjbZfQW29Q2f-B9oA:9 a=CjuIK1q_8ugA:10
 a=OBjm3rFKGHvpk9ecZwUJ:22 a=-hqoVU7_RMCviKuYZNaS:22
X-Proofpoint-ORIG-GUID: OM6vz0pOG0NPddNM883AYxlCtsb-MBes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01

On 2026-11-25 at 06:12:27, Ian Rogers (irogers@google.com) wrote:
> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
> index cd9cca5a9cf5..92c987134436 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
> @@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
>  {
>  	u16 pcifunc = req->hdr.pcifunc;
>  	struct mcs_rsrc_map *map;
> +	int rsrc_id = 0, i;
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
> @@ -744,6 +747,9 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
>  			rsp->rsrc_cnt++;
>  		}
>  		break;
> +	default:
> +		mutex_unlock(&rvu->rsrc_lock);
> +		return -EINVAL;
>  	}
>
>  	rsp->rsrc_type = req->rsrc_type;
> @@ -793,6 +799,9 @@ int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
>  	case MCS_CTRL_PKT_RULE_TYPE_MAC:
>  		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
>  		break;
> +	default:
> +		mutex_unlock(&rvu->rsrc_lock);
> +		return -EINVAL;
Thanks.

May be we need to add some debug prints as same error code is returned for all these
error cases.

Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>
