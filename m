Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E7621
	for <llvm@lists.linux.dev>; Tue, 29 Oct 2024 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730214648; cv=none; b=UzY7TvSJSMq5624ew+BPVEx3FRlAOWn9KENbgQ90Xm0J10zkdFhpUzE9cgUIzgULfRAzYVIe71wq2pLkCzf/rLJGBMuzPg+hrki4IkFOH6RwS1nO7eiJZAzWTUIW+lsCMq+h6xWfqEiZQj/HF5W8NVz2A75Z7eG05NQ39hwQZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730214648; c=relaxed/simple;
	bh=pClzO/h/JROTqlyb6Hk2ZQp5fgFIM9FnfxbvzImRHqc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ryt5g++I8VcMGWA4BmQPWJkAw8C4AdqFp42p0i9bBADcE36PP7nl02El1H/ppV+VsP7j8Qae5HAD7fcQaW8czYC8EptRNnzRjCoWJC9Z/JnTR3noPoO9UtubngrYlyZbJNAM6uTFIjtbRQBaYxLRk3YLOPQqhs/dzcdzP6wmiQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=rQGLa+wF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="rQGLa+wF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4eac48d8so506906f8f.0
        for <llvm@lists.linux.dev>; Tue, 29 Oct 2024 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1730214645; x=1730819445; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pClzO/h/JROTqlyb6Hk2ZQp5fgFIM9FnfxbvzImRHqc=;
        b=rQGLa+wFYZDEIt1Y/FXF0ZovfCHtwHX6p8HLpjSUiCa/zIBg7Pu5d6UUbvhJS6cxAA
         D20X3abetcT5XShRUTcvTyn5aUJlYY/QxinwmPJOleJ+VV9Gu29pamdS5mYdOWeyc5I0
         yZxFfndYRm4DZaht2MkDS0wA8n6/CIDHOfskY2CKJn8t2AN22n7vj9TUksxq+PNFv/D7
         feNcgX0oHYvFcFPH6ZKPp1XzRVH0QFeumTO0ND4IUx/JbUItBG+rXtFRj5mKh+xXQNx6
         jAUgzDI0/30CMLYLNGJDAWFNlqSLcb7Zpiayvvd5GipgoffFFReMuCN8scEnM6W4N1QM
         cjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730214645; x=1730819445;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pClzO/h/JROTqlyb6Hk2ZQp5fgFIM9FnfxbvzImRHqc=;
        b=OS24/e7WIp4Xr1CQMDDqDDkyjDPyOFSQMnc8PLBBJBGJG6Ql8EP+aD1qBOTI/gGFOs
         qEuHsoUKETLbuO2r2OuAtUXXVLInaYXETSRMII5kHpbYlKSShzolO5I5lPAvo2pHmVBW
         /ZyCSUqSE/n6c9RuHRV/wRygR3kCUXyYjeAxipiWuAJt1N7DeIUK463tdDuHT44mxiaV
         ps7mzxE9KzlvA4Oo0CIPx2SNtR8BT/HwIz9PtYF0f4huvpV4aN9lEPL3vql3fsKAUAXF
         V8oKRXB1fBoftQz9Tkrui1I8ArE/63EBcvOgtnpuX+VMN7/VzfHC7BFDm1skD477hzWu
         XkJg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ti1vO1Fz0hfqTHh8r3iXSirETz+IPl9XPsRAP16mBGWVateEq0UfN8PhWM5UbN0h3CU/@lists.linux.dev
X-Gm-Message-State: AOJu0YxjAFNX6tjtIEs+AP+liAWmV3LuwWJq4QwJOhw13yQy3/A2NFQY
	5XNCdE/sKVeagDGqUH7cT21PuoRvAwAjq64bP4KVvdok8pWM8Q67tK0kDuyJQ5U=
X-Google-Smtp-Source: AGHT+IHpB0gsXiLgIYq0IllOpj0RLaS+RFkgWPXNM/xk1DTGgHY978z6z+pWhDKYuiUIrS2oulAcag==
X-Received: by 2002:a5d:6d86:0:b0:374:cd01:8b72 with SMTP id ffacd0b85a97d-380611fe6dcmr4253149f8f.9.1730214644521;
        Tue, 29 Oct 2024 08:10:44 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:a4f:301:c1bf:2b25:a6db:6ae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b713fbsm12813482f8f.88.2024.10.29.08.10.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2024 08:10:44 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 1/1] Compiler Attributes: disable __counted_by for clang <
 19.1.3
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <20241029140036.577804-2-kernel@jfarr.cc>
Date: Tue, 29 Oct 2024 16:10:32 +0100
Cc: kees@kernel.org,
 nathan@kernel.org,
 ojeda@kernel.org,
 ndesaulniers@google.com,
 morbo@google.com,
 justinstitt@google.com,
 ardb@kernel.org,
 oliver.sang@intel.com,
 gustavoars@kernel.org,
 kent.overstreet@linux.dev,
 arnd@arndb.de,
 gregkh@linuxfoundation.org,
 akpm@linux-foundation.org,
 tavianator@tavianator.com,
 linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3ADD56B1-9BBF-48CD-81C7-53E10675F566@toblux.com>
References: <20241029140036.577804-1-kernel@jfarr.cc>
 <20241029140036.577804-2-kernel@jfarr.cc>
To: Jan Hendrik Farr <kernel@jfarr.cc>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

On 29. Oct 2024, at 15:00, Jan Hendrik Farr wrote:
>=20
> This patch disables __counted_by for clang versions < 19.1.3 because
> of the two issues listed below. It does this by introducing
> CONFIG_CC_HAS_COUNTED_BY.
>=20
> 1. clang < 19.1.2 has a bug that can lead to __bdos returning 0:
> https://github.com/llvm/llvm-project/pull/110497
>=20
> 2. clang < 19.1.3 has a bug that can lead to __bdos being off by 4:
> https://github.com/llvm/llvm-project/pull/112636
>=20
> Fixes: c8248faf3ca2 ("Compiler Attributes: counted_by: Adjust name and =
identifier expansion")
> Cc: stable@vger.kernel.org # 6.6.x: 16c31dd7fdf6: Compiler Attributes: =
counted_by: bump min gcc version
> Cc: stable@vger.kernel.org # 6.6.x: 2993eb7a8d34: Compiler Attributes: =
counted_by: fixup clang URL
> Cc: stable@vger.kernel.org # 6.6.x: 231dc3f0c936: lkdtm/bugs: Improve =
warning message for compilers without counted_by support
> Cc: stable@vger.kernel.org # 6.6.x
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: =
https://lore.kernel.org/all/20240913164630.GA4091534@thelio-3990X/
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: =
https://lore.kernel.org/oe-lkp/202409260949.a1254989-oliver.sang@intel.com=

> Link: =
https://lore.kernel.org/all/Zw8iawAF5W2uzGuh@archlinux/T/#m204c09f63c07658=
6a02d194b87dffc7e81b8de7b
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jan Hendrik Farr <kernel@jfarr.cc>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks for fixing this and your work on the Clang issues. Feel free to =
add:

Reviewed-by: Thorsten Blum <thorsten.blum@linux.dev>

