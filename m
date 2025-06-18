Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D41922C0
	for <llvm@lists.linux.dev>; Wed, 18 Jun 2025 05:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223858; cv=none; b=PL5JUCC+6ksQv7xyZhkCUh7kATVCliip4lH1JIezFqS/K/UZq0WhIp3hTgnQyLsBOUVhCKtFmH7D09VQ1+yrE6WaAIPgGx59pu4uafawAVckCQfStBR0mVBGDBr0PENwIjexI9cdYwi3qHd7iwoAx47NE8nKj6ODFLIHdVAE9Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223858; c=relaxed/simple;
	bh=WexBtDk2E9LKCacblwmFztJs1P58mwxrFjwv2qAp77I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhfYqxUvZiJXLvMZX+UgVDgoNMiiUX3QofI0kpajb3RqALpchc5YITQZooBvW2RZMVwcUffxoQBHHbeTRiTS2bbsVNn3FW8wL8zVMefyV5LV/At07s3u9X40Yrt0vY5CujxEYEeDkJkIqW5YUIob4V4ucWkI5OwosCsCf8HnQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDKHA0jd; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDKHA0jd"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faff792f9bso57651116d6.1
        for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 22:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750223856; x=1750828656; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZS0GU7imY1C4qrYwHoQAIT1W20r16a6TjrlPEOgXYU=;
        b=QDKHA0jds2xsG81SpQKchxn0YVwD50AtHiD6r9WU4cG2yZRpaphnj8/8FV1KqIkjnf
         1Z4CS0kNo6nyxS/K55jhVnSs3KiD8N4ToIn6N99UKUQDFBRajSqzk2cgGesZFFxBrs0e
         CF6ajiboL1Mnepr0fqYnSWG1wdmsV4oHrTXqTXCzHPi45Nfkv4QItldQXNv/QZz1LPr5
         g+tEeKBaa3Kf0mGoYXNQd1FPT9Zb/ZeCvG/vZeQaMguwgpxdKgyQupvnKk5VRQMGb9MZ
         0vW+SBcIyes3sZou5kIQf+7itysPZTNsYR13b9NRGfWKU3bQPPBbBPmzfdJs8T6xnVm0
         tNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750223856; x=1750828656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZS0GU7imY1C4qrYwHoQAIT1W20r16a6TjrlPEOgXYU=;
        b=USgwXYrvLv0Vpc0tTU9XUY/MRmhOuE2zcssQqosMBkgw1L/VjWr/QCQ+yejGks97QY
         6Sy2N2+KbqRJjfXIa7Q2oJ1bmxXd4j9PGSYwhKlnutVrwEQcG02vi06N19A8/uJFKznj
         x/9l9HeMYtfjK1Tbv0FFG7a01aNu5/1MiMYeRLsNQA9esD3aLR3/ZRJSWFPzj0LSzzSp
         s1f2Me2aUZr8ALAYqx61zRxtOjRrhnBljgRBov56xJCsRc3lmTmc0IH0NiFSax4V9Ptj
         TCIEd/cc9ZxfRhB7ffhqO0DJDs2GbZge9COl8c5z2hkpCXA3UkabSxUzydLGi7FYBkZq
         7rjw==
X-Forwarded-Encrypted: i=1; AJvYcCXlVsfgDmPyhRDMiEGTiY9XyMC6GknCRK8mm+6YiVLTjzmHeYZ7rIHPRmULu5gACqHRsvEU@lists.linux.dev
X-Gm-Message-State: AOJu0Yy44HZXGI7p9op2CE46YnuOxlfXviuN+la2lLSPDW1Bkf50tORq
	h4CqCPLcS+qHYcptQsV/5Y67gshO59ShRynJZqRArwFdYCrBA9vDRqKc
X-Gm-Gg: ASbGncvZmGse50fQ/VYIf3ZylaWqyfeoU1eebuegtuEPfmt1ojnNjSgapIiIrjO6xu5
	fzs8KWzVJtw+MRclrUtoyP1+VcvvlOlH2RJ05eYdZHE0dBdgahUWwTTBqkq9q5TM9LHMKhRmcZP
	KGz9S9UtD2fwsr/aMLDBJ9dqrfCmMVijOXYZj71M1mWydA/qV2eKbStAClXW8WiWT/UW996O+TX
	1X85EX/u0skwrrDhgAD3Cx5/w0v03zUqlY50dEGR9z0qNN71ZgElHm9MaMdq0E6AStqVmaZfCX2
	t9Jds7v7ZCnSQlYNmlcXabd1WEwEk5nhDl4vsdudQIZLNFkJgIJMPgUEHprZBs2dzqc9+lfT1a3
	1dJgyDmwcwRaigpuQy7wZKM09U5IVEN0VT0a8ypZPFvsUxIXtYaUP
X-Google-Smtp-Source: AGHT+IFQ4YD0qeScvPjSCrO4CwY/Hgqethao3wAwOto+pCfvumm509Bf6OSurwwYn1HLYC7oOT7Mlw==
X-Received: by 2002:a05:6214:5707:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6fb477262e5mr291009876d6.18.1750223855822;
        Tue, 17 Jun 2025 22:17:35 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb58e7687dsm22210186d6.115.2025.06.17.22.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:17:35 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id C5A1E1200043;
	Wed, 18 Jun 2025 01:17:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 01:17:34 -0400
X-ME-Sender: <xms:7ktSaEEi3QN8ZVkJhJEH77Rov2hii83pxGYv3fZtWuiRi_u2Dj_d1w>
    <xme:7ktSaNUX0IsevyHG5jo2XA4a2X0R84t5lKsBsoaxZCwCxij6Vz-lzUD67zm_OE09d
    q0SAWXfKLZI_us5yg>
X-ME-Received: <xmr:7ktSaOLbvyJtb0TFolxGfCXYLGycJY_XG2daAdgAwgRbSsldfKUGak4afw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhi
    nhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrth
    drtghomhdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:7ktSaGEXeSDHYgEejXy_6cV88ozFH7yT0WoAmeYr11vHB50lBkQQdA>
    <xmx:7ktSaKXeP4afb2DjUpraCTkAUGL0HAhpV0GPrS2VkLIqGR_ynC3Ngw>
    <xmx:7ktSaJOmPGKEbdvgX-_4sMwdepUi9NcK3dlWDPqS2D4YxTEB4BwNrg>
    <xmx:7ktSaB2QnM1GGuwTmvO3_bYhNQUc4aRH5aSMzZnrBp1iMsxEWSW3OA>
    <xmx:7ktSaDU3kD7vaQmpTlxFrBAip30dOlRrg3WGuoyOMptaGyK5K7Z6QxkI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 01:17:34 -0400 (EDT)
Date: Tue, 17 Jun 2025 22:17:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] lockdep: avoid struct return in lock_stats()
Message-ID: <aFJL7GW_mdX-VZIR@Mac.home>
References: <20250610092941.2642847-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092941.2642847-1-arnd@kernel.org>

On Tue, Jun 10, 2025 at 11:29:21AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Returning a large structure from the lock_stats() function causes clang
> to have multiple copies of it on the stack and copy between them, which
> can end up exceeding the frame size warning limit:
> 
> kernel/locking/lockdep.c:300:25: error: stack frame size (1464) exceeds limit (1280) in 'lock_stats' [-Werror,-Wframe-larger-than]
>   300 | struct lock_class_stats lock_stats(struct lock_class *class)
> 
> Change the calling conventions to directly operate on the caller's copy,
> which apparently is what gcc does already.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queued for more tests and reviews, thanks!

Regards,
Boqun
