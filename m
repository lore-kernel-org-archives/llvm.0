Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D42DFA42;
	Wed, 16 Apr 2025 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842222; cv=none; b=hSWjQDIH+M7IiRvvL46Uhi73dMIDHmkMroGPTmrvk37Y07o5FUXmFOkgO6LoQpF5nJDn0UmJipHSQxdvYlxqGoQGWHELzmI33332IlMbB2Hs2vA4J+kl7k0D4EdQyAhWykEXJWxGO6U8xrDjSESOYCaEwzEvRzlXNjoYRyTYXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842222; c=relaxed/simple;
	bh=TPaUrtCeLu2Z5hZj1r8jOLlPE4F4Jv22vBCUSxcI3/U=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=B7pvO6Iai1+2ofD+OHKQoCKD/cfkif5QqJHfSyIsONIoNitLRj4bkB0WleFuT59bzQv4x3y7yIq3i8krz/EqulGRPMvP7U42a9LyjeYSXVgUFNGgNcUaviekBoVpSwtspAZTeutK06JqSMIZCUWbvZGdMH6r9p9nVsJHcN5OgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=E04+mUxl; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="E04+mUxl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xoQPmEh//Ecul4GGVBoluXgRVmoldj/oaTPva2dmdcs=; b=E04+mUxlLrAtSm5ipCfSqzhCAF
	6W5QGNhSmBGCOyHeMQjBCTSnjrIotWuu1mRjCp6mtwEbU11/1tyWmKb9HfiqY2V5oAb5aN36lLTzs
	CnnVlDFPx8oF1YnLwPK01lvhGEgd4vhF5M2Dk5N0JTfssoX1dm6YXXQY7Lg/RfzdMUBG4RmCDH9eR
	YuH/gHz7ts638JKMotBXHOOO0v0SFvs/0hjHufJD9uAh4zgASQEcxLFIBcG55MTxmq/7fBb7v3nPu
	yiJsy1o3KkNbAG3pwKcv7sordcUloq1xXXvPo0WHZNsFyoN81SHjcmEQOWNWF/O6+Ykg5QTaFVJ1F
	NLf+ejYw==;
Received: from [::1] (port=24590 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u5BAX-00000000FU6-44pM;
	Thu, 17 Apr 2025 02:23:45 +0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 02:23:44 +0400
From: Igor Belousov <igor.b@beldev.am>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Vitaly Wool
 <vitaly.wool@konsulko.se>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 195/196] mm/zblock.c:369:13: error: incompatible
 function pointer types initializing 'int (*)(void *, size_t, gfp_t, unsigned
 long *, const int)' (aka 'int (*)(void *, unsigned int, unsigned int, unsigned
 long *, const int)') with an expression of type 'int (void ...
In-Reply-To: <20250416092641.198e1e2216f381c5e5852095@linux-foundation.org>
References: <202504161517.KYEDQav9-lkp@intel.com>
 <20250416092641.198e1e2216f381c5e5852095@linux-foundation.org>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <2eeb20e32cc4ae0403b30fd9a5dbfd2e@beldev.am>
X-Sender: igor.b@beldev.am
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am

Hello Andrew,

2025-04-16 20:26 wrote Andrew Morton:
> On Wed, 16 Apr 2025 15:21:24 +0800 kernel test robot <lkp@intel.com> 
> wrote:
> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202504161517.KYEDQav9-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>> >> mm/zblock.c:369:13: error: incompatible function pointer types initializing 'int (*)(void *, size_t, gfp_t, unsigned long *, const int)' (aka 'int (*)(void *, unsigned int, unsigned int, unsigned long *, const int)') with an expression of type 'int (void *, size_t, gfp_t, unsigned long *)' (aka 'int (void *, unsigned int, unsigned int, unsigned long *)') [-Wincompatible-function-pointer-types]
>>      369 |         .malloc =               zblock_zpool_malloc,
>>          |                                 ^~~~~~~~~~~~~~~~~~~
>>    1 error generated.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-add-zblock-allocator-fix.patch
> was supposed to fix this?

I can provide a new version of the patch.

Thanks,
Igor
