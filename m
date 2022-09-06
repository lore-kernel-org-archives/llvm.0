Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD137E
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 06:39:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BAD363375A;
	Tue,  6 Sep 2022 06:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1662446343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq96mh0X1mkrRZ8hx6qwVVNZzLjA5B6LWMrAZRWCMpo=;
	b=c1/6Xn3KlYNBmt3jltoyjpaflfyI6okF1vofqmYUvfo0AQF/8iEt7InIcneqLwlSLSL+tk
	ZM9CFz9Fcj8eri+mSFNn7e28HTEX6ZhhPcD8WOuAQmG0QVnsHWz8xviGkBEPWyCa/IPmqo
	5MgJc4pUc+G7/q6Y6y60BlXfo7JT8c0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1662446343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq96mh0X1mkrRZ8hx6qwVVNZzLjA5B6LWMrAZRWCMpo=;
	b=Su4XGXofyKuUBLBNC9plW/WnBM1FGPVmaLH5AIUO3yvFT4POoysUQs13w7stQx/q96Cttm
	S3TPVDsr17SFzRBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA63213A19;
	Tue,  6 Sep 2022 06:39:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5XBvKQfrFmM5JAAAMHmgww
	(envelope-from <dwagner@suse.de>); Tue, 06 Sep 2022 06:39:03 +0000
Date: Tue, 6 Sep 2022 08:39:03 +0200
From: Daniel Wagner <dwagner@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>
Subject: Re: [linux-nvme:nvme-6.1 9/10] drivers/nvme/host/rdma.c:989:50:
 error: use of undeclared identifier 'nctrl'
Message-ID: <20220906063903.snht3lkixtdt2tkq@carbon.lan>
References: <202209060308.61PnxPmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209060308.61PnxPmE-lkp@intel.com>

On Tue, Sep 06, 2022 at 03:05:51AM +0800, kernel test robot wrote:
> tree:   git://git.infradead.org/nvme.git nvme-6.1
> head:   9951e3d984c9bf324bb7d486f42ec82727e3d777
> commit: 1de8b481a31490d6b0217ac78b87f54bc9bfb65a [9/10] nvme-rdma: Handle number of queue changes
> config: i386-randconfig-a015-20220905
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add linux-nvme git://git.infradead.org/nvme.git
>         git fetch --no-tags linux-nvme nvme-6.1
>         git checkout 1de8b481a31490d6b0217ac78b87f54bc9bfb65a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/nvme/host/rdma.c:989:50: error: use of undeclared identifier 'nctrl'
>            nr_queues = min(ctrl->tag_set.nr_hw_queues + 1, nctrl->queue_count);

Argh, my devel setup(*) obviously didn't compile the rdma bits. Do you
want me to send an fix on top of this or do you want a new version of
the patch?

(*) my main devel machine was out and I had to re-setup it and forgot
to update the config file accordingly.
