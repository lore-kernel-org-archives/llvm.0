Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F901D52B;
	Sat, 14 Jun 2025 22:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749940106; cv=none; b=c576nKuBiULKp7X35vd6HeD0/jHdehHEAhueS44L7XUvAVQ+lKAMDsxIVnT/4M09eDfnGv/TKUzSwvGzsqSVXMMBLyHZtf5IS8z+sbKPsB9zgSBnB0m6kHIP1RdpmlwsWjAb4NEt9oXCKS8rdOuiUyOFeo5eCMHsdiux39r1UPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749940106; c=relaxed/simple;
	bh=vNTJogvHTj8hJl5G7MFoeuNIUrn1DtEp/N1qxITjRWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmY5twjYJbgRZJvN26pRoer34SvC9sWGO0qwd7Ljb/Nn7C1tnA5q2lAmjLC+/dEdmKBggNMET5cWtgvKfhY7ux+WUcL4wE/xW3bCSwWgw7innCK5ivJs2Tpu96zpRFyXBwtG6VA7pHbjlfcQtKFCqTqQMbNnabyCelNaAQa24m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qndMvW71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qndMvW71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542F5C4CEEB;
	Sat, 14 Jun 2025 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749940105;
	bh=vNTJogvHTj8hJl5G7MFoeuNIUrn1DtEp/N1qxITjRWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qndMvW717Q7hnYI5Wc6eBnPRQcebahakW6x6zvhTnUGCuOF1oZNiL7lNs464N4Qcg
	 8MZbKwi7XEc0E5ZNOYcKKhE4+cXvBFLDYouSxutqtaCgP3cSmfwWgkzXPWEVhKDTPw
	 rNjbhby6CrX6xIOJ4B+Tn7b7Ry5tNysbJPukUqAqIsm2bMVLlLKY9kke0KC3PgRRjF
	 Y9eVK69xy9yEKCGiaWZrFTVPgWPVZmtx2YAqsxLTywEC1BRKUOvAtLDO2QrJQAdzVG
	 +g1K5qBPLo3/a+qySzAwVYMMQQ+UFUNiJgOKryfFpvV+D9XIPQSVbTowfvBclLQ+5b
	 2iRW8CqNUjwlw==
Date: Sat, 14 Jun 2025 15:28:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [linux-next:master 1651/2468] lib/crc/crc64-main.c:58:10: fatal
 error: 'crc64.h' file not found
Message-ID: <20250614222816.GA133549@quark>
References: <202506150606.rxZTzhKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506150606.rxZTzhKn-lkp@intel.com>

On Sun, Jun 15, 2025 at 06:13:34AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bc6e0ba6c9bafa6241b05524b9829808056ac4ad
> commit: f58a15d5151d0d21b505ea43457f362cf0d75469 [1651/2468] lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250615/202506150606.rxZTzhKn-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150606.rxZTzhKn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506150606.rxZTzhKn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    clang: warning: no such include directory: 'lib/crc/um' [-Wmissing-include-dirs]
> >> lib/crc/crc64-main.c:58:10: fatal error: 'crc64.h' file not found
>       58 | #include "crc64.h" /* $(SRCARCH)/crc64.h */
>          |          ^~~~~~~~~
>    1 error generated.
> 
> 
> vim +58 lib/crc/crc64-main.c
> 
> e2fd1883971db5 Eric Biggers 2025-06-07  56  
> e2fd1883971db5 Eric Biggers 2025-06-07  57  #ifdef CONFIG_CRC64_ARCH
> e2fd1883971db5 Eric Biggers 2025-06-07 @58  #include "crc64.h" /* $(SRCARCH)/crc64.h */
> e2fd1883971db5 Eric Biggers 2025-06-07  59  #else
> e2fd1883971db5 Eric Biggers 2025-06-07  60  #define crc64_be_arch crc64_be_generic
> e2fd1883971db5 Eric Biggers 2025-06-07  61  #define crc64_nvme_arch crc64_nvme_generic
> e2fd1883971db5 Eric Biggers 2025-06-07  62  #endif
> e2fd1883971db5 Eric Biggers 2025-06-07  63  
> 
> :::::: The code at line 58 was first introduced by commit
> :::::: e2fd1883971db5a2e3537f7deb6702056891d03f lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
> 
> :::::: TO: Eric Biggers <ebiggers@google.com>
> :::::: CC: Eric Biggers <ebiggers@google.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Already fixed in crc-next by:
https://lore.kernel.org/r/20250612054514.142728-1-ebiggers@kernel.org/

- Eric
