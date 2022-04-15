Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C857A
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 21:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c1FZCxRnGrJRubQTHg0gxw7lJJkUpVb13+tAV+wVPp4=; b=F4bXuotjQ+ssHvTmcX+QOYUpg0
	cyl53WDqm5KTR6JDiqEIysmuDYH/KRRqoIp8EGMXxmPcHpDbHNvu+IRsmG53sGvLDIM4GistcD8+6
	aqfa895ezHtgwMzfI8ODX7WIXiSntzmzef4tMIZL5FneyaWt714rUo4psi0y8Qz+WJFxXDDcvfhNM
	sI15VUVnkSB1UZJ9GJ2oHF3hf2fKW5ZKPyMRTrTGsuBY4TWM4Jn5Wvki1zTOkc8o+uIiz8PA+H1g8
	2iYs1BFEdyy2r+dRAivrHpVGp7TcNGCKCKO/CkgkBh3SBgE2T1uctDUPF+E3RqPcR71M/VuoSDHxv
	3MIDepXA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfTxQ-00BRsE-Kj; Fri, 15 Apr 2022 21:58:24 +0000
Date: Fri, 15 Apr 2022 14:58:24 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Wei Xiao <xiaowei66@huawei.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [mcgrof:sysctl-testing 18/18] kernel/trace/ftrace.c:3068:13:
 warning: unused function 'ftrace_startup_sysctl'
Message-ID: <YlnqgBmtLhrgTlR/@bombadil.infradead.org>
References: <202204160113.5Pvywod8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204160113.5Pvywod8-lkp@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

I just posted a fix fo this.

  Luis
