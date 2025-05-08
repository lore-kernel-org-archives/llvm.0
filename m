Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295672624;
	Thu,  8 May 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721999; cv=none; b=D2stcuRUuQDw5XbIEQifmSSUmQkm+iJb6WA7eSo4KiH19UcTGyzc4G8EEZ4J7Z4jqOXUcJrJ5WiRVOnjFmPhHcDlKGlNdVrdslQj2w3Sht7FXI55jz32a1pRVehDfFgjUJ3eIKF10+pc6bw6QbmmwbaxZ7rnwf4VusXIwhLbh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721999; c=relaxed/simple;
	bh=PYSdcj57vJVlGHaQhVhkwKge5Y4uulI4s6/PntA46Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aU0NiInEDfnI9z+VcVHRCcb+4Ju79jMADdBf5s724QATioE/aU/mHIUQpxRUhDZsQyX0AiuOyVKLGX1NsFsEJ6E1I+AJLM0m3ibHvGHPOCw2+V80Nx2jHxcuouPAmkbcHTyDdjO2mA8aNk2z5qXiF2MPRVf2MY4dOJGH8gut8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRJzsZ1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRJzsZ1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E52EC4CEE7;
	Thu,  8 May 2025 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721998;
	bh=PYSdcj57vJVlGHaQhVhkwKge5Y4uulI4s6/PntA46Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRJzsZ1OdT1EjkPOLAzmBVQmg6M8/OGj1D98vy1njEqXYgMktTNVDUC0mVk/Lf5ix
	 KJMUH0aoAP4JvpqJTjemGsr7ru9Arqf7qeqyMk+HLjEc+833FOrp4bkrbInQl4K2fT
	 zodoj99SJ91dNtPA+jL4ieGc7KihaGg/2d/M8lkti4YIwVILInzRv8dQrqeo9wYAZF
	 tvdoUnuaqUfTfgO45MpNr2PTKZl8cIFisJrGGA9wtAmjFsSxjZi68PKaym6U8QB3P5
	 FF7JCrtX0QcvdrBOtylj9ZnMurmMEBGdCP/hPGD9tq7R8iLwW35p3hOz+Zo4Z6cqdf
	 6KJMPabH663jw==
Date: Thu, 8 May 2025 17:33:14 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Xi Ruoyao <xry111@xry111.site>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [linux-next:master 3551/8679]
 arch/riscv/kernel/compat_signal.c:220:28: error: use of undeclared
 identifier 'compat__vdso_rt_sigreturn_offset'
Message-ID: <20250508163314.GB834338@ax162>
References: <202505071542.jdBqsSPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505071542.jdBqsSPB-lkp@intel.com>

On Wed, May 07, 2025 at 03:31:13PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0a00723f4c2d0b273edd0737f236f103164a08eb
> commit: 89079520cef65d6da1e864eab4464effe5396e23 [3551/8679] RISC-V: vDSO: Wire up getrandom() vDSO implementation
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250507/202505071542.jdBqsSPB-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071542.jdBqsSPB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505071542.jdBqsSPB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/riscv/kernel/compat_signal.c:220:28: error: use of undeclared identifier 'compat__vdso_rt_sigreturn_offset'
>      220 |         regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
>          |                                   ^
>    arch/riscv/include/asm/vdso.h:29:42: note: expanded from macro 'COMPAT_VDSO_SYMBOL'
>       29 |         (void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
>          |                                                 ^
>    <scratch space>:315:1: note: expanded from here
>      315 | compat__vdso_rt_sigreturn_offset
>          | ^
>    1 error generated.

I think this happens because the compat vDSO errored earlier, it should
be fixed with

  https://lore.kernel.org/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/

Cheers,
Nathan
