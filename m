Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4421DED4C
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024214; cv=none; b=CoLvFpHvXAx8kGLaqZozFOomwTdgmA8L0LPGHP/XzZm0XP65O2PvcpH5KCYEe46i9KfbE4EKsPl3ObMUY/Bf2qmWO2Pkfs7H9lB8oP40dscJifGBC6ENmW4HnX4TGdgHepx7QdOMR2FZSs35ZSj35IqfKi9Eal2LawIoe2QeuPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024214; c=relaxed/simple;
	bh=77xwMSRFVFqFxKRlTdj50v0DmKzpKBA/cqyr+9C/lSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVXoDkRLgOQmSmGfz0VAkoovHA28rH8HUS00VxDAoCEH/ZbaVGTRzjrp6tW+O1reGR0eWCBdJ3OhAjg6jGnLgLd3cOXhr3PI+EChzxyZaIJ0kW7RTwoM9SCqeBI7U2QWUgXkr5LR1celzsF0whbRz+08MzOjmO56dWfvl1psHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48EB1688;
	Thu,  9 Oct 2025 08:36:43 -0700 (PDT)
Received: from [10.1.34.29] (e122027.cambridge.arm.com [10.1.34.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5BB43F59E;
	Thu,  9 Oct 2025 08:36:48 -0700 (PDT)
Message-ID: <c9ba43b0-2a49-42f5-bf82-4d03ce0f45b2@arm.com>
Date: Thu, 9 Oct 2025 16:36:45 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] drm/panfrost: Add forward declaration and types
 header
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-10-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251007150216.254250-10-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2025 16:01, Adrián Larumbe wrote:
> This is to make LLVM syntactic analysers happy.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> index e6e6966a0cca..27c3c65ed074 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> @@ -4,6 +4,7 @@
>  #ifndef __PANFROST_MMU_H__
>  #define __PANFROST_MMU_H__
>  
> +struct panfrost_device;
>  struct panfrost_gem_mapping;
>  struct panfrost_file_priv;
>  struct panfrost_mmu;

