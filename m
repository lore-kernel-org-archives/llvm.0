Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBEAC8C2;
	Mon, 14 Aug 2023 15:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AA0C433C7;
	Mon, 14 Aug 2023 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692028052;
	bh=t1R8otRM3E6EZ1Itt7NVpdWmmwTSamBHRUIDFtKrf0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/ndevMRJb5n5ncJkJ3CYnQYNdkZV0xZH25Y/IgZp7pjuX9n8HoAGDXd76z9630mC
	 uAYYgjI8Eiwzx48ahKOAc1kGVfLcLQPBDUz11ZkPEIrnIVRuaYk9S28lA3/NIBaayn
	 R0sbNwHn2V5H/zFmRe8gMiMqeY5Uu89wbSM9Vl5cgsErf2Xg4zylY4zS6nP/JOk3/f
	 ciVqZp+KUbnJ5pVVyk1cEZUmxRq+z+1ShDl46yOsW9HRQa8FqFbk9C3BOk87+8WNP1
	 mAfwj1+ZvWWZIpUaHe02+FKGB0J0oANBaHDrtFV5jlkjq/H83j+SzrSLI02pdtUYKg
	 8PCWesEzXvi1Q==
Date: Mon, 14 Aug 2023 08:47:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Xu <peterx@redhat.com>, lkp@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: Re: Cannot find symbol for section 69: .text.arch_max_swapfile_size.
Message-ID: <20230814154730.GA3072@dev-arch.thelio-3990X>
References: <202308120906.Efohswpa-lkp@intel.com>
 <ZNpKaiweCbf9i5QS@x1n>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNpKaiweCbf9i5QS@x1n>

On Mon, Aug 14, 2023 at 11:38:18AM -0400, Peter Xu wrote:
> On Sat, Aug 12, 2023 at 09:11:33AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   190bf7b14b0cf3df19c059061be032bd8994a597
> > commit: be45a4902c7caa717fee6b2f671e59b396ed395c mm/swap: cache maximum swapfile size when init swap
> > date:   11 months ago
> > config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308120906.Efohswpa-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> Cannot find symbol for section 69: .text.arch_max_swapfile_size.
> >    mm/swapfile.o: failed
> 
> Hmm.. I don't really know what's the issue here, neither can I reproduce
> this locally - the cross build seems to all work with the reproducer and I
> can see mm/swapfile.o correctly generated.

This is https://github.com/ClangBuiltLinux/linux/issues/1830 and
https://github.com/ClangBuiltLinux/linux/issues/981, which is a bug in
recordmcount with regards to section symbols that occurs when building
with clang's integrated assembler. It happens when the there are only
weak symbols in a .text section, which occurs more often with MIPS due
to LD_DEAD_CODE_DATA_ELIMINATION implying -ffunction-sections (i.e., any
__weak symbol will trigger this) and I can see this randconfig setting
it.

Unfortunately, the robot seems to have tripped over this a lot over the
weekend :/ Intel folks, can this type of warning please be added to your
filter for at least MIPS + LD_DEAD_CODE_DATA_ELIMINATION so that people
don't get bothered?

https://lore.kernel.org/202308121810.APAJIBxn-lkp@intel.com/
https://lore.kernel.org/202308121535.otQuZept-lkp@intel.com/
https://lore.kernel.org/202308121810.APAJIBxn-lkp@intel.com/
https://lore.kernel.org/202308121246.0TYkHC1K-lkp@intel.com/
https://lore.kernel.org/202308120553.IRzzfaXL-lkp@intel.com/
https://lore.kernel.org/202308111956.QRc8XJVr-lkp@intel.com/

Cheers,
Nathan
