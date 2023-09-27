Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D759A1170F;
	Wed, 27 Sep 2023 15:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE700C433C8;
	Wed, 27 Sep 2023 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695827332;
	bh=rVJ3mC+n/SWejnI1i+ge/9fNDBh8INviovzGEmpuCQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdhqwJM9IvrABPs00ahx0ck9XgmygnDQX1cG1z7uMeIHU49TstmxhFwfVThmw0Ki4
	 ju7moZfFlQxvuJ2S3oA2MJI6+SgLZi5LCT0k7frw2YEH0nzqulZNoNabRmH8QWoZAt
	 SGmuKKTQooxbJMXmD6vEgDTp2uZHCpztJi/sJUkArw+ynY5BpUfmauWsEhYkpu8hKB
	 SvxCC/VcS0/QXjzLHOzdMvf68jIEBDx1gtUTlejOLEQ0ZkToIydyKqdrvaRt3w+9OG
	 RXD4mI19eofbAbTLWjL6VQyA/bTopiOa9GwttMfgUAeJoTiFg6bV4wQ3BL27a+AHyh
	 6+F2OgysjfUxw==
Date: Wed, 27 Sep 2023 17:08:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: syzbot <syzbot+bc79f8d1898960d41073@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, hch@lst.de,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com,
	trix@redhat.com, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in
 ntfs_write_bh
Message-ID: <20230927-armaturen-bestochen-e438ec36aa99@brauner>
References: <0000000000006777d506051db4fd@google.com>
 <000000000000553a2106064e3d86@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <000000000000553a2106064e3d86@google.com>

#syz fix: ntfs3: put resources during ntfs_fill_super()
