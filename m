Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646695;
	b=BuuFdap9keXv++eIx6xU3UkDAA9NlM3AsA9CQRVixJavw+b+q3xVDA6PUE5lljDZFFgm
	 UoDFKYmECLYRbXsoRnVauwNMEeu68VYijlI9z9n0oxcANIw+fiVs/PhsC9LotzBKFDXfF
	 x4d4mpkpCwd1abi6PQiWm4EBwqIdCCFwsXCN25++XhUBHWUTeaAevtngLNFTDF3zJ1O5y
	 yhSpJhwvFRo9mMuO7Rc283EroGrwig7YOwTx93zTSpaXA2Y+MvcwqG1K6GXTA0lO7m+2K
	 Hik18nEFfXXaDl8Ed9uYDDymgxxYy+e2WU10tD760WDiBdm+u22QtVUFGhHJh0lUuGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646695;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=09hEYfefZyI+lQpyAzdThuo5y+p6WAar0tCrhyqNOs8=;
	b=UcsSnJpQ77CA3mJg85/0zPlwVrcFJjaYWlvK/NY3bauXGrAtYY2Ppa+8VhW/IlJu2E9D
	 IerlfdG+E7hzXHCJx8gmNIL1uUoV3bganbyy7nuu+Oikr1+v2+fzf/3d6Bh2yek2kMikT
	 LkKnr6wkEcw7QY+9Xne+HraO0fFqUqoP2zCTkdSwKthRj0SU5uHRFg21V697gY0+gMx87
	 5JvBUJYoHXyAYSLBOG5SVs/SAJUu//I3PQGiZH/zbtOZzMdrfsqEt4mygrfVMs14jHvJk
	 mMv5nk0napVW/B6dSI18lJ1kr2atfDcs9/5efA23Uv5pEMXgFw+JFGLhFp31vjzxbMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=foXVPkKb;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=g4g57sfx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C2606A330
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076C2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=foXVPkKb;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=g4g57sfx
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795646694;
	 b=mJhsM/v2eJMwwerc49Jv7NgJg9W+IDXP9wO/EWn7M4N2JQXAdwqeiTiddqzm/AGNu6vY/Fr/br
	  Gub+sMrMlcM1b1wkoJWmRUISh4n2AAo8h16upsJTihnlv3t3jd29IJsSVYjEVGIq7gtaxCQXje
	  +FK8Nos35t5bxSagcOMF+5mmT5/VnRf/jOFmfcgQVm0zxXHEAsD3xGt3L4XNRCSCxjyuQ+tZM/
	  vUy1LHlkRJX8yTB/1rfcQy2CDSDNRSs31HT6Nv1pBvdBD6XF0XOSZ+/tI2krSZ2b3zTWio3vB1
	  6xuW0LQ26SyeW88pNTTkN0UPinjEgqC5yk2V7jzGLQr9ig==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795646694;
	bh=kfz0kIAt4CPmE9h3+pA1t5UBQfirBcpfDk3pAWZn7mo=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=IA+rdtgzduXmtpG/kOvchjNMJ+4s2/ZS50FUtgaRFeLr0rhsvzaC1MyXYSkM2Ap+WPKNBWyKDw
	  Bys2DCKt9AdKAs3IAMIwkZrANwUjqSxIh/3CiMGDpEPO8n0yS7StqoeZNDUihderGhdpZzp1iP
	  27L/Q4B5fOF+/ngHUiU2lLHNoITwaeoqD0BgIH/LeDCHKFAmlO7sQJ6AyUmLkC8psyMdqoAdoq
	  9TpfV19BOCfc72DeOKJKTMFi94sxjpFz8XN5CbRIpzFVIHJMWEps4M/4q6t7spvbwfA+ogHCP9
	  tXXSozpnZC3+OA8jxt80a8u/wCt4mMue9BKXMZ+R/Wo5Hg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=09hEYfefZyI+lQpyAzdThuo5y+p6WAar0tCrhyqNOs8=; b=foXVPkKbEXKT8Ewo+KlTrYTtva
	rgf+qBaqH5x88gL09X57EjZkOBCSCRI3IYb4WtuET8iGS89y/P7HuA1M/X1U2Lv7aLORjFHNFGI0w
	AiviloFCm5B9jYCfzlCtIp9JaHttRPApkxPuaTLDMPDayHLRCHqL1CYT+6I+fl5dE+Lk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xWLjL-000000031i2-1pz4
	for llvm@lists.linux.dev;
	Wed, 25 Nov 2026 22:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=09hEYfefZyI+lQpyAzdThuo5y+p6WAar0tCrhyqNOs8=; b=g4g57sfxitAZTDIygLU2hIUotO
	sXOVLQeA3t/bBOpinns88pom9c8Z8DUFqmkGBZj+klL3q80UThXanAaHW985XMw619WiqikGjDU/9
	y9lOKBwsjjJNiTkdtiflv3F850k689EhXpmRqmCgFyY1QkZRvD7uYO0HOwuxxmWEU5fc=;
Received: from [79.28.115.6] (port=63994 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xWLjC-00000000OYN-0cMW;
	Wed, 25 Nov 2026 22:44:38 +0000
Date: Wed, 25 Nov 2026 23:44:36 +0100
From: Francesco Valla <francesco@valla.it>
To: Ian Rogers <irogers@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] remoteproc: core: Format firmware carveout rsc->name
 with %.*s
Message-ID: <awddZWH7h4oIy9EL@bywater>
References: <20261119170505.1515029-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119170505.1515029-1-irogers@google.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 331634813af4a0fd9860511640c5a89b
X-AntiAbuse: ID - 331634813af4a0fd9860511640c5a89b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xWLjL-000000031i2-1pz4-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Ian,

On Thu, Nov 19, 2026 at 09:05:05AM -0800, Ian Rogers wrote:
> In rproc_handle_carveout(), rsc->name is a 32-byte u8 array inside the
> firmware resource table. It is passed directly as the printf format string
> to both rproc_find_carveout_by_name() and rproc_mem_entry_init() (which
> call vsnprintf() with zero varargs), and printed via "%s" in dev_dbg()
> without verifying NUL termination within sizeof(rsc->name). A malformed or
> corrupt firmware resource table containing '%' specifiers or lacking a NUL
> byte in rsc->name can trigger out-of-bounds reads or invalid vararg stack
> accesses.
> 
> Pass "%.*s" bounded by (int)sizeof(rsc->name) at all three sites in
> rproc_handle_carveout().
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wformat-security enabled; fix and changelog drafted with an AI coding
> assistant. Verified with an ASan/UBSan C test and build-tested under
> LLVM=1 W=1 and -Wformat-security; not runtime-tested with remoteproc
> firmware images.
>

I tested this on a AM67A with a rogue firmware (with name not limited to
32 bytes) and can confirm both the out-of-bounds read and that this patch
fixes it.


A note on a behavior that I observed and might be worth considering:

with a name of exaclty 32 bytes, the dmesg reports:

  remoteproc remoteproc2: carveout rsc: name: BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB, da 0x95000000, pa 0x95000000, len 0x10000, flags 0x0

while the debugfs prints the same carveout as:

  Carveout memory entry:
        Name: BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        Virtual address: 000000005cc9fc76
        DMA address: 0x00000000a1000000
        Device address: 0x95000000
        Length: 0x10000 Bytes

i.e., with the last character truncated. This is because the name is
forcibly zero-terminated inside rproc_mem_entry_init().

This obviously predates this patch and is basically harmless, since
rproc_find_carveout_by_name() does the same truncation, but might be
confusing while debugging (and limits the usable space for the carveout
name to 31 bytes, not 32).

> Fixes: 72029c901a02 ("remoteproc: add helper function to allocate and init rproc_mem_entry struct")
> Fixes: ffa5f9c84810 ("remoteproc: modify rproc_handle_carveout to support pre-registered region")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 23f8539a99bd..1b1743093edc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -837,14 +837,17 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  		return -EINVAL;
>  	}
>  
> -	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> -		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
> +	dev_dbg(dev, "carveout rsc: name: %.*s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> +		(int)sizeof(rsc->name), rsc->name, rsc->da, rsc->pa, rsc->len,
> +		rsc->flags);
>  
>  	/*
>  	 * Check carveout rsc already part of a registered carveout,
>  	 * Search by name, then check the da and length
>  	 */
> -	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
> +	carveout = rproc_find_carveout_by_name(rproc, "%.*s",
> +					       (int)sizeof(rsc->name),
> +					       rsc->name);
>  
>  	if (carveout) {
>  		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
> @@ -866,7 +869,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	/* Register carveout in list */
>  	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
>  					rproc_alloc_carveout,
> -					rproc_release_carveout, rsc->name);
> +					rproc_release_carveout, "%.*s",
> +					(int)sizeof(rsc->name), rsc->name);
>  	if (!carveout) {
>  		dev_err(dev, "Can't allocate memory entry structure\n");
>  		return -ENOMEM;
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 
>

With the note above (that can be considered later):

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>

Regards,
Francesco

