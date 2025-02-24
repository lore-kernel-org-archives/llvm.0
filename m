Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC878F5E;
	Mon, 24 Feb 2025 00:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740358449; cv=none; b=CH2/x4E5DciZKVSsIUSF4hJv8rNhqUncAEaLxIFhtXpBChuUO1NcmOJ3L0k9cpM8O8u5mLH9tr+rztrQH7vTrPPhMdu4qZajMzuUsd3PniNlO+B+rfdyE7KyWfDUrI571h7G2SeK8DdIhCMP0OEsu8AQwSPjdB4aTw/dppMJs5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740358449; c=relaxed/simple;
	bh=CNirDmsVDT1LLQ2KIbgV1Ns5LAgnpftSLIJlpMFNMfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHyNarQX72TEnHcWB6u+3KZ8wOxffHBOL29/y7LBBILMMr0mIRZTp+UIhBEBS5dZKIRdInYbFoJG9e+JzRl6B6+XB3A/+Ls/FEwIZxmQqoQ/NioucjrRTszYpk9nF1I3VIBDNjhhggS4enoJ6Zb4GUfwZFIZIjfL1T3S1EJt+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ccKUvWnC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WZAk0XfH; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ccKUvWnC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WZAk0XfH"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6DA32254011D;
	Sun, 23 Feb 2025 19:54:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 23 Feb 2025 19:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1740358444; x=
	1740444844; bh=t/Eb+wcf7EZ+UThL8O/D+kbB1rl2eRNVJ73UFN6E/Yw=; b=c
	cKUvWnClrwAkgd+lW1OmlDKi8ks8ZzZIPleLp2hT1ZfaoCQKmIbTTztoShL5j+aK
	5QIsLzUNIlCGhrJv4XG6LD4ogPSYohUSrW+3Fa7POM1qosPusVLD0trUkGmUB6j2
	cbWgCYZdIY5vBiEctIGBETmTS2PNxehmPYecWoldvGz48YAjN2fQrOFH0F1zlF33
	NJDcqqYsN4jQVNTWpB/0QEHUHRh8LeecBt8oUm1YM93EUbp3qL/pyDwVYoxE3Ato
	tJF9C1ZbIJmV956w6pQBzr8yLUv5dv9eaGJRU22RgtpTlSeoaIe2lUAFP0x/LwNk
	eX55YSQKKJQNK0wyLq8Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740358444; x=1740444844; bh=t/Eb+wcf7EZ+UThL8O/D+kbB1rl2eRNVJ73
	UFN6E/Yw=; b=WZAk0XfHOrss8OU5SHkDLcFwcNnG9eAVyotI2Wm/uzQPmQlDLpf
	zT1lbJKEvsn6EpdR+iStWJ72oKSsRDPdG/SGn5JeZFNqz6JyzTsWP9uDPJjfVAhl
	wIVMY9WqvcHEQGSuQzcaaF6oqOosqhsxrZ8MW/liy18Od2pDBOYnTgCMjh2Gezd7
	O8HSxFof/JjSgEw9oFytF4qN0m+y5n3u5Dkm/1A6qeFQg7OkK8OtEmgQky365cf1
	FT2nF5cGtLLyJ2SKs/PLcNm8eARZKS5hCgnc1ZpASBhRMwfckVtc8EjF0uWqabs+
	pZYdmhLtDGdbFwe6m62PehyU19c04Y95a8Q==
X-ME-Sender: <xms:K8O7Zyfc9HFMbbE-Vg7_BfQHbRtt-yP7b1iaNdLLZ6jKUAFsfLIKgg>
    <xme:K8O7Z8Pi9pBCs9lULb7yI_4c2qWdNMdSPt1cHHgZ1O1koiVP6dupoWEQaR_nShE6b
    N1I49-o0GafmLPOlC8>
X-ME-Received: <xmr:K8O7ZzgX_qVIbnCBjoD3GykcNbEfJ4aDXCw1OzfSgGVCAcbv9HjFmakr_5dFA1uFxLKnk3_KwNLtogQc6-fUumPxn-bqvg81rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejjeefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheek
    ffduudevvdefudelleefgeeileejheejuedvgefhteevvdenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpth
    htohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrtghklhhivhhinhhg
    ohhougestghomhgtrghsthdrnhgvthdprhgtphhtthhopehllhhvmheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohephihunhhgqdgthhhurghnrdhlihgroheslh
    hinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtihifrghisehsuhhsvgdruggv
    pdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:K8O7Z_-ejzKIWH4_SvLBdH4YUHvAWcITT3CRT5QLVIiGbW9rf1aMnw>
    <xmx:K8O7Z-uQV4EN_jiUoeZBLnqEB1tCkjjvoyp5hxBmDT3I3Dr4jPquLQ>
    <xmx:K8O7Z2FyBqKgj3GM5GiPkCdC34hhB0ABw0-aRbV2xuV3xJ-uB62JQQ>
    <xmx:K8O7Z9Nqi8k2jriPlhHW8uOwQsW6KoN8yk0zn0Tu6CjpuJeQBKaLIA>
    <xmx:LMO7ZyiZ_eXgTLJuB-4zNt0HEqtq_7zEtiWPr_oV0CWS5y_1BY3DYcEM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Feb 2025 19:54:01 -0500 (EST)
Date: Mon, 24 Feb 2025 09:53:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: jack Livingood <jacklivingood@comcast.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	yung-chuan.liao@linux.intel.com, tiwai@suse.de,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] sound:firewire:fixed spelling error
Message-ID: <20250224005358.GA6489@workstation.local>
References: <20250219172817.50172-1-jacklivingood@comcast.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219172817.50172-1-jacklivingood@comcast.net>

Hi,

On Wed, Feb 19, 2025 at 09:28:17AM -0800, jack Livingood wrote:
> fixed a spelling error.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502191455.cX0HILg0-lkp@intel.com/
> Signed-off-by: Jack Livingood <jacklivingood@comcast.net>
> ---
>  sound/firewire/isight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The issued patch does not exist in linux-next branch of sound.git[1]. The
report to which you address is for Sound Open Firmware project[2].

I think it better to re-post the revised-version of patch to replace the
usage of 'strcpy()' with 'strscpy()'[3].


[1] I guess that the maintainer realized the build error when applying
the patch after my review.
[2] https://lore.kernel.org/oe-kbuild-all/202502220137.fyFohYSo-lkp@intel.com/
[3] https://lore.kernel.org/linux-sound/20250205192258.358362-1-jacklivingood@comcast.net/

Thanks

Takashi Sakamoto
