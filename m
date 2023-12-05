Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D994F5E4;
	Tue,  5 Dec 2023 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rAT1v-0006xC-L7; Tue, 05 Dec 2023 11:51:55 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject:
 Re: [linux-next:master 1690/4884]
 drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:15: error: call to undeclared
 function 'drm_atomic_get_new_connector_state';
 ISO C99 and later do not support implicit function declarations
Date: Tue, 05 Dec 2023 11:51:54 +0100
Message-ID: <8213929.2l3rmUXbR5@diego>
In-Reply-To: <202312051333.Z0rH44Jk-lkp@intel.com>
References: <202312051333.Z0rH44Jk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 5. Dezember 2023, 06:42:51 CET schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0f5f12ac05f36f117e793656c3f560625e927f1b
> commit: ae3436a5e7c2ef4f92938133bd99f92fc47ea34e [1690/4884] drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
> config: x86_64-buildonly-randconfig-003-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051333.Z0rH44Jk-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051333.Z0rH44Jk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312051333.Z0rH44Jk-lkp@intel.com/

This is already fixed via commit 

f4814c20d14c ("drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h")

from 2023-11-22


Heiko


