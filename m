Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C821A3D;
	Fri, 11 Aug 2023 03:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B2C433C7;
	Fri, 11 Aug 2023 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691722851;
	bh=ugjpL/f4X9bYm9eWVGZGS4YcKWe7fHNCatKyjY5ik0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXwWKbzTN0o7TPjX6kedQe2n5rDj672NbzXgHl8suvy4PtRE39z9WbsHsJ9BWNdAY
	 sElY9HbhSROfY14TWVC9YFxajkYCD4EMuGRDSWkFKJUcyhCEPam97jEp81+5dryCzM
	 30u0kWidQF318tRR77cVtSGaPkXmSLC6xwNGCVAnJTxPinkaanrdYKIkUItiymKZ6x
	 YvZwf+YhkWuslUwu0RAR9yRDmNCLAkNU7wPMwnAmYctOWFr10IOLG5VcmXh1JCNhF2
	 NyKUX5VFLLzUXecSoUeqKFOAE6WldeWSSz0EWqaRr5rBsVxP2DkUw/9QFYdvq4uqDC
	 HuB26c8smakUA==
Date: Thu, 10 Aug 2023 20:00:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 7083/7933] ld.lld: error: assignment to
 symbol __init_end does not converge
Message-ID: <20230811030049.GA3949452@dev-arch.thelio-3990X>
References: <202308090338.AqDF9eEK-lkp@intel.com>
 <95122552-df11-c75c-4957-911e58ec9410@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95122552-df11-c75c-4957-911e58ec9410@huawei.com>

On Fri, Aug 11, 2023 at 09:58:02AM +0800, Miaohe Lin wrote:
> On 2023/8/9 3:26, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
> > commit: 489dcf298fbc8c0be81d98a6477ddeadc7327858 [7083/7933] mm/mm_init.c: remove obsolete macro HASH_SMALL
> > config: arm64-randconfig-r032-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090338.AqDF9eEK-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090338.AqDF9eEK-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308090338.AqDF9eEK-lkp@intel.com/
> > 
> > Note: the linux-next/master HEAD 71cd4fc492ec41e4acd85e98bbf7a13753fc1e03 builds fine.
> >       It may have been fixed somewhere.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> ld.lld: error: assignment to symbol __init_end does not converge
> 
> Thanks for your report. It seems that commit is irrelevant to the problem and I have no idea what
> this error means. Could you please give me some more information?

This is a known randconfig failure, it is safe for you to ignore it.

https://github.com/ClangBuiltLinux/linux/issues/1790

Cheers,
Nathan
