Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF7101CB
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jt72MNl3swMARzj53k4BB65l+UHgCy67wPWcGfx/NOk=; b=HikHJobVOYJmiv1G3z0sNjBRUC
	E32VxxdtnfRht167qmJJO18u//Qb1jaDqmUdIGtdOHNkxZKeoBiN2poJrR6f1pEtNJJ0IiBKNr4YF
	PILWV69/8e/P+rkfrv9wIQY9bblY4CuXo5YdyGUlS4DPpWaOBKBftEVaz/oAE1aizladxWrf7Ygmg
	cTzQ2nLGBVeKvAz1xjk3sQAe/M/KM0xA866IkiWhizPVbu4bV+Fwo2hGoEEE3TbIfy+suMjjz26gw
	nVf2XrmgqM3aTaiURwGAUcnIYQ1eANLBPv7FMYgeTIxDs/XLLQzbg9lrTXh9tmmrKjqr+Dq5euc2F
	f6ng6+qw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1TF-005Jop-1P;
	Mon, 24 Jul 2023 19:43:53 +0000
Date: Mon, 24 Jul 2023 12:43:53 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: syzbot <syzbot+9c2bdc9d24e4a7abe741@syzkaller.appspotmail.com>
Cc: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, llvm@lists.linux.dev,
	nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [syzbot] [modules?] WARNING in init_module_from_file
Message-ID: <ZL7UedKQUDAUThHM@bombadil.infradead.org>
References: <00000000000076961f05ff92d4e0@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000076961f05ff92d4e0@google.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 910e230d5f1bb72c54532e94fbb1705095c7bab6 
