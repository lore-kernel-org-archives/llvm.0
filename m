Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EF2296BD3
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818862; cv=none; b=sT38SDpKH81lYMv2WWtgDZbaxoiRbtRaBI6QMASmRp0AespwsCIJFXQMjrwA2i9QCwVgzdfaBGTNUX9fgWNoFvuP4DVpwc1jmxGsqoBU/klt8DzAOK/gPFnYe8GHSFKRx2mKhihepyjF/JWazyXJdQsebzeIVBsKoJP68/v0N58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818862; c=relaxed/simple;
	bh=//nw8KB9cpdJOUZo71z0ZVaFWnQ++bk4joXDKnezZX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKAebqIlty5uOemO5We0HCFDUZx7QJwhUg4qKe8+ThCb38/PnlSIWAugE1wdvNv1JYiTPvuxRMJ+T4hymGuBrJYfhuVpKJmNu4Viigchk4tAsQ8Q9LYM68G+HWTdnDDYXlmlbHSOgWlDC2ceDoyJk0fNsDlYJuUSNYJnv7xNCgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VjUEyDpo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VjUEyDpo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5256169E;
	Mon, 12 Oct 2026 08:27:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B69633F7B4;
	Mon, 12 Oct 2026 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791818860; bh=//nw8KB9cpdJOUZo71z0ZVaFWnQ++bk4joXDKnezZX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjUEyDpobZT1D9Yc4Pj2/LisiOwtlhr0JJifjbDYehQrudpwvNlTKolg6xnhm9bot
	 bcd4W/a1bUXU5de67C/wv6rEQQEI4UTcBPgTg6E8I3mq1lipq4U8fXM1bCWZWSmEv7
	 Z8RkOtRjHn0vyvM5f2riR6h8nzNmaP9RpjkYz8m4=
Date: Mon, 12 Oct 2026 16:27:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Sasha Levin <sashal@kernel.org>, andre.przywara@arm.com,
	bot@kernelci.org, fenghuay@nvidia.com, gshan@redhat.com,
	james.morse@arm.com, jonathan.cameron@oss.qualcomm.com,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
	reinette.chatre@intel.com, "will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
Message-ID: <asz8Zj9VyUATs0MP@arm.com>
References: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
 <20261009163235.3-1-sashal@kernel.org>
 <18df4643-4213-4e0f-94e7-b1e43adcb5c3@arm.com>
 <d8f4fa6c-cb56-4dff-8951-ed2fdb859dfa@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f4fa6c-cb56-4dff-8951-ed2fdb859dfa@arm.com>

On Mon, Oct 12, 2026 at 04:00:10PM +0100, Ben Horgan wrote:
> This is the clang build fix I mentioned. Just adding a note here as I missed to CC you before.

I queued it already, just haven't got around to run b4 ty yet.

-- 
Catalin
