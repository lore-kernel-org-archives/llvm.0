Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33726529B
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754889187; cv=none; b=c7arXq/y7DkHaii24mfVu7DkBgWhhxE6nJfjnJXz5c/jn3shoMSzkjlptBHC6NahYinAMw7S5uMj0DSa+47Py6p3WObz4bhpAdCF9aoPP9xwP4uzs4Tgp9eRJI2lvkU8avVXa+8+Au5jTk2fujWudC8R0OXf/bCpAIm8drc2NDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754889187; c=relaxed/simple;
	bh=PIwwitFtwncqFPfcdRZIKPpYKpLCCzKFD8DtmlOxBq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ergkZWJ4PIh8MdeTkDrKT8hrVM5WuayclQdPzN3O6Jwm1bFnoJIVmTWLSxEevQuFlglojqH1qP1yHG/g5F/4c5lQTWilfn+3phnVKH+OvvVZsxhlOJHa3sLvZvqcgaJhx13Vctk+4W1tZW8do8iHIHKbhZAoGQyzDr2iGkYe5Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DfoNgwBZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DfoNgwBZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so4206331f8f.1
        for <llvm@lists.linux.dev>; Sun, 10 Aug 2025 22:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754889182; x=1755493982; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vb8TTR8hEV4g8/OZKd8Ib45/HtKzsxAgCrIb4ECPQpQ=;
        b=DfoNgwBZDy0iI+J4yXze7EuNqaWPQ1/PTV9r6RFRP0WkG1nP8mkMDHSwGeOZ+7UrDd
         w9RsyAxG+bJUFgZFoSaN5IQtjD4fgHb3fUpb3P43rtZ2gp2tXv9GyExu29EXp47yUcju
         qZzlYWeMWn13G8QI6PDwZd5Bx9F4xCzmfzW1m/27ieRO0L0pY0m3UTtIsQZ6cAoMOKEo
         jc9TDQeeAhE71gmwFkWRLKwSB3ZRProA1td7+WIDGY5hboa5HcqZBip0r/kOt347RIdM
         pZzt1sNZzjjE1fJK8i6EAyuFn8sEh+amt44GTdRTuJXZ9M6b9RU5KdcyhuUaBp3sneBU
         3pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754889182; x=1755493982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb8TTR8hEV4g8/OZKd8Ib45/HtKzsxAgCrIb4ECPQpQ=;
        b=eQKEHqhTqDvBV17iGCEaObTY24Os40K3Ct+4lrvwdX4AG1Z5s03hbFc7vSVZe6HbEZ
         pbOFBrdweV8l6oIS7awyvFnAjXX2NvBrE1zGzJ2OsWtTKCAkANsD5xL+09UoOig01I2I
         MZvvDY72O47884H4HmSPgbnPMOUpDnclcbIiair57SToCiuAf2EqzHeqyiGgBx4vae2b
         Hp6iuLwyfW9a3votGnXjzGFpSdHmzXwjupL1JPdAfI1Uq0r4ptLQxXLoP3O2rmLQvuGa
         J1Jf1wVRMkI34tSDCCnqKH7cqsssh7ebFxEjXMSkbMu7lYenugzhH4sGt9N7mgTP+3MZ
         65vg==
X-Gm-Message-State: AOJu0Yx+ya0ycZS/sVb8+oCsqQTJ52qidp101HVTLlMRLT/BA60ZVUJ6
	Cz/r+zVllqyF8r8PrQauI4YbhSWbwppAR2/Rq2Cjhcz1NJvq6BjNzMFM115fM1d9Y/M=
X-Gm-Gg: ASbGnctqAY4BegyZiJe0kcpqJAn1j7mEdbalhVOL/ZuBXHalfP0ZcF+Xn/pIFoLg01+
	uMe87WuBaCC8nADFzus2ouC1Ecru/KSPuRsI6QEhB84+7brsKqsCZHkaZopQf8Z6ZNkRRQRzfme
	2nbxs4cmJlwGprUfzc2B5IpONQwP7EqH8IvqsUa7vqx1N+y0D7NAZ7sQq2vrcCQqxzHUVEQInEw
	hVUquu1fKKZ1gBKLPHgllnAOO2hvcc6bTqk3x1Qs9PRCQZedQHLylg4f8erYKsIYQ/s4w2J9xrd
	4mV8iid3ZQlw4cxzJVCzMWR01gfYaApcK5dyVtP8NVWew/VZLTEp21j9tbf5qqrAHDbXn5OA2mc
	4ZG1nAfVC4iPjpd04aw5+SvrH1e9Dlz9I7CWPs05Yg0a+lOtNQQ==
X-Google-Smtp-Source: AGHT+IFKQD8ittXWrLC6YuswuaOnCmUXG2xzj+kqw3dWt9bjIcY4BtzEHfllyjeXwpMnr8JDTBP58w==
X-Received: by 2002:a05:6000:2484:b0:3b8:d337:cc12 with SMTP id ffacd0b85a97d-3b900b4d924mr8913434f8f.22.1754889181995;
        Sun, 10 Aug 2025 22:13:01 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f911sm25810756b3a.47.2025.08.10.22.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Aug 2025 22:13:01 -0700 (PDT)
Message-ID: <c51f8f46-38e6-42e2-ad8c-7ee7538711d3@suse.com>
Date: Mon, 11 Aug 2025 14:42:55 +0930
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: use blocksize to check if compression is making
 things larger
To: kernel test robot <lkp@intel.com>, linux-btrfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <14db816c702a3567faa0cd5efe2110b6ebfba970.1754871148.git.wqu@suse.com>
 <202508111239.5dVvTsGq-lkp@intel.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <202508111239.5dVvTsGq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/8/11 14:30, kernel test robot 写道:
> Hi Qu,
> 
> kernel test robot noticed the following build errors:

That patch has an explicit dependency after the "---" line.

If there is a way to tell the bot for any dependency, I can definitely 
add such tag in the future.

Thanks,
Qu

> 
> [auto build test ERROR on kdave/for-next]
> [also build test ERROR on linus/master v6.17-rc1 next-20250808]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-use-blocksize-to-check-if-compression-is-making-things-larger/20250811-081450
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
> patch link:    https://lore.kernel.org/r/14db816c702a3567faa0cd5efe2110b6ebfba970.1754871148.git.wqu%40suse.com
> patch subject: [PATCH] btrfs: use blocksize to check if compression is making things larger
> config: riscv-randconfig-002-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111239.5dVvTsGq-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111239.5dVvTsGq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508111239.5dVvTsGq-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> fs/btrfs/zstd.c:402:24: error: use of undeclared identifier 'inode'
>       402 |         const u32 blocksize = inode->root->fs_info->sectorsize;
>           |                               ^~~~~
>     1 error generated.
> --
>>> fs/btrfs/zlib.c:150:24: error: use of undeclared identifier 'inode'
>       150 |         const u32 blocksize = inode->root->fs_info->sectorsize;
>           |                               ^~~~~
>     1 error generated.
> 
> 
> vim +/inode +402 fs/btrfs/zstd.c
> 
>     386	
>     387	int zstd_compress_folios(struct list_head *ws, struct address_space *mapping,
>     388				 u64 start, struct folio **folios, unsigned long *out_folios,
>     389				 unsigned long *total_in, unsigned long *total_out)
>     390	{
>     391		struct workspace *workspace = list_entry(ws, struct workspace, list);
>     392		zstd_cstream *stream;
>     393		int ret = 0;
>     394		int nr_folios = 0;
>     395		struct folio *in_folio = NULL;  /* The current folio to read. */
>     396		struct folio *out_folio = NULL; /* The current folio to write to. */
>     397		unsigned long tot_in = 0;
>     398		unsigned long tot_out = 0;
>     399		unsigned long len = *total_out;
>     400		const unsigned long nr_dest_folios = *out_folios;
>     401		const u64 orig_end = start + len;
>   > 402		const u32 blocksize = inode->root->fs_info->sectorsize;
>     403		unsigned long max_out = nr_dest_folios * PAGE_SIZE;
>     404		unsigned int cur_len;
>     405	
>     406		workspace->params = zstd_get_btrfs_parameters(workspace->req_level, len);
>     407		*out_folios = 0;
>     408		*total_out = 0;
>     409		*total_in = 0;
>     410	
>     411		/* Initialize the stream */
>     412		stream = zstd_init_cstream(&workspace->params, len, workspace->mem,
>     413				workspace->size);
>     414		if (unlikely(!stream)) {
>     415			struct btrfs_inode *inode = BTRFS_I(mapping->host);
>     416	
>     417			btrfs_err(inode->root->fs_info,
>     418		"zstd compression init level %d failed, root %llu inode %llu offset %llu",
>     419				  workspace->req_level, btrfs_root_id(inode->root),
>     420				  btrfs_ino(inode), start);
>     421			ret = -EIO;
>     422			goto out;
>     423		}
>     424	
>     425		/* map in the first page of input data */
>     426		ret = btrfs_compress_filemap_get_folio(mapping, start, &in_folio);
>     427		if (ret < 0)
>     428			goto out;
>     429		cur_len = btrfs_calc_input_length(in_folio, orig_end, start);
>     430		workspace->in_buf.src = kmap_local_folio(in_folio, offset_in_folio(in_folio, start));
>     431		workspace->in_buf.pos = 0;
>     432		workspace->in_buf.size = cur_len;
>     433	
>     434		/* Allocate and map in the output buffer */
>     435		out_folio = btrfs_alloc_compr_folio();
>     436		if (out_folio == NULL) {
>     437			ret = -ENOMEM;
>     438			goto out;
>     439		}
>     440		folios[nr_folios++] = out_folio;
>     441		workspace->out_buf.dst = folio_address(out_folio);
>     442		workspace->out_buf.pos = 0;
>     443		workspace->out_buf.size = min_t(size_t, max_out, PAGE_SIZE);
>     444	
>     445		while (1) {
>     446			size_t ret2;
>     447	
>     448			ret2 = zstd_compress_stream(stream, &workspace->out_buf,
>     449					&workspace->in_buf);
>     450			if (unlikely(zstd_is_error(ret2))) {
>     451				struct btrfs_inode *inode = BTRFS_I(mapping->host);
>     452	
>     453				btrfs_warn(inode->root->fs_info,
>     454	"zstd compression level %d failed, error %d root %llu inode %llu offset %llu",
>     455					   workspace->req_level, zstd_get_error_code(ret2),
>     456					   btrfs_root_id(inode->root), btrfs_ino(inode),
>     457					   start);
>     458				ret = -EIO;
>     459				goto out;
>     460			}
>     461	
>     462			/* Check to see if we are making it bigger */
>     463			if (tot_in + workspace->in_buf.pos > blocksize * 2 &&
>     464					tot_in + workspace->in_buf.pos <
>     465					tot_out + workspace->out_buf.pos) {
>     466				ret = -E2BIG;
>     467				goto out;
>     468			}
>     469	
>     470			/* We've reached the end of our output range */
>     471			if (workspace->out_buf.pos >= max_out) {
>     472				tot_out += workspace->out_buf.pos;
>     473				ret = -E2BIG;
>     474				goto out;
>     475			}
>     476	
>     477			/* Check if we need more output space */
>     478			if (workspace->out_buf.pos == workspace->out_buf.size) {
>     479				tot_out += PAGE_SIZE;
>     480				max_out -= PAGE_SIZE;
>     481				if (nr_folios == nr_dest_folios) {
>     482					ret = -E2BIG;
>     483					goto out;
>     484				}
>     485				out_folio = btrfs_alloc_compr_folio();
>     486				if (out_folio == NULL) {
>     487					ret = -ENOMEM;
>     488					goto out;
>     489				}
>     490				folios[nr_folios++] = out_folio;
>     491				workspace->out_buf.dst = folio_address(out_folio);
>     492				workspace->out_buf.pos = 0;
>     493				workspace->out_buf.size = min_t(size_t, max_out,
>     494								PAGE_SIZE);
>     495			}
>     496	
>     497			/* We've reached the end of the input */
>     498			if (workspace->in_buf.pos >= len) {
>     499				tot_in += workspace->in_buf.pos;
>     500				break;
>     501			}
>     502	
>     503			/* Check if we need more input */
>     504			if (workspace->in_buf.pos == workspace->in_buf.size) {
>     505				tot_in += workspace->in_buf.size;
>     506				kunmap_local(workspace->in_buf.src);
>     507				workspace->in_buf.src = NULL;
>     508				folio_put(in_folio);
>     509				start += cur_len;
>     510				len -= cur_len;
>     511				ret = btrfs_compress_filemap_get_folio(mapping, start, &in_folio);
>     512				if (ret < 0)
>     513					goto out;
>     514				cur_len = btrfs_calc_input_length(in_folio, orig_end, start);
>     515				workspace->in_buf.src = kmap_local_folio(in_folio,
>     516								 offset_in_folio(in_folio, start));
>     517				workspace->in_buf.pos = 0;
>     518				workspace->in_buf.size = cur_len;
>     519			}
>     520		}
>     521		while (1) {
>     522			size_t ret2;
>     523	
>     524			ret2 = zstd_end_stream(stream, &workspace->out_buf);
>     525			if (unlikely(zstd_is_error(ret2))) {
>     526				struct btrfs_inode *inode = BTRFS_I(mapping->host);
>     527	
>     528				btrfs_err(inode->root->fs_info,
>     529	"zstd compression end level %d failed, error %d root %llu inode %llu offset %llu",
>     530					  workspace->req_level, zstd_get_error_code(ret2),
>     531					  btrfs_root_id(inode->root), btrfs_ino(inode),
>     532					  start);
>     533				ret = -EIO;
>     534				goto out;
>     535			}
>     536			if (ret2 == 0) {
>     537				tot_out += workspace->out_buf.pos;
>     538				break;
>     539			}
>     540			if (workspace->out_buf.pos >= max_out) {
>     541				tot_out += workspace->out_buf.pos;
>     542				ret = -E2BIG;
>     543				goto out;
>     544			}
>     545	
>     546			tot_out += PAGE_SIZE;
>     547			max_out -= PAGE_SIZE;
>     548			if (nr_folios == nr_dest_folios) {
>     549				ret = -E2BIG;
>     550				goto out;
>     551			}
>     552			out_folio = btrfs_alloc_compr_folio();
>     553			if (out_folio == NULL) {
>     554				ret = -ENOMEM;
>     555				goto out;
>     556			}
>     557			folios[nr_folios++] = out_folio;
>     558			workspace->out_buf.dst = folio_address(out_folio);
>     559			workspace->out_buf.pos = 0;
>     560			workspace->out_buf.size = min_t(size_t, max_out, PAGE_SIZE);
>     561		}
>     562	
>     563		if (tot_out >= tot_in) {
>     564			ret = -E2BIG;
>     565			goto out;
>     566		}
>     567	
>     568		ret = 0;
>     569		*total_in = tot_in;
>     570		*total_out = tot_out;
>     571	out:
>     572		*out_folios = nr_folios;
>     573		if (workspace->in_buf.src) {
>     574			kunmap_local(workspace->in_buf.src);
>     575			folio_put(in_folio);
>     576		}
>     577		return ret;
>     578	}
>     579	
> 

