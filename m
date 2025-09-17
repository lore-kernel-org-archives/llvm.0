Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688EB2EA74C;
	Wed, 17 Sep 2025 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758101022; cv=none; b=SC1SFTaB99Kj+C0LR4/AQkhh9COv0V1zcULVuq61Swb0xzAG3D+7wq1LG0BsNKcHfq+MfaUzQ4j3/dAq+68buRPIzKRavJYKKrkCV2BvZH1yc6sLihduX9pZqVKXBp6YX/wvR64ytRbVQQh9kWAvaYki43u1z+Wq/B6gb1Zav9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758101022; c=relaxed/simple;
	bh=fnhl6YMTBDcw0/Avi2g9p1AoA42Ju6rFZJjN5tH9rok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMH88d/AKEcMyh80jWIm/0qFXNgewqphl0Ad9F6hK0IiTZU9uUc+AKFFfL5FKKmPsctUXH+j88loFkzetVw0vveDARLV7nLm2VRMWR5IEkUXVEPzE+uZC5ItpTpMZhdfmqUrxEdjBfBI93fSEgVE1yuE4k0nnMIWpRcVmwqTDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1BFR/IY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1BFR/IY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7097EC4CEF0;
	Wed, 17 Sep 2025 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758101022;
	bh=fnhl6YMTBDcw0/Avi2g9p1AoA42Ju6rFZJjN5tH9rok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1BFR/IYNnPsPT6izo1beZPKUUe7VdDLZ1ft4ttPqZy/1AVIMV7oQRRwAX7tAowGF
	 I1t3BtW+B2IGQGM5cLH1t78GPuudQ1Gd3jenllOAgg1rm3eay+0DEPRDi6+BR1aqcN
	 hK7H/wHievot0jyUJhYqreb7yC8ua2a/3p+yNCIczKXoTxzkk3xhXLdonVZZD9YIvx
	 05NR6F/J9HUGX7jIQz5/15s0c2zffkMLCBfslyaPxQeVRxLwa3AUU+dAuSXxNfzUN7
	 amt13zh3zPrUnO8P95e9v+WfdD4Mf4geBhRKyHpjajp+8Kq+eN0emRZuh3e3G57aqv
	 O3HWmcHzp5ipA==
Date: Wed, 17 Sep 2025 10:23:37 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Simona Vetter <simona.vetter@ffwll.ch>,
	"Daniel Thompson (RISCstar)" <danielt@kernel.org>
Subject: Re: [lee-backlight:for-backlight-next 14/14]
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call
 to undeclared function 'device_property_read_bool'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <20250917092337.GE3893363@google.com>
References: <202509170410.RubSxK3n-lkp@intel.com>
 <a555ff12-e0a9-4413-b90c-0b0fe8515723@suse.de>
 <3254bf0f-f2b2-4f9e-845e-3fb94394af60@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3254bf0f-f2b2-4f9e-845e-3fb94394af60@suse.de>

On Wed, 17 Sep 2025, Thomas Zimmermann wrote:

> 
> 
> Am 17.09.25 um 08:52 schrieb Thomas Zimmermann:
> > Hi,
> > 
> > it seems impossible to catch all of those. I'm going to send out a patch
> > for the driver and get it upstream ASAP.
> 
> The fix already exists as commit 2f44bb65f28f ("drm/panel:
> panel-samsung-s6e88a0-ams427ap24: Fix includes"), which isn't in upstream
> yet.

So long as it comes together in -next and Mainline, we should be good.

-- 
Lee Jones [李琼斯]
