Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E172
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 09:57:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278505655"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="278505655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 02:57:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="426393181"
Received: from pjthomps-mobl1.ger.corp.intel.com (HELO [10.249.254.76]) ([10.249.254.76])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 02:57:26 -0700
Subject: Re: [PATCH 2/3] drm/i915/selftests: Always initialize err in
 igt_dmabuf_import_same_driver_lmem()
To: Nathan Chancellor <nathan@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210824225427.2065517-1-nathan@kernel.org>
 <20210824225427.2065517-3-nathan@kernel.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <354f7760-7b43-8e3f-414b-1556dabbcdb3@linux.intel.com>
Date: Wed, 25 Aug 2021 11:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210824225427.2065517-3-nathan@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 8/25/21 12:54 AM, Nathan Chancellor wrote:
> Clang warns:
>
> drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c:127:13: warning:
> variable 'err' is used uninitialized whenever 'if' condition is false
> [-Wsometimes-uninitialized]
>          } else if (PTR_ERR(import) != -EOPNOTSUPP) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c:138:9: note:
> uninitialized use occurs here
>          return err;
>                 ^~~
> drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c:127:9: note: remove
> the 'if' if its condition is always true
>          } else if (PTR_ERR(import) != -EOPNOTSUPP) {
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c:95:9: note:
> initialize the variable 'err' to silence this warning
>          int err;
>                 ^
>                  = 0
>
> The test is expected to pass if i915_gem_prime_import() returns
> -EOPNOTSUPP so initialize err to zero in this case.
>
> Fixes: cdb35d1ed6d2 ("drm/i915/gem: Migrate to system at dma-buf attach time (v7)")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


