Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB262C80
	for <llvm@lists.linux.dev>; Thu,  7 Oct 2021 07:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tvaAy35J1UGqU3n7MVvnLPYDN8oXHxvNa5M7Uym2krM=; b=QaNrUmLw6uJjGL3ubgT9n7HnY/
	1h/q2HDwcTXwCYdbOxt6wLBW2jL0dOJ4pkcIx1LHNeazRSs5sHXLf01OIucfnRhoJTSAiz7H8aZzD
	XzGKHLV7tk9oS95TduTOFQA5o5jQS4wN0xfjDn0JiDAig90cUvhGGzf+r7+Dslx0/WIB0drSfJ+L+
	XkWlxgg2vCyyc+j+dGkH+gUPYezgqu4jWeExjS8riERxK2xem8+xOZRBw9qZ1vbyAljb1LBJYRKf3
	jRepmVkPePZYp7Heqj0DHGnUv694wf3Y1KI+Ofr6eDvKqsMc9hI6RgQp4qVd+paSMrcXRvQTYhs4g
	1voFx1hQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYO8x-001dho-Pr; Thu, 07 Oct 2021 07:48:53 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id BD8C698623A; Thu,  7 Oct 2021 09:48:43 +0200 (CEST)
Date: Thu, 7 Oct 2021 09:48:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, lkp@intel.com, yujie.liu@intel.com,
	oliver.sang@intel.com
Subject: Re: [peterz-queue:sched/cleanup 38/40] kernel/irq_work.c:44:6:
 warning: no previous prototype for function 'irq_work_single'
Message-ID: <20211007074843.GO174703@worktop.programming.kicks-ass.net>
References: <202110071515.2ivww4qz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110071515.2ivww4qz-lkp@intel.com>


This mail has dodgy headers:

To: unlisted-recipients: no To-header on input <;

Is the robot sick?
