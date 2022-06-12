Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F09EC0
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 12:31:20 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 108)
	id 84FE9C01B; Sun, 12 Jun 2022 14:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1655036638; bh=h2RHYSByEU5eRTPDXbysP2Dge1dTMEpexMMRrlnjQtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBMbff3imYxiandiIfSWCWx/mqkIvMSlzbeAOgFOKlZkolTI1EF8WXZCMJBW8rbRd
	 ydOUY8dEizMhu7EI1GNmiX2q9AcRj0hVZwQ5kGc7vs9RQ1pBc6owUcQF34kbJZcOUZ
	 dmRoK/s34Nzw01ILzF5KhlStpiLr2glSb3wplBRpvbBnwUU9biRQDgD3yFI0tfpLc+
	 XvuOxsU2AFtgVqILaByd5xCqfik2M+JKWoqThwi8klRezIMr6bBCu96AYUWAd/UDC1
	 AIjzLD2qhxpeU8CYHg25uYskszdQp2p8N3SsWZmhcRzJdSxMz4pyoLqWbWf1LWwWts
	 JH4o412dyjIFg==
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id C388FC009;
	Sun, 12 Jun 2022 14:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1655036638; bh=h2RHYSByEU5eRTPDXbysP2Dge1dTMEpexMMRrlnjQtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBMbff3imYxiandiIfSWCWx/mqkIvMSlzbeAOgFOKlZkolTI1EF8WXZCMJBW8rbRd
	 ydOUY8dEizMhu7EI1GNmiX2q9AcRj0hVZwQ5kGc7vs9RQ1pBc6owUcQF34kbJZcOUZ
	 dmRoK/s34Nzw01ILzF5KhlStpiLr2glSb3wplBRpvbBnwUU9biRQDgD3yFI0tfpLc+
	 XvuOxsU2AFtgVqILaByd5xCqfik2M+JKWoqThwi8klRezIMr6bBCu96AYUWAd/UDC1
	 AIjzLD2qhxpeU8CYHg25uYskszdQp2p8N3SsWZmhcRzJdSxMz4pyoLqWbWf1LWwWts
	 JH4o412dyjIFg==
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id 1e40d947;
	Sun, 12 Jun 2022 12:23:52 +0000 (UTC)
Date: Sun, 12 Jun 2022 21:23:37 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [martinetd:9p-next 11/13] ERROR: modpost: "p9_fid_put"
 [fs/9p/9p.ko] undefined!
Message-ID: <YqXayRpfhqMwUjXe@codewreck.org>
References: <202206122057.RBESqurT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202206122057.RBESqurT-lkp@intel.com>

kernel test robot wrote on Sun, Jun 12, 2022 at 08:18:10PM +0800:
> >> ERROR: modpost: "p9_fid_put" [fs/9p/9p.ko] undefined!
> >> ERROR: modpost: "p9_fid_get" [fs/9p/9p.ko] undefined!

Thanks, I had this fixed in my tree and in the patches I submitted to
the list but forgot to update the branch.

(looks like this was caught before the linux-next merge at least, that
was helpful)

-- 
Dominique
