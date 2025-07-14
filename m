Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C07523A6;
	Mon, 14 Jul 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752488132; cv=none; b=rR6MSULv3ut8xpc1msDeNQBRP3fa+LaU3aIVaWjR7dJQim479FfvjIjubgQExKH6aSuvcRQ7DgAcgrFw3qJeiODXumruCw7x5PCD98+nRvXRv3PRIeBHC5CeuWWBbM1LKAWLxfaF0XcTbe3ZAqFbxkfYEyVpt/tADk/E9HRfbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752488132; c=relaxed/simple;
	bh=WZUyWFtxBjB2AMK7PAfY8sCfy3+o8kjVh3ZAgQsuNYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2mCgCf0kw7IB2B200L4QxEfNCQiuqRDmOlSgB/0D/4/PYknMI3WPAIJvCnLTdwN4rwSKRDB0wvAIPfHj8+ENp5Br25aUlv1yQSOUTztwZ50dl0Z57En4IdsV/H73Hp3Hkeyask1LnlqE/yJAOAG+x/lgQg2MtMW+lFRNkHPXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VFyibpHn; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VFyibpHn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 26F6640E01FD;
	Mon, 14 Jul 2025 10:15:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5SV9BRqgsOhl; Mon, 14 Jul 2025 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1752488124; bh=Z71D3jnIb/b7AqFcTVZz69rr/39DhPuGlpH3oYjD7TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFyibpHnWuM/6aTIsmrMaUpl6rCeXK0HLvaK6PE9tDmdZ5ZetAW4uWtrcNe+u4XDA
	 gkllC56ulZki5QMqzaZ8iiZd0dEg5IGADZxcUwh8w8/0pENMYXT6xNYSQU+XgQqlkB
	 immlV8M5FA2LMltF6IwEbaNifGC4E7wli/sSmNUByZMg3dxCH9aniFg0virzhqnkxW
	 vCIXIGUGeB9MGK5qFeK+HD/2RgwKv1lyGnaUvScPUTwPsTIrffuOCW/4tIIHuHdia0
	 MviAiJ7dSSeWZTSyq8k8fVIZmfwkxLBHZfx5Y4RnHBOT9iQgWw18ZeYnAdSvLFRqWn
	 OR51lquuYQbqXYAkiBlZi2etQMmEs0jfLKnlsCyCYd8/gDR9yJUUekLQh3ZvM2ZK5+
	 URiEPgfftBH5f41hl8yt8BeG8ihdJnbzDUaIbCNIFHgxWXoL0Dip5eURaJQ/MKK5Lw
	 j7ksazzZI54+8vlaYVkIsJveQpcWPrigKXMQ+C8RyQghDL388/1UVG9fX2YpIPbb7n
	 ewdUAcEY1T1Wy9qaqGqm7cgnGmQx9Mw0er91S+6iDilxTnXpiJcDiPfJN21aws3/G/
	 4ZhDiNrxyx/vwoN/hAezSJ77GzG2lek7U8WTKLPaDBKlfChMpyXUY1Yrrm27v2bJEb
	 +E0YJIq2L2/f21Lij0Z3GpQU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1FECB40E0163;
	Mon, 14 Jul 2025 10:15:20 +0000 (UTC)
Date: Mon, 14 Jul 2025 12:15:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [ras:edac-drivers 1/1] drivers/edac/synopsys_edac.c:1405:6:
 warning: variable 'rc' is used uninitialized whenever 'if' condition is true
Message-ID: <20250714101515.GCaHTYs-tZIBxGNfdf@fat_crate.local>
References: <202507141048.obUv3ZUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202507141048.obUv3ZUm-lkp@intel.com>

On Mon, Jul 14, 2025 at 11:04:12AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-drivers
> head:   3e2923c48e75f69f988c9cafd1fd2fbca4fc05f6
> commit: 3e2923c48e75f69f988c9cafd1fd2fbca4fc05f6 [1/1] EDAC/synopsys: Clear the ECC counters on init
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250714/202507141048.obUv3ZUm-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507141048.obUv3ZUm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507141048.obUv3ZUm-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Thanks, I'll merge this into the patch:

---

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index a0d101aa15f7..51143b3257de 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -1404,6 +1404,7 @@ static int mc_probe(struct platform_device *pdev)
 	priv->p_data = p_data;
 	if (!get_ecc_state(priv)) {
 		edac_printk(KERN_INFO, EDAC_MC, "ECC not enabled\n");
+		rc = -ENODEV;
 		goto free_edac_mc;
 	}


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
