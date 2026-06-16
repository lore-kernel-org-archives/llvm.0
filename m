Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226893CCA1D;
	Tue, 16 Jun 2026 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781587108; cv=none; b=lrIGDUvZaRKXCpXZw0aAueEI6J14tGDPaDLvtfdGz0T6G5iRaXY28us3AzH+XAKcoiniV1GBapufPIqeYAL903smWFStib6U5CYOtyJEFVxbD6GzJBl0WwP+08yO5jE1dHQ3gw9sDqI53Sc9MGCpFV4hTRbxBmiIr7ulrIzcc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781587108; c=relaxed/simple;
	bh=nXAAUZI0t9XPGruLOpg5OKV7uLUV4MpoRINxaq38G7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQjHdKTiBFNu4Ti/yRo4Ci5Ah2N3ARf7kmrYBDW7F63gUscyJW3ZFmVXf0tmR9muWFaKTga+jhVCHidhIiidjuA2hLWQL68xq5g1ii2b2QwYfs0S0XM2cndNdAoocAxTyumEuNlXtXcyFxKsKEGajJDnokvGSsa34aHGdQ7udts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S5b8E2n3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S5b8E2n3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OnPiJtY6qO3p7KPgIthKJtjFjWsgxHP6TmOCfFIVUyM=; b=S5b8E2n3sDVPqyWYMLEfe4COy7
	0u5C5V1MSR0cLA5Dmt5G6SaSWfuYIpoJVZm92JGEtphpQzBTbhrrOtuePN3Nj2gNjMcL/N88n8nsw
	d+ZUym0H2FNtZfFFbh70sEBeMKPLO2WKht2/QkSV4mwP38dddx/epqtddSiQtfma6vm4fmIw+Sy3I
	My85GEPHikFlw89XjlHYNH7Cz3Ivm4aFR4MDXDJuY2+U+q3/kN2IMc+hRu3QQqhej41/DQS1e4u5x
	EinB1fWONmM5pEBHRUpm6ucFG1D5F39Z0LW/7tqWkJoqkwRaIn4YVQLRVH5e0qBKyziDangTltbbv
	JLyi7i+w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMBs-0000000FExa-0y0P;
	Tue, 16 Jun 2026 05:18:24 +0000
Date: Mon, 15 Jun 2026 22:18:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 22.1.7 uploaded
Message-ID: <ajDcoAMsUMzwhIbs@infradead.org>
References: <20260602215932.GA1352412@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602215932.GA1352412@ax162>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Jun 02, 2026 at 02:59:32PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> I have built and uploaded LLVM 22.1.7 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.

Do you also plan to uoload a 23.x build now that this is required for
using the context analysis feature in the kernel build?

