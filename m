Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDF17AC1;
	Fri, 18 Aug 2023 13:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D9EC433C7;
	Fri, 18 Aug 2023 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692364458;
	bh=kGhAkAiiAfeWyJ3QgeiaV3PO4o2y8rRpbHm210LQQvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVtLZ7HwikGqHIaZCQxQ63Gr10NMs1q2SgHgMfX/TC30K46rbXb5XRD3Wfmmzjn6A
	 Z0UIibLI7qGkRK0l6FzI1ZUKCHh2EQIE3gw1WKXOvoTmAuQ48plidVYOtctDwfbKp3
	 MjIhiQmL9Rxu4gORhuURBZs4fNCKic8OZwOaj4Md93t8iKu/dtNXX2klD7trV3L+2Y
	 LtVVoFSQC8AbszvfsO2ePGv+Zk8LDRx5TYYa8P1e+6yfj+VhkTcZQxkY/vRUfCOgGw
	 +JS3n4FcYgXTo8gjD5/4MQmcc2QXV4B106FC6WkrgH16PQHG0zKkWW8NVXoYyv0c0W
	 TT9u6Obk9Uc/w==
Date: Fri, 18 Aug 2023 15:14:14 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [linux-next:master 8648/10848] ERROR: modpost: "bdev_mark_dead"
 [drivers/s390/block/dasd_mod.ko] undefined!
Message-ID: <20230818-abhob-gecko-420d48fbc031@brauner>
References: <202308172348.1BthulLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202308172348.1BthulLk-lkp@intel.com>

On Thu, Aug 17, 2023 at 11:35:54PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
> commit: 381f678306ceef1cefb39fb22f88e3b977b81403 [8648/10848] block: consolidate __invalidate_device and fsync_bdev

Outdated commit hash and should already be fixed in-tree.
