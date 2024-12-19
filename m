Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C48F6D
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645455; cv=none; b=KLVE/v9jzUQiJOnXOoLrxztIY/gAtBIP2ZjGcIHJ2le0KvyTdrydsXg0UKSrgbVScrL1EJAk2zDUhzey3jULWyEtAm4H5RxUnj7MOqgH96x4mj7g4IlIT7EjbjlMrU5S8ShTWTTDnMO7k9SpCrn7MaPQCRoxqhMz2wTxSPcrovI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645455; c=relaxed/simple;
	bh=830D/Y0uwRU3gpc7bD/i0VBchE7RkXNBc/KlmRq5S2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=en1HGB4WgPZOhjOkf5ZoXKzsdJlj2EhggTLZXXGFWlXU+IoYKig1oet1wPIpHcMiG5+X16WmH+N9lkpgJFLlwH5BkoHt1QAQsYQneviorYHKNJMQwCQwHalt/ec56l6nd5czVBlfPVE72vtBbsJii4GQsrsvcRNcUz0CQz9Nt6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLZBlazo; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLZBlazo"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46785fbb949so12488511cf.3
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 13:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734645453; x=1735250253; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgOKWEjuj4h1JgLFwVKltCYrXDDd1soimQNh2JEAfzo=;
        b=XLZBlazoZ/UjGoAlrQjCQS74hAgracqfBRHt5drmt5DAR2yf/oIqtYiVljg77ExDXM
         YxrrdYO6qCyyu+tY9GA1bOGD7mIJzy20vIVJYnDzxb/B9gDpyBCQPsOR/QHF+7QTcbjo
         cbJMWRhrv3Hfx2KDyPy3RHvo1rj+SUve6AFhlSfixGy/yuLiWkQl7kYz4LO57ovOQV+4
         rtRsy+mlXmnjXS1jjqlLrZVMNjzTnFGrl04X/6vsvo4tPQjvVcrIcSYDX/kL4HjxN4jI
         /f9yHoa7lIafo9l5WVN4Kh1AlkIDyb1LAme5BrCAxzURcI5ZqUYv4fQA178KnvogTYn9
         wGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734645453; x=1735250253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgOKWEjuj4h1JgLFwVKltCYrXDDd1soimQNh2JEAfzo=;
        b=gbwLAEIIm2tgeZhUNI2KYSzMRXfG0xQHoscWDhixvAkStskuILI0o3qV4VIp4fgulP
         tPNibHLHU5rhCldYnj7Vb94hu1tW5o5cwVOigqqYxdkuGEn9Likruna5+QP5Cf9iAlF+
         mjjgHWnkg9vCtjpHLHOkDYlvUPvEfNu5K7KW6f+hzpOQ6Lkkp3pIkUr9omt09Al0WMkh
         FOKpecEZ3i1XYx0YuBuLcVvLj8EuRlRgBy+C8rRscg67uL1MWhhg66wAXU8kbRZj9Vmo
         6wZIHnqQyHJfM+ZWCIJlIdtv0CTxCpursXjQIZ3pk3dxwN9qcLJ+7iFYI6V1Z7z6mqqt
         rnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvQLb/KAGxn8G0pbZn8mBq3MLR7pk5cUNdkQat7p5XarOBS32ZGnL7m7iukXFWknP1Xx1A@lists.linux.dev
X-Gm-Message-State: AOJu0Yy18WfddLhScWuHcs/2stMdezjwfwhE3PvysZlWdF2hDXnyDzXY
	5k/by+7zzMOvlpexrOt7Lzy8HnDSd2EBl+BInnxFLcppbtl2NMBS
X-Gm-Gg: ASbGncvUw5DiHlkRdqgzMTXWZylZ20A+mOzDHc8zJcOigntvUNVtDQGLh5UCS1nyV4v
	Cu0Y08icurcMx5P6QlA4KC0vdt0VRZxrDgr2KR1N8DkOleJhLkh3z7edcp/XB13NVTL2mqOAZds
	Q+GToVvkOsDnhJx08TG/t/lXO4MSowTkthk0mMaGs4cQHa6faQvDe8JvjpLg/ydr9NYiqCzxEh1
	Ym8LjlRMGtgkqdxmK8iUgu4qpp7RlzqIdZz2dZLo2eeoRidn1smUI2NID8v/9BzI5zVuLIY10aY
	3f6Y0pxZdOqdtDbuRXgv26/LgxF/yx8T/qblebP3usIHhk0=
X-Google-Smtp-Source: AGHT+IGBdHGCgeNshPJJKZC50TTfEiy645VHLxmD83MvdzSEJGrm5DB7mtec4EoaXeeO28cwrmDXkA==
X-Received: by 2002:ac8:5a16:0:b0:467:75fa:8c9 with SMTP id d75a77b69052e-46a4a8b3472mr8974231cf.8.1734645452740;
        Thu, 19 Dec 2024 13:57:32 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6788b3sm10243841cf.26.2024.12.19.13.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:57:32 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id AB3481200043;
	Thu, 19 Dec 2024 16:57:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 19 Dec 2024 16:57:31 -0500
X-ME-Sender: <xms:y5ZkZySV8bXPqTr2GUGEeKP9nsO_BEiLrItYuGCdtpq49AZssc1XUw>
    <xme:y5ZkZ3z0AIHp38KB_fcgLphJiua-JzGbY_Ry7PxKQUdcCt3QzmD8fwj1uQT5Zo6P7
    ZcHwGS88aYgT5d7QQ>
X-ME-Received: <xmr:y5ZkZ_3Yv6p9E0Owqavi6jRd8KXskONt1Ea6EOtdAj9aBcV3MaJ3INreu5zJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoh
    eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhope
    ifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehnuggvshgruhhlnhhivghrshesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:y5ZkZ-AdwsQeAHtbV882qkysvwFnHMN9DCbU0jjVHyI4c_fLlMTglg>
    <xmx:y5ZkZ7i8QTQGdxpyz7VDlDPm8-2-BffLO2lSu7mtpedwyndbXiNP1A>
    <xmx:y5ZkZ6pGEVrryF70ZULpJbPMWM8ZJv6Z7DQ0G9gMY4YCJW0c_2DaQw>
    <xmx:y5ZkZ-hjLeKGbUj4OrVvZhxM8IbqIRQ93vwc7TzFW1Ov_bnpk2JmhA>
    <xmx:y5ZkZ6TGpmctmJLlxhsONJ4ThksM8ePUFRtk6S2h258Xca3oF8VJVyq_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 16:57:31 -0500 (EST)
Date: Thu, 19 Dec 2024 13:57:30 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Mark chain_hlock_class_idx() with
 __maybe_unused
Message-ID: <Z2SWypPS7Lc2CXb6@tardis.local>
References: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>
 <Z180HFO6a61PtzYm@tardis.local>
 <Z19IYHyBbxf4csGB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z19IYHyBbxf4csGB@smile.fi.intel.com>

On Sun, Dec 15, 2024 at 11:21:36PM +0200, Andy Shevchenko wrote:
> On Sun, Dec 15, 2024 at 11:55:08AM -0800, Boqun Feng wrote:
> > On Mon, Dec 09, 2024 at 07:08:10PM +0200, Andy Shevchenko wrote:
> > > When chain_hlock_class_idx() is unused, it prevents kernel builds with clang,
> > > `make W=1` and CONFIG_WERROR=y:
> > > 
> > > kernel/locking/lockdep.c:435:28: error: unused function 'chain_hlock_class_idx' [-Werror,-Wunused-function]
> > > 
> > > Fix this by marking it with __maybe_unused.
> > > 
> > > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > > inline functions for W=1 build").
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > This looks fine to me, so I'm going to queue it, but could you do me
> > favor if you could share the exact configs that would make
> > chain_hlock_class_idx() an unused fuction in kernel/locking/lockdep.c ?
> 
> I might harvest this when I come from vacations (some around mid-January).
> 

After some investigation myself, it turns out that
chain_hlock_class_idx() is defined outside "#ifdef CONFIG_PROVING_LOCK",
but only used under CONFIG_PROVING_LOCK=y, hence the unused warning.

TBH, I feel we should really clean-up/consolidate those "#ifdef" to make
internal definition/usage more clear. But nothing blocks this patch, it
fixes a real issue, I will add the CONFIG_PROVING_LOCK part in the
commit log. Thanks!

Regards,
Boqun

> > I might add these information in commit log.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
