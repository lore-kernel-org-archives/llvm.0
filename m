Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3048FFBEB;
	Tue, 18 Jul 2023 17:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47820C433C7;
	Tue, 18 Jul 2023 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689700867;
	bh=HFx3XvwtmZevU4+dFDo0gIWAy1biJ4z6q/z9dt7sNY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmHkoD+MOkP23yrL1ziSiUw6xABb1zAi4C+cpwrT2TLPHEX+ljwzvp1JfeVP8h5KL
	 NnTAgC+D8odyxdzwmLVtmMUnnEbrC8IOfyHxWGfvElcoY+5Q+dueCdX8KVDPx00SsP
	 R4rZWW5yx0V7GXzcecenC9F5hzbxZLSJClZW7l7H4X4qcXKoPBqWEy+LfLVqlgNw9Q
	 YJps5KBY7IOAzKYHeuU7/8Tt43tQXz9nPROJzJN1RCUsVZxa6fnF9OmcgMvYKkli4B
	 0cSyFjNfbOuAYxHQZWBwxxMOZcu9SCupMuy2IjCRmYI5ndq+wvlhIcABunHv+KR8r+
	 0NWUGM1FNjAFg==
Date: Tue, 18 Jul 2023 10:21:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 209/215] mm/mmap.c:2430:29: error:
 assigning to 'lockdep_map_p' from incompatible type 'void *'
Message-ID: <20230718172105.GA1714004@dev-arch.thelio-3990X>
References: <202307180750.Dk6xL6nG-lkp@intel.com>
 <20230718171025.vn67ydtjifawkvqo@revolver>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718171025.vn67ydtjifawkvqo@revolver>

On Tue, Jul 18, 2023 at 01:10:25PM -0400, Liam R. Howlett wrote:
> * kernel test robot <lkp@intel.com> [230717 19:36]:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   75ac3c8cee9c94691bc9001fcfb6214ae812bfa8
> > commit: f40b24c7c416b304b93115d66d02dc54e5d2f7d1 [209/215] mm/mmap: change detached vma locking scheme
> > config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230718/202307180750.Dk6xL6nG-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> 
> Just a status update on this..
> 
> The above config works with clang 16, I will reproduce it with the
> periodic build of clang 17 once I locate a copy.

I can reproduce this with LLVM 16.0.6 that I publish on kernel.org:

https://kernel.org/pub/tools/llvm/

  $ curl -LSso .config https://download.01.org/0day-ci/archive/20230718/202307180750.Dk6xL6nG-lkp@intel.com/config

  $ make -skj"$(nproc)" ARCH=um LLVM=$PWD/llvm-16.0.6-x86_64/bin/ olddefconfig mm/mmap.o
  mm/mmap.c:2430:29: error: assigning to 'lockdep_map_p' from incompatible type 'void *'
          mt_detach.ma_external_lock = NULL;
                                     ^ ~~~~
  1 error generated.

For the record, I see the same error with GCC 13.1.0 from kernel.org:

https://kernel.org/pub/tools/crosstool/

  In file included from include/uapi/linux/posix_types.h:5,
                   from include/uapi/linux/types.h:14,
                   from include/linux/types.h:6,
                   from include/linux/limits.h:6,
                   from include/linux/kernel.h:16,
                   from mm/mmap.c:12:
  mm/mmap.c: In function 'do_vmi_align_munmap':
  include/linux/stddef.h:8:14: error: incompatible types when assigning to type 'lockdep_map_p' from type 'void *'
      8 | #define NULL ((void *)0)
        |              ^
  mm/mmap.c:2430:38: note: in expansion of macro 'NULL'
   2430 |         mt_detach.ma_external_lock = NULL;
        |                                      ^~~~

> The llvm repositories currently don't have 17 [1], so this is delaying
> the reproducibility and fix for the issue.

As Nick said, they should. If there are issues or something is broken,
please consider filing a bug on LLVM's issue tracker under Packaging:

https://github.com/llvm/llvm-project/issues/new

https://github.com/llvm/llvm-project/labels/packaging

Cheers,
Nathan
