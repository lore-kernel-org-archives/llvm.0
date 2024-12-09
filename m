Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26539184545;
	Mon,  9 Dec 2024 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748272; cv=none; b=ohfX2YqTf7YS2qYYWk5dGPa1h88iX2lOA/Oq8bSjl+hmqaWJok6L1j7UjvMNGJf4vR8jo8AvEwCAN7g3uRDirfGcEFT6wubbeAOeJc0s8W7N+dcGemq3R0coQa2HFgiipvV+qo8itpMMKnqw7gXzSGM8b3VL6QFuEke5S489fMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748272; c=relaxed/simple;
	bh=/LfXVqgbf3ucFNgzXBGj/R4r0+6y9xamFU2lQ/HfMWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDRllUm2iJM4QyWlCWySH0JxMWD+5UdUgxYY33BsdJBnQ7mDBJGt4ZGXuUwv54XdtVLFVWXKhpVOLtewNQ3GTvecqR68VZr+ihE5ETNGUuvAey5KCWcVeUHvJ4Iq8XtJcMNvbb3Ep2ilYaU9IKX80q8qyoGnlKSmMcO22kflVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id BB39C68D09; Mon,  9 Dec 2024 13:44:25 +0100 (CET)
Date: Mon, 9 Dec 2024 13:44:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Keith Busch <kbusch@meta.com>, axboe@kernel.dk, hch@lst.de,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	sagi@grimberg.me, asml.silence@gmail.com, anuj20.g@samsung.com,
	joshi.k@samsung.com, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCHv12 11/12] nvme: register fdp parameters with the block
 layer
Message-ID: <20241209124425.GA14066@lst.de>
References: <20241206221801.790690-12-kbusch@meta.com> <202412071144.9uXFLnls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412071144.9uXFLnls-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Dec 09, 2024 at 12:05:27PM +0800, kernel test robot wrote:
> >> drivers/nvme/host/core.c:2187:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
>     2187 |         } while (i++ < fdp_idx);
>          |                  ^
>    drivers/nvme/host/core.c:2160:7: note: initialize the variable 'i' to silence this warning
>     2160 |         int i, n, ret;
>          |              ^
>          |               = 0
>    2 warnings generated.

Yeah, looks like this is uninitialized.  Did I mention I hate these
variable length log entries in nvme?  They've already been a major
pain in ANA before..

