Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CCC1BF2A;
	Mon, 15 Apr 2024 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713190199; cv=none; b=uP5ZaM9+wkn6UiG7dmgP2ColnvNSeCZTyoAWo2pRvFy2nTXejseUK8Zjq2kmUrrFTNUzvzUg1OcNHpmeWr7EaphPousnY5CQrgNfWAVuwASeufOEnoW/wGEs/NRZdqEzLlborT5YpXiAU5Soy0pDcMs+gTcRPrPTiSzn12YawfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713190199; c=relaxed/simple;
	bh=g9TmFsQA8BZhMgljVxSGsYCZtc2xUei9846QT/4hyLs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oUxYviSMxow5BRfE/Q1lFOWoKdlIZ6tfV84cDVryecNrzG41Iv0DCQJHlAG06GxmgSjfPi9Mn5xcITQLCSy2eV/os3HL0VI9Z0pVuKSMe/4+5sWR/9L5ZGadVBZTLyGxLGDBI7pIBZQBn2esjk3wRAPXgjZt2DoQl0nC/9qBt24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNw8+OF0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNw8+OF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5DAC113CC;
	Mon, 15 Apr 2024 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713190198;
	bh=g9TmFsQA8BZhMgljVxSGsYCZtc2xUei9846QT/4hyLs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KNw8+OF0gzeDHsuCuuKOxBg0oTgLPif0JtuG5ptlPpnJdnWtl/4BjTS09vWsVVETt
	 KofJZpqeKME6H99NoG/BkJkiAb4YrByWfKtOtjyhUK1KVkU9XIjD7Oeqvi8zW5j/KV
	 uszEhOoxMfpV67pS+dEyQURfiK4uK2zN4/DFqyXSTyaYUo33IpAlRKYPdiD3eEgdfj
	 +V5kxYNNGVKvPOs2riVov1d6g+JfqT89scBWdMNANV5YDzTxD7ShYVuEhpNLEONvGS
	 f8oLvuBenmCFUbz+cchgY3Uk3hGfleG7Ti4BKi5+XUUVXVzdaqihe2V8E7L1OobH8h
	 PurDwI1WmuEYA==
Date: Mon, 15 Apr 2024 23:09:54 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Qiang Zhang <qiang4.zhang@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [trace:bootconfig/fixes 4/4] lib/bootconfig.c:911: warning:
 Function parameter or struct member 'early' not described in '_xbc_exit'
Message-Id: <20240415230954.2d12f4db697290c3e98d4d16@kernel.org>
In-Reply-To: <202404150036.kPJ3HEFA-lkp@intel.com>
References: <202404150036.kPJ3HEFA-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Apr 2024 00:26:07 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace bootconfig/fixes
> head:   89f9a1e876b5a7ad884918c03a46831af202c8a0
> commit: 89f9a1e876b5a7ad884918c03a46831af202c8a0 [4/4] bootconfig: use memblock_free_late to free xbc memory to buddy
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240415/202404150036.kPJ3HEFA-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404150036.kPJ3HEFA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404150036.kPJ3HEFA-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/bootconfig.c:911: warning: Function parameter or struct member 'early' not described in '_xbc_exit'
> >> lib/bootconfig.c:911: warning: expecting prototype for xbc_exit(). Prototype was for _xbc_exit() instead

Ok, I didn't check the kernel doc part.
Let me fix this.

Thank you,

> 
> 
> vim +911 lib/bootconfig.c
> 
> f3668cde856299 Masami Hiramatsu 2021-09-17  902  
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  903  /**
> 115d4d08aeb942 Masami Hiramatsu 2021-09-17  904   * xbc_exit() - Clean up all parsed bootconfig
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  905   *
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  906   * This clears all data structures of parsed bootconfig on memory.
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  907   * If you need to reuse xbc_init() with new boot config, you can
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  908   * use this.
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  909   */
> 89f9a1e876b5a7 Qiang Zhang      2024-04-14  910  void __init _xbc_exit(bool early)
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11 @911  {
> 89f9a1e876b5a7 Qiang Zhang      2024-04-14  912  	xbc_free_mem(xbc_data, xbc_data_size, early);
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  913  	xbc_data = NULL;
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  914  	xbc_data_size = 0;
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  915  	xbc_node_num = 0;
> 89f9a1e876b5a7 Qiang Zhang      2024-04-14  916  	xbc_free_mem(xbc_nodes, sizeof(struct xbc_node) * XBC_NODE_MAX, early);
> a91e4f12ffc42f Masami Hiramatsu 2020-02-07  917  	xbc_nodes = NULL;
> ead1e19ad905b9 Masami Hiramatsu 2020-09-21  918  	brace_index = 0;
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  919  }
> 76db5a27a827c2 Masami Hiramatsu 2020-01-11  920  
> 
> :::::: The code at line 911 was first introduced by commit
> :::::: 76db5a27a827c2c89e5120a3d486472da847863b bootconfig: Add Extra Boot Config support
> 
> :::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
> :::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
