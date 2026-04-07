Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D4358364
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597820; cv=none; b=MBPfr9B84MbzGUCrNfAw20hEkJrSdcuAk7d7h6b2XtRyKxYhid0w1TpEx1B9emlNDGFzQd345eo/detWpwzFLc1nnRYco8HwtMZJiI1V63Ad5KmHGBd7KpliK+WaldWlJDBYG+PxtNn1fo3ipVu4zHfWJs4kMKkKgEc0qB+YNhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597820; c=relaxed/simple;
	bh=EpKTL3G7H2XFaseYYG+2w0nRlWysJEnHpsD48AKJrRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pR45xaQhAX3nBikVkxOmnXLNt5x/fS0o5H9YaSs/g/Lk+3bn7tG3vqHrKnnOzFAnZ5D/BC9CunrzzpIqBL/+EVPlxNjKf2jDR5X+fgpuBrd/UNnnsCK8w/ChNfGPUFPTVHLmd8PBLVQjVbnavkxddEppNat+ssyaZptqaDso15w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5nii4N/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5nii4N/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so36157555e9.2
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 14:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775597817; x=1776202617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKcy50S1bW/vY4PpqHDf6kRxjpQRD4gf10Ur4mE7VLM=;
        b=E5nii4N/a93EYjNQfenU9AOGaWPU3CTtyTj+28p/GJocKY2c18RhIfRDuzB68VTrzq
         LF6ih9Xgj+QTQh62KpBSIdZ7V5kfFy8Ok0TjUHZT/EUX3vH6rXF/XJ7fpushCRSGpxhH
         /S/5d7uYc+n9zvGWn1sY06SAveh3ddPXqCwXukmNKHrN2b5CAqSeP2I/yuG5xeaRnIyF
         qZ6650gACCctlVAI7c3O8n4btK6iyMtc1vWZjSKw9Lda98aN4mWuCYlDo3sBJYjpXobe
         Hv2LO1TCPfSOECGtdqzFHAg4DaCf6NZhMCDreeLpXtJgAamE7ezlNd5OCTNAmZr822Bz
         oNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775597817; x=1776202617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKcy50S1bW/vY4PpqHDf6kRxjpQRD4gf10Ur4mE7VLM=;
        b=cSTIyi4kHmhP+4g0V4ppAD6qnH7+qg4eUPxRlY5QZErwhfCGFzU0+a+7cMp67Ncdfn
         Yc/vddbXWzMCa25F/CyAaavSiMeMjxmIHEzjTSL2hFE8/EJkFsH2QvLzu/hGWBsvPxjj
         XzKSWFwCn7m33WQ4FAZT3K45gwSGA4M/mzC/I/NV0Oi2crd9hVGsmiYskHoJTHy8svoe
         ZF4uvumrXEFx/Oaf0ekfRn9bpUXgjWP4mJU0wYWqT9tKndM6Hqpf/hzeEYt7dTZTndmI
         kUMBgvWWk2Yq/4a93ds0NdUWC0N/xZ3+OtaEGhqqV0SIJOKVeu7sqHcxxhx1gjKW3qNz
         5ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZuWe/OqB6eLD+DrTSOHkT+og6oDx3owVtuZ6jU8ZVnYgRJ2H87OHta+pCRtNs97rfXsFy@lists.linux.dev
X-Gm-Message-State: AOJu0YzWKQle0Qp6+UaOUm9q1DNzHtGbjACOvC7eQnkVi1R/gyhdbdRm
	LXrEwop4uAdx85+IKJq60pWTx3dTJ47UDMWgmbH/4dpnT9ASwZyCQqMJ
X-Gm-Gg: AeBDietwKVsls2r1SseHbUWIasnLf6I8rQdftrQayE4QVbvcpGxvBMJhFxbPdXelgSx
	gmRvgf2Naf/V2jOaWXTbsWEORq5FvNiw+OIVf3zxvOSu31LT+MnPZQvEub7Qzzylh3LtW36S47r
	gfY5Yw/FFHbWg6ttMDcpJs/0gMhXGoQ7JkwLd16f0O0215AE3AgIPJbjbd7dm+vMrJ2ZRhj/7AG
	mBPH5x1QKlGZoIqKhIZn6CipwjWRiZts1gLdFwOsvZY/+GgZagi/AR/iF368ix9hhm/ZROtfx/B
	sLfTBuLzrA3kavyl5tfMF6xbzr3vmTgU4f0k55bGRi8Jy70MdOng6QWkdrcf1Vre64DbI7gRFZP
	5VItwkFuN1fJ5IUEeWZ1ZPNsya1srVjI+Mjt10wF5Fhgbfs5VqGTLOqJtclXGL94JQq19E72i97
	I1YBbuOxRFNGggpcyp/4r/7sA9XUbmkIh39IgTE7Whmk5nGaAh6C0Bq2H67h3M2sk3
X-Received: by 2002:a05:600c:3acb:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-4889972b8c2mr222088045e9.12.1775597817192;
        Tue, 07 Apr 2026 14:36:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm611304445e9.7.2026.04.07.14.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:36:56 -0700 (PDT)
Date: Tue, 7 Apr 2026 22:36:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de,
 will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org,
 nathan@kernel.org, justinstitt@google.com, seanjc@google.com,
 perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com,
 james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org,
 jgross@suse.com, peterz@infradead.org, morbo@google.com,
 ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org,
 x86@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <20260407223653.2d3d3c60@pumpkin>
In-Reply-To: <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
	<bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 07 Apr 2026 17:45:20 +0000
Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:

> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> With the announcement of ChkTag, it's worth preparing a stable x86
> linear address masking (lam) user interface. One important aspect of lam
> is the tag width, and aligning it with other industry solutions can
> provide a more popular, generalized interface that other technologies
> could utilize.
> 
> ChkTag will use 4-bit tags and since that's the direction other memory
> tagging implementations seem to be taking too (for example Arm's MTE)
> it's reasonable to converge lam in linux to the same specification. Even
> though x86's LAM supports 6-bit tags it is beneficial to shorten lam to
> 4 bits as ChkTag will likely be the main user of the interface and such
> connection should simplify things in the future.
> 
> Shrink the maximum acceptable tag width from 6 to 4.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Ditch the default wording in the patch message.
> - Add the imperative last line as Dave suggested.
> 
> Changelog v3:
> - Remove the variability of the lam width after the debugfs part was
>   removed from the patchset.
> 
>  arch/x86/kernel/process_64.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> index 08e72f429870..1a0e96835bbc 100644
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
>  
>  #ifdef CONFIG_ADDRESS_MASKING
>  
> -#define LAM_U57_BITS 6
> +#define LAM_DEFAULT_BITS	4
>  
>  static void enable_lam_func(void *__mm)
>  {
> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
>  static void mm_enable_lam(struct mm_struct *mm)
>  {
>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
> -	mm->context.untag_mask =  ~GENMASK(62, 57);
> +	mm->context.untag_mask =  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);

I'm not sure that GENMASK() is really the best way to describe that value.
It really is ((1ul << LAM_BITS) - 1) << 57 and even the 57 shouldn't be
a magic constant.

I also wonder how userspace knows which bits to use. The other patches
just seem to handle a count from userspace, but you aren't giving out
the highest available bits.

If this had been done for 48bit vaddr, you would really have wished that
that bits 62-59 had been used not 51-48.

	David

