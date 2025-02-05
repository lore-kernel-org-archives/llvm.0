Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D91519A4;
	Wed,  5 Feb 2025 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765071; cv=none; b=fssTbEIkDY7gsATeSn2DKLM60ed0uAoAqMgb8NJXCbxQVm2L5N4tiU4Bs7mA1129Ua1J15qMTnUdlMyEHqe8t8jeGLwWD+QIjt6YTB2rtaTalDVlfWIzwjXnLVyCcP0y1mzKbF8tbAI/iv7Ac3X1V89viZKXCLJffwPmL8Pgkkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765071; c=relaxed/simple;
	bh=bo1S18lqvvZvopF9f6Z9v9B7y0lts4CYjXwnNErSpm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkVbca+sAdQdGsgFGVmFLuDAl36QP8LneYOaCz6iGDBVfaoRasgSd3+wa4RHxRz4w8i7oG8yZIwkjPwbtEUDRoNFeYQHpoFTLd9eoAqb04ggyh5BIuAOcYXpKomyu4bZegwsFZ8z7Vk0me0ueYRxUQMukuwjciv8oFBijDb4whM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFGGl+yW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFGGl+yW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A3CC4CEE2;
	Wed,  5 Feb 2025 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738765071;
	bh=bo1S18lqvvZvopF9f6Z9v9B7y0lts4CYjXwnNErSpm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFGGl+yWLUA6yfZEftQGV7OV82luzFmuMMQXQ202uaObcvIZjB8DqG2Y3Z2YSJRt4
	 7kwYaE0hBUP11o8lq1Vs4/GwIf7MDHYeA3MjDTCTkY90fgJLLnJ5cJIm/ySkD7IrlR
	 Hg8M+SRCpgD8ag7wcCiOVnnq3JgFq7zqZiTMqbtBawV7giNuAAsxiDVEbowRbRLHDl
	 bf2LEC7HdWZfmJlwJBvQrCAUj1tuNrnlMBIeWsogM16s5qgdVSUHXOltsFqxqBQxTS
	 +nkYpwbgeMunK2Odh+CVjjQMFKpOw1GxAOdhbayDRg27gzHZP022gHWrTroO9pkbQz
	 jkr5PyOSibeDw==
Date: Wed, 5 Feb 2025 15:17:46 +0100
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.all 10/38] kernel/signal.c:4091:3: error:
 expected expression
Message-ID: <20250205-backen-warzen-9f601999b5e1@brauner>
References: <202502052137.74NcNNI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202502052137.74NcNNI2-lkp@intel.com>

On Wed, Feb 05, 2025 at 10:08:56PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> head:   d740eaae6bc3aa29d1440413f482b153264df85d
> commit: e6e4ed42f8d8be56bec57c864e07437fc887a366 [10/38] pidfd: add PIDFD_SELF* sentinels to refer to own thread/process
> config: hexagon-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052137.74NcNNI2-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052137.74NcNNI2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502052137.74NcNNI2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/signal.c:4091:3: error: expected expression
>     4091 |                 CLASS(fd, f)(pidfd);
>          |                 ^
>    include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
>      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>          |         ^
>    <scratch space>:140:1: note: expanded from here
>      140 | class_fd_t
>          | ^
> >> kernel/signal.c:4092:16: error: use of undeclared identifier 'f'
>     4092 |                 if (fd_empty(f))
>          |                              ^
>    kernel/signal.c:4096:30: error: use of undeclared identifier 'f'
>     4096 |                 pid = pidfd_to_pid(fd_file(f));
>          |                                            ^
>    kernel/signal.c:4104:15: error: use of undeclared identifier 'f'
>     4104 |                 if (fd_file(f)->f_flags & PIDFD_THREAD)
>          |                             ^
>    4 errors generated.
> 
> 
> vim +4091 kernel/signal.c

This is already fixed. I forgot to add {} in the switch statement to
make sure that CLASS() has a valid scope.
