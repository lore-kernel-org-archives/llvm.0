Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F510782
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ijMl1Cv9y9enj5ovf4v4qSeTqopWOU/OBedk6+5VrX0=; b=o/MKFZwzv0jFes6m40Ybq+6Z0l
	OWIXSREb5FqwPLK9im6nfojshNNzR9gGww1EgQvj76Ej9giQjz3yyzFzjd7Rj3nJetHlcUkV9fjIe
	cNSMlm/f+nZl+Fxhi9N5p3eiqBsOnPOeIw1dXWBX8uA8DcJqXJom7btsb/G+h8HlnamwkaC/mjjtP
	SRw7Q4CT8pAJQQr4a/m2eLHsCGCh+H7hneUdZpjKETk+toWv44Q2f1yUxdj+Xo2KqkFl9rtT3fFg2
	CCezJyFkdXV4rOpe1TAP3jleOtN3PXyl6k+LcnwXQtHFnFIzrp5x+H6CEXXi/bgoPpgV8zDPR+LFq
	akNUH4qg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1VN-005K1E-1M;
	Mon, 24 Jul 2023 19:46:05 +0000
Date: Mon, 24 Jul 2023 12:46:05 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: syzbot <syzbot+9e4e94a2689427009d35@syzkaller.appspotmail.com>
Cc: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, llvm@lists.linux.dev,
	nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [syzbot] [modules?] general protection fault in sys_finit_module
Message-ID: <ZL7U/V3SFaJndkhW@bombadil.infradead.org>
References: <00000000000094ac8b05ffae2bf2@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000094ac8b05ffae2bf2@google.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 910e230d5f1bb72c54532e94fbb1705095c7bab6
