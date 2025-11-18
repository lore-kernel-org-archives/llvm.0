Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69485327219;
	Tue, 18 Nov 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473677; cv=none; b=H/2y9MYbsVlwN2nKxgq3nfYRgkS2pq+jB4XZxnVf9QlpMQ6z2yB/cmq4KPQgacUs4evtmpwltemL7ec0rfiTGBjNhpQtY5xSmPG0NQ9N01i36n1hN58H2rP8LoxpvMHeDk6/1GHTtQVoO54ypk7PxlqNIFjmG1RcrJO0rY/HpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473677; c=relaxed/simple;
	bh=evXWuhB3EZVlG2oT44nV7VhEEbvExwwRV1m+pBrcQBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkQNgQfOVOqie0fTVW47Wxqt6JN4fLewZlE0pdljjDjx8YSE3U0uXdrnS/RXla/cgfAQtHzfOnWJ8Tl8cdLcMxz6refGXhLV8CT1H+Hf1TLYHJaVW0glJRQRohw0duh7jaXexjjLPh6GQZiIxaZoR0e4ot+b0N8T4pDOIo0wrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cc5B5zIp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc5B5zIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763473676; x=1795009676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=evXWuhB3EZVlG2oT44nV7VhEEbvExwwRV1m+pBrcQBw=;
  b=cc5B5zIpaxbNsrwVnh1okigE4MFl/bA7OvJf4Z8i9EGmMmyliad++/Dt
   3VeHyiBRtbk1aHbIGN2LPcgiN6S9Tn/SbU43BOFh45uCpRIGqsUCbVX1m
   bcvAVnhcBrW0C45nQnhkVAM7WQvj+8OwgQ1u6i+1DbrwEhx3fj0wixNyF
   xe1b4FhORhrJ+VQjIw+azLbcawRRE3q5p5akMrf4S/ZZlGS156aMkpcPM
   TxSr0c4Dh8RImGJMWPGTFYrCuywy4oAX3LsSR4MOk3oPJGdI+TYzjjnz2
   h5zGOJrCJ+2MXMAe9FUTjQLOHoBCP5ZJYiHakOjp7DKg7CqF5YHCc423N
   Q==;
X-CSE-ConnectionGUID: wz/zhgELTaWVN7lheqdrZg==
X-CSE-MsgGUID: gvOrxqUvRuOKhPZPamKrQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65374500"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65374500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 05:47:55 -0800
X-CSE-ConnectionGUID: Shf6U8bGSUyqhc7V0agsvw==
X-CSE-MsgGUID: 1YI/9Lh3QgeTI2QpWjd9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190915976"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 05:47:55 -0800
Date: Tue, 18 Nov 2025 05:54:58 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as
 private
Message-ID: <20251118135458.GA21441@ranerica-svr.sc.intel.com>
References: <20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c@linux.intel.com>
 <202511181954.UMxCeTV1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511181954.UMxCeTV1-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Nov 18, 2025 at 07:45:28PM +0800, kernel test robot wrote:
> Hi Ricardo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 6f85aad74a70d17919a64ecd93037aa51c08698d]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Neri/x86-acpi-Add-functions-to-setup-and-access-the-wakeup-mailbox/20251118-011935
> base:   6f85aad74a70d17919a64ecd93037aa51c08698d
> patch link:    https://lore.kernel.org/r/20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c%40linux.intel.com
> patch subject: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as private
> config: x86_64-buildonly-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181954.UMxCeTV1-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181954.UMxCeTV1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511181954.UMxCeTV1-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/x86/hyperv/hv_vtl.c:9:
>    In file included from arch/x86/include/asm/acpi.h:11:
>    In file included from arch/x86/include/asm/numa.h:8:
> >> arch/x86/include/asm/topology.h:159:47: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
>      159 | const char *get_topology_cpu_type_name(struct cpuinfo_x86 *c);
>          |                                               ^
>    arch/x86/include/asm/topology.h:160:57: warning: declaration of 'struct cpuinfo_x86' will not be visible outside of this function [-Wvisibility]
>      160 | enum x86_topology_cpu_type get_topology_cpu_type(struct cpuinfo_x86 *c);
>          |                                                         ^
>    2 warnings generated.

This is fixed with: https://lore.kernel.org/r/20251117-rneri-topology-cpuinfo-bug-v1-1-a905bb5f91e2@linux.intel.com
