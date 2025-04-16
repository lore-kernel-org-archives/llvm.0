Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCAE20D4E0;
	Wed, 16 Apr 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820802; cv=none; b=CJl3g+aSzWVWJS6oZ5KZsqOv2acmAZhaltm5qtnaeZ4LDNtYVc7e8XixkX9fa6UtFSNhAaSqTLG3IV/pauEHuHkAi1AFGH3hy+Xnonq/EBYjat5hd+Igbs8He9s7VdMpBi78y3dKM5m2tYTlzUpYJXOAkKLKkVyicW6JIZ8nKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820802; c=relaxed/simple;
	bh=ykGZBHq7AVdEKgnkOJot7S+aHZRDlVwsvQEdzh7v3VY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FMF8/d4kkgtSzDZviItn7hLlKsqi6lirevtF1Yg5PzD0azBHXpoIlF1c7P8jGkkm44cPTzqR+p3tLoFLCFSuCXCMssK1KKS6llyRXiscSEPrwajztX8ZmB5QmHfRuH6cQcBn4DGSUiE5bBG25G2Og9qxWp+WHQ3fXaBC/C0emLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Tf+9V2sL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Tf+9V2sL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5787C4CEE2;
	Wed, 16 Apr 2025 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744820802;
	bh=ykGZBHq7AVdEKgnkOJot7S+aHZRDlVwsvQEdzh7v3VY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tf+9V2sLJ9roB1T8fVjOIK7mQyaA/arFs8n3YUMVTstoRz73RqVaoEr92LO5caLmD
	 ZKE47DJ80aBfxvXGfAJgzcHOcaNxq1mioUhnqKRZRZpy9x1d8HNHUh9dcXpo8+yxTP
	 9ajtkq9CaGwtIP38Nn4HCVZq7Y5eB2S7KYF3uwtk=
Date: Wed, 16 Apr 2025 09:26:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Igor Belousov <igor.b@beldev.am>
Subject: Re: [akpm-mm:mm-new 195/196] mm/zblock.c:369:13: error:
 incompatible function pointer types initializing 'int (*)(void *, size_t,
 gfp_t, unsigned long *, const int)' (aka 'int (*)(void *, unsigned int,
 unsigned int, unsigned long *, const int)') with an expression of type 'int
 (void ...
Message-Id: <20250416092641.198e1e2216f381c5e5852095@linux-foundation.org>
In-Reply-To: <202504161517.KYEDQav9-lkp@intel.com>
References: <202504161517.KYEDQav9-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 15:21:24 +0800 kernel test robot <lkp@intel.com> wrote:

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504161517.KYEDQav9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/zblock.c:369:13: error: incompatible function pointer types initializing 'int (*)(void *, size_t, gfp_t, unsigned long *, const int)' (aka 'int (*)(void *, unsigned int, unsigned int, unsigned long *, const int)') with an expression of type 'int (void *, size_t, gfp_t, unsigned long *)' (aka 'int (void *, unsigned int, unsigned int, unsigned long *)') [-Wincompatible-function-pointer-types]
>      369 |         .malloc =               zblock_zpool_malloc,
>          |                                 ^~~~~~~~~~~~~~~~~~~
>    1 error generated.

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-add-zblock-allocator-fix.patch
was supposed to fix this?
