Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40AA8462
	for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735840; cv=none; b=bPEjfDM7Tu5TdCCC2AdhdSSqpKTRxFv2FH3v4h1zL8BVsbTsUWqi92g7y6+QRdo47DXG1LhDvu/g5SHqhlgmzwQgQD230F9DsQpg/VvL1+bFFl3HdkhlUxbvTATt83O9DtiOEEWB+1kiG0TVt5eD4rIVmC9KbxfRl02LzxSwZ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735840; c=relaxed/simple;
	bh=XpqRNizCBON4rIR5fIVyri8Dc/rmmbCpOn5VeKq4fg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXx0s+fwbBAoGFxzK0GoC5zJwa44STsQ0yOoJ3nReXwMdSBQvqTiwuTeWY38KEwnbdApHLN4bmsqb2GSBRQpWIG8iLi/99/PE6iJkm/XXbZ/sdnzbJFYobZF/IV7e9+wNc9tIFw9PNsjsu2ZFd37rsZCAE372tAm1oiXp+9aQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fpgHZNkO; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fpgHZNkO"
Date: Mon, 23 Jun 2025 23:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750735826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QzyfTvY77/Jkd4+F0eh5qovwK+V3HCOnxHF3r7CT20c=;
	b=fpgHZNkOQgjqXB1UsbI+d1GOwAHltNpCpJtdtASiaDk1a6Lu2dL37y7MQN59ME4maY+O03
	kr8dwaXUppJzt8TTV748JZeXTF4IaOBdVYL6NLJESpy3PAdUhRM98JeaHfffqGo47Hprve
	8FQKNuWSlCAI/B18Sjv8+5rCj//j32k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: fs/bcachefs/fs.c:867:12: warning: stack frame size (1056)
 exceeds limit (1024) in 'bch2_rename2'
Message-ID: <7f7ckuqso5tg634u5462vhn2er2itref3xeggrm7yukotoc7l2@shh2y4sskhtg>
References: <202506240200.Fsm6BEST-lkp@intel.com>
 <70cef6b1-7e2b-45ca-a94e-55521ab34840@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70cef6b1-7e2b-45ca-a94e-55521ab34840@huawei.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 24, 2025 at 09:49:58AM +0800, Hongbo Li wrote:
> 
> 
> On 2025/6/24 2:22, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   86731a2a651e58953fc949573895f2fa6d456841
> > commit: e614a6c52d32c9c7ff545ca842eb2de4aeb1d2d9 bcachefs: make directory i_size meaningful
> > date:   5 months ago
> > config: s390-defconfig (https://download.01.org/0day-ci/archive/20250624/202506240200.Fsm6BEST-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240200.Fsm6BEST-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506240200.Fsm6BEST-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >     In file included from fs/bcachefs/fs.c:4:
> >     In file included from fs/bcachefs/bcachefs.h:188:
> >     In file included from include/linux/bio.h:10:
> >     In file included from include/linux/blk_types.h:10:
> >     In file included from include/linux/bvec.h:10:
> >     In file included from include/linux/highmem.h:10:
> >     In file included from include/linux/mm.h:2223:
> >     include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >       504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >       505 |                            item];
> >           |                            ~~~~
> >     include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >       511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >       512 |                            NR_VM_NUMA_EVENT_ITEMS +
> >           |                            ~~~~~~~~~~~~~~~~~~~~~~
> >     include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >       518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >           |                               ~~~~~~~~~~~ ^ ~~~
> >     include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >       524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >       525 |                            NR_VM_NUMA_EVENT_ITEMS +
> >           |                            ~~~~~~~~~~~~~~~~~~~~~~
> > > > fs/bcachefs/fs.c:867:12: warning: stack frame size (1056) exceeds limit (1024) in 'bch2_rename2' [-Wframe-larger-than]
> >       867 | static int bch2_rename2(struct mnt_idmap *idmap,
> >           |            ^
> >     5 warnings generated.
> > 
> > 
> > vim +/bch2_rename2 +867 fs/bcachefs/fs.c
> 
> It is very common for bcachefs functions with high stack usage, but it seems
> a non issue. The same disscussion in [1], what about use a larger stack?
> 
> [1] https://lkml.org/lkml/2025/5/22/1058

No, we don't really want to increase the warning just for bcachefs.

It is annoying, but we do need to fix it.
