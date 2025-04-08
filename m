Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AC11EE7BE;
	Tue,  8 Apr 2025 05:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088863; cv=none; b=uz7y6Asbu2yfq2d7BHORIFcNYNFyAI0K6VBFhL4tntmdMUD9DyFv1M9/cgvlOaf0bLgEeEULiwoZBgPKKRWXr2ead4c6UFHIlM79u/9D9MOD1UlNgtfCc3hCWcxMlzt68Q55nPsrynP9wRP8ByhKtBxRp4AE+zL/ycJTxlrU970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088863; c=relaxed/simple;
	bh=d6QB42zxkx5DaGIMpHLLWmfoGvbJQwm9vjJ8Uu2t6hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6AthI8eJRPWspuNFTA5b0aiBIzhE2ENmM2ggzJyNpTy36+jqtivw0VmGEPxK6+XlneczLA/1UTc7tcN6URO+ileNPRAF4yxU9cZYssrUWQ2OmAaY099BrHOSfONdThdA4S2m/JwgyiY9C+YOcH9/lKAebpqhFP6R17f+aGDY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B532B67373; Tue,  8 Apr 2025 07:07:36 +0200 (CEST)
Date: Tue, 8 Apr 2025 07:07:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: kernel test robot <lkp@intel.com>, Hannes Reinecke <hare@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [linux-nvme:nvme-6.15 3/4] drivers/nvme/host/core.c:4302:5:
 warning: 'CONFIG_NVME_MULTIPATH' is not defined, evaluates to 0
Message-ID: <20250408050736.GA32275@lst.de>
References: <202504080139.KuphZ8ZZ-lkp@intel.com> <CADUfDZpvMAGheJ-k7jTa3pfjuTXCCZPt-iprnfd_HHAfS5+ghA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADUfDZpvMAGheJ-k7jTa3pfjuTXCCZPt-iprnfd_HHAfS5+ghA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Apr 07, 2025 at 12:02:27PM -0700, Caleb Sander Mateos wrote:
> Looks like it should be #ifdef instead?

Yes, I've fixed it up now.

