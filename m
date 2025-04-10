Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066FFC0B;
	Thu, 10 Apr 2025 00:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744244791; cv=none; b=s+Bx/PUYxv4QGEntY7+9wux7VaP6NGGJXAKFYQM5rdkWwlChuaBsYaoJMHOZMnGMyqVaCPHUnl2Mh4lnfuNDOF5aID4dmjpCVVFP31mFN3ukuHPkUtt8mFKNLYU38labNambcdLHPigWXrSWzNaXhdweqqpmThxMPB9X+n8r+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744244791; c=relaxed/simple;
	bh=mf7dlN6bui6TyvxORYOq971NbU/Gtl454K5wEcxrs8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nrkVvqvWpxiy4HedhMJ54Hc7DmUyni1bfCkxIL0xciuaml6VZmHidZvjf4s+iI87R2d4aOYbBruEqlP3Q84Z4zgw5mgbSPgTUA7ExqJSmSgd4mg8zBR4f1EKrcxOqXfOj/iBUHrvc1F1zt0y9f0f2cvRjSBAKRsNKeKq23V6NYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK6L9TRi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK6L9TRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EDFC4CEE2;
	Thu, 10 Apr 2025 00:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744244790;
	bh=mf7dlN6bui6TyvxORYOq971NbU/Gtl454K5wEcxrs8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RK6L9TRiHWI9SoBGN5hSdYsUZIpTaeKPOS3pjP1T5sKtYW9vTr6W6v3OYAqa64FuZ
	 NxSAi6dsKTLP43qcHKQFXzeMarFoDZXZVuQoxRFn2NbHIMui/FJLKZHKsOblrR+Zfa
	 cYsNHc6gLiyiclUAcWWDSJhMz4CFl44fghjLjCM6HefQ1ViES83ms6IxJ11HkKk2cA
	 3dfA27Cl8BQLHdXxkHQpXAWFdZ6FF2qf9FpA1BHhhn1myLBYoYfWcTIMXsOOJmjI8v
	 oA3cQn39p0dmw+b8DNEMsM0yzgdiRxRtvv7OgYeZuIsBxuBciqmU27jRh64aRCwkt3
	 lrshgQoro/hgw==
From: SeongJae Park <sj@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted
Date: Wed,  9 Apr 2025 17:26:27 -0700
Message-Id: <20250410002628.7927-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Z/b4mdaNvhdg7FJD@MiWiFi-R3L-srv>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Baoquan,

On Thu, 10 Apr 2025 06:45:45 +0800 Baoquan He <bhe@redhat.com> wrote:

[...]
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 2887ed5d34cc..08b52346cc39 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1539,7 +1539,7 @@ static bool swap_entries_put_map_nr(struct swap_info_struct *si,
>   * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
>   * caller have to ensure all entries belong to the same cgroup and cluster.
>   */
> -static inline bool swap_is_last_ref(unsigned char count)
> +static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
>  {
>  	return (count == SWAP_HAS_CACHE) || (count == 1) ||
>  	       (count == SWAP_MAP_SHMEM);

I confirmed that this fixes my !CONFIG_DEBUG_VM case build failure on the
latest mm-new.  Thank you for quickly sharing your thought and this fix.


Thanks,
SJ
