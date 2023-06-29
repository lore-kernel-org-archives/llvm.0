Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCF1C07
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 03:35:32 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-117-150.bstnma.fios.verizon.net [173.48.117.150])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 35T3Z9nZ001101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 23:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1688009712; bh=8kjIV4lIzkhZOX9U+hzvz1B+7tNY+I1GSOViXiuWJss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqn7Txnw2HRfGKZv/SAQj+uRsMBt9ipF6TT9l9Tf1LmeYLlvHcKMAbos2A301QRhU
	 wSGJMn6pTGOVWeem9IHvo/YR5RLozu7G0qPdt0+WuK+yS4fPdmLf2Tq9o6CtqE0SSD
	 FQhe2RP8sHKDirowwmFlL2e+C0R5wuPM0VF3OGhh/HCmHULMVkYJklSjCPZp4ZXq5f
	 aPhpWpUAokngFhmk6qYpcGZtechu/JDejwTSf5Pa2HDk85seIqt8UFA1QO1uGlP7uJ
	 qx5+98AXYWsHXNW6IffoeZ3W+EiR1nyagV0hSuARL+zIKnrtrE9h3S6rCrfLj3+P7q
	 vyXx49HEp7Frw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 68B9115C027F; Wed, 28 Jun 2023 23:35:09 -0400 (EDT)
Date: Wed, 28 Jun 2023 23:35:09 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: syzbot <syzbot+f4cf49c6365d87eb8e0e@syzkaller.appspotmail.com>
Cc: adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
        syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [syzbot] [ext4?] UBSAN: shift-out-of-bounds in
 ext4_handle_clustersize
Message-ID: <20230629033509.GI8954@mit.edu>
References: <000000000000edf08305feb6a5f6@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000edf08305feb6a5f6@google.com>

On Thu, Jun 22, 2023 at 05:01:44AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    1b29d271614a Merge tag 'staging-6.4-rc7' of git://git.kern..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15fefd03280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7ff8f87c7ab0e04e
> dashboard link: https://syzkaller.appspot.com/bug?extid=f4cf49c6365d87eb8e0e
> compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.

> UBSAN: shift-out-of-bounds in fs/ext4/super.c:4401:27
> shift exponent 374 is too large for 32-bit type 'int'

fs/ext4/super.c:4401 is:

	clustersize = BLOCK_SIZE << le32_to_cpu(es->s_log_cluster_size);

... however earlier, in ext4_load_super() we check to make sure that
(es->s_log_cluster_size) is no more than 20 (EXT4_MAX_BLOCK_LOG_SIZE -
EXT4_MIN_BLOCK_LOG_SIZE).

So it's likely this is either a while pointer corrupting the
superblock after we've checked the value, but before we try to use it
later.... or this is another "some thread is actively writing to the
block device while we are in the process of mounting the file system".

Since it's only occurred once, and we have no reproducer, it's
impossible to say, but we'll just ignore this for now.

	      	       	     	  	      - Ted
