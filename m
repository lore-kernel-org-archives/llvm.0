Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C13BCD2A
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443451; cv=none; b=MQZkmxV61d0dO4CqcJB5orZuahwPEYX54xsZYbqSEBLrcDXsNvsnfZiuDyI4wkrQiwhW3YXrmPAjKXBlbdtUhvN0L8scPW8YTIUNkFnsIfpP3Ts8NaTj2jb0hsb00Rlj7K5CTs/ZC589S1OPkJTDHcRrq9FKdBEIBBo8uwg1QnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443451; c=relaxed/simple;
	bh=FeZICw99s+k2He4rwIBLTy656mhd4BVV478wspmPBKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peXkOHxGQ63E8K6HrMbRuCqrbyJ8qkhZiceIGjw48mD2tz3ntN9QqyFKSA32A2UAPPiEHwhjtEXF7BQxaDRRs21syctxbRhN3CDv/QBLIOlM+k4Gp1CexQ8groQ6vRFG3ooF1qT4Xlw+xPa9Sp8jxmn+f9pjKixvPee1cdpd69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1511068BEB; Thu,  8 Oct 2026 09:10:46 +0200 (CEST)
Date: Thu, 8 Oct 2026 09:10:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christoph Hellwig <hch@lst.de>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
	Marco Elver <elver@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v4 7/8] scsi: scsi_debug: Improve lock context
 annotations
Message-ID: <20261008071045.GB30898@lst.de>
References: <cover.1791349129.git.bvanassche@acm.org> <765bf3683555f3d7fbe8510cde1eb50d5f6d0c6f.1791349129.git.bvanassche@acm.org> <20261007131411.GE30647@lst.de> <cf697d5c-1b5d-4e3a-983b-f710eb41b5b6@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf697d5c-1b5d-4e3a-983b-f710eb41b5b6@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Oct 07, 2026 at 01:10:27PM -0700, Bart Van Assche wrote:
> Do you like the alternative below better? If so then I will replace
> patch 7/8 with the changes below.

Much better, although I'd drop the pointless inversion of the
condition and keep the flow as in the old version:

static inline void
sdeb_read_lock(rwlock_t *lock)
	__acquires_shared(lock)
{
	if (sdebug_no_rwlock)
		__acquire_shared(lock);
	else
 		read_lock(lock);
}
