Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BC427FB25;
	Mon, 21 Jul 2025 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080439; cv=none; b=eM07wIbYuM0k+NHAmhxXmOY/7FV+6XR5PGHLARh8ufV2VFrNcrKUw1LFnwOXd4nwjks3v0AzyLohd/mnx1IjtrdpF0Yb2HXgMlXbT6SI/s91M4DOfbJIMgrSUadaSlnSH+u396EGkumgiD8J+/v3RrUdvuxqu6YdUc7YjWVKge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080439; c=relaxed/simple;
	bh=T7HMOUpuvtvroMArkjKn+tfi1JfmVBXjSP/RWiCN7/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLi+XiXg4BunyHtBYQZYWuPB6z1GCdFWDHETKifbVRmx1fhsj2H+2KWgD5S84NKNP/PU+MzpUNx6KJytMU7sFC6+z5vhK2I0sEGCT3/EvIRePE4gdbY86EjZ1NPzmT/2s+Vl81oGM3RxaIVjKKXS4R9SBwyG4fs6tOPzeVryPXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E5F6268AFE; Mon, 21 Jul 2025 08:47:12 +0200 (CEST)
Date: Mon, 21 Jul 2025 08:47:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: kernel test robot <lkp@intel.com>, viro@zeniv.linux.org.uk,
	jack@suse.com, brauner@kernel.org, axboe@kernel.dk, hch@lst.de,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	yukuai3@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH] fs: Add additional checks for block devices during
 mount
Message-ID: <20250721064712.GA28899@lst.de>
References: <20250719024403.3452285-1-wozizhi@huawei.com> <202507192025.N75TF4Gp-lkp@intel.com> <b60e4ef2-0128-4e56-a15f-ea85194a3af0@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60e4ef2-0128-4e56-a15f-ea85194a3af0@huaweicloud.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 21, 2025 at 09:20:27AM +0800, Zizhi Wo wrote:
> Sorry, disk_live() is only declared but not defined when CONFIG_BLOCK is
> not set...

You can just add a if (IS_ENABLED(CONFIG_BLOCK)) check around it.


But the layering here feels wrong.  sget_dev and it's helper operate
purely on the dev_t.  Anything actually dealing with a block device /
gendisk should be in the helpers that otherwise use it.

