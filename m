Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38DA15EFC5;
	Thu, 27 Jun 2024 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491977; cv=none; b=TbncoMoWt9Oy8dVNpVlvglPtua+ciWnEz4FIzZAB2trbj3K0yKZ3P6a1qnO/ym2lrdgYFj3q4n4umavU0CrfT/KBRo+bgNETF2JCGGmmcpP4c/UtMgJi/MpBNivGPqQhtmF4kx2/EFpcZsb78w4/5rkpQ/Ek1ljXldb6GVVW5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491977; c=relaxed/simple;
	bh=XIiN2SU02Qa6IoY68GGkhAS66T4UHBbwG6fx2lujuAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YLvPvms9RcRug5L7yrT5Na0AuJNqtExW1zMILRY/l/NsL9v9e+4wk1BvrjVsfnldckYiBTH4b2dNP9YWlrGHgnXTHb3mY2UQYcT/cLJ7MzRn8Nta0wKTZvCdiDaBhpd1teTIJpKhse+q+v42WAFpRt3g9eVxu7mznArkKsUKq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ahrCbyoU; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ahrCbyoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vkEX8
	CnABxw6g+6C0/kCh5ySrZHNhjny2P+4xtrVQvM=; b=ahrCbyoULxWhJIuJgH8Iv
	VP5YQszl65e68JeQy8ymXXc1VGhMW9wIF7+FtuJGzQsNyjVcJ1xhw/meuLrZAB8t
	pd4v8ynYeEIFRv6FpZVdsvnHU0vhXim9J3AMY66WQrn3ejw8NvRYkJ90vJw9dVEd
	FqXpcpPrvY4lmzBcdhbEpI=
Received: from localhost.localdomain (unknown [193.203.214.57])
	by gzga-smtp-mta-g1-0 (Coremail) with SMTP id _____wD3_4FeXX1m+wa7Ag--.41205S4;
	Thu, 27 Jun 2024 20:38:55 +0800 (CST)
From: ran xiaokai <ranxiaokai627@163.com>
To: lkp@intel.com
Cc: baohua@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	peterx@redhat.com,
	ran.xiaokai@zte.com.cn,
	ranxiaokai627@163.com,
	ziy@nvidia.com
Subject: Re: [PATCH 2/2] kpageflags: fix wrong KPF_THP on non-pmd-mappable compound pages
Date: Thu, 27 Jun 2024 12:38:54 +0000
Message-Id: <20240627123854.23205-1-ranxiaokai627@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202406262300.iAURISyJ-lkp@intel.com>
References: <202406262300.iAURISyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_4FeXX1m+wa7Ag--.41205S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1kCw17JF15ur47CFWfKrg_yoW5Jr1xpa
	18GFs8Kr48Gw1rGws7GFWUZa1jqws8Wr1agF18Gw47ZF4YvFyq9r4Ikr13uwnFgrykKrWf
	Crn7XF9Yqa4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUKAp8UUUUU=
X-CM-SenderInfo: xudq5x5drntxqwsxqiywtou0bp/1tbiqQALTGVOBIg1VwAAsr

> Hi ran,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.10-rc5 next-20240625]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/ran-xiaokai/mm-Constify-folio_order-folio_test_pmd_mappable/20240626-113027
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240626024924.1155558-3-ranxiaokai627%40163.com
> patch subject: [PATCH 2/2] kpageflags: fix wrong KPF_THP on non-pmd-mappable compound pages
> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240626/202406262300.iAURISyJ-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406262300.iAURISyJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406262300.iAURISyJ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> fs/proc/page.c:151:35: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>      151 |         else if (folio_test_pmd_mappable(folio)) {
>          |                                          ^~~~~
>    include/linux/huge_mm.h:438:58: note: passing argument to parameter 'folio' here
>      438 | static inline bool folio_test_pmd_mappable(struct folio *folio)
>          |                                                          ^
>    1 error generated.

Hi,

This patch is the second patch of the serial:
https://lore.kernel.org/lkml/20240626024924.1155558-1-ranxiaokai627@163.com/

and it relies on the first patch:
https://lore.kernel.org/lkml/20240626024924.1155558-2-ranxiaokai627@163.com/

and it seems the first patch is not applied.
Or in this case, we should not split these two patches?

