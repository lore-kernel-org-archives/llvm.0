Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18111CD06
	for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705426860; cv=none; b=M+TxgCvfG18YD4VDVmD/8QHXmTxH6KkqKohyYcjzRk1TgR+peKQ0/c2ehMjmWo/PoKGBVSIs1720Z7j4k65WIfQKzh1r9HJLyIlqpDSzc7C7+0QuJEQ6ME5q68o5/vCsXttjBNX7ANYqow+v0SuS15mtJ3K7zGID9X2pTXkx018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705426860; c=relaxed/simple;
	bh=XvvcYoCr4zpjWC2RHZe0h/ouCH5Zo/Y79WhWx6k5mnY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IbhSUaQh5NXfNXQVMwOILMDqlqHQY/trxbU/fWvcMiiTC6uKIgXShAkbToUTS78J+Si0lwKrSehWlQNegIgY8hdnYpMn2CRbmuQ4Z6FJiJ2a9TuJv9CqkGyuYbYRi6TGE9+svY+BYTrCDqTpYUec/nB2Yr6oF2al8IE0paRNT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d3TrqOjg; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d3TrqOjg"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6daf9d5f111so8168659b3a.0
        for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 09:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705426858; x=1706031658; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOlwdSwaFY4qZZ/MF2sX5IosH4JrIbBPd9daBrZxqLw=;
        b=d3TrqOjgF6NA9oVF0Za8tNZ0JbqkMO6S3DPibKml07Yv5RsB/p3yD60b9GZvJd88Uv
         FRx+Xdi4Z4FhK2NgqVlTDwLx8REllOil7oTJrcOQKlJCZZ4vKnfKp0J8iNoYmbNyvR07
         ZU47jYRWLYAyAETmXZsBdzA4WTFOhqrjMxdiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705426858; x=1706031658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOlwdSwaFY4qZZ/MF2sX5IosH4JrIbBPd9daBrZxqLw=;
        b=WqEOSrDf9DfBkqpvOYgwZ96PepUQVGlgLQoAJcjdy5Ormd/GKRgDd6VfKFR0kM82pH
         MAt3xt1pxIazs0Wo1zM9cSgI4DCBcwHa1MaMLdXFwHhDgPU26tv1aN4n0tS5oaB4AcjL
         ewwZa9nQTfWLyRtajuJXgOUDxBKVxtZY1d+STFEFvYGuRngRe93rHxAZM96LzLrXP2RU
         LYj4Uf7CmE51nDXVAx0XdBroTowr1JEvyixn18y7XT20QHTuWb4UynUnOvtk7qRl5mJm
         M6HDPdUFwwX10Y/mUpmGRcUQPg3YNmUwVwhGkwfpieu1zxGleMl+XBDd1wN9HYHOUHwq
         CKSQ==
X-Gm-Message-State: AOJu0YzwegUc4UXj8hileUQvo+3vnfjus0sCpOwFVI/Hl0M4INQyRIOS
	hEt0wZUqC2ZBsYuUo5+bp86eMkYVKD38
X-Google-Smtp-Source: AGHT+IGSq12YfeBII3I7eyQkB4trJr8EZhJyUqknHpzHjJNorjltxMMcubYS6hhtjlOeab7iuZAREg==
X-Received: by 2002:a05:6a00:4604:b0:6db:7038:fc0f with SMTP id ko4-20020a056a00460400b006db7038fc0fmr7290950pfb.63.1705426858263;
        Tue, 16 Jan 2024 09:40:58 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:88f1:3bea:43ea:b8b8])
        by smtp.gmail.com with UTF8SMTPSA id x16-20020a056a000bd000b006d9b2694b0csm9640397pfu.200.2024.01.16.09.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 09:40:57 -0800 (PST)
Date: Tue, 16 Jan 2024 09:40:55 -0800
From: Brian Norris <briannorris@chromium.org>
To: kernel test robot <lkp@intel.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: google: cbmem: Add to module device table
Message-ID: <Zaa_pwuPOMCQV4GD@google.com>
References: <20240111151226.842603-4-nfraprado@collabora.com>
 <202401151013.Xioj5wZo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401151013.Xioj5wZo-lkp@intel.com>

Hi Nicolas,

On Mon, Jan 15, 2024 at 10:53:48AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
> >> drivers/firmware/google/cbmem.c:118:40: warning: unused variable 'cbmem_ids' [-Wunused-const-variable]
>      118 | static const struct coreboot_device_id cbmem_ids[] = {
>          |                                        ^~~~~~~~~
>    1 warning generated.
> 
> 
> vim +/cbmem_ids +118 drivers/firmware/google/cbmem.c
> 
>    117	
>  > 118	static const struct coreboot_device_id cbmem_ids[] = {
>    119		{ .tag = LB_TAG_CBMEM_ENTRY },
>    120		{ /* sentinel */ }
>    121	};
>    122	MODULE_DEVICE_TABLE(coreboot, cbmem_ids);
>    123	

I was wondering why we have a seemingly unique "unused variable" failure
mode in comparison to other similarly-structured device/bus drivers, and
I realized that's because we're not relying on the same structure for
both MODULE_DEVICE_TABLE (struct coreboot_device_id) and for the driver
definition (struct coreboot_driver -> 'u32 tag'). Thus, this structure
is only used for #define MODULE builds, and otherwise not used.

Rather than wrapping these definitions in "#ifdef MODULE", perhaps we
can settle on a single field, and replace `struct coreboot_driver::tag`
with an instance of `struct coreboot_device_id`? That would normally be
a breaking change that would require changing all drivers at the same
time as the bus (or else some kind of intermediate transition state),
but considering there are only 4 driver implementations and they all
live under the same maintainer tree, that seems like it should still be
OK (IMO).

If it makes the series more readable/incremental, perhaps the switchover
can be the last patch in the series, and there can remain some
duplication (and potential -Wunused-const-variable issues) for the
middle of the series.

Brian
