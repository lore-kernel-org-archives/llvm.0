Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A2226A0E0;
	Thu, 10 Jul 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155827; cv=none; b=XNjWN30NbHCmJ1fawKTrzvMTZ+ChprauFeWIYOehJoT4US3Fiq4TG6nWSyH4h74aBYvYtye/Bv8ZMb/h9sRCtgI7muTvFC5Qz2tocJ3sdzOLQ7iMifVR3KAuvXv3fxkeO2WTFyGZBPZEAFLExH6/NAcwvXND4shKXf+u8TcDnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155827; c=relaxed/simple;
	bh=Tql5oIqygZUiEE5nm05FXG0lG5dY0ReXL7adlCc3QYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6uvcodtDFLBnJvYR6PokSDL2jqwXNJZXB6SplnHLJx0VJMOt/hPOE8eZDvdstD66xp0LCsU6S9xafgk1YeYmAPu9+bWfSE3p4h9RqBNk/6rP+3AXc2yJOi/wJXxCilOgMhFr4ojscHRuEvw2GBlCi7aZDCr7DmKDwlSt25gJ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Uic/fNiH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Uic/fNiH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tQxFdwzzhqRzORfFKiQy6qbKfEcaU1zOltkbcG/O8Jc=; b=Uic/fNiHgbMGnR8jpzsOuquy5W
	4F1bsOn2+Bk1fRJKQqQd0IEwB6e9iGLjFOlGlgxyz+laWsECV6FbFeI6+82SlQmt9wKjugNfzLf1y
	mI9Ii7r2Twfx9bCM7/8dVyIP7a3mEV8Ek5zzMIomDNkF3Oj2PxMC+gTLeN8VQevIX9DP+jmB0/0jC
	5lQTZB3XtPVQyucop1I9nc6v26RoGtGegsYRB/xGpEZlaFhoCtIYizmkKLfMaj0wiyA0pjMPfC/oO
	vypRAdUV89RNOiWLtIco+SmWYubjfc+llCoRO7CBZ7UDZqhZ/5kj3k1Bny6MQCuZIddxUXQ8kFyjR
	ZOzVDyRA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrln-000000098if-1CZv;
	Thu, 10 Jul 2025 13:57:03 +0000
Date: Thu, 10 Jul 2025 14:57:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56: error:
 passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
Message-ID: <aG_Gr8NvCiXC4SyU@casper.infradead.org>
References: <202507101412.50ND2WEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507101412.50ND2WEX-lkp@intel.com>

On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
>          |                                                                      ^~~~~
>    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
>      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)

Ah; I changed only one of the definitions of fscrypt_pagecache_folio.

Jaegeuk, can you fold in this fix?

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index b334c0538864..8d9127a0fdb3 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -524,7 +524,8 @@ static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 	return false;
 }
 
-static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
+static inline
+struct folio *fscrypt_pagecache_folio(const struct folio *bounce_folio)
 {
 	WARN_ON_ONCE(1);
 	return ERR_PTR(-EINVAL);
