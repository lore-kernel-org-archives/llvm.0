Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCA2FB6
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AYmPB6eKX/pK+eH7NmvpIyaBhO0aePPARgfiAYIigdk=; b=wFoyhuxXtvPIqJZ6PEFFXJ9fjV
	mJohraR43/WrtV99f3DQJwBTVIQBSOMjsE8vCVdJJVSw1jzPDQ1IKaDjzFbp41x69Z+TTlDlJiYn7
	IBLp4HqTpzfnIH7z8fbaI9jB/iQI55djcyNegdh2D6tGQ3XSrTu/0hx4C8ZuZqWMQYS3whJr0c6OR
	4dbHevzw5168GzLw2TWpHAWltiXahXdFP+TbkxcCCWQs71kncRwLvv165YxrTiQ5fM3vxR7APQViS
	yeMRGOtCA6Up4tdHnRjYJeWsLuuqVAigN/8CyIlT8MuJWswCiTs5HzO6xYlYrEJoxAazxg6lS5ror
	tTLK+A3w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qO2D8-005NqM-0A;
	Mon, 24 Jul 2023 20:31:18 +0000
Date: Mon, 24 Jul 2023 13:31:18 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: syzbot <syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com>
Cc: bpf@vger.kernel.org, chris@chrisdown.name, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, llvm@lists.linux.dev,
	nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [syzbot] [modules?] KASAN: invalid-access Read in
 init_module_from_file
Message-ID: <ZL7fllo9Td1gJmHo@bombadil.infradead.org>
References: <0000000000000e4cc105ff68937b@google.com>
 <ZL7Una9vhJpX+dkb@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZL7Una9vhJpX+dkb@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 910e230d5f1bb72c54532e94fbb1705095c7bab6
