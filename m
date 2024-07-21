Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A16944E;
	Sun, 21 Jul 2024 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721577856; cv=none; b=VXtXG5HC/fbvbm1y06PK0R/1Zf6ViKM0pp+t05rna/xMNO69Aejng4L30/QTEslKzqFqB5xhPvALPwtom0KsMuqLVtEvgMCQriRCGjrcUPVAkXZWMip0H0Z1rEK1donpL3tcFmdGrxOtGzCgVQsm27bor0JSGjByZnY4XQq3Qtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721577856; c=relaxed/simple;
	bh=AnSfINUiuqi8C53XcZTZvlixM/jub3PO3LFVCAyukI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYFxBWm9xLRM4ivMWhRE7GdQGfyl53xyU1Z5v6t8/8UEGQC5HqSJv4Ic8oVG2+tZ4xc9Zu0x13MMSOuSRc+FKfA2JkkKOK6a6xPB5/q9PhplpQBg9TrA/74xNOnEPyby257bbsFYvwyCpIVUp/YZ8BEfszJ1QhpAdm1niYv4a0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdgKbeTQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdgKbeTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467FCC116B1;
	Sun, 21 Jul 2024 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721577855;
	bh=AnSfINUiuqi8C53XcZTZvlixM/jub3PO3LFVCAyukI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdgKbeTQcDicr/B/RTQhNN0d3ncsL3/YjvUZfSUs7PFx2jnj6J/R0+BnHLlz8T1RA
	 e0YoQSP6z+b/8UH82LQvJQq1nwoO/MsRoSD8JcoHqGbK0KZTsiFDRALEQ+pvF/4xWF
	 5WNxjRqc/WVLMyQPFhwQrkZ99utWKQh2P+C+XgNGxzaQH2yyEuymJ5UflrtDuilITV
	 8/LWSLA7C1B0bqVBRwqj+QfyyE634JjrZCSmArcFJkuURKoHzZQIfGCWaF8QIoh58n
	 CnQBP77AS5tN/nulQTMWHuoRmd2lL43hOLxuf7okPQOaKqqtd5dZGJtnjH8T11KMQa
	 C2L0lzLyBH+Xw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 47/56] mm/damon/vaddr.c:307:6: error: call to undeclared function 'pmd_trans_huge'; ISO C99 and later do not support implicit function declarations
Date: Sun, 21 Jul 2024 09:04:13 -0700
Message-Id: <20240721160413.357392-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407211853.4RE1o37u-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Sun, 21 Jul 2024 18:21:27 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi SeongJae,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   c3004f235d68aa890660b532b04714a40abafd78
> commit: 06463781fa1457eb6fb892eb36da7be303933de6 [47/56] mm/damon/Kconfig: select DAMON modules to test when test config is set
> config: riscv-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211853.4RE1o37u-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211853.4RE1o37u-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407211853.4RE1o37u-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
[...]
> >> mm/damon/ops-common.c:42:40: error: call to undeclared function 'pte_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       42 |         struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
>          |                                               ^
[...]

Thank you for this report!  However, I cannot reproduce this issue following
the instruction.  That said, I think this issue is same to your previous
report[1], and therefore the fix for the report should also fix this issue?
Please let me know if I'm missing something.

[1] https://lore.kernel.org/202407211851.ymsqkPO7-lkp@intel.com


Thanks,
SJ
