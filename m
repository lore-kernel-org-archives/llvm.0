Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8E9671F
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661367745; x=1692903745;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bYVre1YznOFajN/3s4M8VKRS5YVUUpw3RPbdi4Ytvg4=;
  b=MACkC2nIHXkk7WBfj0dsDDrG1t/ElExDxqBva1oTiHrTibLTRmckTeD/
   vWAp6nPM+InJYEqIY4hFAUcm0h2D8NAfRwHPCZrRlOnhqMx7C1AzMvz39
   2R8p4mmNENjXRK40kNJBR22aZNgnZfuOTe7Efs2SDrUNHEdwN5XP1HuYu
   yKOJ91Fu1Bzed/RsahYipM3H0DNlO+RP3nxAKUU2Vy0c2t30+ZeNinmjC
   VJTOG8pSXgdLqdyUW5+Cqq71r1VS/qpKZck5vX2BOkUQO5xEdaXC4fLpk
   YhiMrGU8BfvrA9m+f/awXdDHgFFugf8Lf7ZVADSzui2yimlzTMOTkBl2A
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="274441399"
X-IronPort-AV: E=Sophos;i="5.93,261,1654585200"; 
   d="scan'208";a="274441399"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 12:02:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,261,1654585200"; 
   d="scan'208";a="938027073"
Received: from skeshri-mobl.ger.corp.intel.com (HELO [10.212.154.182]) ([10.212.154.182])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 12:02:10 -0700
Message-ID: <08cda8cc-1a0f-9577-0e2d-ed6ccd10c174@intel.com>
Date: Wed, 24 Aug 2022 12:02:10 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Simplify load_unaligned_zeropad() (was Re: [GIT PULL] Ceph
 updates for 5.20-rc1)
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <CAHk-=wh1xHi-WeytuAK1-iSsR0wi=6e4-WgFq6ZPt8Z1mvqoNA@mail.gmail.com>
 <20220814225415.n546anzvud6sumux@box.shutemov.name>
 <CAHk-=wiOqbuzy7xzsLrN8LXKGGUUMH109wcKOXx_PV9PkHa=Zw@mail.gmail.com>
 <CAHk-=whSGBmH7zKvD-=qJLkWPSGZo1cM7GyLH=8cuide7+ri_Q@mail.gmail.com>
 <20220815041232.kypaxhhnvobgb35t@box.shutemov.name>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220815041232.kypaxhhnvobgb35t@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/14/22 21:12, Kirill A. Shutemov wrote:
> But if somebody would try to be clever -- allocate memory and vmap() as
> shared (with proper VMM notification), but leave direct mapping intact --
> we have a problem. load_unaligned_zeropad() can step onto private mapping
> of the shared memory in direct mapping and crash whole TD guest.
> 
> The worst part is that for somebody who is not aware about
> load_unaligned_zeropad(), the vmap() trick is totally reasonable approach:
> it helps to avoid direct mapping fragmentation. We considered the trick
> for one of TDX-specific drivers.

This can also be fixed with guard pages.  It means allocating a
physically contiguous page to precede each one you want to vmap(), but
that's not the end of the world.

We're going to have to be *VERY* careful with any private->shared
conversion code.
