Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFBD326947
	for <llvm@lists.linux.dev>; Sat, 17 Jan 2026 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768636273; cv=none; b=bxoNtKOvgZz3iK+USEYVjNGQ2SUFQdSfx370h2IMLIXFhaWaAshplcqB9yyVNOqYdvC7NpYmOv5E6GbzgJEBC45+BdoZG7fBOazSRCSUiVpw/w/E1/BShYt6ENHPhY3nt7EG+uGiSeVM7vp3JzbzdQcNCDMgRtVk5CmpQwd13po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768636273; c=relaxed/simple;
	bh=p6sqOA+iIHLgxv85Ijcz4Itw/vURsxWopcXs1pJxgJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OItWPiF+hwqfrln6c9EpyVpziL1ktruq2Q5oPDmGnQjajOTTxLyeCw/qND8aOASpwEkGlN+tE80f80QRTQIOVn+ac4dqEq9Jww+SDgAborrclWW9GLd0wjYiijLWoh6QSE6UVAwUspAHWf61p+PDarl4V1Yi7lyNGuw1HIHUbMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0Ras6GB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0Ras6GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768636270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fdpvBhQBOChk8ARM449+Wm7H/W77F2DePeTntsLCc48=;
	b=Q0Ras6GB33ibvbzMesUeiYPS1gPa4LWCJFr+zz2xW/mWppX3DOc2h/FT24h7Rka/ePujzK
	8iRnc2BdpysMQ0FyG+iQNsfawU/9yhPMe+I1GXZatyc1HySz3V2GFcJ19gC7XDwBC209hC
	/mmUTPYwyB+2nVlz5y+m/0cn5xOOS98=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-r9exbGOMPpe339aV_PTw6w-1; Sat,
 17 Jan 2026 02:51:05 -0500
X-MC-Unique: r9exbGOMPpe339aV_PTw6w-1
X-Mimecast-MFC-AGG-ID: r9exbGOMPpe339aV_PTw6w_1768636263
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 750DA1956096;
	Sat, 17 Jan 2026 07:51:01 +0000 (UTC)
Received: from fedora (unknown [10.72.116.198])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4067E3001DBA;
	Sat, 17 Jan 2026 07:50:51 +0000 (UTC)
Date: Sat, 17 Jan 2026 15:50:45 +0800
From: Ming Lei <ming.lei@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: Re: arch/um/drivers/ubd_kern.c:780:13: warning: stack frame size
 (2152) exceeds limit (2048) in 'ubd_device_release'
Message-ID: <aWs_VTjkaD5yHB-o@fedora>
References: <202601171315.t7AOGOhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601171315.t7AOGOhS-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Sat, Jan 17, 2026 at 02:00:56PM +0800, kernel test robot wrote:
> Hi Ming,
> 
> FYI, the error/warning still remains.

Hello,

`arch/um/drivers/ubd_kern.c` is maintained by UML subsystem:

ming@fedora:~/git/linux$ ./scripts/get_maintainer.pl arch/um/drivers/ubd_kern.c
Richard Weinberger <richard@nod.at> (maintainer:USER-MODE LINUX (UML))
Anton Ivanov <anton.ivanov@cambridgegreys.com> (maintainer:USER-MODE LINUX (UML))
Johannes Berg <johannes@sipsolutions.net> (maintainer:USER-MODE LINUX (UML),commit_signer:2/3=67%)
...
linux-um@lists.infradead.org (open list:USER-MODE LINUX (UML))
linux-kernel@vger.kernel.org (open list)


Thanks, 
Ming

