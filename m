Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16616A382
	for <llvm@lists.linux.dev>; Sun, 21 Jul 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721589937; cv=none; b=awsHv6VCoUUZL6aFVo+r8aRXzRbVD8z3yoOddxdCh1a0VkZuTFxQJ9sBNSaN1TH+E5TKWSh1cS/G+aBzNF0yMigcuzTHAFNOP/DOSQqic2sjvegndTX6/RTVMvVEO4CYC2sGDVgfs7zqf/CkWXlZWacQAIAyhLgAFAIGWvmGtTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721589937; c=relaxed/simple;
	bh=O+LpjzA42QdFd25VgFIGIjM2RfYvaDGPTBJXAy190qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n696cKabPGa2h3CKaDdrr3cMTe86doQyR2qxLyT6XiLiuGINhKHKS8O1cqtmwk45ELXonmKfPgjADkgAZxP3MRjPV5qK2/bpFx/EHgDidsBTsNfen248OXm4S3qtKGHRKkS3v7SzHlHShrehLNrrokH9EOlYYb1tAENBrHWgWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAhtddo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAhtddo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E45C116B1;
	Sun, 21 Jul 2024 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721589937;
	bh=O+LpjzA42QdFd25VgFIGIjM2RfYvaDGPTBJXAy190qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAhtddo4DBjp9SlTR01lO9lbAhDDPIaJbR2NOjpVgQUMeGOzYN5gJXWlSE/DGsQ7H
	 YsPRG1fFzIothtO10euDYfmwxV5Lu3Kz2z5NSHNgTJkAvfrpvVTy70JDvN2pTBzWED
	 7/ZE3mrJur4zNwJQhitYsYYrcfOrKBqm3YT1FSVUvGIpiGJ3518Pw9i2ZNPyuYJRDM
	 xavuwgYSuvYaXND+owXQJWMV5H9GYqJGXMvZ00gRJiIuFc8UnoplxxFqJRZLDrx1W8
	 1jU608smVnof9IBtOmYxl3lK/GQSJ7s+/PPaCDCEGOhWeSvltbC7iwBHi9E5s2pJ2J
	 Ssyb5AxgITLZQ==
Date: Sun, 21 Jul 2024 12:25:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
	Michal Wajdeczko <michal.wajdeczko@intel.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/xe: Fix warning on unreachable statement
Message-ID: <20240721192534.GA3459346@thelio-3990X>
References: <20240719191534.3845469-1-lucas.demarchi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719191534.3845469-1-lucas.demarchi@intel.com>

Hi Lucas,

On Fri, Jul 19, 2024 at 12:15:34PM -0700, Lucas De Marchi wrote:
> eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
> it handles all enum values. However it's perfectly legal to pass an int
> to that function so in the end that function may happen to return
> nothing. A smart compiler could notice eu_type is never assigned to
> anything other than those values.

Well that assignment happens in load_eu_mask(), which is obviously
called before xe_gt_topology_dump() in xe_gt_topology_init(), but I
don't see how the compiler could assume that eu_type is always one of
those two values when xe_gt_topology_dump() is not static and could be
called from anywhere (i.e., when eu_type is potentially some other
value)? I might be missing something though.

> Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
> triggered for me, but this was reported in a different system with
> gcc-10:
> 
> 	drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()

I have been seeing similar warnings with clang as well, such as:

  drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump+0x77: sibling call from callable instruction with modified stack frame

  drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_dss_mask_group_ffs()

  drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump+0x77: can't find jump dest instruction at .text.xe_gt_topology_dump+0xc0

The final warning happens when LTO and CFI are enabled and I see a CFI
failure that appears to be a result of that.

[  +0.008116] Missing ENDBR: __cfi_init_module+0x0/0x10 [xe]
[  +0.000226] ------------[ cut here ]------------
[  +0.000001] kernel BUG at arch/x86/kernel/cet.c:102!
[  +0.000014] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[  +0.000004] CPU: 3 PID: 335 Comm: (udev-worker) Not tainted 6.10.0-rc3-debug-01858-g7108b4a589cd #1 6163aa9290b9c012af9bc3cd405d04758721ac11
[  +0.000005] Hardware name: AZW MINI S/MINI S, BIOS ADLNV105 12/12/2023
...
[  +0.000002]  ? __cfi_init_module+0x10/0x10 [xe 257ff34a29c86b7d55c1c838833ff13eec5c3393]
[  +0.000167]  ? xe_hw_fence_module_init+0x40/0x40 [xe 257ff34a29c86b7d55c1c838833ff13eec5c3393]
[  +0.000171]  ? __cfi_init_module+0x10/0x10 [xe 257ff34a29c86b7d55c1c838833ff13eec5c3393]
[  +0.000174]  ? do_one_initcall+0x147/0x350

> Since that is not really possible, just take the simple approach and
> return NULL.

Indeed, bare unreachable() is generally considered harmful and can introduce
undefined behavior. Commits

  d652d5f1eeeb ("drm/edid: fix objtool warning in drm_cvt_modes()")

and

  3764647b255a ("bcachefs: Remove undefined behavior in bch2_dev_buckets_reserved()")

come to mind as instances like this.

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

This change resolves all the issues I have noted above, so thank you!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 5a1559edf3e9..0662f71c6ede 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -233,7 +233,7 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>  		return "simd8";
>  	}
>  
> -	unreachable();
> +	return NULL;
>  }
>  
>  void
> -- 
> 2.43.0
> 
