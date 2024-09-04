Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08101D7E3F
	for <llvm@lists.linux.dev>; Wed,  4 Sep 2024 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452992; cv=none; b=MNFXrodYke0yEjlNpoTm4M77yqE4TbkMhUhEUSzQa7XLavae+JCYSOTA0OgYVEJRGI+KixrDKVNAtMAYNkfqHQ+or/rZGC/SUTG5NAU7YcRUZKmOLibroEMIT+AAGIU2/7MVemKnay7eEwlRKtmsD3NDuMPAcirfrlGTQb7L5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452992; c=relaxed/simple;
	bh=sFm2HpUoj2CaPhjOOZkuLbu82utaZ07dktMJYD+N+KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=RAiYGUJrTnRyNEheR8CR9z4kdD2VBhg1DaoB5kZ8YRotatk3K+OGGYlaSJq1lCNvRV7T6r24KqhAwJjyxoP0kf6o5MMxKTfMfmo2911sElmlCGTx1T3NGRiL3rcWx40D/ZF8HGxGh9rr4/kDa9v+ehrfniNQTXxp1lghz34cHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iorw.io; spf=none smtp.mailfrom=iorw.io; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iorw.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iorw.io
X-QQ-mid: bizesmtp91t1725452913tk5jw6rs
X-QQ-Originating-IP: SaysuuqQVKOz++TcBwpN6cWTk6uo5XmvwZdgQeuDIY8=
Received: from localhost.localdomain ( [203.119.160.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Sep 2024 20:28:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 956775205899086131
From: Zigit Zo <zig@iorw.io>
To: stappers@stappers.nl
Cc: anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	johannes@sipsolutions.net,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	mingo@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ojeda@kernel.org,
	richard@nod.at,
	rust-for-linux@vger.kernel.org,
	tglx@linutronix.de,
	x86@kernel.org,
	zig@iorw.io
Subject: Re: [PATCH 1/2] rust: arch/um: use 'static' relocation model for uml modules
Date: Wed,  4 Sep 2024 20:28:10 +0800
Message-ID: <477D5EA32B25AA05+ZthOusZtXttQOf3B@evil>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <ZtgopAHp+I2+xCIz@gpm.stappers.nl>
References: <20240903130606.292935-1-zig@iorw.io> <FD7D773099A0C7EC+20240903130606.292935-2-zig@iorw.io> <ZtgopAHp+I2+xCIz@gpm.stappers.nl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:iorw.io:qybglogicsvrgz:qybglogicsvrgz8a-1

On Wed, Sep 04, 2024 at 11:30:12AM +0200, Geert Stappers wrote:
> I failed to match the actual change with the commit message.  Consider
> that ignorance on my side.

FYI, I'm using the master branch of the upstream, but yes it's in the
'rust-next' or other branches as well, so maybe not a big deal IMO.

Of what 'https://rust-for-linux.com/branches' says, maybe I'll use the
'rust-next' branch for the next time, thanks for pointing out!

> I see a problem in just renaming a variable, might be my problem.  Thing
> is that removal of 'KBUILD_RUSTFLAG += ' feels wrong, hence this posting.

I think this is fine, the 'KBUILD_RUSTFLAG' controls the 'PIE' flag for
both the kernel itself and the loadable modules. And yes, that's the only
way I can make the 'PIE' flag out of the modules while keeping the UML
kernel itself works, and the 'scripts/Makefile.lib' I tought has placed
those flags correctly.

What about adding a 'static' flag to the 'arch/um/Makefile' explicitly,

---
KBUILD_RUSTFLAGS_KERNEL += -Crelocation-model=pie
KBUILD_RUSTFLAGS_MODULE += -Crelocation-model=static
---

but that's just a redundant of the already defined 'KBUILD_RUSTFLAGS'.
Have no more ideas what can this flag goes wrong :(
