Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE731D366
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.71.1.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881422; cv=none; b=Fkq4GGKhFBtrwQ6VQ1JOAvpbK3CJsEv6+49DNynGcVf3CU3Tu8zHDGAtgDfOII9axi1zxVFJMveh/uk1V96kXuzK4ASsQ9TdCmoYvZmXYewh5STEvwWao3XO0vK7i3cevKH2ta/6vGGdogPsiVUYYw7yrKqrDjM5MVoXJVRYxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881422; c=relaxed/simple;
	bh=zPefufmPXCTHKeEHe4dmfRQUNsQhoP/ZN+dyz7Jdti8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmH4QUUMNPSallbMwYGGUN39q/5GCTsSIiosdxgJmOQcSQ6GfXiBE3Ushy21XAYWVvVRt1MDc0mdQPiwr+uRZ7axgcHPwhzBPWLh+Q0B859IsdJOaf4nd8RT2r/bXmIfhH5lctqQmRKDYAo2mR+1d28/08BsQ0f4jNkQ/TK8Yjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edpnet.be; spf=pass smtp.mailfrom=edpnet.be; arc=none smtp.client-ip=212.71.1.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edpnet.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edpnet.be
Received: from [192.168.177.80] (213.219.165.243.bro01.dyn.edpnet.net [213.219.165.243]) by relay-b02.edpnet.be with ESMTP id VOhoZgEPRUhcN1kR; Thu, 04 Dec 2025 21:37:17 +0100 (CET)
X-Barracuda-Envelope-From: janpieter.sollie@edpnet.be
X-Barracuda-Effective-Source-IP: 213.219.165.243.bro01.dyn.edpnet.net[213.219.165.243]
X-Barracuda-Apparent-Source-IP: 213.219.165.243
Message-ID: <ddf5f151-852a-4678-8857-0b72fa058e27@edpnet.be>
Date: Thu, 4 Dec 2025 21:37:11 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [koverstreet-bcachefs:pr/992 2/2] ERROR: modpost:
 "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!
To: kernel test robot <lkp@intel.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
X-ASG-Orig-Subj: Re: [koverstreet-bcachefs:pr/992 2/2] ERROR: modpost:
 "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202512031412.agZspLiJ-lkp@intel.com>
Content-Language: en-US
From: Janpieter Sollie <janpieter.sollie@edpnet.be>
Autocrypt: addr=janpieter.sollie@edpnet.be; keydata=
 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
In-Reply-To: <202512031412.agZspLiJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: 213.219.165.243.bro01.dyn.edpnet.net[213.219.165.243]
X-Barracuda-Start-Time: 1764880637
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1173
X-Barracuda-BRTS-Status: 1
X-ASG-Debug-ID: 1764880637-214fdf551823b30001-z8pkLo
X-Barracuda-Spam-Score: 0.40
X-Barracuda-Spam-Status: No, SCORE=0.40 using global scores of TAG_LEVEL=10.0 QUARANTINE_LEVEL=10.0 KILL_LEVEL=7.0 test= 
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125474
	Rule breakdown below
	  pts rule name              description
	 ---- ---------------------- --------------------------------------------------
	 0.40 BSF_SC0_SA085b         Custom Rule SA085b



Op 3/12/2025 om 07:27 schreef kernel test robot:
> tree:   https://github.com/koverstreet/bcachefs pr/992
> head:   39aff98c65bacc4dcd96c8ac030646bca1bfb183
> commit: 39aff98c65bacc4dcd96c8ac030646bca1bfb183 [2/2] Merge branch 'master' of https://github.com/koverstreet/bcachefs into HEAD
> config: i386-randconfig-017-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031412.agZspLiJ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031412.agZspLiJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512031412.agZspLiJ-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!

Fixed by reverting to vanilla v6.18 in lib/crypto/Kconfig
