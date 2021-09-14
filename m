Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C63FC5
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 17:10:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="202248069"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="202248069"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 10:10:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="544188720"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost) ([10.251.216.6])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 10:10:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Nick Desaulniers
 <ndesaulniers@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH 0/3] drm/i915: Enable -Wsometimes-uninitialized
In-Reply-To: <YT+QmKyKCdotTcqA@archlinux-ax161>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210824225427.2065517-1-nathan@kernel.org> <YT+QmKyKCdotTcqA@archlinux-ax161>
Date: Tue, 14 Sep 2021 20:10:14 +0300
Message-ID: <87wnnj13t5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 13 Sep 2021, Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Aug 24, 2021 at 03:54:24PM -0700, Nathan Chancellor wrote:
>> Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
>> disabled -Wsometimes-uninitialized as noisy but there have been a few
>> fixes to clang that make the false positive rate fairly low so it should
>> be enabled to help catch obvious mistakes. The first two patches fix
>> revent instances of this warning then enables it for i915 like the rest
>> of the tree.
>> 
>> Cheers,
>> Nathan
>> 
>> Nathan Chancellor (3):
>>   drm/i915/selftests: Do not use import_obj uninitialized
>>   drm/i915/selftests: Always initialize err in
>>     igt_dmabuf_import_same_driver_lmem()
>>   drm/i915: Enable -Wsometimes-uninitialized
>> 
>>  drivers/gpu/drm/i915/Makefile                        | 1 -
>>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>> 
>> 
>> base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
>> -- 
>> 2.33.0
>> 
>> 
>
> Ping, could this be picked up for an -rc as these are very clearly bugs?

Thanks for the patches and review. Pushed to drm-intel-gt-next and
cherry-picked to drm-intel-fixes, header to -rc2.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
