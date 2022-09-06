Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5D7E
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 08:17:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8239D33952;
	Tue,  6 Sep 2022 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1662452232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E8sxmFsMTC8da6/otIfVCeM9K3+G8GUZIXfiXdp/ZBw=;
	b=opDlnYL8BQGiMV1mfwu3i6NciY0CQjsoEhm5tDJY/oIxnPafk3dXSS66m5axpa7YbK19uR
	eBVuGKqqvxTq5G7cGXHiXM8CFoT6CtuggtL5skVh9cH2XHyPbeBuduuelPGC7r6KkAA3PN
	BetM9t/7Et4ODbSWuRX5c3yqWdXfGkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1662452232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E8sxmFsMTC8da6/otIfVCeM9K3+G8GUZIXfiXdp/ZBw=;
	b=1D6UHK2FO4kvJf/gsMK7KyvPh2mtpZfozw1wdp+mb59SHeELgRBSq9ozos099yHUiej41H
	C4Og5u7f7gjTaEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74C6513A7A;
	Tue,  6 Sep 2022 08:17:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KFpnHAgCF2ORSwAAMHmgww
	(envelope-from <dwagner@suse.de>); Tue, 06 Sep 2022 08:17:12 +0000
Date: Tue, 6 Sep 2022 10:17:11 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-nvme@lists.infradead.org,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>
Subject: Re: [linux-nvme:nvme-6.1 9/10] drivers/nvme/host/rdma.c:989:50:
 error: use of undeclared identifier 'nctrl'
Message-ID: <20220906081711.dmkw66d2iqejkika@carbon.lan>
References: <202209060308.61PnxPmE-lkp@intel.com>
 <20220906063903.snht3lkixtdt2tkq@carbon.lan>
 <20220906065142.GB2190@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906065142.GB2190@lst.de>

On Tue, Sep 06, 2022 at 08:51:42AM +0200, Christoph Hellwig wrote:
> On Tue, Sep 06, 2022 at 08:39:03AM +0200, Daniel Wagner wrote:
> > Argh, my devel setup(*) obviously didn't compile the rdma bits. Do you
> > want me to send an fix on top of this or do you want a new version of
> > the patch?
> 
> I've fixed it already.

Thanks a lot. I'll fix my setup in the meantime.
