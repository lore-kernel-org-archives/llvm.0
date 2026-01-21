Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC624D90B7
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015134; cv=none; b=mQmyuYp/iM2DxIOuiafwMMLxx8qkdx1Lmzcha36d+Tv/ZUCIxBFmSbEcKX09rJs0fbCJwXHXr01uwQE3WtyOg4PypVwmGguqtLa004Wlbey+OUjoOe40luEAo8rP5sCK7K9PoZz8LxfTKml6buVuUrJepaWMTjdEITd4UbLiVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015134; c=relaxed/simple;
	bh=BA1Io05RmSPvmyu2AGLaTVXNhdRVOch9VEur7ZOh768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lT8OCCAYhKlgyHgU99FBvs3aADROFofiGPF0PE5TiNQdkiYvZwufof58dRZXabxOQqFWe8Ry2mljbrpU6GxXI+vIAQuODZFQmRMikFyKtbAaiP3K7vyED22sU++1FSaOo78dC1T6AWoBGTpNPAURU4R1j1QblLTRK1Nr0HkHXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i80O7wDG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i80O7wDG"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38316b89455so72881fa.2
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769015131; x=1769619931; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSywsaNq61h75Z1wzOoBhV8mE5CzphyKGUVeAGM9YLE=;
        b=i80O7wDGSSX9fk7exDTQfzs/I9LR5ySHh3zyEvXX+zVvCZJvOt177Ah6UisHGfvGzO
         Sy7hJ3BCfpBl1pqvNaB9DVyvoKX0hlJOeLG/fVSqDa6bA+hfKoT1IibmdIi2fDMmE0AT
         L6KpnkU0Dv7Sdfj7BpGV9VTocymjr2OhFenx39ixgfOS7aXlmYqjKQztBpu+dMaiQ2Lo
         ksUKGMu8Q2BbYc3v/N4XOhKR3ht0Cy1h0rKbNoGA766y/w0IfQzHurw6heCJydfgSfRY
         AmvEbsh4LHotqZl4E5jaVIn2kJjYCwIcACmQL7ocVe5MUE9tXdPwPM7LtlbHV4PaNn+k
         6KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015131; x=1769619931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSywsaNq61h75Z1wzOoBhV8mE5CzphyKGUVeAGM9YLE=;
        b=r6SqO5AK4GuKsulxr6yXwnU8GhY4qPfhcvBlkCI4Nu6Tx9QCJqzUfFtKW9IUcFc+XM
         mQDQPP/Lj6rTGMP9AuNU/6NBeUAJ6iW+Dy+Zx7DzschBqQHjKsLyGRRPbnzg86hIuWti
         nx2jYQPsiZHb9+tAliNBndEzBFYhs05yDu82O5i8UCh4otZ7miJONt+zDZPu0PuGIvzW
         0hgZUVeUTm9Md5abaiy6+zRi2VM3YaG5sLL9X1spX3phCngH/ihfr9UY3xc5RruLVwpF
         prlVtPRvdFsy54WScHRlB7czuTg34Yh3Tytg+ehqxG5TP5L2C5QKYYa55L1SxSHY9eX6
         hWfA==
X-Gm-Message-State: AOJu0YxPyaQZSU7+FMVUuFGclXKQzqfJ2mR2kaRsgergVS8UuwLzIav3
	wzdZxm8N+iRG6kOvZ1GiO4cwXerXTctsDIxJ5V6//PEGceQd15SqF7tV
X-Gm-Gg: AZuq6aKOH1/BRdcevWmba9O/99wGusRpbDI/Cnmohvb9YuFsELZ5WwSQVbiQbFFC61x
	mGWUNI+bD5gHASnEXQIqoABjGAjYcXpdmgOKr+LqejpMclNyiqVzcFQz0OsfYW4aHIzbh0eBC7m
	rjUPdps/C7eeA42R6FEGILIWmGwIHk434WtjFzTIW80T9nOxO4huG+JVZgTMIE8Ere+cnkaoJxq
	7WkzWqBj4ppFqd00nXiaXx+0mv/m6afY4/HKWNm1sCswY3mT8C6uqCc4JKQiFRiUoQdorTFM+z0
	NNgKiWrskdSS5v0GlIvYaWRrtYYpRqZuDBVhwKdJnILzQ56uFygP1WoQL489MVv25MFM15XJKAk
	ne90VOjbm+I4D9NmxWolUtLClPKgKozbpmuGCdliU0vlYGMoDqvrnItqls746YMPGqUaRIe/F9a
	RZde3Jh4bsiuRHI52ZQQ==
X-Received: by 2002:a05:651c:547:b0:37a:9558:5bdd with SMTP id 38308e7fff4ca-383842ccf59mr39226381fa.3.1769015131133;
        Wed, 21 Jan 2026 09:05:31 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbe6c1sm46902931fa.22.2026.01.21.09.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:05:30 -0800 (PST)
Message-ID: <8d5cea70-0e1d-4442-b761-e6589346d654@gmail.com>
Date: Wed, 21 Jan 2026 18:04:36 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7687/8302] ERROR: modpost:
 "vrealloc_node_align_noprof" [mm/kasan/kasan_test.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrey Konovalov <andreyknvl@gmail.com>
References: <202601211250.6uQzZrQp-lkp@intel.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <202601211250.6uQzZrQp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/21/26 5:57 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   053966c344dbd346e71305f530e91ea77916189f
> commit: 22228c860d2633a22656cc506022c657fec15194 [7687/8302] mm/kasan/kunit: extend vmalloc OOB tests to cover vrealloc()
> config: x86_64-randconfig-121-20260120 (https://download.01.org/0day-ci/archive/20260121/202601211250.6uQzZrQp-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211250.6uQzZrQp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601211250.6uQzZrQp-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 053966c344dbd346e71305f530e91ea77916189f builds fine.
>       It may have been fixed somewhere.
> 

Yep, this has been fixed independently by https://lkml.kernel.org/r/20260107-export-vrealloc_node_align_noprof-v1-1-a581bec13054@google.com
It would be nice to reorder the patches so that the fix is applied before the kunit patch.

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "vrealloc_node_align_noprof" [mm/kasan/kasan_test.ko] undefined!
> 


