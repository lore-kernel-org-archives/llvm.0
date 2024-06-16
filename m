Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A200714012;
	Sun, 16 Jun 2024 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718552712; cv=none; b=GKUDRuFTA68l4U0pzR/6Vo6h/xF2Txg33pZ/zb5OHG7CzPBZqU6RvqOPI6+oD6cXLVE47guFL02gK4kPypQua0vsW5RBtI24O4ikSfyjRXo0hD4cNmERiVPbVl0QG1c8xPTXIjZD0T5lyuZUclubDZ2LJoWOcQoCaMIFvxFglRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718552712; c=relaxed/simple;
	bh=rAWuJAreyULEhFyS9+CF003ZC6hKwBzxRXmA5TtHfpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L+rNRW2VtCNwbjKeQu0JUiWZuXa3DWt16arQGOKENYChdFiM00RR55kSjASqBMR95d4ienINMtiJA+8xfm1vdr2MuVNouGYZnwy4RENZC08Dz+ozF7x+q32hhv4qNp9l+Hfl/7BK9Q5b+wzEqCQuYvxeWpLvjWzcI6xFvuFg2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ddp7Ehfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ddp7Ehfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E355BC2BBFC;
	Sun, 16 Jun 2024 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718552712;
	bh=rAWuJAreyULEhFyS9+CF003ZC6hKwBzxRXmA5TtHfpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ddp7EhfnzSHGzTbfinKYP2xjudh8GTboZ8B90YLPefc/vFrOM/txeq0KceVKbxtpo
	 gM5P1jWRY85jbDGKZzBWr0PTsrv6k0x0rxFbXoF0bFm2GwzM0JO5zScV0u3gZez8nX
	 hIXwsEtGyGqjBx2IMXkWQiv16GwpSqUOnkie8dFvDfUrLq74SUxFibJ4ww+hqR8GNV
	 V8bdqb5yabSwizYsbG8U5ZDTrcaAv8KoLXyLXG56s5ew6ackbH7SnRQwfhWm/zGmaT
	 GHKYbGOjwoSlWHXsObchvwIsd+ZWR5tsrGcQVvvDG05Sd+DFZXzwmJ+WRmTh9xX3vL
	 hPFUne9Ru+32A==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 9/47] mm/damon/core.c:705: warning: expecting prototype for damon_commit_quota_goals(). Prototype was for damos_commit_quota_goals() instead
Date: Sun, 16 Jun 2024 08:45:08 -0700
Message-Id: <20240616154508.52947-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202406161331.PjF4uMpc-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 16 Jun 2024 14:02:55 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   dc8dc5011c1230b2f3b20c53eec91368ee9836b4
> commit: 7b2776f2db539d498b8ed2c9e4e40c5f2c42296d [9/47] mm/damon/core: implement DAMOS quota goals online commit function
> config: i386-buildonly-randconfig-001-20240616 (https://download.01.org/0day-ci/archive/20240616/202406161331.PjF4uMpc-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161331.PjF4uMpc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406161331.PjF4uMpc-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/core.c:705: warning: expecting prototype for damon_commit_quota_goals(). Prototype was for damos_commit_quota_goals() instead

Thank you for this nice report.  I just pushed a fix to my patches queue:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/damon-hack.git/commit/?id=5bc3caf3da54ecef752dea374b83b6bfa10f4cad


Thanks,
SJ

[...]
