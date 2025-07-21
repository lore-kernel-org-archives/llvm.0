Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF455299957
	for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753105844; cv=none; b=Jkw5/2/LvLexvghg2L4xgXcWsVQRI7xv1rfIQH3M+Kzd5UcxUy+nMZztAGIOQziPAavCtdHFOECexy5ukbgpydQwl0ielleVsywG2O+NlXhqIH/7KpHax/xdyTO0k8oxR4atdFEeLO4fFsQZ3F4aS+SjKOdpzSpU0RdENed1wxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753105844; c=relaxed/simple;
	bh=Ouh+Rb2DpWa0BE8kZFuhuQSkkgiHTdJ5Enf6J0Q61q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhLGbdy7evSraVY2BNUjFy4OTKZ5H3DJ/CYE6MDwVBMAzuu1S9IZmbxoBKNAD/aQmWtYxHrzpVY37llgAFAHPyOR8seYeEZ+7x7cyT4nyDfS1zXm2ff83rYhEz7kydZJNqkz58JeI+XCb4Pd6oR8guEl99gYJRHK8jqVGFZHGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmY6Eehy; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmY6Eehy"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab6b3e8386so47827521cf.3
        for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753105842; x=1753710642; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kDWJYEkMDweMn2MG5CYOHj9gUw0O9qH9V4td8BhypXE=;
        b=kmY6EehyRKTTsy2GeJvD3xCPj7G25lmwWl/gXF0ydxMPm9D2PJxHCIVKIUkgWbpCaq
         lokpmo6E+25i7XDCfpt9n+5Ew3AEhWBE8IfcjlquKPC5a52pU+/LMbjiLEMzCrFx0DHM
         NvqEI9bhp/v29rzuflO2rrGhUXtGnvtgs25rffGdAvXmQPANkPYH4TYvqBaT3e6I62Kf
         uEGUqRcyMkvUlJViv1j5iJfF5MnaSHehvq3Dc25tiv7yPn3kQWId0t8km9cTb+udulxC
         zJBtHdNC9IVIvTq6fJ1/4gttAnom9GCGE/1wdVmDOfD2+RDrbb6wz7t9eV5FB770kqJ7
         qkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105842; x=1753710642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDWJYEkMDweMn2MG5CYOHj9gUw0O9qH9V4td8BhypXE=;
        b=q7cQFDuqdT6Y8YHHLi1MTCpzH3pRwM4ZFblHjcFcizqc9+lGxQsJqb9VwCrAbDRdou
         p8aPlsDHghISJOd6ZBDJ7g5AbuZYNSHaZlWCA0Xhimo1wL+Va0164HZ76WTb+9iL6FjP
         E64t4zct/4mpKZUrnPoO0Wc/G5bRPW593jYkEI580ynGJotrfbOlgrHWlxM95Cf7kGBI
         6Kh7gxWGQKD5ZINAdriNB2nVjlg02PcqD4CmPDH4YlnZ5AJgORGM+87w5SE6Ljbldshu
         lN0+nI0mGvx0dW8xbk1M8GJAcPQWNHcmgR6RAWtLbxVXecHRYsq4YjalpTO9Q0MuoEdq
         Yycw==
X-Forwarded-Encrypted: i=1; AJvYcCVFoUwT+McQULtE33GiOOL7sn2WVOdtcwGxjPxTgiMV+RqFwPQJMKUKWVXOzbp9nBedpxwJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx5Cnrtn9tNtoYz2e1PkXkoAB4ipw/h8/oBDzYjKvvxLXHn8N5
	GP5Lar+X0+YlYmXeX3gW7Z1Zcn5cfk2gC45+yeeH44qDcS16NzKBzlu4
X-Gm-Gg: ASbGnctNphpLvawEfUkek7si4oSrkoGkGmBDVkItc7IykqGeFudkwLMZseXfFjLiFRc
	seCZ6tq7ba96s2yFQxyCNqGicNksEn6Tpqg/SjHvJzehADgdP3I7tivj+CQ5YttIfKXyYWF8sxJ
	LEecma77GKS4pUjuEwdmFhVkn9FfjZQXtx+zNAGcLkQA62v/3w3zJDVEcITQ3HEvtGV3Q/nyFf2
	PtS9hhU/0TrG6dxveTVpTcnHMfOlP8FsqVU63p9AQ69wX1GuHIAsq6b4oAXiY1EEYf5CsbWMvmx
	6cfIlzm8aSMku4q408x2zEXhQk2gtNvaiIflNF3SjzMbaGg0F1wkReZ84GSOfSnCqSkqnUWd5eN
	ALyib7gyabvuPr9hta7LHkG0i7aBdoKCUZuvnIaiHC/wY2iPE8IFZ0k+dNnElwk5H/ksecwexum
	Yz6DPKZaRpwR2FeCQ1WVJY9ws=
X-Google-Smtp-Source: AGHT+IFmrPwcjbXv7D6cvTSAvEa9bZ4UiiY9QfKEDHjEmYMvt6DyjTBIN4LKxmXUR6KBkas/qE7PnQ==
X-Received: by 2002:a05:622a:2987:b0:4ab:50bf:e9d0 with SMTP id d75a77b69052e-4ab90987701mr241335011cf.8.1753105841389;
        Mon, 21 Jul 2025 06:50:41 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b57d78sm42149441cf.73.2025.07.21.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:50:40 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id ECD79F40066;
	Mon, 21 Jul 2025 09:50:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Jul 2025 09:50:39 -0400
X-ME-Sender: <xms:r0V-aGwNuHBLUz9FIKEiQA9u5kwjtrMjUj5i-ydgJCJlsBesA5WY4Q>
    <xme:r0V-aOYJ22wa2HiQImGDVi7Af5p7QW4lbpiSRU1KMq1VSHdRERXoYNRN8OMSFYyO6
    fs8MGcjn_Gafkut4g>
X-ME-Received: <xmr:r0V-aBn3hHX6w91J3-Axk5BrnCMzqmunPKSB0945WnQqc_X8tyL9aF4k-RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmh
    hinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhhurhhirdhlvghllhhisehr
    vgguhhgrthdrtghomhdprhgtphhtthhopehvihhntggvnhhtrdhguhhithhtohhtsehlih
    hnrghrohdrohhrghdprhgtphhtthhopeguihgvthhmrghrrdgvghhgvghmrghnnhesrghr
    mhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtg
    hpthhtohepsghsvghgrghllhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:r0V-aLkQjUzD63dh2EgEL3kRgcGo5g1Xjor2jwIJp6Ko2j59znGKlA>
    <xmx:r0V-aMNLIoSkHAEHrwxwHn8l_1DsSO8Ja-9f5NzrZHvvYZMZpFQ8Wg>
    <xmx:r0V-aNpoUdlAaTJtSiSPkH7ZE5GEb0wkRRwECI4CITcO_oJMrNhnmA>
    <xmx:r0V-aHQDoAJm5WrK3Mh2iQtg05p296ka2jMluRSsqtFNoOxkSRBk-g>
    <xmx:r0V-aFb8x-QJ1J1Hmcp20IJxKj61HAkTw8mGTL-jbxHiB5wswtbcQ5Zq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jul 2025 09:50:39 -0400 (EDT)
Date: Mon, 21 Jul 2025 06:50:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: Re: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes
 for v6.17
Message-ID: <aH5FrrpORLWpDCkk@tardis.local>
References: <20250625051518.15255-1-boqun.feng@gmail.com>
 <aGKWIFVl4nwSl8SG@Mac.home>
 <CAH5fLgj1C-BVAfK8Qoaxb4hV=s74-SNPUeHq9LtmQ5q8aqcd-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgj1C-BVAfK8Qoaxb4hV=s74-SNPUeHq9LtmQ5q8aqcd-g@mail.gmail.com>

On Mon, Jul 21, 2025 at 01:00:49PM +0200, Alice Ryhl wrote:
> On Mon, Jun 30, 2025 at 3:50 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Tue, Jun 24, 2025 at 10:15:13PM -0700, Boqun Feng wrote:
> > > Hi Ingo & Peter,
> > >
> > > This is the updated version from my pull request last cycle:
> > >
> > > v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun.feng@gmail.com/
> > >
> > > Please take a look, thanks!
> > >
> >
> > Ping ;-) I forgot to add that this is a dependency for Rust version's
> > read_poll_timeout(), which is a dependency to a few things:
> >
> > * In the `Tyr` driver:
> >
> >   https://lore.kernel.org/rust-for-linux/20250628.224928.690831629261546521.fujita.tomonori@gmail.com/
> >
> > * In Nova, the gpu driver:
> >
> >   https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-24-ecf41ef99252@nvidia.com/
> >
> > * In the qt2025 phy driver:
> >
> >   https://lore.kernel.org/lkml/20250220070611.214262-9-fujita.tomonori@gmail.com/
> >
> > Thanks!
> 
> I would love to see this land to unblock the above users. I wanted to

Thanks, Alice. It's already merged in tip tree:

	https://lore.kernel.org/lkml/175153176741.406.14557081807475800171.tip-bot2@tip-bot2/
	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=7e611710acf966df1e14bcf4e067385e38e549a1

> add that I fixed the Rust language so that it NUL-terminates these
> filename strings, so Ingo's concern from the last cycle should not
> apply to this version of the PR.
> 

Thanks a lot for pushing the changes at the Rust language side.

Regards,
Boqun

> Thanks!
> Alice
> 
