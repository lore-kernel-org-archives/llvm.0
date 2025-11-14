Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131E2329C57;
	Fri, 14 Nov 2025 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763149177; cv=none; b=P588p5+HZYE1OzAGe/vDCoBOKWktUoAixsLVgMcJbmw1x32TRHl7tgzPO/2Oa9GgZapw4WMkgyNwxQuTXb1DEArs7gQzqP0fda8SdlbGWVAiUlsuKI0Bqy21A0sKIwgANrzjACkMG1wKpLXwbBL28TJw6SCM+oU93kEWlqRaZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763149177; c=relaxed/simple;
	bh=54NLBk7Njpf4E6a9gJR3/zpHbL++ajPh9Y+MWKanMgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDznvMI8oAzG84il9wxUqqUsfuNQ+/pEtNGv8s5lemKa5hoRkUeT8n3qI/SQsNLSdoPZmRVGoBLoLuSTTjuamxcN4Q12asZDhF/4sH63v+lJBgAhXPtDs/zGU7+EaZy27kZI/ko/94Ijnidi+19m7Qpw10GKwa8CCsg/2r7lDWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnop2DB+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnop2DB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93DDC4CEF8;
	Fri, 14 Nov 2025 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763149176;
	bh=54NLBk7Njpf4E6a9gJR3/zpHbL++ajPh9Y+MWKanMgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qnop2DB+z9ZecMETjC2TQD0j7snZXxCyh9BZtRFSL3Vj+nGofDn3vpkjact5FtBlS
	 nHu9Kk8kG5n7Xk740/Z6a0MT1Ju02Z6jQPFIdTIgnZuA7jnpVEXGekwlXEmaEUs7yJ
	 HttHQlQiYtE5ibkAM+78/ptWHgo/VqxpcMgUYqWmeccfxPZWasi2d0MvAv8XU4SYo8
	 UO+mdnxiuQqf4RQhYfW3WJRElizt9RJFz4Fjl+jvaQwksBSUUrh+LKYBGDzUcsVTwB
	 wNTwl58i9PAbsmRr8k7vsZoBaYcKaLkrXI3KWBoE15mCCFi+MJX+YDTXxgfelpASmb
	 NzsyfILQ3/cfw==
Message-ID: <e1345a3f-b5c5-49fd-a1e2-a77926cb9256@kernel.org>
Date: Fri, 14 Nov 2025 20:39:31 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
To: Nathan Chancellor <nathan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <202511141140.LrrRrtIv-lkp@intel.com>
 <20251114182956.GD2566209@ax162> <aRd69_c1pULRoKOU@casper.infradead.org>
 <20251114191817.GA1089438@ax162>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251114191817.GA1089438@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.11.25 20:18, Nathan Chancellor wrote:
> On Fri, Nov 14, 2025 at 06:54:47PM +0000, Matthew Wilcox wrote:
>> On Fri, Nov 14, 2025 at 11:29:56AM -0700, Nathan Chancellor wrote:
>>>>>> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
>>>>      1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
>>>>           |                       ^~~~~~~~~~~~~~~~~~
>>>>     include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
>>>>      2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
>>>>           |                                         ^~~~~~~~~~~~~~~
>>>>     include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
>>>>      2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
>>>>           |                                 ~~~~~~~~~ ^~~~~~
>>>>     include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
>>>>        56 | #define SZ_16G                          _AC(0x400000000, ULL)
>>>>           |                                         ^~~~~~~~~~~~~~~~~~~~~
>>
>> Clearly this is a 32-bit build, since otherwise a conversion from
>> "unsigned long long" to "unsigned long" is a NOP.  But 32-bit cannot
>> support 16GB folios!
>>
>> I say this is a bug in powerpc32's config.
>>
>> #if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
>> #define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
>> ...
>> #else
>> #define MAX_FOLIO_ORDER         PUD_ORDER
>>
>> (PUD_ORDER is 16GB, so I think this will be what's being picked up)
>>
>> but the only place the mentions ARCH_HAS_GIGANTIC_PAGE is pretty
>> clearly dependent on 64bit ...
>>
>> config PPC_RADIX_MMU
>>          bool "Radix MMU Support"
>>          depends on PPC_BOOK3S_64
>>          select ARCH_HAS_GIGANTIC_PAGE
>>
>> so I'm a bit stuck about how this comes to be.  Adding the PPC people
>> for thoughts.
> 
> Note that the original report is against mm-unstable and flags
> 
>    https://git.kernel.org/akpm/mm/c/c3f81a41ba6f93693d208edde08ce2b0da21c645
>    https://lore.kernel.org/20251112145632.508687-1-david@kernel.org/
> 
> in mm-hotfixes-unstable as the problematic change. This configuration ends up
> with
> 
>    $ rg -N 'HAVE_GIGANTIC|HUGETLB|PPC_8xx' .config
>    # CONFIG_CGROUP_HUGETLB is not set
>    CONFIG_PPC_8xx=y
>    CONFIG_HAVE_GIGANTIC_FOLIOS=y
>    CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
>    CONFIG_HUGETLBFS=y
>    CONFIG_HUGETLB_PAGE=y
> 
>    config PPC_8xx
>        bool "Freescale 8xx"
>        select ARCH_SUPPORTS_HUGETLBFS
>        select FSL_SOC
>        select PPC_KUEP
>        select HAVE_ARCH_VMAP_STACK
>        select HUGETLBFS
> 
> which may indicate a bug in either selecting ARCH_HAS_GIGANTIC_PAGE in
> this case or the logic of HAVE_GIGANTIC_FOLIOS in that change?

God how I HATE that hugetlb crap at this point. So much wasted time.

Likely, for 32bit builds we should cap it at 1 GiB, which I think is the 
32bit maximum hugetlb folios size on ppc actually is.

-- 
Cheers

David
