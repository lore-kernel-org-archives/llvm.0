Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549034;
	b=dMDAAdtPJ+Jj2t8LJ06wI/HFy7hN1bSmTBJOklgVhiQ1g3YbQwgdPS2Tk2BO6/J2Vgle
	 xteVZ3SwwUolxxSq2aQ1JPfWXcAGkYIQvWszz0CgJX9xseM0vLelwQtfCpqQarecadq5u
	 D4nGhWJktcMpqI4PSBX5skQIn38yD2YldRRxJK83MGqLfNVSY4SQbVFowU9LDq3s/VF6f
	 t+KL/GpvI1rIf2gnhhWKwn4a6DPc1jghvi3Z/hOb+mUnPzu1RNwIIOIQ7UBBfsFvrtz9f
	 M3sQRfXTBb1vuvWCXMrV9M/6NXtaJMe6r6Jnjhv1OJTzozuj6oBYk0X1ja79vDrU+dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549034;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=47Wj15clpQHDfDO8p01OckNc4yVYDR40Xb+7MXFS/0A=;
	b=Q/TW4GuF1kTQgtMiU9VVTu7wCw7hPU2uV75TlQH9os+2vlS1VqfcnZbRoYweXsNZS8CN
	 RW5kX0IU98XTZGxlHjnGYEdcSP3DFx3o6bfRv39XkDANU98wdPGgWlBRK4W75xw+7buDU
	 Y0iy7PiXakLLVxfDD2e47hsfAmXOAbO0u5lINGWOWEdVwkzlLbqQ/CyiaXQ2X+lfLsgrR
	 NlEX9fkAHPQg0beRiu6kVsnMTpGGyD71QvLUQdmsI3qr6npod9bhu2+scyVYkW40fAI9i
	 47ZQS3uPeOR2ZmI7Aq8xxzvQlx++EFP399totFEl+xMbEt2A+H+dTNRxmbem2BTieJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pt0SwH8J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D4606A324;
	Sun,  1 Nov 2026 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pt0SwH8J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC741F000C1;
	Sun,  1 Nov 2026 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793549033;
	bh=47Wj15clpQHDfDO8p01OckNc4yVYDR40Xb+7MXFS/0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pt0SwH8Jvq11BucinGZjNCR4KWdGR1hztw+N6dCgiP2kxJBHIydEvBT5z9xw4xarU
	 1GEyGwSKkyBtdg5aMTRpHLa8LVdsLrAr/2Zzfk2ssEiWFE0Ji5+6BMoDNxEz9423l4
	 dELV6/uUpI/lLbax9c5SciF7L4lpKWKuA/hPEiPKKM8jEGP7UM/tPxcE6FzzQSVXFh
	 5vBYveAN/nhl6Q3LlXFxEYx5Kt3muvVu7r0tFRetIFWWnx8N0TdL1lY5ku+cEcdL57
	 0XCzCNmlc9QDPTwWi2EjScDuZczn0TpUo5YVlF9kawre6ewe5aGGk7Oc3+u9MvWfeD
	 DiiidoOj/RPVw==
From: SJ Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SJ Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 41/139] mm/damon/vaddr.c:891:35: error: too few arguments to function call, expected 2, have 1
Date: Sun,  1 Nov 2026 08:03:46 -0800
Message-ID: <20261101160346.108738-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202611010353.NDt2ru5X-lkp@intel.com>
References: 
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 01 Nov 2026 04:00:40 +0100 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   7004d750fdd0fe580091136ef098fba296e51863
> commit: 046c68e46b042453c4cdbd909eb4dc448dde6325 [41/139] mm/damon/vaddr: use damos->last_applied for migrate action
> config: arm64-randconfig-2000-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010353.NDt2ru5X-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010353.NDt2ru5X-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611010353.NDt2ru5X-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/damon/vaddr.c:891:35: error: too few arguments to function call, expected 2, have 1
>      891 |                 if (damos_va_invalid_folio(folio))
>          |                     ~~~~~~~~~~~~~~~~~~~~~~      ^
>    mm/damon/vaddr.c:840:20: note: 'damos_va_invalid_folio' declared here
>      840 | static inline bool damos_va_invalid_folio(struct folio *folio,
>          |                    ^                      ~~~~~~~~~~~~~~~~~~~~
>      841 |                 struct damos *s)
>          |                 ~~~~~~~~~~~~~~~

Thank you for this report, I just fixed this issue on my tree.

Btw, seems this is a duplicate of other report [1].  For any followups, let's
use the other thread.

[1] https://lore.kernel.org/202611010354.GdEQgO22-lkp@intel.com


Thanks,
SJ

[...]
