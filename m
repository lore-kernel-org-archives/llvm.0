Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1201341ABE
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611288; cv=none; b=XpR/bukaDYLTAGaUMLBPd0+NooU6cjClWO2Hx1IFwC5jQBiTkQXgyAgAVYbSdfHNbL/KmZo22XN22gp4smDQvlsbvfZ8VmWR4TG7pudtYDUfk9NWhcSeoveV7FSzzzAF0pf5UEp3eLhNcLG1x+dxvaCszKyS/8jz3C7HvP0S0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611288; c=relaxed/simple;
	bh=WgxoQGTefGQy6krhXNt6jyY6Ogd2/MoAfO4+6xkHD0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=bFk2mUr0ei1ip5Q/RTgUJTSaMnw1O3zlcUOelHDvjVAsVhetMyzVcbVoN9EJGs5GxsDAVnTHWBGdnOSVOgQsq9MhPr072NTh2PZsgQB4NeXwuolyTWWpam88MdLO6L7c+EjTAher1bBkaCsKsvfsdhQALY3DrAWcxW7K1/CfNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mFOUIVth; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mFOUIVth"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250819134804euoutp0213fc72dc5fdab2cf3dcef62050326623~dLyl1y7qE1780017800euoutp02l
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 13:48:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250819134804euoutp0213fc72dc5fdab2cf3dcef62050326623~dLyl1y7qE1780017800euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755611284;
	bh=rNNRF4Z64xSeC0TtYIjoq13C5zAXQshZP/bVM+z+NiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFOUIVthvLpbk8Q9P5dhVu8SsExVI/BPt0Z7z5NmZ/0BURIHyaKRLVRxkisUyW0Qw
	 X3hbHXJG+yJbvi5adKwc/jVgaTg1XRtnfy8V+km6bUL8Xp/Tomxl7s2LkkE0ynwrdF
	 5Jie4pHMZfdyiWkfORKbBFBFRfXHyjsaS5B498AA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11~dLylHjeKm2798127981eucas1p1o;
	Tue, 19 Aug 2025 13:48:04 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250819134803eusmtip14d110ea7c0e1c86224f6c2ecf32b88ba~dLykUPeUf2742627426eusmtip1o;
	Tue, 19 Aug 2025 13:48:03 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: m.majewski2@samsung.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux.amoon@gmail.com, llvm@lists.linux.dev, lukasz.luba@arm.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
Date: Tue, 19 Aug 2025 15:47:55 +0200
Message-ID: <20250819134755.92187-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819131704.19780-1-m.majewski2@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
X-EPHeader: CA
X-CMS-RootMailID: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
References: <20250819131704.19780-1-m.majewski2@samsung.com>
	<CGME20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11@eucas1p1.samsung.com>

> +		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);

I missed this when writing the previous reply, but this doesn't build:
"soc" should be "data->soc". This line disappears in 7/7 though, so 7/7
builds just fine for me.

Kind regards,
Mateusz Majewski
