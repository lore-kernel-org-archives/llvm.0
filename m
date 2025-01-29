Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102891552F5;
	Wed, 29 Jan 2025 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175204; cv=none; b=HPNjtTJ1lFGDpsuijyL4L7WIgmDxZQiNJx2uFEqfCfcdQk7y6xY9am1jKMciLGf1kwRhzMlHWb8nup6JYragpe61bLhHgnonlSDeD+duJSefbWR360jiFMPjYLgDr6iMeYMazyi5tacWi32BqdxdY0aP9lFH336vSY/nWC3JiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175204; c=relaxed/simple;
	bh=DExkMOAqfVhAPB2F6gnWdQpPMc+rgkiVrGMWQ5PyUxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iAp2m4IRaowZkmlcECzBfVIo8zatINGoboWDrKphETUH1feYXqV17orV6tBvm8afOdZ/g4caOV5QiPbilBvTqHYnYnUFiuvcQueqInLX5MeadEatSowVxArKoDyc891RHmrl5LxAkvvJO/25neSJLOUmd4YBA5VhwDgPzi7Zd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diRcAFPA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diRcAFPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB972C4CED3;
	Wed, 29 Jan 2025 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738175203;
	bh=DExkMOAqfVhAPB2F6gnWdQpPMc+rgkiVrGMWQ5PyUxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=diRcAFPAVOV8nwqaQnKrExPTvHPxJ/Q8oeOmNuYN8eQER5PSGP44F2RKUKw4Cs+0n
	 gfuujocOBz5sBR2x+OelDUpbUtbfRNAKa7vd03gvHwYsjv9v9HeJSar9RQ09niL/4V
	 417A6VEdsYJnCojXvtJKcjAFLBcLFwbhI00B8oJmcVuUWi91LnE1+opIebvqE/ftX1
	 EEIDRzoaqmRMKTZcYgYuPrFXkxQPr34lAt2G4EWLuHU5Su6g/LDwkKvE1eeq9GKNyl
	 24C5/XpE+zR5KL3r8O1I6HWvdm4OGNjFdT0jxZP71uL2+o4Bzpm90HyrdAiWXAZBGZ
	 EXGw6UmdTLy9A==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 60/63] mm/damon/core.c:1339:16: warning: variable 'nr_regions' set but not used
Date: Wed, 29 Jan 2025 10:26:37 -0800
Message-Id: <20250129182637.56038-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202501300041.usRaByZc-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 30 Jan 2025 00:08:39 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   db09358b42a2d75f76c297d9eedceeb9786c96fd
> commit: dcd0807d5a93d6e7b64f63de86de810f55a19bfb [60/63] mm/damon: intervals tuning parameters refactoring
> config: s390-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300041.usRaByZc-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300041.usRaByZc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501300041.usRaByZc-lkp@intel.com/

Thank you for the kind report always.  Just pushed a fix as commit f9be0d7542dc
("mm/damon/core: fix set but not used 'nr_regions' in
damon_get_intervals_adaptation_bp()") on the tree (damon/next), with the above
two tags.


Thanks,
SJ

[...]
