Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D44A5EBE
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378863; cv=none; b=JYEUh23dneKmYx1M71cXAe9nr9sz+EUoKdSPtP0cgMOreukQgFxRAOFh3WBQs+C2kExA8Kenrt2UowVN+WbPC3AsZGptO/w1vjoj/rxAkXXIW+SujdjQdaPRiyeyB1Y5X4TB1hNQRwvfGjb5JFYmBwrbpy0PsuY77ydEDXqU7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378863; c=relaxed/simple;
	bh=EVRpmFjJ2W8oKyEn2kS6MhrPerdZPsnJGcY47qFLRYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSi+3zxjebCiIz4grTHc7qroYVHdoFd60glRdw09bnSGyG48Vmq6YTEyQk5c1NbeIJ2jue4In1IrSZsu3ATieEvORQ2oDSqQ0gYi2hiqb7OjIkCp4edEuQHSTGwG92DONFusXbqhVZGwXUvYuyv4mmAZwcSs3V1Ps2WX8aH3sE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7374668BFE; Wed,  7 Oct 2026 15:14:11 +0200 (CEST)
Date: Wed, 7 Oct 2026 15:14:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
	Marco Elver <elver@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v4 7/8] scsi: scsi_debug: Improve lock context
 annotations
Message-ID: <20261007131411.GE30647@lst.de>
References: <cover.1791349129.git.bvanassche@acm.org> <765bf3683555f3d7fbe8510cde1eb50d5f6d0c6f.1791349129.git.bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <765bf3683555f3d7fbe8510cde1eb50d5f6d0c6f.1791349129.git.bvanassche@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Oct 06, 2026 at 10:07:29PM -0700, Bart Van Assche wrote:
>  static inline void
>  sdeb_read_lock(rwlock_t *lock)
> +	__acquires_shared(lock)
> +	__context_unsafe(/*conditional locking*/)
>  {
> -	if (sdebug_no_rwlock)
> -		__acquire(lock);
> -	else
> +	if (!sdebug_no_rwlock)
>  		read_lock(lock);
>  }

Is there no way we can make the spare-style __acquire/__release work for
clang?  That would be this and similar patterns so much better and
safer than the blanket __context_unsafe.
