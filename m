Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCD1CC85;
	Wed,  9 Aug 2023 18:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E28C433C7;
	Wed,  9 Aug 2023 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691605999;
	bh=7i+9CZK9MTaE9M7KFWMrFjix2XVGqj+IDgNiugKyaT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1w2TlePhvk7HcDcIsb7svaPCa819NKHF12VKGYF+kbx591ztOJhOO9E3aZ75AiPX
	 GVbd4rNdohVfZoiN5SuSo3K90Su1q0WWLw3VywIRAJMbcTfWRPpx4EqYGe2E2uFxpV
	 DgFNn0aEK45zvRrAbqat2Qnun2Kei3vYCQc3Rn2FxrKDzXwnHcGuBs1+bh8Hkde+aq
	 Krk9BzyQudSbXU8+rBDMKbJJDyKyya+1NnWzS/0JGxk0OJ8V7ya3brQUon0SoXqtQQ
	 2X+GVs69kK7VOJNuTvAK39oOH0l+J7v3Cy8pKU+wDIOEdCZp7MDGL4c2Is2IMA3K4v
	 UnmCayoG4kA6g==
Date: Wed, 9 Aug 2023 11:33:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marco Elver <elver@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 8173/8441] warning: unsafe strcpy() usage
 lacked '__write_overflow' warning in
 lib/test_fortify/write_overflow-strcpy.c
Message-ID: <20230809183317.GA3355565@dev-arch.thelio-3990X>
References: <202308100247.oHTlRKLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308100247.oHTlRKLx-lkp@intel.com>

On Thu, Aug 10, 2023 at 02:29:07AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   21ef7b1e17d039053edaeaf41142423810572741
> commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_debug: introduce CONFIG_DEBUG_LIST_MINIMAL
> config: arm-randconfig-r005-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100247.oHTlRKLx-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100247.oHTlRKLx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308100247.oHTlRKLx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> warning: unsafe strcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strcpy.c
> --
> >> warning: unsafe memcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-memcpy.c
> --
> >> warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcmp.c
> --
> >> warning: unsafe strlcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strlcpy-src.c
> --
> >> warning: unsafe memmove() usage lacked '__read_overflow2_field' warning in lib/test_fortify/read_overflow2_field-memmove.c
> --
> >> warning: unsafe strncpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strncpy-src.c
> --
> >> warning: unsafe memset() usage lacked '__write_overflow_field' warning in lib/test_fortify/write_overflow_field-memset.c
> --
> >> warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memcmp.c
> --
> >> warning: unsafe memmove() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memmove.c
> --
> >> warning: unsafe strlcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strlcpy.c
> --
> >> warning: unsafe memscan() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memscan.c
> ..

I suspect this is a symptom of
https://lore.kernel.org/all/202308092009.dDIMqss4-lkp@intel.com/, as the
fortify tests build with -Werror.

Cheers,
Nathan
