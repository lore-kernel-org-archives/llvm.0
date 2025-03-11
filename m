Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C28B2627E3;
	Tue, 11 Mar 2025 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722584; cv=none; b=XfjA+8j2dQTv9LjzNx9yvKErwm2H1HvNyxrnwlRmGC2Q4X/KTuT3mThEjyPkXy5AsLYwBF1XJYn3LNDJwU1KBQIK7nbh6HoFqGuQUolSisgqfY5lib0mK2qQ/2jkpdMMnIvmJBqKPEOdehvlAWQ5v9GTZYu82Gd9RWSXUFWVhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722584; c=relaxed/simple;
	bh=VUeXEoe7cLyLK7BnlwjEq8QHhmUEZd1UD2IA7JMXFSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ON482xZtgjV2JTRS/SMMhZrW1ddF6va0r3tyA863atc6PbSeIV7HUz287Jyewpp5RRgOJAQO7rBFQfaq3EAIhhzjLz8vgIDGw8mWvgmaxpj5JQbm2CFHeEMaodm6RZQv8eFQS7qgWCLD8/hLXKhxckwl/YpEVlle+e57y3YC83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7UETkv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7UETkv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD84DC4CEE9;
	Tue, 11 Mar 2025 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741722583;
	bh=VUeXEoe7cLyLK7BnlwjEq8QHhmUEZd1UD2IA7JMXFSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7UETkv5sSQLqKu8UioeEn86PJKSccY5xaHzF6PN8Et+sCj4A5RN0wCqPvhjHdhu4
	 riclY/ChJq6TBSAH0XmvhpzzdcW6KfOne52QL+pRXV6YZWYsauDyxH0kCa6pgdjAaQ
	 AKbyeeFp27YOdNmQtJinL9doFcRCnvcfe1RbNx2r3m4d8T/LYqsKpnbjD7ul3vgtCL
	 r0tyO5nL/uOXQm0axmtMsjDHJO9Blhcp5/gSFnAyHdzbkkkRBzosO34V+VwN6gbJQx
	 rgHkTHKNhUbWK+ob0j713JdQaflv+m9E+SdeLkdD5/ZxalhrKz1LlI8Y6qoknj6lyo
	 DXG+862qEN2zA==
Date: Tue, 11 Mar 2025 20:49:40 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [thomas-weissschuh:b4/module-hashes 9/9] llvm-objcopy: error:
 '.tmp_module_hashes.o': The file was not recognized as a valid object file
Message-ID: <20250311194940.GA1966726@ax162>
References: <202503112010.RsM1bgi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503112010.RsM1bgi6-lkp@intel.com>

On Tue, Mar 11, 2025 at 08:14:14PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes
> head:   8ab7849599f74e8492224b62d852cd9affecea7c
> commit: 8ab7849599f74e8492224b62d852cd9affecea7c [9/9] module: Introduce hash-based integrity checking
> config: x86_64-randconfig-005-20250311 (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503112010.RsM1bgi6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> llvm-objcopy: error: '.tmp_module_hashes.o': The file was not recognized as a valid object file

I suspect this happens because LTO is enabled for this configuration (so
-flto will be in KBUILD_CFLAGS), which generates an LLVM bitcode object
file instead of an ELF one.

Cheers,
Nathan
