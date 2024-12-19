Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141E1A2642;
	Thu, 19 Dec 2024 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634770; cv=none; b=UQpONd/g+C/zRzzZhUxR9UXDq3n+2VmWnHDZ2nAVFuDUsuH0V3CnhzjTc3h07XnlML/tyL/4Qc1i7o5cLZHEQGjlDHWiGRm5Y8f7mTlYpSz6uoLUmLZjmp7kaXFMOvuLoV9gIeX+qlnFXC0lgh3Pc4fBGsWO6IBYG4DOkzHhXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634770; c=relaxed/simple;
	bh=9XxmR34SCeOwKoWjP6iptH4J3xSEye5t2CNxKIthBqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VHIQR0B83F+9eIJvJoFHNOOfTKc3Bknbb2AQdavxnxxONdh5VHzR/ONB6oX3Q/XxwLYUylrGLi+17u4qF+4Hdz6vjNDDDDn72rMQUtyipE+4S4umZ0I8P4EEUh3UZAaxZMirIndhEHHNqd4u3URWvVMRto9xVsXNFN50lqzX11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnVHHZol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnVHHZol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B5FC4CECE;
	Thu, 19 Dec 2024 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634770;
	bh=9XxmR34SCeOwKoWjP6iptH4J3xSEye5t2CNxKIthBqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EnVHHZolkXoFhRtueUPNJy2FnZL6sAa+EDGT6sbU0oSZAkNi7Cb+6jcC060LnKJn4
	 gUoaMgFO7PZT2PZE5evaS8a1/PViutvs6hA6Q4p5SA/mgzip8yJoEdjDoJ9nFXsToT
	 WLLU47pzI+Bu4bRaPDBehQh8g4MapVMx00Qw2UQiHoottyca5ZB6jZSJ0dOkzrl0bV
	 Ycixif3vlg0u72AJp7iKnCYx6KnUSBZgkY3/xJvv90CiZcz1Xj8IJ9+k34Ena3nZLu
	 pjhwPjzgZV9ns5vCwyr+Ab4Ay4+k/T+caA8AERdz0Wdh3i06FPRdSeX39N/ZLUuVKN
	 V8PZrbDc9CUfQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 52/79] mm/damon/sysfs-schemes.c:2129: warning: Function parameter or struct member 'sz_filter_passed' not described in 'damos_sysfs_populate_region_dir'
Date: Thu, 19 Dec 2024 10:59:27 -0800
Message-Id: <20241219185927.73314-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202412191225.f6bEMRT2-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robot,

On Thu, 19 Dec 2024 12:51:39 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   acaaeb549248b361cb0586af34b317d05a61512b
> commit: d92ceeda1fde0fd17da7d3dfe5d51e6684e20c6c [52/79] mm/damon/sysfs-schemes: expose per-region filter-passed bytes
> config: arm-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191225.f6bEMRT2-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191225.f6bEMRT2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412191225.f6bEMRT2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/sysfs-schemes.c:2129: warning: Function parameter or struct member 'sz_filter_passed' not described in 'damos_sysfs_populate_region_dir'

Thank you for this kind report.  Just pushed a fix:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=c597c25a2fce809f5d9c6b61f959f753156bcb21


Thanks,
SJ

[...]
