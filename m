Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E242DF68;
	Mon, 25 Aug 2025 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756161527; cv=none; b=b4pTRXcWMQGav/OZaoPVhfAkLLBCkPgqx668cAzFJzh4qZgAp7wfSZcPZg1KZZ+sKR65xn9eW9jfx4zZxZj8223g4+oDPVF5cCmkDfOVtPanY3jPl9SZm+JnB1rJyVSQOepvlRIaKPiaSnH9hv5YuoTtDrgdbfNUIKnMiaMPTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756161527; c=relaxed/simple;
	bh=V3i7T9lT07bOL5BbFwOOCL7OwuJkih0vx0CRYju6Zfc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nEJTEbpDMVrENtsYQO3hWAMePbzV8tRHW34mYQPB6SchKqxoAC6+GImwdgGOz3kOamR4gixDX3K3Qxo7WIjTqZLra2CAcXYFdVFZOqoomJR/NW4OX6+0jL1p8gFnR2UF09gpr5aRGoCfDJyBPN6Dw7X6IywsT/sPnyd6rXvpeTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CuhMQyUp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CuhMQyUp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD16C4CEED;
	Mon, 25 Aug 2025 22:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1756161526;
	bh=V3i7T9lT07bOL5BbFwOOCL7OwuJkih0vx0CRYju6Zfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CuhMQyUpQXFe99MpbOgyGc6ceLTzbIgnEcgAFKhEtI1cgd6s+Ntsh4Q0mlJLZyNek
	 kSbLRYvmVNeE3ooiD5/FJ9bLyweFYv6q/51jTvx5vtGgPlE82FKuAzQdF7RsR7FLdD
	 D/JYbb6T4hP0kySuGRfDK4254+PxRDU/KRuudkaM=
Date: Mon, 25 Aug 2025 15:38:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Rohan McLure <rmclure@linux.ibm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [akpm-mm:mm-new 216/233]
 arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to
 function call, expected 3, have 2
Message-Id: <20250825153845.eae0ae269c3f28a18e7db069@linux-foundation.org>
In-Reply-To: <20250825200715.GA598466@ax162>
References: <202508230551.qiEQu04P-lkp@intel.com>
	<20250822150906.7a6a87a7a8ad69f2ad67c817@linux-foundation.org>
	<20250825200715.GA598466@ax162>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 Aug 2025 13:07:15 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from arch/riscv/kernel/asm-offsets.c:8:
> > >    In file included from include/linux/mm.h:31:
> > >    In file included from include/linux/pgtable.h:6:
> > > >> arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to function call, expected 3, have 2
> > >      951 |         page_table_check_pud_clear(mm, pud);
> > >          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~        ^
> > 
> > Thanks, I added this:
> 
> It appears that this fix patch was applied to the wrong patch. The error
> is about page_table_check_pud_check().

blah, OK, I'll drop everything.

Rohan, can you please refresh, retest, resend?  Against
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm's mm-new branch,
preferably.  Thanks.

