Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221A62BEFE5;
	Fri, 27 Feb 2026 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158433; cv=none; b=B+gE/4ob9cz2DXru87eOgVpkklwnmlqey3nFyPavrHg6XI7iNVfsut8op5LkiJPcXFWWcqWSbJfXUpi7mEiceuOzb9uMrBwABYNx2olR/tdn/z7s+R/Q+MlpBhZ7GrPgTI66C3K1Qg6T0xhP8ZylIV9ucel2hQsObRnjbY/1kfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158433; c=relaxed/simple;
	bh=pUzfhXPt9/t1WG+dFLR5+cJwUQBfw7GEYe25p4yVmAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=unN74BG5vJFfCUSS4BXyhw0aH/sUDdiQnlMS93nJAik37kCjhD6QbdlJDBYT34rDlKlMQcF7oywu/cY69Q9uRkjsT3YzCVz1ku0ZnFyFn//TsTogTmC5GuBbsNHmHvEWwL2Azie2cUHhC/3AD3mErZ1O1kgyW64udJoOygnadAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=yvX1brx3; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="yvX1brx3"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=voAqtAuA68HE0t2honi6L8XVGdT1Q7y+AUf9C/awVpw=;
	b=yvX1brx34dEfh8Jk2jDfwCYTJBctFaqjFG2qXZxOUugWpPHxKnE78Low/xV0xarG9BZ5zHPgZ
	Md7OokrOazq6PtuEHY4EMUvY8NnNW8YHA/5SFHBr52BnbGLhTp3kvrGdYC50C3SAPdv94DsvXn9
	8fuq1fxSVN8yvfCnjW8TPqU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fMWwB445BzKmWX;
	Fri, 27 Feb 2026 10:08:58 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 165C2402AB;
	Fri, 27 Feb 2026 10:13:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Feb 2026 10:13:45 +0800
Message-ID: <ce8f3a69-1313-2d58-dfc2-fcbec849d6b5@huawei.com>
Date: Fri, 27 Feb 2026 10:13:44 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <pmladek@suse.com>,
	<rdunlap@infradead.org>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<paulmck@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
References: <20260226130437.1867658-5-ruanjinjie@huawei.com>
 <202602270403.GagykAb8-lkp@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202602270403.GagykAb8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/2/27 4:34, kernel test robot wrote:
> Hi Jinjie,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on robh/for-next linus/master v7.0-rc1 next-20260226]
> [cannot apply to powerpc/next powerpc/fixes]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/powerpc-crash-sort-crash-memory-ranges-before-preparing-elfcorehdr/20260226-222516
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20260226130437.1867658-5-ruanjinjie%40huawei.com
> patch subject: [PATCH v7 4/5] arm64: kexec: Add support for crashkernel CMA reservation
> config: x86_64-buildonly-randconfig-004-20260226 (https://download.01.org/0day-ci/archive/20260227/202602270403.GagykAb8-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270403.GagykAb8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602270403.GagykAb8-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/of/kexec.c:312:29: warning: unused variable 'i' [-Wunused-variable]
>      312 |         int ret, chosen_node, len, i;
>          |                                    ^
>    1 warning generated.
> 
> 
> vim +/i +312 drivers/of/kexec.c
> 
>    294	
>    295	/*
>    296	 * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
>    297	 *
>    298	 * @image:		kexec image being loaded.
>    299	 * @initrd_load_addr:	Address where the next initrd will be loaded.
>    300	 * @initrd_len:		Size of the next initrd, or 0 if there will be none.
>    301	 * @cmdline:		Command line for the next kernel, or NULL if there will
>    302	 *			be none.
>    303	 * @extra_fdt_size:	Additional size for the new FDT buffer.
>    304	 *
>    305	 * Return: fdt on success, or NULL errno on error.
>    306	 */
>    307	void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>    308					   unsigned long initrd_load_addr,
>    309					   unsigned long initrd_len,
>    310					   const char *cmdline, size_t extra_fdt_size)
>    311	{
>  > 312		int ret, chosen_node, len, i;
>    313		const void *prop;
>    314		size_t fdt_size;
>    315		void *fdt;

If this patch is acceptable for merging, could you please help move the
loop variable i to a different location as below to avoid resending a
new version?

--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -309,10 +309,10 @@ void *of_kexec_alloc_and_setup_fdt(const struct
kimage *image,
                                   unsigned long initrd_len,
                                   const char *cmdline, size_t
extra_fdt_size)
 {
-       void *fdt;
        int ret, chosen_node, len;
        const void *prop;
        size_t fdt_size;
+       void *fdt;

        fdt_size = fdt_totalsize(initial_boot_params) +
                   (cmdline ? strlen(cmdline) : 0) +
@@ -431,6 +431,15 @@ void *of_kexec_alloc_and_setup_fdt(const struct
kimage *image,
                if (ret)
                        goto out;

+               for (int i = 0; i < crashk_cma_cnt; i++) {
+                       ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
+                                       "linux,usable-memory-range",
+                                       crashk_cma_ranges[i].start,
+                                       crashk_cma_ranges[i].end -
crashk_cma_ranges[i].start + 1);
+                       if (ret)
+                               goto out;
+               }
+
                if (crashk_low_res.end) {
                        ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
                                        "linux,usable-memory-range",


>    316	
>    317		fdt_size = fdt_totalsize(initial_boot_params) +
>    318			   (cmdline ? strlen(cmdline) : 0) +
>    319			   FDT_EXTRA_SPACE +
>    320			   extra_fdt_size;
>    321		fdt = kvmalloc(fdt_size, GFP_KERNEL);
>    322		if (!fdt)
>    323			return NULL;
>    324	
>    325		ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
>    326		if (ret < 0) {
>    327			pr_err("Error %d setting up the new device tree.\n", ret);
>    328			goto out;
>    329		}
>    330	
>    331		/* Remove memory reservation for the current device tree. */
>    332		ret = fdt_find_and_del_mem_rsv(fdt, initial_boot_params_pa,
>    333					       fdt_totalsize(initial_boot_params));
>    334		if (ret == -EINVAL) {
>    335			pr_err("Error removing memory reservation.\n");
>    336			goto out;
>    337		}
>    338	
>    339		chosen_node = fdt_path_offset(fdt, "/chosen");
>    340		if (chosen_node == -FDT_ERR_NOTFOUND)
>    341			chosen_node = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
>    342						      "chosen");
>    343		if (chosen_node < 0) {
>    344			ret = chosen_node;
>    345			goto out;
>    346		}
>    347	
>    348		ret = fdt_delprop(fdt, chosen_node, "linux,elfcorehdr");
>    349		if (ret && ret != -FDT_ERR_NOTFOUND)
>    350			goto out;
>    351		ret = fdt_delprop(fdt, chosen_node, "linux,usable-memory-range");
>    352		if (ret && ret != -FDT_ERR_NOTFOUND)
>    353			goto out;
>    354	
>    355		/* Did we boot using an initrd? */
>    356		prop = fdt_getprop(fdt, chosen_node, "linux,initrd-start", &len);
>    357		if (prop) {
>    358			u64 tmp_start, tmp_end, tmp_size;
>    359	
>    360			tmp_start = of_read_number(prop, len / 4);
>    361	
>    362			prop = fdt_getprop(fdt, chosen_node, "linux,initrd-end", &len);
>    363			if (!prop) {
>    364				ret = -EINVAL;
>    365				goto out;
>    366			}
>    367	
>    368			tmp_end = of_read_number(prop, len / 4);
>    369	
>    370			/*
>    371			 * kexec reserves exact initrd size, while firmware may
>    372			 * reserve a multiple of PAGE_SIZE, so check for both.
>    373			 */
>    374			tmp_size = tmp_end - tmp_start;
>    375			ret = fdt_find_and_del_mem_rsv(fdt, tmp_start, tmp_size);
>    376			if (ret == -ENOENT)
>    377				ret = fdt_find_and_del_mem_rsv(fdt, tmp_start,
>    378							       round_up(tmp_size, PAGE_SIZE));
>    379			if (ret == -EINVAL)
>    380				goto out;
>    381		}
>    382	
>    383		/* add initrd-* */
>    384		if (initrd_load_addr) {
>    385			ret = fdt_setprop_u64(fdt, chosen_node, "linux,initrd-start",
>    386					      initrd_load_addr);
>    387			if (ret)
>    388				goto out;
>    389	
>    390			ret = fdt_setprop_u64(fdt, chosen_node, "linux,initrd-end",
>    391					      initrd_load_addr + initrd_len);
>    392			if (ret)
>    393				goto out;
>    394	
>    395			ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
>    396			if (ret)
>    397				goto out;
>    398	
>    399		} else {
>    400			ret = fdt_delprop(fdt, chosen_node, "linux,initrd-start");
>    401			if (ret && (ret != -FDT_ERR_NOTFOUND))
>    402				goto out;
>    403	
>    404			ret = fdt_delprop(fdt, chosen_node, "linux,initrd-end");
>    405			if (ret && (ret != -FDT_ERR_NOTFOUND))
>    406				goto out;
>    407		}
>    408	
>    409		if (image->type == KEXEC_TYPE_CRASH) {
>    410			/* add linux,elfcorehdr */
>    411			ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
>    412					"linux,elfcorehdr", image->elf_load_addr,
>    413					image->elf_headers_sz);
>    414			if (ret)
>    415				goto out;
>    416	
>    417			/*
>    418			 * Avoid elfcorehdr from being stomped on in kdump kernel by
>    419			 * setting up memory reserve map.
>    420			 */
>    421			ret = fdt_add_mem_rsv(fdt, image->elf_load_addr,
>    422					      image->elf_headers_sz);
>    423			if (ret)
>    424				goto out;
>    425	
> 
