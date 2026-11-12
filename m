Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472386;
	b=yqEmJBJ7v0HyOi8UJms0B3pim8RyXnN29SiWp2IykrhVpxGxp14iNuNNlREA2Jiwnd6H
	 A6Ip0ym0WeJwYx2jdlBjW7y8nefCtVeA2fk+jUL3JbEan0gi8jPpSe1Z83jiQdyxoq3j2
	 lDwAXU2is7sTkUE+fb/nBgfMZyezggAu0MgmnfTxBSV95uYEEA06u5MUJRioH+aHinmFt
	 F07IeEpywz5pAa79pjy72cdqjBUQ61Y1PrUTkNptxviW235hxf97PhtLEtFtr5YSY7XJF
	 OEfKP0GXraMPzKOYzcH9OKwqNTgD5xouJokqlyvBTELjts29DfyqeCTLaMw6qKe5Bqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472386;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wHiIDa6cL/vpsXtyC/9ShVCBR8lPrdKhQ+5jGKW/U9k=;
	b=jqlEQZeO+ByZaY2O8+JcBrPT05Aa4rZ5LUQ5KTzFdC04C8qPHQzTcqj4aXaQE4fsSjZK
	 YSv02B2ZkPxig7nnJ+jmUpmZr3z9Js2AGfWzONq9kvKTg7AV2dRM/ln4TPKB4dfmTAo5w
	 EXPyHQ51j3CyeO0DwMlDHnRJWVmWHJ40ZKMA2w+qJJiGl2U/YBkOOytv66KxReROWlHSp
	 TaqMLLWVSpkIXKJjmYj5OFc0h4sDk9durImtxde7ITxcf3qVkdMjXsA7KxQZXi3u8m1ks
	 EfMW5XrrtCRHO27vn4mRpPtd5VMVJtplWQLeYY5K7xB3ezVUyYylXx7L6iDZY/Mv1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XG5g/nm+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8D60A6F7C;
	Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG5g/nm+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2451F00A05;
	Thu, 12 Nov 2026 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472386;
	bh=wHiIDa6cL/vpsXtyC/9ShVCBR8lPrdKhQ+5jGKW/U9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XG5g/nm+K513+nhn+5OndsG9mSGbSKzvtgyM6i/B1s7gs6BBtrMqbTQEB4nsUsb8Y
	 oQBiqPksMq2HIM1slpfSCtELJa+h1P9qduLsmng/X+fuofsa/4TxFbTx0cExrAvgN0
	 4TTPv5gaIf8qxki3ZocDSc0+llOvkYB7jVhO9XIdEtTU94MxWL1KPtuaXY4iuOgdz8
	 RKNT/l5phTCXxGIXrMq6E0/2HZxwWuVJkRbC4XUORQ7Tzce4iD8P5Nbm8wSMdxKQf7
	 f9Ov7BH49eJmcxU3WAtmhyUDUb/GRsfdxvJdFck11FIyh5fa3qVOAV3bQmQfuoeGC6
	 I2uEMwAG3Da3g==
Message-ID: <8fb62131-db10-491c-9839-a3835d7aaf32@kernel.org>
Date: Thu, 12 Nov 2026 09:33:00 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shmem: drop the second folio batch from
 shmem_undo_range()
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Qiliang Yuan <qiliang.yuan@linux.dev>, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
 Qiliang Yuan <odys.yuan@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>
References: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
 <787a1ba3-df93-45f9-abe1-3fcdefbe41cc@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <787a1ba3-df93-45f9-abe1-3fcdefbe41cc@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/26 09:05, Baolin Wang wrote:
> 
> 
> On 11/12/26 11:39 AM, Qiliang Yuan wrote:
>> shmem_undo_range() keeps a folio_batch and an array of FOLIO_BATCH_SIZE
>> indices on its stack. Removing truncated folios from the page cache in
>> batches added a second folio_batch to collect the folios to delete.
>>
>> That grows the stack frame by about 200 bytes, past the 1024 byte limit
>> of mips eyeq6_defconfig built with clang.
>>
>> Pass fbatch itself to delete_from_page_cache_batch() once the swap
>> entries are gone, as truncate_inode_pages_range() does. Undoing a failed
>> fallocate() only removes the folios that are not uptodate, so remove
>> those one at a time with truncate_inode_folio() as before.
>>
>> Stack frame of shmem_undo_range() built with clang 18:
>>
>>    config                before (bytes)  after (bytes)  change
>>    mips eyeq6_defconfig             928            720    -22%
>>    x86_64                           920            712    -23%
>>
>> Fixes: b97fbd541ecba ("mm/shmem: remove truncated folios from the page cache
>> in batches")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202611112032.TMyPU6Rm-
>> lkp@intel.com/
>> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
>> ---
>> David, this applies on top of b97fbd541ecba in shmem-7.5.misc; please
>> fold it in if you prefer.
>> ---
> 
> I think you should send out a complete v2, and David could queue your new version.

Yes please. I'll drop the old patch from core.git. Should be gone later today.

-- 
Cheers,

David
