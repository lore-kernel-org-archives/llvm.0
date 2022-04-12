Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720571FA1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 05:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qKT+rKxJxRTHwUX6zSPidvw6TsQOrmd//JseePK15uA=; b=hafi3HcZO8eclGRtpUfrnE7sz+
	GnBAtjQIZNL0tYtwdHuTZcGGXIpJdnbezVWLvAEmIgpr/gr+rzKToHd/w0XwyrBFB5p/FWfb5+Ej6
	JapzhsrEoapweCNZ5h4r3Dj3E+4PlafjaTJX0J0B+Tbx8yOAREaPPKadIanLPk+Ffiv3116nxwEt5
	g+pFhD6zKyBrqNfguDK1LNiQuOIgAk0e9zJwd547O7NmObUXW1eYNLsngge5e/VM0SQfM/KA3cLq7
	Jp4gRfd3Lkbi13GGMT3PSYNozHQoB5nUKtOJyn194Qmr9eP8ztXnRQEiGYg/O1GNm4aQXxnGUS5vZ
	uODATKMA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne922-00BmCM-4j; Tue, 12 Apr 2022 05:25:38 +0000
Date: Mon, 11 Apr 2022 22:25:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tom Rix <trix@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, tim@cyberelk.net,
	axboe@kernel.dk, jejb@linux.ibm.com, martin.petersen@oracle.com,
	nathan@kernel.org, ndesaulniers@google.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] security: do not leak information in ioctl
Message-ID: <YlUNUgTfej6VpkWS@infradead.org>
References: <20220409145137.67592-1-trix@redhat.com>
 <YlREKRb/xgAFsi97@infradead.org>
 <eec2efee-1153-8d8e-77c2-96156733a0c6@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eec2efee-1153-8d8e-77c2-96156733a0c6@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Apr 11, 2022 at 09:31:20AM -0700, Tom Rix wrote:
> The failure can happen in the transfer loop, so some of the data will not be
> zero.
> 
> And checking status should be done.
> 
> zero-ing is because i am paranoid.

Maybe I'm just lost because of all the reformating.  Please do a first
patch that split the CDROMREADTOCHDR and CDROMREADTOCENTRY into one
helper each and the just do the minimal fix on top so that it is
reviewable.
