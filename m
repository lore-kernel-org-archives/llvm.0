Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033D35B135
	for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201408; cv=none; b=goo7wbNS8OnUx98pjly47PEzeHNy8FWwRPau7onNU1ucTEAAljdXZrvR2czS7dNS0H+vUXdezD5XfPsJDqTOjngx/0Mxhof/XFOWHqNW9NcZ4yWpRr+R5FXlLhxbexKC6K9FklKZlM7q/0upkHvd93f1ioiXNySQ9WGBtpI8CD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201408; c=relaxed/simple;
	bh=jHktJRpimehEbEWEHzUs0oQlFXrvPr4/EwzgpKc+WTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGYL2FbcRDQRLz6oeRAE9qd+k3I2ZxlwjpjdRnK/wn05S6l0kahhfgwaZR3XErKlnJ+ZYN+TCqo+hAtD77OHnmv0JBX5T8nflVTRen3nMo9E4lCGk+PVWx48pByNbCIY0v3B56u4DdmiTQPmkCnE86UDorWKmw3yEmcfLHvejTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVbA/bpv; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVbA/bpv"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-79af647cef2so425076b3a.3
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 23:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761201406; x=1761806206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxh5IXXN/oTEexZMfsEWqTqOVeT3OfvGPgG6VwjolG4=;
        b=mVbA/bpv19gr8RfuCWtJPIgRMq9o4fktoE11ltG69x1T4Yvr9StJHSwRnK11mzjTJj
         d7mD1FbCFK6/ZC2sUFtrchU3rJWWBRWgyUwbWQzRQfHEhQjQfxnJR3SJR+LelR0Q0J1L
         epp4QzcTtKDNUTj3DtQazOyu5FU0HHxJApDTu+0g0KtlbZAHusyV/sSymCDxSNXYsnYu
         aFyVpta6+WBIh7rolbLLo2QTmLOkGw8Thq+7MvNvYFVf3PFwmESJo2/2FRb5ZjW1tdQs
         YDaNjzQDsetsbjufhTYDXFw0dfUY6mq7p8GyNuLRf1YPPovCUq0CNwRwRx2P23Kt0ofU
         3Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761201406; x=1761806206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vxh5IXXN/oTEexZMfsEWqTqOVeT3OfvGPgG6VwjolG4=;
        b=SoFuS+G8hLPXwmeZkUOhCSdmJYbtAtMiLJbQBhyAzx7yPDSoGjaASL6viXVi+5iq+7
         /lR6GiOE7uB5Qf6WrQ256PJwvt2By1N1jnCSzm/F/L0dcN9vlxTYD9dilMLw40/A7xCC
         Q1im19fEVE2InXuosySodxOgl1MeoS4svKXXT0XuAYGeNkQvttK/AUe9SxQ2HvqY/yfn
         8CfTtyElgx3g2F75Vh67qsjXVwm8PkhiORGhQJmRAWUA5fpQqVGDkJh+KgIegqIHu2IQ
         eT4k4nojl5D8e2jzyMdWXEr3eer7z+oTIpw3YSSQtGobBKDen8gqBKqIzFTWb4y8Fzjw
         HIvg==
X-Gm-Message-State: AOJu0YwU2IeyNTemM0jLAExdnRs9Ic7+x+v/BDeYs3AxTSrpEdINxy5o
	tVADgo/WaFuASerPRTpJWQHM2i2UU4G0DNhcowb1knbRWFmjDC06TJ9H5qantzNuFzk=
X-Gm-Gg: ASbGncsgnmPacOva5kmrB6sruAITD6E1HibTWSFPQItas6weI3jxVxr1KAISUrkqQUp
	wolYEvTUOsfY4o/RmOlWuk9qe7RYrSFUbr/XeGXVoiB/NmXkB5tIkoKurrGsLNgeSqRtl/eDYq2
	n9G3igePUX0VptQm/cfCJMQtlabCAhTZQ0HdRa09MENEMaIDsNPxp09WbsATsAR5o28/nuZhvF/
	ZivC5FobD4NPFqWXZPgwd4yysQznlJWRK2D+MJpPpFqXDF1MKzpf1EKFjvVpA+I36T+4ZunR0fq
	42l5nCa+qQ7+BEhjsMC/le3FTBU1AZV025dmNzgU2KcL8lC+ny4iTEo8jV3jBCyFXBMjZ6jEv8L
	9E9RtNvczlRdZn7eQN2DwFoe9BZIlzR7BhtDXb2zuSarWqeBqA8PEVzv+fG7Sk39eYDJlgkE6s3
	2BCg==
X-Google-Smtp-Source: AGHT+IFJgbOUm4zaDdsgXZjpxpGCcpFXaWdFjqgKNOX33nOXyIbf12R2eSDruOtha6dRePJInBpPcA==
X-Received: by 2002:a05:6a00:9514:b0:781:2271:50df with SMTP id d2e1a72fcca58-7a220ad9c9cmr28464862b3a.19.1761201401027;
        Wed, 22 Oct 2025 23:36:41 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8a0edsm1356826b3a.35.2025.10.22.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:36:40 -0700 (PDT)
Date: Thu, 23 Oct 2025 12:06:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:opp/linux-next 2/2] drivers/opp/of.c:1545:3: error:
 cannot jump from this goto statement to its label
Message-ID: <ocd5xl3svsyqivfl76yoxzbwakgx6zpdujxvr37xcr63lhaqgg@3yyspadowr3j>
References: <202510230410.vPtSOkAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510230410.vPtSOkAh-lkp@intel.com>

On 23-10-25, 04:34, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
> head:   45a64ff434a027c296d1d5c35f442e51378c9425
> commit: 45a64ff434a027c296d1d5c35f442e51378c9425 [2/2] OPP: Initialize scope-based pointers inline
> config: arm-randconfig-004-20251022 (https://download.01.org/0day-ci/archive/20251023/202510230410.vPtSOkAh-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230410.vPtSOkAh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510230410.vPtSOkAh-lkp@intel.com/

Fixed and pushed.

-- 
viresh
