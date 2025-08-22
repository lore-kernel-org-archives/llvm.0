Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF520322;
	Fri, 22 Aug 2025 22:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755900547; cv=none; b=K79z4pEKy0sRlgmU+KtQdlN+/57esXQuaoOe3LE8pr8uy/vOaUf3q1RTlv6pBXByi2zhvebGqeA44V0n0rtXfRRJMfzXc9GQp7GmHvgEXJLd/A00A/LR/OZGKeK40z5WKOafZM7KywvEaLxodeM7bDAKKOxc9Zf1S6pnSjVUqtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755900547; c=relaxed/simple;
	bh=+76XesRQfwoY1jEOmEJj0AwVlQTN3XUHf6f+eVyTwds=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AW0C8xAo9W3x7lhZpoZzX4VkU3yhfx6b+XsnUC+cH7/NxvP/UT7aZtjc9YE40BfLIxFlet/SPjkCWJMU9HjC2D3R+O3ywNyQt4ZTVEWY7neB/il4fAatYLY6+KU+XxB0EqCD+Lcnao1Lbu4HSOpOhaCb8BgEI6Vx6l+kW0mBAzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cKAnUECY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cKAnUECY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C315DC4CEED;
	Fri, 22 Aug 2025 22:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755900547;
	bh=+76XesRQfwoY1jEOmEJj0AwVlQTN3XUHf6f+eVyTwds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cKAnUECY3qTdBMpzcdGQSEWAve14+6uMcO//W7omALZoPTIIfzx83LOHwRj4QS0XS
	 iE/ciok3Xn3L/j9nlsYmi5n5lKHDjNNXwiWbjVIFikY2+eFsK/pf8w2AbpEn9P1GPz
	 P5x3C9Kr9Cg+1YDv39PELXoo8gC6+nMCKI+95qdY=
Date: Fri, 22 Aug 2025 15:09:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Rohan McLure <rmclure@linux.ibm.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Andrew Donnellan <ajd@linux.ibm.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>
Subject: Re: [akpm-mm:mm-new 216/233]
 arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to
 function call, expected 3, have 2
Message-Id: <20250822150906.7a6a87a7a8ad69f2ad67c817@linux-foundation.org>
In-Reply-To: <202508230551.qiEQu04P-lkp@intel.com>
References: <202508230551.qiEQu04P-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 23 Aug 2025 05:30:45 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   a8af4c2fd982fd94fffde3c5b6b764fd20af68fe
> commit: e009b0f3187482a5756ff3b015cf30277cc1cfd9 [216/233] mm/page_table_check: reinstate address parameter in [__]page_table_check_pud_clear()

> config: riscv-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230551.qiEQu04P-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230551.qiEQu04P-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508230551.qiEQu04P-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/riscv/kernel/asm-offsets.c:8:
>    In file included from include/linux/mm.h:31:
>    In file included from include/linux/pgtable.h:6:
> >> arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to function call, expected 3, have 2
>      951 |         page_table_check_pud_clear(mm, pud);
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~        ^

Thanks, I added this:

--- a/arch/riscv/include/asm/pgtable.h~mm-page_table_check-reinstate-address-parameter-in-page_table_check_pud_set-fix
+++ a/arch/riscv/include/asm/pgtable.h
@@ -948,7 +948,7 @@ static inline pud_t pudp_huge_get_and_cl
 {
 	pud_t pud = __pud(atomic_long_xchg((atomic_long_t *)pudp, 0));
 
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, address, pud);
 
 	return pud;
 }
_

