Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652417710C
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728443882; cv=none; b=tJgk0XCWUdrKIhZPvBpiOWgNMCoaP9AUveHmFzBIPYmcuDsNZlYOJCCAhW5NA/E5iK/bM/Sye/Oj7uxKTkKgrcSS+vzsF5TZ9qYvsbXbWSfNmZAPsv2Ne+aqafq2kYGhWZeQGnw//+23M5ez2WXcXnYt2cNKcjcKsf20K7ElCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728443882; c=relaxed/simple;
	bh=qeTeiqxFgtHkrwd4+T1jN4x/0VgEwAW/vhJtPYAJgZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjIYi9/lLewWW82SfQV5/SRlABvrBO1OaKqM+EusNpkPSc67xQmcmtrZAXxXfdjcP2Hp+q6ikOjz3j9dQT2hbsR4GtSbTi5TeKSOYmmV7x4S1lOzTIjF/8w22lM0AfCq1/2/ekM6mou0GQMzbG5cCWtybSpJVSDr4nzgP0cS0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu; spf=pass smtp.mailfrom=illinois.edu; dkim=pass (2048-bit key) header.d=illinois-edu.20230601.gappssmtp.com header.i=@illinois-edu.20230601.gappssmtp.com header.b=e3pb92VF; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=illinois.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=illinois-edu.20230601.gappssmtp.com header.i=@illinois-edu.20230601.gappssmtp.com header.b="e3pb92VF"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb97afcec9so44961346d6.2
        for <llvm@lists.linux.dev>; Tue, 08 Oct 2024 20:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=illinois-edu.20230601.gappssmtp.com; s=20230601; t=1728443879; x=1729048679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thDgyfP+u4RJkN9ygN4eA5i7zuNDmPDTp6v1MVROO00=;
        b=e3pb92VFhsYh06OARhluqk8+CCYwELxGYNd8TYL6B7GQNUT4EP9HPo7Mco29IN4f7j
         y+C/19CqxxHzUylKwRxubV3AkMXaKEJrNuMAO8brlQ8/3KJCWYMBlQoeN6Mb6r+/1ROE
         EUjKJKKpmNEPc16SgfNCJPLse2J17VPE9gTl8Zzbui9pQJjA33rlQyc1BRj+6T8XbZw3
         bVPek8OPqqrgrOcOhcLwwyXFI5csn0rSwYvdCnO/7VwGyZnNJr4C8NSMKIzpfhLtd//5
         4/MhkSfLeg5/q8VXFeqbGeaf9bk9YPOjCVcW2EgU+QHCi/CQfaq60rScDKtH68CxEPNk
         bibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728443879; x=1729048679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thDgyfP+u4RJkN9ygN4eA5i7zuNDmPDTp6v1MVROO00=;
        b=OHlzwdu2APvs4H5vXHTyiD0ia4rvYkJHvK6duJlvxsiS/4ERglZEn2AYeOfiyGUfml
         aeiCorxtwpkuHPdgQ1pJCSch0zq+c7EvPQRj3a3mhfyPgm1ZMhuGlGq6VnCU8PuJjzQT
         E5u3VkJBVJ79A6xHoeV+ywbz+A0AT9h6VhoQoSyPnv4lu1CEBkOrNGZ/BWjZZOrlkfj2
         VRbFsHtvb4Kdg9lQG4qiNPU/iZr6Br96c3KpSOzoZrsux9KKYxrmpxURf/+wDIi91Qlp
         xCfL8jNgs/H8ny090XnNUs4/TsEduLJnXV1XFX3u11S7YhWckn/XBHMv3f9GFeyAJnKJ
         nVpw==
X-Forwarded-Encrypted: i=1; AJvYcCWoDw+bcTiR3xQufiwZtJ+KJ32gLAhibsJX81eSF+eyAQPZYx7YdJPcMRlz+BSVf0AnKCrJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyT4zhX6s6wwW+RGTlDnL1mAonkKva/sVLxEUNOaSbyAowte8In
	PSqfwGdQkoWirliMIKg38MYHJyhbsvqTCjiHynF4mjp6KeJHcTplMchvyfuN+g==
X-Google-Smtp-Source: AGHT+IEhn9w/MP0oB2WKldelhVAKmKiL1d/EbmMPMKgnT2doMp+iZMaSHOVIOpO2jisfYNBEVmkdXg==
X-Received: by 2002:a05:6214:5a04:b0:6cb:99db:bdbf with SMTP id 6a1803df08f44-6cbc95d4684mr18380106d6.43.1728443879197;
        Tue, 08 Oct 2024 20:17:59 -0700 (PDT)
Received: from node0.small1.linux-mcdc-pg0.clemson.cloudlab.us ([130.127.134.91])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbcaad37f5sm1820886d6.130.2024.10.08.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 20:17:58 -0700 (PDT)
From: Wentao Zhang <wentaoz5@illinois.edu>
To: nathan@kernel.org
Cc: Matt.Kelly2@boeing.com,
	akpm@linux-foundation.org,
	andrew.j.oppelt@boeing.com,
	anton.ivanov@cambridgegreys.com,
	ardb@kernel.org,
	arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	chuck.wolber@boeing.com,
	dave.hansen@linux.intel.com,
	dvyukov@google.com,
	hpa@zytor.com,
	jinghao7@illinois.edu,
	johannes@sipsolutions.net,
	jpoimboe@kernel.org,
	justinstitt@google.com,
	kees@kernel.org,
	kent.overstreet@linux.dev,
	linux-arch@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	luto@kernel.org,
	marinov@illinois.edu,
	masahiroy@kernel.org,
	maskray@google.com,
	mathieu.desnoyers@efficios.com,
	matthew.l.weber3@boeing.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	morbo@google.com,
	ndesaulniers@google.com,
	oberpar@linux.ibm.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	richard@nod.at,
	rostedt@goodmis.org,
	samitolvanen@google.com,
	samuel.sarkisian@boeing.com,
	steven.h.vanderleest@boeing.com,
	tglx@linutronix.de,
	tingxur@illinois.edu,
	tyxu@illinois.edu,
	wentaoz5@illinois.edu,
	x86@kernel.org,
	chuckwolber@gmail.com
Subject: Re: [PATCH v2 0/4] Enable measuring the kernel's Source-based Code Coverage and MC/DC with Clang
Date: Tue,  8 Oct 2024 22:17:38 -0500
Message-ID: <20241009031738.2851980-1-wentaoz5@illinois.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003232938.GA1663252@thelio-3990X>
References: <20241003232938.GA1663252@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2024-10-03 18:29, Nathan Chancellor wrote:
> ...
>>> I was able to successfully build that same configuration and setup with
>>> my primary workstation, which is much beefier. Unfortunately, the
>>> resulting kernel did not boot with my usual VM testing setup. I will see
>>> if I can narrow down a particular configuration option that causes this
>>> tomorrow because I did a test with defconfig +
>>> CONFIG_LLVM_COV_PROFILE_ALL and it booted fine. Perhaps some other
>>> option that is not compatible with this? I'll follow up with more
>>> information as I have it.
>>
>> Good to hear that you've run it and thanks for reporting the booting issue.
>> You may send me the config if appropriate and I'll also take a look.
> 
> I seem to have narrowed down it to a few different configurations on top
> of x86_64_defconfig but I will include the full bad configuration as an
> attachment just in case anything else is relevant.
> 
> $ echo 'CONFIG_LLVM_COV_KERNEL=y
> CONFIG_LLVM_COV_PROFILE_ALL=y' >kernel/configs/llvm_cov.config
> 
> $ echo CONFIG_FORTIFY_SOURCE=y >kernel/configs/fortify_source.config
> 
> $ echo CONFIG_AMD_MEM_ENCRYPT=y >arch/x86/configs/amd_mem_encrypt.config
> 

Chuck and I can confirm the issue is reproducible these options, and we
are still looking into it. Thanks for catching this!

> ...
> 
> Another thing I noticed with this series is there is no entries added to
> MAINTAINERS. Who is going to be responsible for maintaining this code?
> 

We are going to add the following as the fifth patch in v3:

diff --git a/MAINTAINERS b/MAINTAINERS
index a097afd76..55438cb90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13262,6 +13262,12 @@ F:	include/net/llc*
 F:	include/uapi/linux/llc.h
 F:	net/llc/

+LLVM-COV BASED KERNEL PROFILING
+M:	Wentao Zhang <wentaoz5@illinois.edu>
+M:	Chuck Wolber <chuck.wolber@boeing.com>
+S:	Maintained
+F:	kernel/llvm-cov/
+
 LM73 HARDWARE MONITOR DRIVER
 M:	Guillaume Ligneul <guillaume.ligneul@gmail.com>
 L:	linux-hwmon@vger.kernel.org

Other than the booting issue, v3 is ready and being tested locally.

Thanks,
Wentao

> Cheers,
> Nathan
