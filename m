Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FEB622
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 02:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC02FC433D2;
	Fri, 13 Jan 2023 02:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673576766;
	bh=IP2gv1lTVyvsOnZCZLK4oCIKQqjrH8jP6S6HKbMvK+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWlQxI+haamKaSA4y73abmE68G+07SlfaDFORGIyKKcfmyMJNq9qC2UyKF08c8jv5
	 eMYw/7Rd98qwIxFP+qECBAQTmuID8FLkLc5Jl9iro9eB8RtgVRjT5hkyJ32f4zzyDf
	 1dZjlArfXlIbS2OFbAg1JbfFzvSelHFBIsYrKm06IdRGk7qHKs6jmrTkxkuymPobVt
	 HA8S997AtuHFQMuOX2+WRQatC+4hYmGw0i0AAbM4gc9dmNWokA4otw6HPh6n3FSPHs
	 x/viqyVHsuxDL6ckuJwh9xv3w0DjJcikxRF5SnujxI7dshe4uqXhqug+yb4dJB0YDF
	 rXlCP+dazW2kA==
Date: Thu, 12 Jan 2023 18:26:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	syzbot <syzbot+8317cc9c082c19d576a0@syzkaller.appspotmail.com>,
	adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com, tytso@mit.edu,
	viro@zeniv.linux.org.uk
Subject: Re: [io_uring] KASAN: use-after-free Read in signalfd_cleanup
Message-ID: <Y8DBPLh694GFKl8T@sol.localdomain>
References: <000000000000f4b96605f20e5e2f@google.com>
 <000000000000651be505f218ce8b@google.com>
 <Y8C+BXazOBbxTufZ@sol.localdomain>
 <9d8339cf-5b66-959a-254d-839c0de92ec8@kernel.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d8339cf-5b66-959a-254d-839c0de92ec8@kernel.dk>

On Thu, Jan 12, 2023 at 07:17:25PM -0700, Jens Axboe wrote:
> On 1/12/23 7:12 PM, Eric Biggers wrote:
> > Over to the io_uring maintainers and list, based on the reproducer...:
> > 
> >     r0 = signalfd4(0xffffffffffffffff, &(0x7f00000000c0), 0x8, 0x0)
> >     r1 = syz_io_uring_setup(0x87, &(0x7f0000000180), &(0x7f0000ffc000/0x3000)=nil, &(0x7f00006d4000/0x1000)=nil, &(0x7f0000000000)=<r2=>0x0, &(0x7f0000000040)=<r3=>0x0)
> >     pipe(&(0x7f0000000080)={0xffffffffffffffff, <r4=>0xffffffffffffffff})
> >     write$binfmt_misc(r4, &(0x7f0000000000)=ANY=[], 0xfffffecc)
> >     syz_io_uring_submit(r2, r3, &(0x7f0000002240)=@IORING_OP_POLL_ADD={0x6, 0x0, 0x0, @fd=r0}, 0x0)
> >     io_uring_enter(r1, 0x450c, 0x0, 0x0, 0x0, 0x0)
> 
> This was a buggy patch in a branch, already updated and can be discarded.
> 

Then let's do:

#syz invalid
