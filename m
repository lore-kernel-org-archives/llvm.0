Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9F534B1A4;
	Thu, 12 Mar 2026 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302571; cv=none; b=qkiREct+AfSnW42/SPY0y53T/nNG0JBn7Jl4DBJYUWWmQh3DoI76LfJUF8VN39DQCFFoJd00qL5qwRqd5wW1O9t7rdUbbzTrDoCQjfY5kRAnAy3Kj+sl73jnhdh0OLlbctDCCy7I/D+Qma3ufE8XdJrAANiIuQe63jZqE0bZRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302571; c=relaxed/simple;
	bh=rOOCLsoaLb28ovZSPnnf45HbMo0fTfq5uGTva0TuFEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9NudVH08AwFOFsl0IPM1yPEudIxS+yt+PPf8q3fFftuS8AjLUSIVRghXJknlfpLztKpARob0Qc/k5aDrqmCx/QKmsdRUemq4NEvuwpPRSBrw/0fz0rVRT8a7D0NtiP3c2Bwm8IpjrhlcNRe5s3jHkXlwkjmjY1cMtgQSCZyjSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNkVHSp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNkVHSp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBEEC4CEF7;
	Thu, 12 Mar 2026 08:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302570;
	bh=rOOCLsoaLb28ovZSPnnf45HbMo0fTfq5uGTva0TuFEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNkVHSp8aV7sS5Qk8ZaP4YOYE3mNMhJYj4DmpuqlQBMhNBxfQEgf8486GJNvAiRHp
	 MjMaRBZfReUBmhgrs6728xWBOWF4A4S/BzAg8r7uWZNZbdNRHCdSXfsVudVZ0J9JkZ
	 t+N18ZiT0BUcn1/TPy4tgu+nU+v4WT9jxXghR/jt6jIRgUFC75uUjFLMNde8af3N+r
	 G40d3r8OJ2fCn1AGmRFq7KBdbV7hFjbIIUDevdo7b+CZmaeZQdKDR/qkp6yrT80LSb
	 rUV58KFYHWBBd6nCzlm5zDNWGEQpM5nxfHp69ha3J7GZQjnJSu0J18yqnqsbePElLo
	 4/rXki/MNjOKQ==
Date: Thu, 12 Mar 2026 01:02:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, Charlene Liu <charlene.liu@amd.com>,
	Ovidiu Bunea <ovidiu.bunea@amd.com>, Alex Hung <alex.hung@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [REGRESSION][PATCH] drm/amd/display: Fix uninitialized variable
 which breaks full LTO
Message-ID: <20260312080245.GA3988095@ax162>
References: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>

Hi Calvin,

On Mon, Mar 09, 2026 at 09:24:57PM -0700, Calvin Owens wrote:
> Commit e1b385726f7f ("drm/amd/display: Add additional checks for PSP
> footer size") introduced a use of an uninitialized stack variable
> in dm_dmub_sw_init() (region_params.bss_data_size).
> 
> Interestingly, this seems to cause no issue on normal kernels. But when
> full LTO is enabled, it causes the compiler to "optimize" out huge
> swaths of amdgpu initialization code, and the driver is unusable:

Yeah, this appears to be a very unfortunate case of "clang encountered known
undefined behavior and stopped code generation", which we would like to
avoid but figuring out a proper upstreamable solution is hard. The most
recent attempt:

  https://github.com/llvm/llvm-project/pull/146791

My guess is that LTO allows inlining of
dmub_srv_get_fw_meta_info_from_raw_fw() into dm_dmub_sw_init(), at which
point it can see that the result of accessing an uninitialized
region_params.bss_data_size will be used through
fw_meta_info_params.fw_bss_data and gives up generating the rest of the
function.

>     amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x07002F00
>     amdgpu 0000:03:00.0: sw_init of IP block <dm> failed 5
>     amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
>     amdgpu 0000:03:00.0: Fatal error during GPU init
> 
> It surprises me that neither gcc nor clang emit a warning about this: I
> only found it by bisecting the LTO breakage.

gcc's -Wmaybe-uninitialized is disabled by default for the kernel but
even enabling it with KCFLAGS does not show an instance here, which I
find quite surprising... for clang, it is harder because the warning
happens early in the frontend where it might not be able to track a
value that well.

> Fix by using the old value for region_params.bss_data_size in place of
> the uninitialized reference, which makes amdgpu work with LTO again.
> 
> Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b3d6f2cd8ab6..e69e61163ae9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2554,7 +2554,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>  	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
>  					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
>  					    PSP_HEADER_BYTES_256;
> -	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
> +	fw_meta_info_params.fw_bss_data = le32_to_cpu(hdr->bss_data_bytes) ? adev->dm.dmub_fw->data +

Maybe it would be better to use fw_meta_info_params.bss_data_size
instead of le32_to_cpu(hdr->bss_data_bytes)? Obviously it is the same
value but it would result in a smaller change. It seems likely that this
was just a copy and paste failure.

>  					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
>  					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
>  	fw_meta_info_params.custom_psp_footer_size = 0;
> -- 
> 2.47.3
> 
