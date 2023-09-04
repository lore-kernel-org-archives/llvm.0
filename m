Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A5937E
	for <llvm@lists.linux.dev>; Mon,  4 Sep 2023 03:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f0F1mT0oTx0cuxqaIamdvQUQP90eouQn4jLAgHy5Lho=; b=SH9O2kzmjwTcdAresHcuTllhNM
	wIJ50gPWrtRS0vyNfVkhn/+IYH9mvdX8xPUtTAjGr/2IbW94zxkwtNBIkhNbN6IS69JtYdD1q/XAo
	t13UXd8hxOqeKHncB/mMFr7tOaTuZy0LnQ0SR+3szubrB4KoRF8OMZCBzuai3yuYPcF9F+5GLSzsu
	ulrnW8EicTg5oyx+KdWadfkfR9+L5+qEBP4zQ+VSkSCDZTSuIY4x0b1lVx9YdWzQklQGgE9ZiHfjV
	u7kNO6l9vk7MeCq6xDN7KVS0+s6rDIf2g4n9WKwgHGVdBCoNcuW9YoOtkc9rjFTjQuyX5glDhDtRb
	cKPVBeiA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qczrF-003DLH-2p;
	Mon, 04 Sep 2023 03:02:33 +0000
Date: Mon, 4 Sep 2023 04:02:33 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Dave Chinner <david@fromorbit.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>,
	syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>,
	brauner@kernel.org, djwong@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org,
	ndesaulniers@google.com, syzkaller-bugs@googlegroups.com,
	trix@redhat.com
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
Message-ID: <20230904030233.GP3390869@ZenIV>
References: <000000000000e6432a06046c96a5@google.com>
 <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f>
 <ZPUIQzsCSNlnBFHB@dread.disaster.area>
 <20230903231338.GN3390869@ZenIV>
 <ZPU2n48GoSRMBc7j@dread.disaster.area>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPU2n48GoSRMBc7j@dread.disaster.area>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Sep 04, 2023 at 11:45:03AM +1000, Dave Chinner wrote:

> > thread B: write()
> > 	finds file
> > 	grabs ->f_pos_lock
> > 	calls into filesystem
> > 	blocks on fs lock held by A
> > thread C: read()/write()/lseek() on the same file
> > 	blocks on ->f_pos_lock
> 
> Yes, that's exactly what I said in a followup email - we need to
> know what happened to thread A, because that might be where we are
> stuck on a leaked lock.
> 
> I saw quite a few reports where lookup/readdir are also stuck trying
> to get an inode lock - those at the "thread B"s in the above example
> - but there's no indication left of what happened with thread A.
> 
> If thread A was blocked iall that time on something, then the hung
> task timer should fire on it, too.  If it is running in a tight
> loop, the NMI would have dumped a stack trace from it.
> 
> But neither of those things happened, so it's either leaked
> something or it's in a loop with a short term sleep so doesn't
> trigger the hung task timer. sysrq-w output will capture that
> without all the noise of sysrq-t....

Here's what brought sysrq-t:

| > The report does not have info necessary to figure this out -- no
| > backtrace for whichever thread which holds f_pos_lock. I clicked on a
| > bunch of other reports and it is the same story.
| > 
| > Can the kernel be configured to dump backtraces from *all* threads?
| > 
| > If there is no feature like that I can hack it up.
|
| <break>t
|
| over serial console, or echo t >/proc/sysrq-trigger would do it...

A question specifically about getting the stack traces...
