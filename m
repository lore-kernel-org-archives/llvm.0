Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689810F5
	for <llvm@lists.linux.dev>; Mon,  4 Sep 2023 08:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D95C433C7;
	Mon,  4 Sep 2023 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693815818;
	bh=X9oWyqCbB2rKdV0IJ5r05rZOHmU/29ZmUxFASRi2Z9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZscYfV13IpDaANAevgUJdJjM6qFYc5HNCJpHq/PXpmC61Mm9m3E+Bh17g4gMIWLeu
	 WqVzJXRcG1+nPOS411eMQ/8Knh9Hnj0Ak4c1klRHcSuGzOI+Posap06lQYg9GcuYqn
	 mRLwdrjAMn1qREeyKbsdIxfm9f81b5sw1v690WRK5pNRhfEJRO9RwCMQ59WeYPuS+i
	 uQ3Rp+ZzgIrlXXbyP+LAXeDS6MjKJOzHFppQuq9+YMsUboug2syKJvfiSPLV11Wrwn
	 sE/o8DRjEPHjnxYwDy5IFA5RK5MsAnh5jQTU9lCrkAuJV+zLzrAAqUvfGLV9HxOHqT
	 eCPaOa+AD+jFg==
Date: Mon, 4 Sep 2023 10:23:33 +0200
From: Christian Brauner <brauner@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>,
	syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>,
	djwong@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com,
	viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
Message-ID: <20230904-nashorn-gemeckert-3ca91ef71695@brauner>
References: <000000000000e6432a06046c96a5@google.com>
 <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f>
 <ZPUIQzsCSNlnBFHB@dread.disaster.area>
 <CAGudoHE_-2765EttOV_6B9EeSuOxqo1MiRCyFP9y=GbSeCMtZg@mail.gmail.com>
 <ZPUSPAnuGLLe3QWH@dread.disaster.area>
 <20230904-beleben-adipositas-ac1ed398927d@brauner>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230904-beleben-adipositas-ac1ed398927d@brauner>

> > Which is pretty much the case for all filesystem bug reports from

I think we should at least consider the option of reducing the number of
filesystems syzbot tests. Filesystems that are orphaned or that have no
active maintainers for a long period of time just produce noise.
Slapping tags such as [ntfs3?] or [reiserfs?] really don't help to
reduce the noise.
