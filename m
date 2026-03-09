Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DBA3D4100;
	Mon,  9 Mar 2026 15:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070820; cv=none; b=Cxk90Od5jl9S6rDGmwY13hr4ncwQJgZbQnSP/mgQ5mL2X3Vk9ZE/GC6g4c3tdcft5KNbNhINcZOj6IU+bON6E1akv0L/jOTkFXlef5WTXM/Sq3XaYR3ClxNbWEObhkO48mDHqBdqwFKgo9zl8FocigRokol1LpBB7zdTs6cAMQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070820; c=relaxed/simple;
	bh=BH5jW73g8Nbb+MOjYtZX3x5WWXhBibQwMiTFmg8NspM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8qNwFN3nOBR2HYTZ83WxNntQW6LdX40dibfgYOmwqaGPKa0Hg5qqd02YUTL3ONzkWYPKLpjsTf+7jYK0Fh1vHlL/Lw8SbTlvQX65hdi1Ha4Te0Rz/bXgRFNz6e36C3NU+TVwPrgFeR5cFV3OaxTWAToy+kLWRQM9QYh5TTOgbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HNX5zIrr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HNX5zIrr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BH5jW73g8Nbb+MOjYtZX3x5WWXhBibQwMiTFmg8NspM=; b=HNX5zIrrNTdc66q+DRzxzxmDJh
	aC+4Ui7AidvvtENeSLq1FUXKwWB0VMSnDToWmHjVpUYPQmLC6/xFedb1FOJEiIWjLls8fEtBbGcmx
	RH+PakbfC8kUJOCJM2sRAOCYYvmbgH/ISeP973YAcPe7tCVy392sdlYBCWxTObifkis+favDEVuE1
	wZIl304YuROD6csuFgI9Z49+rXJ7oDmnoWnJpWDF1jqkNuv+LTKa3rRQ3kRiA5hghMH+YwFjeD7CQ
	02v3UuDQ6kTLCSdaVs1bRdaASzR9XI5mXRer/cAJNiQYcgj/lYVEQhgo+zcHR9cZvM2G0H9YLIngr
	8dxwxjVw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzciM-00000006AaX-0gpX;
	Mon, 09 Mar 2026 15:40:14 +0000
Date: Mon, 9 Mar 2026 15:40:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Xie Yuanbin <qq570070308@gmail.com>
Cc: rppt@kernel.org, david.laight.linux@gmail.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: optimize the implementation of WARN_ON_ONCE_GFP()
Message-ID: <aa7p3eQfEuh2wObQ@casper.infradead.org>
References: <20260309153811.40958-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309153811.40958-1-qq570070308@gmail.com>

On Mon, Mar 09, 2026 at 11:38:11PM +0800, Xie Yuanbin wrote:
> As shown in the commit message of commit 242b872239f6a7deacbc
> ("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
> the code "unlikely(a && b)" may generate poor assembly code if it is
> actually "unlikely(a) && unlikely(b)" or "unlikely(a) && b".

Why fix this in multiple places in the kernel instead of once in clang?
