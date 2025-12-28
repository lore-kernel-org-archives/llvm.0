Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6451D6195;
	Sun, 28 Dec 2025 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766958978; cv=none; b=UnxyTOECQ6OIC6xzmDQwAZnu7k6EhkAvxiI7hRH9SMDCnGrDeDtFU0zt2j/djhG3CNH4OtKNrsvqdm8vmQ7AFTguG98NBaFin9oP24OP3VOpYZpgliSSQ0557dGnbrpZi849fGuSNXNReKCtRpjUbxCxL5GMkqGJZZ832h1cbGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766958978; c=relaxed/simple;
	bh=h9J1W/6qeXCXFcc9WTdkGzuxAMIhZc3abbaha7ymYlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/WB2STqRL1AAwhF52f+WMUG769OwYvCewA+mK/ORd5+aM1Lx3lasp4nQdj/RBQW9meB4V3A6dYwhsE6VZL2nWhEtJuaU2a7F3U3GgRvr70LBJXz98Y3SvmSqRH6xL3IfrtPCp+h0CuGxE73288UIwZilZLA3nA0YC/pS9hMboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6kP6p3e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6kP6p3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C3DC4CEFB;
	Sun, 28 Dec 2025 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766958977;
	bh=h9J1W/6qeXCXFcc9WTdkGzuxAMIhZc3abbaha7ymYlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6kP6p3eIsXi/oNcYimf2y8YtiQ0bXLMueMiuWkJlf9EolZjK8Jz1pqVpNqROJIXH
	 mmtB66oeJsalB2nctBbAtKrRgm55m32EHj5CeRaZX4F1yg3SpUk5xaoYBKT7F6LqiJ
	 MKHQ24gCf1VsREMEKT2OOER7iplYjsOPocvs33WOeK+bzcH5O5Ruo+u1RwBXM5uwn6
	 Q5ORz1k7ECvNBHLMlqMUMUxYOqi5MHu3Gk6ZA21q6v9tf4NdDyjkGYgDF3xMk4+YTK
	 YY0Ig05WScT50dGHEc9/37lZ69ADl8x4d3nOugpaMOf6gVi2Hs9+zn7modn6/+N4Rg
	 vbGLgXLjnUHkQ==
Date: Sun, 28 Dec 2025 14:56:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
Subject: Re: [bpf-next:master 8/9] ld.lld: error: .tmp_vmlinux1.btf.o is
 incompatible with elf32lriscv
Message-ID: <20251228215613.GA2167770@ax162>
References: <202512240559.2M06DSX7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512240559.2M06DSX7-lkp@intel.com>

On Wed, Dec 24, 2025 at 06:02:31AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> head:   f14cdb1367b947d373215e36cfe9c69768dbafc9
> commit: 522397d05e7d4a7c30b91841492360336b24f833 [8/9] resolve_btfids: Change in-place update with raw binary output
> config: riscv-randconfig-002-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240559.2M06DSX7-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240559.2M06DSX7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512240559.2M06DSX7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: .tmp_vmlinux1.btf.o is incompatible with elf32lriscv

While I have not verified this, I suspect this error occurs because the
${CC} command in gen_btf_o() in scripts/gen-btf.sh only includes
CLANG_FLAGS for the target selection but not '-m32' or '-m64' from
KBUILD_CFLAGS to control the word size (as documented in
scripts/Makefile.clang).

Cheers,
Nathan
