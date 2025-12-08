Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A862BD036
	for <llvm@lists.linux.dev>; Mon,  8 Dec 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187260; cv=none; b=AzVPotkmIjWP9bbflTkUptYPq1BMRqUnorQpar+y61xQHhwLiic6BPYCTbHJooy/qBUOpGWm4yBWj5hF8eXzKsCrLgNquH+tQs+ABWkurdGwESD3dSJTIZcvPXEHfECyIbX72Dw4Rc0E5aBg/fyvJsitZcljt39bgHZ80KGP/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187260; c=relaxed/simple;
	bh=tJ4mRQHZeVINxneBr+GQ4ALwVIFkRtCOw+TjqIEPRzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCft6XlRfFEN9q0ClAtSY5kboluA3IaA+/yRdfK/G7zFQstHjCX1HHDVcw7BJX4Cw2LX3e/rRcSqgcj2JXWYHzBkMNBz8cDVcpkiIWcL/b4Po+Z8aHsq33w+lceACskr78J7Zde9ZVdYEL4tm1kWlN3own2YkoCpABDdxFnmhkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=A44TqR/w; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="A44TqR/w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CTnDG/mX1Er10V6CjOPlnKa6y0MCt7ZScwEti+D/1c0=; b=A44TqR/wIWC7gV9rumF2H3UFcL
	guMr058MNiNX6XSmOeKg1YG7Vnm6d79gnY4RPoXaHrcA6VqHqmoVeIjD9SJeb13IB64mg/UjfoEkK
	ekprfdvN7sLEJtlQ2tI/3FWYJ1IsH4QjVuOQ5H4V4EqfFODGBl9H0iH5Sld6znSmvyUcMSQft9ltt
	t51OTq9hYELJcZMoN2C0ikIsXmWYcqYOKNHrm0qHYkgwmpu1+NaeH3BOXzwec9uAFqgPRek6Wu+p4
	vXzcMGuW2TjGf8hEh+OoH2MRk6T7Ff0Zyr0nwa5/JFd6YOK3BM0kPosV9BK0qTpbElgLzat1SdZup
	ZfVyfQOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSXpu-000000007a3-0w7o;
	Mon, 08 Dec 2025 09:47:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSXps-000000004vE-1OEn;
	Mon, 08 Dec 2025 09:47:16 +0000
Date: Mon, 8 Dec 2025 09:47:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Liyuan Pang <pangliyuan1@huawei.com>
Cc: nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, nico@fluxnic.net, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, xieyuanbin1@huawei.com, wanqian10@huawei.com
Subject: Re: [PATCH] ARM: fix input-only operand modification in
 load_unaligned_zeropad()
Message-ID: <aTaepMnRKqCM1IJe@shell.armlinux.org.uk>
References: <20251127025848.363992-1-pangliyuan1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127025848.363992-1-pangliyuan1@huawei.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 27, 2025 at 10:58:48AM +0800, Liyuan Pang wrote:
> In the inline assembly inside load_unaligned_zeropad(), the "addr" is
> constrained as input-only operand. The compiler assumes that on exit
> from the asm statement these operands contain the same values as they
> had before executing the statement, but when kernel page fault happened,
> the assembly fixup code "bic %2 %2, #0x3" modify the value of "addr",
> which may lead to an unexpected behavior.
> 
> Use a temporary variable "tmp" to handle it, instead of modifying the
> input-only operand, just like what arm64's load_unaligned_zeropad()
> does.
> 
> Fixes: b9a50f74905a ("ARM: 7450/1: dcache: select DCACHE_WORD_ACCESS for little-endian ARMv6+ CPUs")
> 
> Co-developed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> Signed-off-by: Liyuan Pang <pangliyuan1@huawei.com>

Sorry, I missed this email in the deluge. This looks entirely correct.
Please submit this to the patch system. Details in the signature below.
Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
