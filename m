Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDD48796;
	Tue, 21 Nov 2023 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Oxnot+Sy"
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A6066607286;
	Tue, 21 Nov 2023 11:40:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700566801;
	bh=QN8sfdw9pnigmly++dHM3DUPO6tyeN0rwNsDLLFnGR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oxnot+Sy9mksXa2n3vPiHZ8pmFaTRp2nCaqFDjBqLfGsHAtFDNBKgFcd/PStdzanb
	 tOo0S2KoUrTfEaPZwxERa/Dq8HAaWlskN5DqWq1/pasqOAhQWwJmhyDNgn+jUUdFee
	 eCwHOTrEMhu9Bsj9AVRSdaVH8Wao6UBS4XA7F52MKzBZMYVQOCsykJLHYZmpFek+Hk
	 b1i2pWPkLcXCQP6QZgvAflrEMCh3sG2rSiSUdBTTFY5nIB420tvt9HC3M/wlU+JDAl
	 VYL/0Nt/NizwVUFrW+KV1b1jOGOa+jPtF6hGoHWjdZRz/Mk59M1LS5NXd+VBxwgSJD
	 btUvhe65z/i8A==
Message-ID: <060248c3-38c0-4896-b01a-59c19ff7c6d6@collabora.com>
Date: Tue, 21 Nov 2023 12:39:58 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mediatek:v6.7-tmp/soc 7/7]
 drivers/soc/mediatek/mt8188-mmsys.h:126:3: error: use of undeclared
 identifier 'MT8188_VDO0_RST_DISP_OVL0'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202311211559.hXmHshEO-lkp@intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202311211559.hXmHshEO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/11/23 08:21, kernel test robot ha scritto:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.7-tmp/soc
> head:   c1b652b84e6a779e670bac250d80ef2f2d4a45d9
> commit: c1b652b84e6a779e670bac250d80ef2f2d4a45d9 [7/7] soc: mediatek: Add MT8188 VDOSYS reset bit map
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311211559.hXmHshEO-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211559.hXmHshEO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311211559.hXmHshEO-lkp@intel.com/
> 

No action required. This is because this branch needs commits from v6.7-tmp/dts64.

