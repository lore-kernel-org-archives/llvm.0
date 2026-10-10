Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D27389E04
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602795; cv=pass; b=SKkpapJiGrje4xIurqjQEE9SOWsqIovOFhVaMP2XSjOTQU7NcTOJ1mx/CL5Qvu7cBV7O0KjwAoZZSILxvq15xzlxAPY0PWSUsxzDSJDNdpcOw67HvEp6luya1WGjyECboVcxxbzQkmMPiRsfyzHIB4XgoYUZeqg3D4L909slUBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602795; c=relaxed/simple;
	bh=gzk/Vqa98lLR1g14dUkoIDBfibZcPrZRHRXSu0c7M0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N61rFLFACwIhcyaMNQ/KuCjiN9xGOtAwDjwmjKA68hub9VpmdQ0x9qrrCYC3NesorCGoXKWBpyBhg3t3QB+RmJ8MRv9FVqqAnTmCcz24v7L1JTw691PFVuZ+nJTtEHWhWydM7hhWyJSv0SABiEFmsKRQejvp36pIxc/6/y1ItB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXu5LEEB; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXu5LEEB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e7006bbf77so1903775ad.0
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 20:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602794; cv=none;
        d=google.com; s=arc-20260327;
        b=Z5ViWtU3GC1t0XfYfLNOZX9msU3At/m1gtidzLbgyvHLydEi9XPaKmVoL5E+0EZhGQ
         AlniQ3PuCbMc7o0H6hIDzinT3qAVRj/t+GgFwW0f0/6QpTFEKJ+1O9nMc7lYftboUMMN
         6+YaWMV7/SLbDGi8cPUW7QZSn7D6JppgLSKbWzsocHKYwZP9ZyR3EXTHTJ8IOKtaVYqh
         +Dii93BZJbkGJzI+zRXCPUE8+oIyT8b+Dlvz0yqpsxRlMh+6iRhqiTLGIQgSo8usTe6/
         kTjJ8fF7jPohX1xzRS9ukAiyIvXVicq23v6La6KAWpaVEgQKueKlM/qh5YeiEVVl4eac
         VFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        fh=OjszRdydZErmc2M3y35+3fnxJHpvuaOttSlLh8A73O0=;
        b=TsO/L/bkn8slO1x+SzPiewZNJDHc5loas4V31fs5SKqQNIF3vaIwOnPZtZ1AYKCu9e
         1a/BYE8KiQuEJIpTw6u9FFTBPqEg/2Nz9stvWfeARDKHBgJao9Xu5PLy9hV7JYqL29na
         u8uB8jwywBRSg9A/Emqb3gdVyEUy/dZD/YAKceXMds9kDDSxiEGbtTHeyVMGA4Kf4mLl
         tgQbsQ8D07UGNKXpx5PpC6HcD6jphGjef2QuKuc9mlD4nHDWtNamz6EI3VSJ34RHYpo9
         YFHVMxkQ6+lBglxKFDYrcrrZ1SKKNBOqSi4d8+5WjxD09AmxCAaQy8HMgSYzl1poB8Uy
         a8NQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602794; x=1792207594; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=IXu5LEEBvC6xzi/uLSve60ASUnWiG12aFOEPCiam40DR1wK7U3/mh6UKnoIUIF7LuW
         D6BWeFjIjyJVj6bVE4TARHtHl+8ISyq6DQBMMAd658eZd/BfLg2baOVnze7p88zJ4Fwj
         Vk49lwUGAhY+tq+i4j4F/f2IQEa9pkw9Ih7S/Dt2szEj4DZ949IaHO3DFX9gp2g8M6GZ
         HQEJ25FDQ+wyx3xjS3R0K/NRHZpQCOhhphdPsa5KNVugsHlpZdZ32zwjE1j6EtydzQlj
         cUXq3AM/L88jcY3EarGNq0bgTmJHq4tbpilN7vFOcRTJlavF0KOhsqzxdo+wB86jjGe/
         mnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602794; x=1792207594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=b6gIlJ4UIMRmoTQURRhZlAwE7JnYFRU2DT3C6sdou1xt2grqiohp/dG9+/DMm6epyq
         f8iMs9Q0QBJe5OirfWOsAGp0aDopHj80a866xn+feZRviyg09wVhr1GFB+NTR+9Nxrdi
         AkdTzTdfNmQRCDggqzLo8BWEdhgFVav6Qf0MrmvqAw4mbEbDAuy3akOSMrTF3zSAaT4G
         WB9GVXAwD0t3OtS5+o+yrSC4X+eDpw51IzTIqG0eqQTVc+Yp/op3Tjl5IEhjlRgnZJWt
         edaiY9vB9vXUOn4gC6gVxiykNaU+dpzMN9tDaniexWVr4HYIKQpZBiZTqFTN5j/WxRcv
         pfoA==
X-Forwarded-Encrypted: i=1; AKwUvBxOwRqycsW3Y/yTzHYZStGBvnxEEKUZfbMeBx4zdTX2hi3aUSGhZUVyqqRMrI9yTZIykxVX@lists.linux.dev
X-Gm-Message-State: AFq9FYKg2GTcXegp32kunGKaceM3J3SPvkfbyssikuh1gGI5z1DtUdbm
	FSXg95Lw1/57eRxjsj/sZb5LTsv1sgX7HCb2wNAJMYKNrn3CCVHPbWV7zeRhjZMGB65DBFhca9E
	G2TRdY0ELywnr6mIH6BekHpiLuI4h8Mg=
X-Gm-Gg: AYBFou1KUpSBYrKvd4AJOZi5lDYRurd2NDxi3BTnc+Ey8H4MEgyQh45u4PAFFMuLuC4
	wXa+U0GD6wNlIaHMUZbiXEdZStuIbxyZfLEyz/9dg4XKH7zpGI/2xprEdUU/bCd0pWgQaMeY4hM
	cwjfIcgHMMWG2k7mL74inCzr0O+Iib2nqTwal1wFN8HzPNnNgQ7pTYIM0iZXtok7U4rRfOvPKQk
	rsuSe28HS5SijZYxB2YlTrQqSnrAXf1qy35CY/PtDBQ8GDxykS4ws8bUyRayqjJF4K8OJKFsrum
	ObEtq8Nd+fnJWfdxaReBacGtz3jW+Ll67iBPMMMXyWonZJzKUW5gkb07En1tt6HCI/yLDHefBbl
	PqWkq8oOfenn43jNbnAiOh2eHNjQ9N18lMr8oL1zFFgGhfl4qGDh2UWCSp7ix1YJA3zWVeEFMvf
	LUVBEu2Y3BwRC70ZqO1gT+8QWQSQ==
X-Received: by 2002:a17:902:e74f:b0:2e5:78b1:33fc with SMTP id
 d9443c01a7336-2e842e061e4mr35918455ad.53.1791602794135; Fri, 09 Oct 2026
 20:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009112634.33436-1-phucduc.bui@gmail.com> <202610100943.RQhhOoh8-lkp@intel.com>
In-Reply-To: <202610100943.RQhhOoh8-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 10 Oct 2026 10:26:23 +0700
X-Gm-Features: AclHuK-rwA97Wy1N3y57S1OeNaWlVpoAN-_YWwiNqheegjzdeSENPlryISm6gn0
Message-ID: <CAABR9nEkjf8_dar1q4tYMgBTa0p7WzR9Qx1N4Nr_ECuNZ=hxEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Darian Biastoch <d.biastoch@gmail.com>, Andreas Kaessens <akaessens@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610100943.RQhhOoh8-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/pinctrl-mcp23s08.c:617:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>      617 |                 return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
>          |                                           ^~~
>    drivers/pinctrl/pinctrl-mcp23s08.c:592:17: note: initialize the variable 'ret' to silence this warning
>      592 |         int status, ret;
>          |                        ^
>          |                         = 0
>    1 warning generated.
>

Thanks for the report.

I also received a similar warning from the sashiko-reviews earlier.
I'll return PTR_ERR(mcp->reset_gpio) in v2.
