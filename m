Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3984299928;
	Tue, 11 Nov 2025 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888203; cv=none; b=sf5+3EiC8VKcgSDjhIQ0wdKYwSeB65jYsVwrx0yK5in/R/yZyogdqfBOVjevIYa3lzC2ANygaxMxqNZ8ShDQU499brn8YJr/u2PmaLDe4AmEQTuQ66ygnrgWlkpkBANhU6D5uKEjtJI0Cg1Ajpu77ql4VANKwmxzCyRDmJjWFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888203; c=relaxed/simple;
	bh=El+Z/L3HXKC2aFhDnhlEIS9FQckPXE2P5pGlBt1edZA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RzguUEpLrMSSGGd3eqb1lIcTth1otJEtfDvKhD+WpfUatsDYn/YObijWnudgjfPlh2InWdgyOlgytLFlL0J8qzNgVCyGfC5nE96zRvAinPZGToNzhp0v8LWRrDk9bqOKTNDTHP3Ay1DKwIBkfoOP1+lgeFf8rabWkjIj55oFXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yMmALMuA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yMmALMuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FD9C113D0;
	Tue, 11 Nov 2025 19:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1762888202;
	bh=El+Z/L3HXKC2aFhDnhlEIS9FQckPXE2P5pGlBt1edZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yMmALMuASVOTl3Ax05wz3Zqh3iGBO2/lclrUnhOWppWSyY/IMwv3q6V3gyRKcgTKp
	 1b3iUf+YFnPkC/qrN7MtjYiVW5kac7f5wNRJ6C0aPwfTQBTTA1GQXZtRuWFfM+YfM3
	 flFsQFRzQmVA1/biAKn5D9dZgcjBPZ6/xRqCB9Pg=
Date: Tue, 11 Nov 2025 11:10:01 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7210/7661]
 kernel/liveupdate/luo_file.c:571:3: error: call to undeclared function
 'get_file'; ISO C99 and later do not support implicit function declarations
Message-Id: <20251111111001.a4a4bee3d4e132b76115fe5e@linux-foundation.org>
In-Reply-To: <202511120222.vMZm9rD4-lkp@intel.com>
References: <202511120222.vMZm9rD4-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Nov 2025 02:19:06 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2666975a8905776d306bee01c5d98a0395bda1c9
> commit: 74602408d6248999ca8a567c46ce0f78204d6e89 [7210/7661] liveupdate: luo_file: implement file systems callbacks
> config: x86_64-buildonly-randconfig-001-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120222.vMZm9rD4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120222.vMZm9rD4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511120222.vMZm9rD4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/liveupdate/luo_file.c:571:3: error: call to undeclared function 'get_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      571 |                 get_file(luo_file->file);
>          |                 ^

Thanks.

--- a/kernel/liveupdate/luo_file.c~liveupdate-luo_file-implement-file-systems-callbacks-fix
+++ a/kernel/liveupdate/luo_file.c
@@ -102,6 +102,7 @@
 #include <linux/liveupdate/abi/luo.h>
 #include <linux/module.h>
 #include <linux/rwsem.h>
+#include <linux/fs.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/string.h>
_


