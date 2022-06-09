Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115CE20FB
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KZQDSbbB2xXFPYcYXWliunjDP+JIiOJaCJx8gslKoxk=; b=SDxXJ+OjjpJl5hiNOD5mb9QB2M
	QOEJ2sQFsyt2vQYng8owapHSWT+i5AJic7Bi20gBmGbARAXoUE77wdDCxsNu1l6mwgGWnPZYMSQbC
	12XH5NrX6vWaUOn4berkyfTAsOA0FYzgRR1F2spNVybCMcQ5pg95VBvtaAZeB1ALAD7LR/3OIVoev
	YCo6aIIPP3vXBUKMjNVrSkN8VfCX4cc0d1/Tm0DrtbPSXW57xyghoCo0b4bKXImWJHHzhyjJCszRr
	5ouVRN0bwX2qNaMeSXGMIwtym7dqFiaMolFVmu5MuV1cA+Vew7vzxtdLD6nLBB42L5YTxU6eE27vk
	U9Boiu0g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzNBE-00DloB-Qi; Thu, 09 Jun 2022 18:46:52 +0000
Date: Thu, 9 Jun 2022 19:46:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 02/19] mm: Convert all PageMovable users to
 movable_operations
Message-ID: <YqJAHDKlbGzhNdgH@casper.infradead.org>
References: <20220608150249.3033815-3-willy@infradead.org>
 <202206092341.s0Iay4wA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202206092341.s0Iay4wA-lkp@intel.com>

On Thu, Jun 09, 2022 at 11:27:13PM +0800, kernel test robot wrote:
> >> mm/z3fold.c:1505:24: warning: variable 'new_mapping' set but not used [-Wunused-but-set-variable]
>            struct address_space *new_mapping;
>                                  ^
>    1 warning generated.

Thanks, fixed.
