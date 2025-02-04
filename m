Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85304213E81;
	Tue,  4 Feb 2025 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682807; cv=none; b=LhK7c7gDlReLvduGqi9iEWgJ9Ics5b2wpys9dFWVzXNqas0ZwL9FeyHhE//p9WwYvRoqXXsBgcCNolaPSEdSuGSQy8yOZ2AKN9XQpiIZ4ob9B+k3xSd0D0C23OmCEUykRQuwS2VgzXi+xvp/wYqyhq38yybnopQv6IOHeGmF6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682807; c=relaxed/simple;
	bh=5oxPJ8jy72qLFIDj1/K9xMM+HHBMdNhIFNGaxg0vH4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1imV99hXr8bYIfwcJhCz1vcCE+u/wIyq7UsLO30urOQJgLZPrk8lZTgMGl7ku398R7O39NlRVPjhpZIUD2Bgj15v8uVNTZBgCOqwR3IEHP03bPk3B7He/OPNizHpliH1Wv8cK6H7WrE4MtNXWexOQSgDfdVnvEJXMEbNVb5cyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWKTOhUT; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWKTOhUT"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6ea711805so804583585a.1;
        Tue, 04 Feb 2025 07:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738682804; x=1739287604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9/M1Sq3IU8+ynTHRlqAPqWJvQh8qM3cInBgFTNxjEU=;
        b=iWKTOhUTyi9/JOZmka/RV/avgjESV4IsTknNXnBIH+KKDsSoxLNycA8CCfOIvwpYVH
         YY6CLqAH9tKMsiOEkhJnVzF5brxL/ZVvj8ARJ4umFYYdRmlF4tq8r1ZlNINXuu2296aA
         i+BoNccLp4Xa9TBfsyonBgq5K6Dv65Jy8WgZujXSAwFHtW3TxiqM+qTY6b7NoiC7ZPd+
         wZzTjWTU+yMoCvdmp9H0KMZnbZyzDNvmGVRX+SdhMMkuOZSkdvnjrQsUnn/p6oBrcske
         hLxche1i0nhVUv7AvSF4hl0HgT0rU8xJ8lcvl7RVIT98H4dL5B0BsJzmW65zIEyoXzoG
         IpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682804; x=1739287604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9/M1Sq3IU8+ynTHRlqAPqWJvQh8qM3cInBgFTNxjEU=;
        b=Nm+sEeEiTao2kJoux8KEgMyOTO9CCb2v3DhLbWyBv/vCDba8NkSBjyVuNH0y56JY9z
         tNQJnSv1/p5jYYrqhGPZJF9B9sqA+O2K3LvBOMXf2LxNhBtFGMszXB38KSXNzgqym9nf
         4Mj7x7MOs21X4S/SUdJwJgGlLQlz8lPqq3XyZi9Ai0Z3SJMaZbKwWDsQVWiZR5m5fSq3
         x6Og/K1XV/mja6vJQnDcAPbIK5nKVPO6BPHVWZVU57ehWHmQb2cL6ISd/mOVdtR3cK/Y
         MpHvXKaNNy9b+RUsXeZdIUNukA8DBmZlGjmQcO/wJ6nPAkCd+/42c5FWs4bwWFxPmFUg
         kFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtYESOI5KbWJ3PAT1a4rnj5CLqlQQJz88cT+quvSSyzZU5BtyKzSSlQpl+VTVK4VLNGmw7H9RgL2pdl1coCg==@lists.linux.dev, AJvYcCX7hdgF0fwbn+j0rYQm+8hOE8PA7k5G+cAy/CDp2uAY2XprL2zko17up30baAq/z2WxNybn@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu1lhbTtEQn5ZP9F217mZsDR7ytWJkInKXlgvB/km8Adva+80K
	qnSadTjsS0JAEr8675LAi5l1h712KtD5/OijtEOemmFk8dty8cey
X-Gm-Gg: ASbGncsVR+ATNaANBaH1lUp9YoHwX4jml5YwRH2Xj9QHgwg2g6TA2r0vMLc6dwLbCGj
	a0fmoVdFPv4eDyL0kb0ISvCyBI0xGNox3og2AvsjIhWjKnDcWYPc+jyP7tuUKvkLSBAvS2XKay/
	H95a9FjIX43XGlCQ057JqVklAtHTctmIYpiaE/y7p/HQV0PNjzTp8sfUc8FrjN60SivXpbiNo3d
	Wqsnum+/HalxC33h/Z5TvYOghOcdws8B1bOH5ZF1rFPoJ23MFDJwkjGQ/UMDTzZGSWlds1EoDvR
	8OqNtER+y+vsoXbIonirFxqrGWwyujo6tRIOJtGV+r9Oll8YEnU=
X-Google-Smtp-Source: AGHT+IEZs1QoQFe7O34wQ91VXCKMpOjQQbMZO3pVYpq/6ZSbNskxpq+wA5hig24p0v+dRCeW0wr2WQ==
X-Received: by 2002:a05:620a:2a0f:b0:7b6:f2a8:64d with SMTP id af79cd13be357-7bffcda88camr4314528185a.49.1738682804098;
        Tue, 04 Feb 2025 07:26:44 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a9058e4sm649428085a.82.2025.02.04.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:26:43 -0800 (PST)
Date: Tue, 4 Feb 2025 10:26:35 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>,
	Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mateusz Holenko <mholenko@antmicro.com>
Subject: Re: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:539:21:
 warning: use of logical '&&' with constant operand
Message-ID: <Z6Ixq9aJtowFgink@glsmbp.wifi.local.cmu.edu>
References: <202502012258.KCOVEE5t-lkp@intel.com>
 <CAMuHMdUi8faCPsd5-bdG0ZR+DOZ-S212ZwRYr1LYZ3d3Vgkuhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUi8faCPsd5-bdG0ZR+DOZ-S212ZwRYr1LYZ3d3Vgkuhg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Tue, Feb 04, 2025 at 03:59:56PM +0100, Geert Uytterhoeven wrote:
> Nice catch!
> 
> All four "&& HL_TIME_MASK" should be changed to "& HL_TIME_MASK".
> Gabriel: I guess you don't need me to send a patch? ;-)
 
Done -- applied, rebased, and force-pushed.

Thanks much!

Cheers,
--Gabriel
