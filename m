Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C377C275AE3
	for <llvm@lists.linux.dev>; Fri,  7 Nov 2025 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532336; cv=none; b=cD/yzAksGu40XGuqhlLPl89s4PZZ9rRN8HwtRdAy0E8LetxAS0NNCsBo4+n2F5poxTGIiL7q3Eko1ogrdd/dYj1L09ru55iyT1J5OITpvL60LbM8B9fXTQ9ZunNiCedUSJ24M6FUoiOHED5aHhsG0cnSAgPF6JsyvAVMHCGXDzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532336; c=relaxed/simple;
	bh=/MVuEHa/23Qv0C/9OdlGj8X2onOeVc2HZ/vE5ohBEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljXLARw645v9ZbGYi3Sw9YJlwubTLRZ8dBqrkAuCPKAqUT7ZaCDvbP86n/jaRcSs86U/PGyNBwf6sMMhCild7GTfRfgxHTfZi1q2Bw0mSTAdWSbuETcWkA8qqHjg3ou/85s3B9xNKj7BK4Dk9VUcusCm6KjPbC5jrKf3YGGlw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-641458f71ffso1339586a12.3
        for <llvm@lists.linux.dev>; Fri, 07 Nov 2025 08:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532333; x=1763137133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYdiXEjVampZ2jSiqSx9tYyz7jq/QUvexI5w408e0Dk=;
        b=A2weS+t7TckeiFfX2BTSRV+hgHagiACGeENhd0k/RRIr/1gVXIHWeQBUGjKg3g5Tod
         IHTgYn+Z8H02IArtpEQMyTXfPry5aq6rznhUv3hIEaahLM+SDi6V5VVtSZjLxzX9I3Cy
         AVvqjDy7C9CDqWSekYQ4hw1wPUt3uH4zhH68NxZLi01/qb8/Rp+9qhB3+gvbh22o4W/v
         2C3cUQdHxhemW5WcsLARp8e3/oLFI9li076AkuUu8QLQ2aO/ILq/VwmHYHt9FqXUJAZz
         edMpQ65YcRjHKbU47TskL1cUh4gOIPegYH69dvv9I/3S7i31+NMfEMFSzRHDYXjP6WqT
         30vg==
X-Forwarded-Encrypted: i=1; AJvYcCWckwl4t+UUsupXz9QG+VkvjusjUUgg6katGX6Y1wSAyeM8VtVzgin331sW+NIn6nac+VSj@lists.linux.dev
X-Gm-Message-State: AOJu0YyQkrH8qQXdRHBWfII9iytyD2MUr/NBQeICw+RbcwlbzO6DX0CR
	RT1EMs1OpH5eV6RpOV35giYbhUwq2eBxJiP+B+eTXSyQpAJStgikzj4S
X-Gm-Gg: ASbGncudOFK9KIucIq92wkXjIS4zUcfFxA/kp6TKwCmTi7rWhpxpcUYqvxb3oAFqP59
	k34NqJ0fa5dHMf6dqkHAXicT13JVVMYj+fcqMhg6ybkFWTyc0JToFiqq8rwGaHdDo+31eq01A+H
	HkfvEfmc+NS8tanZgYfQn4yXnyB3Yhl8DEoOVkCtPZoMQEyrm119MjonOPLf6R5pm4vPrO9bU5j
	FIxSnw/3sotGlrI+eB1fzIPfJZYba256MTUWNYUFrKIgdKPDt/n16jHcPAYc75LpWaZAnI/NGWd
	vmlpIX65z2owf7UPi7BGfGSnED62lc7vHE0SRjWtlRLUpuQbzYoqTFTNl3RQbPvNFhyDKMniVI4
	6ciFgUzreXbR2oxyB2yxS8hyCbyS/ep3DXya9tnxoZZFIp1eHnhE9BjygZoXycViua0E=
X-Google-Smtp-Source: AGHT+IHPJ69JUqZgdpNF0p+3fZhOjmHXGs9AcN7Hi5uAvwr6NOYxLUozjN0/kKt6el2+3CrQcxSHkA==
X-Received: by 2002:a05:6402:51cb:b0:640:b643:f3c5 with SMTP id 4fb4d7f45d1cf-6413ef04f4emr3649289a12.16.1762532332712;
        Fri, 07 Nov 2025 08:18:52 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8141e6sm4596289a12.15.2025.11.07.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:18:52 -0800 (PST)
Date: Fri, 7 Nov 2025 08:18:50 -0800
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>
Cc: Ma Ke <make24@iscas.ac.cn>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] EDAC/ie31200: Fix error handling in
 ie31200_register_mci
Message-ID: <k67mlei5ja52oq3txm77poyhwtq7rakfhvcbvxi2guhyzappji@a726bvtwcmkb>
References: <20251105022146.22105-1-make24@iscas.ac.cn>
 <202511060427.k5gEuYdp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511060427.k5gEuYdp-lkp@intel.com>

On Thu, Nov 06, 2025 at 04:55:26AM +0800, kernel test robot wrote:
> Hi Ma,
> 
> kernel test robot noticed the following build warnings:

This should fix it:

commit b265162b5f9ae2a5f0f2cf8c312b3bbd1137f34d
Author: Breno Leitao <leitao@debian.org>
Date:   Fri Nov 7 08:11:29 2025 -0800

    EDAC/ie31200: Fix uninitialized variable 'priv' in error path
    
    The variable 'priv' is initialized from mci->pvt_info after the window
    mapping succeeds. If ie31200_map_mchbar() returns NULL, the code jumps
    to fail_free, but in the original code, this would execute
    put_device(&priv->dev) before reaching edac_mc_free(mci), using the
    uninitialized 'priv' variable.
    
    Fix this by moving put_device(&priv->dev) to be part of only the
    fail_unmap path, where priv is guaranteed to be initialized. The
    fail_free path now only frees the mci structure, which is safe to do
    regardless of whether priv was initialized.
    
    Fixes the Clang warning:
      error: variable 'priv' is used uninitialized whenever 'if' condition
      is true [-Werror,-Wsometimes-uninitialized]
    
    Signed-off-by: Breno Leitao <leitao@debian.org>
    Fixes: d766967335 ("EDAC/ie31200: Fix error handling in ie31200_register_mci")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202511060427.k5gEuYdp-lkp@intel.com/

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index ea8fc0d5f347d..4c6396da3603a 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -527,8 +527,8 @@ static int ie31200_register_mci(struct pci_dev *pdev, struct res_config *cfg, in
     return 0;
 fail_unmap:
     iounmap(window);
-fail_free:
     put_device(&priv->dev);
+fail_free:
     edac_mc_free(mci);
     return ret;
 }

