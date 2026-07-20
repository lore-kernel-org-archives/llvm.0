Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B652288D5;
	Mon, 20 Jul 2026 01:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510763; cv=none; b=lbR2hxRuW/ux11G8kht5JmTJGunHFoyEf6Md3zo29de2EyQ//ddoaFGxzNSzQW1hqmr/j/Oj9O2Uhk2sB1TM5ENI9OAtWCx7cCnIwhsdqG9BvbZF5J1WzzMwFAmTgrG7VJf2o3rUx3w3vdfJu0asKN4xdVgWyzXkX73yTagO1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510763; c=relaxed/simple;
	bh=U6pqw9MZEH1+YuVO+f1CAnlnj6E9xzlc65h9pqxaRkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE+OX/G/pnwEQcR3YqUrYYfUJYB3eUFSWt+s6WLuRY872lLpMzAOqLs6CBdaHXNpOuJstvvH5w8AiK2Y6ylceVGRc+FTTvbAFbG0XaoMzXy6wkJJ8jMR/OG4f7IfNtnCgjCcVCEEHd8cnBWvt+XP49lDRFuKj4SENhnVRE9qumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxm3YlLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxm3YlLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EC01F000E9;
	Mon, 20 Jul 2026 01:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784510761;
	bh=98A8/CC82pZbi2K4sYDiURXrUDyt5H3JMZ6WbBetIm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cxm3YlLEMBN538EXxtBhGLPM8y1FjoXi6A0+ONa3x7p7O/GTG7QUSyKF/nObgD0XC
	 9wfLjlGjBMwaEW7qbdLX8bqKLiCIDiat+rECXGCUR4kxoRDeMtc513+ugiT/b/qrlE
	 w+1uz9/wimfIZOIaQ+to45mwt+C6wvAFczn7EsRfgyYFIn/uYpt9VObs1szXJTyEQU
	 z9SZZmT8GFTfzXzVcVKKa6S9MpWrhomOVf/VEMjX3jh1fN2NDtDAWcnCR5sKTrO+WK
	 GD49nCLWw55xZna1bCyMcikS0cylLWlMOa15lfx2RSQK9xtgcD+3mVffBbE9KlciZ+
	 0R3iR0MIywXXA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7220DF4007F;
	Sun, 19 Jul 2026 21:26:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 19 Jul 2026 21:26:00 -0400
X-ME-Sender: <xms:KHldau80bruEolQ8f88pXNkgT57L2JSvuZoDvrW-3afMFD5GYrJFyw>
    <xme:KHldahxFRBDbQ4NWiqdkoIWp7K0ialH0CZUh1txevW9zrtzQj2w1WUgiQJ76OQmoD
    JCLGhwv3J87Q10SCL_rh8fT0gKq3Ea8UZfwj8WN23kP3QpgvpCllw>
X-ME-Received: <xmr:KHldaupsFp2IatEo_cRFA7SvAgTAlv4PlEU-09Z9Mt-Ay1eyKWP9tjMe9rrGltm54D3AItGLTWULihPB69zzCX95O2XLq7b_TA>
X-ME-Proxy-Cause: dmFkZTFyS6OgV0Kvo5fVvITmiUW+LQNPP3bEEu+l3e4Zr74xWvB5YEJvQ+h0LWgsxSocQN
    esfkcvTldCIoINDOQ6FMLGpUmKmJy1Qau2qhGIHbvVwWY6634ScOCfYOIXzV/Hw/AnS0De
    F7HXC7llgNfbRLNp3bKoUVCTK1t9wm9/iLa9W49xuf6yt79q7ONKFuxemlN9C2wyXFs6PB
    Pewp3qezGXHOvSeWI8dKcHY6BozYOrFdlHivD6FXS54xDSILQwUX+DbWWBKkgmvasbauGr
    dJkQXFeShO2tj4fdRwkTIoJU8vh5D45226jHR3e2YaL5gMM4tbjsKPzXiWrGcVnnO2R4dQ
    1GKUgo7olB8hVFCZ8QIYKgz5VRvvdeNTxaL2dyXLpQagVGp0/AjZsE4IVjTeb2zKlaQCJZ
    yQzHu1iePn+VtAQ5P/RSgRKy0gUNY2B4qW5WcFvw9tcyfQed6/fdyPJzFrxkmdccwLt18M
    3v9/makwHglhizYpFzg94mLtXGhaMl2R2MeY9c9SuzVaJG2KfNi1QbuV9B89/2P9Xhw4v3
    q+SGBva8v2CSkGHC+VOQCB7u9Vvzzxr/OR+w8MZwiUic+xyRL+vnAca3qShGSNiRQF0q2K
    /RSn24wkNWse+M2G29oYQ+Gutaw9z+yZmiNQbEhNICwLPU/XJ5/66m7bzKUw
X-ME-Proxy: <xmx:KHldaioTITUefVH-TAmfzI3IrxbRAkCOYKD7ZO3fL1Bjm4dHj1BipQ>
    <xmx:KHldauBNxQD1CvlWywCiH-_hS395xGI4soRY7lGumb0OtANHMH3E9w>
    <xmx:KHldagt562TVbL4nBNGfiFkiR5T4eUbI5V0KxISaDACocvb5UcUGOQ>
    <xmx:KHldatItoTAt7XHUhSOa2WDqRi_eUSTytE3GOdXBIJXtAi8DyiE2gA>
    <xmx:KHldana02z8WImwlftp0O5dXH8A6CH08oSm-zOM_YS0BkJ8JHl8liIVw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jul 2026 21:25:59 -0400 (EDT)
Date: Sun, 19 Jul 2026 18:25:58 -0700
From: Boqun Feng <boqun@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	ojeda@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [paulmckrcu:dev.2026.07.13b 75/86] warning: constant
 `WARN_ON_FLAGS` is never used
Message-ID: <al15JgmfEzQHF3YA@MacBook-0RXW5>
References: <202607190048.vAGhOcAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607190048.vAGhOcAV-lkp@intel.com>

On Sun, Jul 19, 2026 at 12:38:20AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2026.07.13b
> head:   04b88652be5bc3b092a63198d1b2bebaf46b9e72
> commit: f41634950050921c691e1fabdafc0304c2aedfdf [75/86] rust: sync: add SRCU abstraction
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260719/202607190048.vAGhOcAV-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190048.vAGhOcAV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607190048.vAGhOcAV-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> warning: constant `WARN_ON_FLAGS` is never used
>    --> rust/kernel/bug.rs:126:19
>    |
>    126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>    |                     ^^^^^^^^^^^^^

[Cc Miguel and Tomo]

Is this one supposed to fix the issue?

	https://lore.kernel.org/rust-for-linux/20260712102802.3013600-1-tomo@flapping.org/

Regards,
Boqun

>    |
>    ::: rust/kernel/sync/srcu.rs:106:12
>    |
>    106 |           if crate::warn_on!(
>    |  ____________-
>    107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
>    108 | |             // and `srcu_readers_active()` only checks the active reader count.
>    109 | |             unsafe { bindings::srcu_readers_active(ptr) }
>    110 | |         ) {
>    | |_________- in this macro invocation
>    |
>    = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
>    = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
